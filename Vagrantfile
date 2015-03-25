# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "php-berkshelf"
  config.omnibus.chef_version = :latest
  config.vm.box = "chef/ubuntu-12.04"
  config.vm.network :forwarded_port, guest: 80, host: 11180
  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
        "recipe[php]",
        "recipe[php::test]",
        "recipe[php::geoip]"
    ]
    chef.json = {
      'php' => {
        'version' => '5.5', 
          'cli' => {
            'ini-defaults' => {"PHP" => [['short_open_tag','on']], "Session" => [['url_rewriter.tags','"a=href,area=href,frame=src,input=src,form=fakeentry1"']]}
        }
      }
    }
  end
end
