Vagrant.configure("2") do |config|
  config.vm.box = "centos-6.7-x86_64"
  config.vm.box_url = "centos-6.7-x86_64.box"
  # config.vm.boot_mode = :gui
  config.vm.network :forwarded_port, guest: 8080, host: 9071
  config.vm.network :forwarded_port, guest: 443, host: 9072
  config.vm.network :forwarded_port, guest: 80, host: 9073
  config.vm.network :private_network, ip: "192.168.33.30"
#  config.vm.network :public_network
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.vm.provider "virtualbox" do |v|
     v.customize ["modifyvm", :id, "--memory", 3072, "--cpus", 2, "--name", "Bahmni-OpenElis-Dev"]
  end
  config.vm.synced_folder "..", "/bahmni", :owner => "vagrant"
  config.vm.provision "file", source: "./pg_hba.conf", destination: "pg_hba.conf"
  config.vm.provision "shell", path: "./setup.sh"
end

