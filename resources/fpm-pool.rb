require 'resolv'

actions :create, :delete, :modify
default_action :create if defined?(default_action)

#Base Pool Configuration
attribute :pool_name, :name_attribute => true, :kind_of => String, :required => true
attribute :pool_user, :kind_of => String, :required => false, :default => 'www-data'
attribute :pool_group, :kind_of => String, :required => false, :default => 'www-data'
attribute :listen, :kind_of => String, :required => false, :default => nil
attribute :listen_allowed_clients, :kind_of => String, :required=> false, :default => nil
attribute :listen_owner, :kind_of => String, :required=> false, :default => 'www-data'
attribute :listen_group, :kind_of => String, :required=> false, :default => 'www-data'
attribute :listen_mode, :kind_of => String, :required=> false, :default => "0666"

#PM Configuration
attribute :pm, :kind_of => String, :required => false, :default => 'dynamic'
attribute :pm_max_children, :kind_of => Integer, :required => false, :default => 10
attribute :pm_start_servers, :kind_of => Integer, :required => false, :default => 4
attribute :pm_min_spare_servers, :kind_of => Integer, :required => false, :default => 2
attribute :pm_max_spare_servers, :kind_of => Integer, :required => false, :default => 6
attribute :pm_max_requests, :kind_of => Integer, :required => false, :default => 0
attribute :pm_status_path, :kind_of => String, :required => false, :default => nil

#Ping Status
attribute :ping_path, :kind_of => String, :required => false, :default => nil
attribute :ping_response, :kind_of => String, :required => false, :default => nil

#Logging
attribute :request_slowlog_timeout, :kind_of => Integer, :required => false, :default => 5
attribute :request_terminate_timeout, :kind_of => Integer, :required => false, :default => 0
attribute :slow_log, :kind_of => String, :required => false, :default => '/var/log/php5-slow.log'

#Misc
attribute :chdir, :kind_of => String, :required => false, :default => nil
attribute :chroot, :kind_of => String, :required => false, :default => nil
attribute :catch_workers_output, :kind_of => String, :required => false, :equal_to => ['yes', 'no'], :default => nil
attribute :security_limit_extensions, :kind_of => String, :required => false, :default => nil
attribute :rlimit_files, :kind_of => Integer, :required => false, :default => nil
attribute :rlimit_core, :kind_of => Integer, :required => false, :default => nil

#PHP INI
attribute :php_ini_flags, :kind_of => Hash, :required => false, :default => nil
attribute :php_ini_values, :kind_of => Hash, :required => false, :default => nil
attribute :php_ini_admin_flags, :kind_of => Hash, :required => false, :default => nil
attribute :php_ini_admin_values, :kind_of => Hash, :required => false, :default => nil

#ENV Variables
attribute :env_variables, :kind_of => Hash, :required => false, :default => nil

attribute :template_source, :kind_of => String, :required => false, :default => "fpm-pool.conf.erb"
attribute :template_cookbook, kind_of: String, default: "php"


attr_accessor :exists