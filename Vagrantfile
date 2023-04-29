Vagrant.configure("2") do |config|
    # Ubuntu 16.04
    config.vm.box = "ubuntu/xenial64"

    config.vm.define "pintos" do |pintos|
        ip_addr = "192.168.1.1"
    
        pintos.vm.provider :virtualbox do |vb|
          vb.cpus = 2
          vb.memory = 2048
        end
    
        pintos.vm.network "public_network", bridge: "eth0"
        pintos.vm.network "private_network", ip: "#{ip_addr}", virtualbox__intnet: true
        pintos.vm.hostname = "pintos"
    
      
        pintos.vm.provision :shell, path: "bootstrap.sh"
        
      end
end