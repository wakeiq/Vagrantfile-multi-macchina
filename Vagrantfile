# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  #Macchina1 -> web
  config.vm.define "web" do |subconfig|
    subconfig.vm.hostname = "web.m340"
    subconfig.vm.network "private_network", ip: "10.10.20.10", virtualbox__intnet: true
    subconfig.vm.network "private_network", ip: "192.168.56.10", name: "VirtualBox Host-Only Ethernet Adapter"
    subconfig.vm.synced_folder "site/", "/var/www/html"
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "web.m340"
      vb.memory = 2048
      vb.cpus = 2
    end
    subconfig.vm.provision "shell", path: "provisioning/web.sh"
  end
  #Macchina2 -> db
  config.vm.define "db" do |subconfig|
    subconfig.vm.hostname = "db.m340"
    subconfig.vm.network "private_network", ip: "10.10.20.11", virtualbox__intnet: true
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "db.m340"
      vb.memory = 2048
      vb.cpus = 2
    end
    subconfig.vm.provision "shell", path: "provisioning/db.sh"
  end
end
