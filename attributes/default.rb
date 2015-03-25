#
# Author:: sKotenok (<chernbiy.kot@gmail.com>)
# Cookbook Name:: php
# Attribute:: default
#

# Base
default['php']['version']         = '5.4' # '5.4', '5.5', '5.6'
default['php']['install-method']  = 'ppa' # source, package
default['php']['bin']             = 'php'
default['php']['ini-template']    = 'php.ini.erb'
default['php']['ext-avail-dir']   = '/etc/php5/mods-available'
default['php']['base-packages']   = %w{ php5-common php5-cli php5-dev php-pear }
default['php']['packages']        = []
default['php']['package-options'] = ''

# CLI
default['php']['cli']['ini-file']      = '/etc/php5/cli/php.ini'
default['php']['cli']['ini-defaults']  = {}

# FPM
default['php']['fpm']['install']      = true
default['php']['fpm']['conf-file']    = '/etc/php5/fpm/php-fpm.conf'
default['php']['fpm']['ini-file']     = '/etc/php5/fpm/php.ini'
default['php']['fpm']['pool-dir']     = '/etc/php5/fpm/pool.d'
default['php']['fpm']['pid']          = '/var/run/php5-fpm.pid'
default['php']['fpm']['error-log']    = '/var/log/php5-fpm.log'
default['php']['fpm']['log-level']    = 'error'
default['php']['fpm']['emergency-restart-threshold'] = '10'
default['php']['fpm']['emergency-restart-interval']  = '1m'
default['php']['fpm']['process-control-timeout']     = '10'
default['php']['fpm']['bin']          = 'php5-fpm'
default['php']['fpm']['service']      = 'php5-fpm'
default['php']['fpm']['user']         = 'www-data'
default['php']['fpm']['group']        = 'www-data'
default['php']['fpm']['packages']     = %w{ php5-fpm }
default['php']['fpm']['pools']        = []
default['php']['fpm']['conf-defaults']= {}
default['php']['fpm']['ini-defaults'] = {}


# PEAR
default['php']['pear']            = 'pear'
default['php']['pecl']            = 'pecl'
default['php']['pecl-packages']   = %w{  }


case node['php']['version']
  when '5.4'
    default['php']['ppa']           = 'ppa:ondrej/php5-oldstable'
    default['php']['ext-conf-dir']  = '/etc/php5/conf.d'
    default['php']['mod-packages']  =  %w{  }
  when '5.5'
    default['php']['ppa']           = 'ppa:ondrej/php5'
    default['php']['ext-conf-dir']  = '/etc/php5/cli/conf.d'
    default['php']['mod-packages']      =  %w{  }
  when '5.6'
    default['php']['ppa']           = 'ppa:ondrej/php5-5.6'
    default['php']['ext-conf-dir']  = '/etc/php5/cli/conf.d'
    default['php']['mod-packages']      =  %w{  }
  else

end

