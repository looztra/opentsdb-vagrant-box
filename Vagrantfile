# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.define :tsdbcollector do |tsdbcollector_config|

  # Every Vagrant virtual environment requires a box to build off of.
    tsdbcollector_config.vm.box = "centos63"
    #
    tsdbcollector_config.vm.customize ["modifyvm", :id, "--memory", 2048]

    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    tsdbcollector_config.vm.box_url = "https://s3.amazonaws.com/itmat-public/centos-6.3-chef-10.14.2.box"

    # Boot with a GUI so you can see the screen. (Default is headless)
    tsdbcollector_config.vm.boot_mode = :gui

    tsdbcollector_config.vm.host_name = "opentsdbcollector"

    # Assign this VM to a host-only network IP, allowing you to access it
    # via the IP. Host-only networks can talk to the host machine as well as
    # any other machines on the same network, but cannot be accessed (through this
    # network interface) by any external networks.
    # config.vm.network :hostonly, "192.168.33.10"

    # Assign this VM to a bridged network, allowing you to connect directly to a
    # network using the host's network device. This makes the VM appear as another
    # physical device on your network.
    # config.vm.network :bridged

    # Forward a port from the guest to the host, which allows for outside
    # computers to access the VM, whereas host only networking does not.
    # config.vm.forward_port 80, 8080
    tsdbcollector_config.vm.forward_port 4242, 4242

    # Share an additional folder to the guest VM. The first argument is
    # an identifier, the second is the path on the guest to mount the
    # folder, and the third is the path on the host to the actual folder.
    # config.vm.share_folder "v-data", "/vagrant_data", "../data"
    # Enable provisioning with chef solo, specifying a cookbooks path, roles
    # path, and data_bags path (all relative to this Vagrantfile), and adding 
    # some recipes and/or roles.
    #
    tsdbcollector_config.vm.provision :chef_solo do |chef|
       chef.cookbooks_path = "chef/cookbooks"
       chef.roles_path = "chef/roles"
    #   chef.data_bags_path = "../my-recipes/data_bags"          
       chef.add_role "base"
       chef.add_role "java"
       chef.add_recipe "opentsdb"
       chef.add_recipe "opentsdb::opentsdb"              
       chef.add_recipe "opentsdb::tcollector"
    #
    #   # You may also specify custom JSON attributes:
    #   chef.json = { :mysql_password => "foo" }
    end


  end

end
