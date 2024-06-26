
# Changelog

## New in the version 3.1.0

* [#227](https://github.com/geekq/workflow/pull/227) Allow event arguments to be taken into account when selecting the event
* [#232](https://github.com/geekq/workflow/pull/232) Add ability to include partial workflow definitions for composability
* [#241](https://github.com/geekq/workflow/pull/241) Example for defining workflow dynamically from JSON

## New in the version 3.0.0

* [#228](https://github.com/geekq/workflow/pull/228) Support for Ruby 3 keyword args, provided by @agirling
* retire Ruby 2.6 since it has reached end of live; please use workflow 2.x, if you still depend on that Ruby version
* [#229](https://github.com/geekq/workflow/pull/229) Switch from travis CI to GihHub actions for continuous integration

## New in the versions 2.x

* extract persistence adapters, Rails/ActiveRecord integration is now a separate gem
  workflow-activerecord
