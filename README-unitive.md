# README for Unitive

The eventual goal is to use the upstream Hiptest Publisher directly.  However, there are certain features that we need now while waiting for Hiptest to implement their feature roadmap.  Therefore, we maintain this fork as a (hopefully) small number of commits that are fast-forwarded onto the upstream `master` branch.

Our fork of Hiptest Publisher is maintained in branches named `unitive-master-[0-9]+`.  New features exclusive to our fork can be written as PR's onto the latest `unitive-master-*` branch.

These `unitive-master-*` branches are maintained as fast-forward branches from the upstream `master` branch.  In so doing, we can more easily track the (hopefully) shrinking set of commits that we maintain relative to upstream.

When upstream changes are to be integrated, follow this process:

1. Create a new `unitive-master-*` branch from the upstream master, incrementing the version number.  For example, if the latest master branch is `unitive-master-3`, then a new branch `unitive-master-4` would be created from the upstream `master` branch.
2. Create a PivotalTracker chore named something like "Sync to upstream Hiptest Publisher v0.15.3"
3. Create the corresponding topic branch from the previous `unitive-master-*` branch, e.g. `unitive-master-3`.
4. Rebase the topic branch to the latest `unitive-master-*` branch, e.g. `unitive-master-4`.
5. Make a PR to merge the topic branch into the latest `unitive-master-*` branch.

Stable releases are tagged with `unitive-[0-9]+` tags.  Those are picked up by the Docker Hub automation, so that Docker images can be referenced using those tags.
