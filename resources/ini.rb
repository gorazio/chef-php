#
# Author:: sKotenok (<chernbiy.kot@gmail.com>)
# Cookbook Name:: php
# Resource:: ini
#

default_action :update
actions :update

attribute :file_name, :kind_of => String, :name_attribute => true
attribute :values, :kind_of => Hash
