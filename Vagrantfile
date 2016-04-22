# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  ## Choose Official Ubuntu Server 14.04 LTS 32bit (Trusty Tahr) as the base box
  config.vm.box = "ubuntu/trusty32"

  ## Mount the Salt file root configuration
  config.vm.synced_folder "srv/salt", "/srv/salt/"

  ## Enable provisioning with Salt
  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "srv/salt/etc/minion"
    salt.run_highstate = true
    salt.verbose = true
  end

  ## Extra VirtualBox configuration
  config.vm.provider "virtualbox" do |vb|
    ## Give the system 2Gbs of RAM
    vb.customize ["modifyvm", :id, "--memory", 2048]

    ## Change the network card to PCnet-FAST III
    # NAT adapter
    vb.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
    # Host-only adapter
    vb.customize ["modifyvm", :id, "--nictype2", "Am79C973"]
  end

  ## Set the network parameters
  config.vm.network "private_network", type: "dhcp"

  ## Forward the default NodeJS port
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  ## Configure default SSH connection parameters
  config.ssh.insert_key = false
end
