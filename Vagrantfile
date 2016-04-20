Vagrant.configure(2) do |config|

  # Base box
  config.vm.box = "fgrehm/trusty64-lxc"
  config.vm.box_check_update = false

  # Network
  config.vm.network "private_network", ip: "10.0.3.101", lxc__bridge_name: 'lxcbr3'

  # Shared directories
  config.vm.synced_folder "./conf/nginx/", "/etc/nginx/"
  config.vm.synced_folder "./conf/fpm/", "/etc/php5/fpm/"
  config.vm.synced_folder "./conf/configs/", "/var/conf/"
  config.vm.synced_folder "./www/", "/var/www/"

  # Provision
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.provision :shell do |shell|
    shell.path = "./upstart.sh"
  end

end
