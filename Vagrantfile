# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  config.ssh.forward_agent = true

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "10.31.3.14"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 12355, host: 12355
  config.vm.network "forwarded_port", guest: 12356, host: 12356

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./projects", "/home/vagrant/projects"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:

  config.vm.provider "virtualbox" do |vb|
    # These super low-spec settings were chosen to emulate the specs that we'll
    # have available to us when running on the beaglebone black. You may want to
    # increase the resources available to the VM when initially setting it up so
    # that it doesn't take an absurdly long time.
    vb.cpus = 1
    vb.memory = "1024"

    vb.customize [ "modifyvm", :id, "--usb", "on" ]
    vb.customize [ "usbfilter", "add", "0",
      "--target", :id,
      "--name", "Arduino Nano",
      "--vendorid", "0x1a86",
      "--productid", "0x7523",
    ]
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "axiom"
    chef.verbose_logging = true
  end
end
