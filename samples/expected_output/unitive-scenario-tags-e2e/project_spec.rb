# encoding: UTF-8
require 'spec_helper'
require_relative 'actionwords'

describe 'Unitive Sandbox' do
  include Actionwords

  it "It should show the search bar" do
    # Tags: e2e
    # Given I'm on the Job Copy page
    im_on_the_job_copy_page
    # Then it should show the search bar
    it_should_show_the_search_bar
  end

  it "It should show the list of available reqs and the extra data with it" do
    # Tags: e2e
    # Given I'm on the Job Copy page
    im_on_the_job_copy_page
    # Then it should show the list of available reqs and the extra data with it
    it_should_show_the_list_of_available_reqs_and_the_extra_data_with_it
  end

  it "It should show a no-data message when there are no reqs available to the user" do
    # Tags: e2e
    # Given I'm on the Job Copy page
    im_on_the_job_copy_page
    # Then it should show a no-data message when there are no reqs available to the user
    it_should_show_a_nodata_message_when_there_are_no_reqs_available_to_the_user
  end

  it "It should show a no-data message when there are no reqs after searching/filtering" do
    # Tags: e2e
    # Given I'm on the Job Copy page
    im_on_the_job_copy_page
    # Then it should show a no-data message when there are no reqs after searching/filtering
    it_should_show_a_nodata_message_when_there_are_no_reqs_after_searchingfiltering
  end

  it "It should show the job description when clicking the \"Preview\" button" do
    # Tags: e2e
    # Given I'm on the Job Copy page
    im_on_the_job_copy_page
    # Then it should show the job description when clicking the "Preview" button
    it_should_show_the_job_description_when_clicking_the_p1_button("Preview")
  end

  it "It should create a copy of the req and job description when clicking the \"Replicate\" button" do
    # Tags: e2e
    # Given I'm on the Job Copy page
    im_on_the_job_copy_page
    # Then it should create a copy of the req and job description when clicking the "Replicate" button
    it_should_create_a_copy_of_the_req_and_job_description_when_clicking_the_p1_button("Replicate")
  end

  it "It should show ten reqs and a show more link" do
    # Tags: e2e
    # Given I'm on the Job Copy page
    im_on_the_job_copy_page
    # Then it should show ten reqs and a show more link
    it_should_show_ten_reqs_and_a_show_more_link
  end
end
