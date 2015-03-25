#
# Author:: sKotenok (<chernbiy.kot@gmail.com>)
# Cookbook Name:: php
# Recipe:: ppa
#

default_action :discover
actions :discover, :add, :update, :remove

attribute :channel_name, :kind_of => String, :name_attribute => true
attribute :channel_xml, :kind_of => String

