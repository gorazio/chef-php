#
# Author:: sKotenok (<chernbiy.kot@gmail.com>)
# Cookbook Name:: php
# Resource:: pear
#

default_action :install
actions :install, :upgrade, :remove, :purge

attribute :package_name, :kind_of => String, :name_attribute => true
attribute :version, :default => nil
attribute :channel, :kind_of => String
attribute :options, :kind_of => String
attribute :directives, :kind_of => Hash, :default => {}
attribute :zend_extenstions, :kind_of => Array, :default => []
attribute :preferred_state, :default => 'stable'
