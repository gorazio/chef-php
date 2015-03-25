#
# Author:: sKotenok (<chernbiy.kot@gmail.com>)
# Cookbook Name:: php
# Provider:: ini
#

def whyrun_supported?
  true
end

use_inline_resources

action :update do
  begin
    require 'inifile'
  rescue LoadError
    recipe_eval do
      chef_gem "inifile"
    end
    require 'inifile'
  end

  unless ::File.file?(new_resource.file_name)
    ::File.open(new_resource.file_name, 'w').write('')
  end
  
  
  if new_resource.values.empty?
    ini = {"Session" => {"url_rewriter.tags" => '"a=href,area=href,frame=src,input=src,form=fakeentry"'}}
  elsif new_resource.values.is_a?(Hash) and not new_resource.values.has_key?("url_rewriter.tags")
    ini = {}
    ini.merge!(new_resource.values)
    ini.merge!({"Session" => {"url_rewriter.tags" => '"a=href,area=href,frame=src,input=src,form=fakeentry"'}})
  end

  phpini_old = ::IniFile.load(new_resource.file_name)
  phpini_new = ::IniFile.new(:content => ini)
  phpini_old.merge!(phpini_new)
  if phpini_old != phpini_new
     phpini_old.write
     new_resource.updated_by_last_action(true)
   end
end

def load_current_resource
  @current_resource = Chef::Resource::PhpIni.new(@new_resource.file_name)
  @current_resource.file_name(@new_resource.file_name)
end


# count = 0

#   new_resource.values.each do |head, keys|
#     if phpini.has_section?(head)
#       data = phpini[head]
#     else
#       data = {}
#     end
#     keys.each do |key, value|
#       if data[key] != value
#         count += 1
#         data[key] = value
#       end
#     end
#     file[head] = data
#   end
#   Chef::Log.info "count is #{count}"
#   if count > 0
#     file.write
#     new_resource.updated_by_last_action(true)
#   end
#   !count.zero?
