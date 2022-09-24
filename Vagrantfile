Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2204"
  
  config.vm.define "ubuntu_podman_minikube" do |ubuntu_podman_minikube|
  
    config.vm.synced_folder "C:\\My\\AMIS\\MySharedFolder", "/mnt/mysharedfolder", automount: true
  
    config.vm.network "forwarded_port",
      guest: 8001,
      host:  8001,
      auto_correct: true
      
    config.vm.network "forwarded_port",
      guest: 8080,
      host:  8080,
      auto_correct: true
      
    config.vm.provider "virtualbox" do |vb|
        vb.name = "Ubuntu Podman Minikube"
        vb.memory = "8192"
        vb.cpus = "2"
        
    args = []
    config.vm.provision "podman shell script", type: "shell",
        path: "scripts/podman.sh",
        args: args
        
    args = []
    config.vm.provision "minikube shell script", type: "shell",
        path: "scripts/minikube.sh",
        privileged: false,
        args: args
        
    args = []
    config.vm.provision "kubectl shell script", type: "shell",
        path: "scripts/kubectl.sh",
        privileged: false,
        args: args
    end
    
  end

end
