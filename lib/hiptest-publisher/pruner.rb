require 'set'

require_relative 'utils'

module Hiptest
  class Pruner

    def initialize(xml, options)
      @xml = xml
      @options = options
    end

    def prune
      # Don't prune if there are no filters.  While this allows unused actionwords to remain, it preserves backward
      # compatibility.
      return unless filters? || prune_actionwords?
      filter_tags = Set.new @options.filter_tags.split(',')

      unless filter_tags.empty?
        scenarios = find_tagged_scenarios(filter_tags)
        prune_scenarios(scenarios)
        prune_scenario_snapshots(scenarios)
      end

      prune_actionwords
      prune_actionword_snapshots
      return @xml
    end

    private

    @@scenario_css = '> project > scenarios > scenario'
    @@test_run_css = '> project > testRuns > testRun'
    @@scenario_snapshot_css = @@test_run_css + ' > scenarioSnapshots > scenarioSnapshot'
    @@actionword_css = '> project > actionwords > actionword'
    @@actionword_snapshot_css = @@test_run_css + ' > actionwordSnapshots > actionwordSnapshot'

    def filters?
      return !@options.filter_tags.empty?
    end

    def prune_actionwords?
      return @options.prune_actionwords
    end

    # Return the set of scenario names that match any of the filter tags.
    def find_tagged_scenarios(filter_tags)
      scenario_names = Set.new
      puts "Finding scenarios for tags: #{filter_tags.to_a.join(',')}" if @options.verbose
      # Tags are only found on scenarios, not on scenario snapshots.
      @xml.css(@@scenario_css).each { |scenario|
        scenario_name = scenario.css('> name').first.text
        puts "Scenario: #{scenario_name}" if @options.verbose
        scenario_tags = Set.new scenario.css('> tags > tag > key').to_ary.map { |element| element.text }
        scenario_tags.each { |tag|
          puts "  tag: #{tag}"
        } if @options.verbose
        # Save the scenario if has any of the desired tags.
        if filter_tags.intersect?(scenario_tags)
          puts "Saving!" if @options.verbose
          scenario_names.add(scenario_name)
        end
      }
      return scenario_names
    end

    # Remove the scenario nodes from the XML if they are not in the set of names.
    def prune_scenarios(scenarios)
      puts "Pruning scenarios" if @options.verbose
      @xml.css(@@scenario_css).each { |scenario|
        maybe_remove_by_name(scenarios, scenario)
      }
    end

    # Remove the scenario snapshot nodes from the XML if they are not in the set of names.
    def prune_scenario_snapshots(scenarios)
      puts "Pruning scenario snapshots" if @options.verbose
      @xml.css(@@scenario_snapshot_css).each { |scenario|
        maybe_remove_by_name(scenarios, scenario)
      }
    end

    # Remove the node if its name is not in the set of names
    def maybe_remove_by_name(names, node)
      name = node.css('> name').first.text
      unless names.include?(name)
        puts "Removing #{name}" if @options.verbose
        node.remove
      end
    end

    # Remove any actionwords that are outside of the transitive closure of actionwords used by any scenario.
    def prune_actionwords
      puts "Pruning actionwords" if @options.verbose
      prune_actionwords_by_css(@@scenario_css, @@actionword_css)
    end

    # Remove any actionword snapshots that are outside of the transitive closure of actionword snapshots used by
    # scenario snapshot.
    def prune_actionword_snapshots
      puts "Pruning actionword snapshots" if @options.verbose
      prune_actionwords_by_css(@@scenario_snapshot_css, @@actionword_snapshot_css)
    end

    # Remove any actionwords (or snapshot) that are outside of the transitive closure of actionwords (or snapshots)
    # used by any scenario (or snapshot).  The CSS parameters distinguish between regular and snapshot nodes.
    def prune_actionwords_by_css(scenario_css, actionword_css)
      # Collect the actionwords used by all scenarios.
      used = collect_actionwords_used(scenario_css, actionword_css)
      # Extend them with actionwords used by other used actionwords.
      used = actionwords_dependencies(actionword_css, used)
      puts "There are a total of #{used.size} actionwords used" if @options.verbose
      # Remove actionwords that are not used at all.
      remove_unused_actionwords(actionword_css, used)
    end

    # Remove actionwords that are not used at all.
    def remove_unused_actionwords(actionword_css, used)
      puts "Pruning unused actionwords" if @options.verbose
      @xml.css(actionword_css).each { |actionword|
        name = actionword_name(actionword)
        next if used.include?(name)
        puts "Removing actionword #{name}" if @options.verbose
        actionword.remove
      }
    end

    # Collect the actionwords used by all scenarios.
    def collect_actionwords_used(scenario_css, actionword_css)
      puts "Collecting actionwords used in any scenario" if @options.verbose
      used = Set.new
      @xml.css(scenario_css).each { |scenario|
        scenario.css('> steps > call').each { |call|
          actionword = call_actionword(call)
          if used.add?(actionword)
            puts "Discovered actionword used by scenario: #{actionword}" if @options.verbose
          end
        }
      }
      puts "Collected #{used.size} actionwords used by scenarios" if @options.verbose
      return used
    end

    def call_actionword(call)
      return call.css('> actionword').first.text
    end

    def actionword_name(actionword)
      return actionword.css('> name').first.text
    end

    # Extend them with actionwords used by other used actionwords.
    def actionwords_dependencies(actionword_css, used)
      pass = 0
      while true
        pass += 1
        puts "Finding actionwords used by other actionwords, pass #{pass}" if @options.verbose
        more = actionwords_dependencies_once(actionword_css, used)
        return used if more.empty?
        puts "Found #{more.size} additional actionwords, pass #{pass}" if @options.verbose
        used.merge(more)
      end
      puts "Found no additional actionwords, pass #{pass}" if @options.verbose
      return used
    end

    # Return actionwords used by any of the specified words.
    def actionwords_dependencies_once(actionword_css, used)
      more = Set.new
      @xml.css(actionword_css).each { |actionword|
        name = actionword_name(actionword)
        # See if this actionword is used.
        next unless used.include?(name)
        # See if this actionword calls others.
        actionword.css('> steps > call').each { |call|
          called_actionword = call_actionword(call)
          unless used.include?(called_actionword)
            if more.add?(called_actionword)
              puts "Discovered actionword used by actionword: #{called_actionword}" if @options.verbose
            end
          end
        }
      }
      return more
    end

  end
end
