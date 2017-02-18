# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
CONFIG = File.join(File.dirname(__FILE__), "vagrant-config.rb")

if File.exist?(CONFIG)
  require CONFIG
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.hostname = "elkBox"
  config.vm.boot_timeout = 30
  config.vm.graceful_halt_timeout = 15

  config.vbguest.auto_update = false
  config.vbguest.no_remote = true

  # If you wish to build the box offline, uncomment this line
  config.vm.box_check_update = false

  # config.vm.network "private_network", ip: "10.0.0.100"
  # config.vm.network "private_network", type: "dhcp"
  # config.vm.network "public_network", :bridge => "wlan0", :ip => "10.0.0.100"

  # config.vm.synced_folder "sources", "/home/sources/something"
  # config.vm.synced_folder "sources", "/home/sources/something", type: "nfs", nfs_udp: 1

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 443, host: 8443

  # Elastic search API port
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  # Kibana frontend port
  config.vm.network "forwarded_port", guest: 5601, host: 5601

  # Set the name of the box to elkBox
  config.vm.define :elkBox do |t|
  end

  # Providers
  config.vm.provider :virtualbox do |p|
    p.name = "elkBox"

#    config.vm.provider :virtualbox do |vb|
#      vb.gui = true
#    end

  # These shortcuts can be achieved with 'modifyvm' as below.
    p.memory = 2048
    # p.cpus = 2

    # p.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    # p.customize ["modifyvm", :id, "--nictype1", "virtio"]
  end

  # Forwards SSH requests to host machine (to use its SSH keys)
  config.ssh.forward_agent = true

  # Just use the insecure_private_key for convenience
  config.ssh.insert_key = false
end
