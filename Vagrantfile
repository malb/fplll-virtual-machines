# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "ubuntu32" do |ubuntu32| 
    ubuntu32.vm.box = "ubuntu/xenial32"
    ubuntu32.vm.provision "shell", path: "setup-strategizer.sh", args: "debian", privileged: false
    ubuntu32.vm.provider 'virtualbox' do |vb|
      vb.customize ['modifyvm', :id, '--name', 'fplll-ubuntu32']
      vb.memory = "1024"
    end
  end

  config.vm.define "ubuntu64" do |ubuntu64| 
    ubuntu64.vm.box = "ubuntu/xenial64"
    ubuntu64.vm.provision "shell", path: "setup-strategizer.sh", args: "debian", privileged: false
    ubuntu64.vm.provider 'virtualbox' do |vb|
      vb.customize ['modifyvm', :id, '--name', 'fplll-ubuntu64']
      vb.memory = "1024"
    end
  end
  
end
