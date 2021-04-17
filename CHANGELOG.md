## 0.3.0 -- Fri 16 Apr 2021 06:49:07 PM PDT

- hooksvc now listens on 0.0.0.0, not localhost
- independent branches & "do not merge": you can now select specific branches
  to not be merged against the default branch. Just configure these in the
  default branch's tinyci.yml. See types/task.go's RepoConfig struct for more
  information.
  - additionally, you can get this behavior by specifying the "do not merge"
    flag in the same place. It applies to all branches and PRs.
  - currently, only the overlay-runner supports this functionality.
- `tinycli` now has a splash of color in certain spots. Feedback please! Set
  `TINYCI_NOCOLOR` to something in your environment to turn it off.
- per-run environment properties. Add to each run in task.ymls to utilize.
- Using golang 1.16
- (optional!) privileged mode for runners.
- unified `tinyci` binary for launching all services.
- Many internal build improvements & upgraded dependencies
- overlay-runner now no longer spouts lots of garbage when switching branches

## 0.2.6 -- Thu 16 Jul 2020 05:06:39 AM UTC

This release contains many small bug fixes to the underlying components:

- hooksvc
- errors framework

It also supports the notion of resource constraints which are a part of the
RunSettings protocol now. New runners will need to address these values if they
want to use them.

The vendor tree was pruned. Use go 1.14 and modules now.

## 0.2.5 -- Mon 06 Jul 2020 05:20:25 PM UTC

0.2.5 allows changes to come from non-master branches

## 0.2.0 -- Mon Nov 04 09:11:42 PDT 2019

0.2.0 represents a lot of bugfixes and a few large features:

- Submissions! Submissions group your tasks and runs into a single item that
  corresponds for the submission of the test in the first place. Submissions
  come from:
  - A POST to hooksvc from github (pull request, branch push, stuff like that)
  - Manual submissions in the UI or through tinycli
- Auth has been broken out into its own service, in preparation for our multi-service journey.
  - An additional, but unused service called the `reposvc` is present in the release. Ignore it.
- The UI has received a significant overhaul as well; several changes were made
  to facilitate that. Please see [ci-ui CHANGELOG.md](https://github.com/tinyci/ci-ui/blob/master/CHANGELOG.md)
  for more info.
- GRPC services now gracefully stop, attempting to finish their transactions
  before terminating.
- Certain classes of transactional / distributed bugs were squashed due to
  changes in use of golang contexts.
- Pull Request IDs are now called "Ticket IDs" in the UI, and are reflected in the UI.
- Now on golang 1.13 and targeting ubuntu disco for installations
- Run data now carries what host it ran on if it has entered a running state.

## 0.1.1 -- Sat Jul 13 10:27:26 PDT 2019

Just a patch release intended to fix some things with the 0.1.0 launch.

- Update tinycli to use certs if necessary/desired
- Clear session cookies when they're invalid

## 0.1.0 -- Wed Jul 3 11:13:35 PDT 2019

Initial release!

## 0.2.7

Bugfixes, experimental k8s runner

## 0.2.6

Support non-master branches in overlay-runner (whoops)

## 0.2.5

Support non-master branches

## 0.2.4

- golang 1.14
- Upgrade library dependencies

## 0.2.3

We'll just forget about this one

## 0.2.2 -- Thu Dec 19 14:23:12 PDT 2019

Small fix to ci-ui's javascript dependencies

## 0.2.1 -- Wed Nov 05 22:49:56 PDT 2019

0.2.1 represents a small fix in the overlay-runner.

- The runner framework would leak goroutines and channels during signal handling.

## 0.2.0 -- Mon Nov 04 2019 11:18:39 PDT 2019

0.2.0 represents a lot of bugfixes and a few large features:

Core:

- Submissions! Submissions group your tasks and runs into a single item that
  corresponds for the submission of the test in the first place. Submissions
  come from:
  - A POST to hooksvc from github (pull request, branch push, stuff like that)
  - Manual submissions in the UI or through tinycli
- Auth has been broken out into its own service, in preparation for our multi-service journey.
  - An additional, but unused service called the `reposvc` is present in the release. Ignore it.
- The UI has received a significant overhaul as well; several changes were made
  to facilitate that. Please see [ci-ui CHANGELOG.md](https://github.com/tinyci/ci-ui/blob/master/CHANGELOG.md)
  for more info.
- GRPC services now gracefully stop, attempting to finish their transactions
  before terminating.
- Certain classes of transactional / distributed bugs were squashed due to
  changes in use of golang contexts.
- Pull Request IDs are now called "Ticket IDs" in the UI, and are reflected in the UI.
- Now on golang 1.13 and targeting ubuntu disco for installations
- Run data now carries what host it ran on if it has entered a running state.

UI:

- Submissions are first class, front page items.
- Run and Task counts displayed under submission
- Optional Ticket ID (pull request ID) displayed under submission
- New fonts and icons throughout the system
- Major reorganization of data tables; now more spacious and easier to read.
- Improved abstractions lead to more consistency between pages
- Display of timing data, hostname of runner, and tons more.

Runners:

- Runner framework `fw` reworked, easier to use and more reliable in a number of scenarios
- Graceful restart support! Send a SIGHUP to terminate the runner after its current run completes.
- Fix situations where logging would cause a lockup of the runner if it could not reach the logsvc.
- Up-to-date on golang 1.13

## 0.1.0 -- Wed Jul 3 11:13:35 PDT 2019

Initial release!
