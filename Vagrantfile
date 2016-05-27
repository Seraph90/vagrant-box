Vagrant.configure(2) do |config|

    # Base box
    config.vm.box = "fgrehm/trusty64-lxc"
    config.vm.box_check_update = false

    # Network
    config.vm.network "private_network", ip: "10.0.3.100", lxc__bridge_name: 'lxcbr3'

    # Shared directories
    config.vm.synced_folder "./configs/", "/var/configs/"
    config.vm.synced_folder "./scripts/", "/var/scripts/"
    config.vm.synced_folder "./sites-available/", "/var/sites-available/"
    config.vm.synced_folder "./www/", "/var/www/"

    # Provision
    config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

    config.vm.provision :shell do |shell|
        shell.args = "nginx"
        shell.path = "./upstart.sh"
    end
end
