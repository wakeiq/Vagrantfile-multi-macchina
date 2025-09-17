# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  BOX_NAME = "ubuntu/jammy64"
  MEMORY = 2048
  CPUS = 2
  UART_PORT = "0x3F8"
  UART_IRQ = "4"
  HOST_ONLY_NAME= "VirtualBox Host-Only Ethernet Adapter"
  config.vm.box = BOX_NAME
  # Macchina1 -> web
  config.vm.define "web" do |subconfig|
    subconfig.vm.hostname = "web.m340"
    subconfig.vm.network "private_network", ip: "10.10.20.10", virtualbox__intnet: true
    subconfig.vm.network "private_network", ip: "192.168.56.10", name: HOST_ONLY_NAME
    subconfig.vm.synced_folder "site/", "/var/www/html"
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "web.m340"
      vb.memory = MEMORY
      vb.cpus = CPUS
	    vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
    vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
    end
    subconfig.vm.provision "shell", path: "provisioning/web.sh"
  end
  # Macchina2 -> db
  config.vm.define "db" do |subconfig|
    subconfig.vm.hostname = "db.m340"
    subconfig.vm.network "private_network", ip: "10.10.20.11", virtualbox__intnet: true
    subconfig.vm.provider "virtualbox" do |vb|
      vb.name = "db.m340"
      vb.memory = MEMORY
      vb.cpus = CPUS
	    vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
    vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
    end
    subconfig.vm.provision "shell", path: "provisioning/db.sh"
  end
end
