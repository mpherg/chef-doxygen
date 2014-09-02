Description
===========

Installs Doxygen from source.

Requirements
============
## Platform

The following platform families are supported:

* RHEL

## Cookbooks:

* build-essential
* yum

## Attributes:

* `node['doxygen']['version']` - Doxygen version to install
* `node['doxygen']['url']` - URL to Doxygen source package
* `node['doxygen']['checksum']` - Source package SHA256 checksum

Recipes
=======
## source

Installs Doxygen from source.

Usage
=====

This cookbook installs Doxygen from source. It will remove any existing doxygen
installation.

To install Doxygen:

    include_recipe 'doxygen::source'

License and Author
==================

- Author:: Michael Ferguson (<mpherg@gmail.com>)
- Copyright:: Michael Ferguson

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
