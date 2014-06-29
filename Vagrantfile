# vi: set ft=ruby :

Vagrant.require_version ">= 1.6.1"
Vagrant.configure('2') do |config|
  config.vm.box = 'vm'

  config.vm.provider 'virtualbox' do |v|
    v.name = 'vm'
  end

  # forward guest port to access your web application
  #config.vm.network :forwarded_port, host: 8080, guest: 8080

  config.ssh.forward_agent    = true
  config.ssh.private_key_path = 'packer/keys/vm'

  # share a folder with your host via nfs
  #config.vm.synced_folder "git", "/home/vagrant/dir_to_share", :nfs => true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w(cookbooks)

    # Setup
    chef.add_recipe('helper::setup')

    # Dev Tools
    chef.add_recipe('zsh::install')
    chef.add_recipe('zsh::setup')
    chef.add_recipe('ruby::rbenv')
    chef.add_recipe('ruby::ruby_build')

    # Custom recipes
    chef.add_recipe('tmux::install')
    chef.add_recipe('vim::install')
    chef.add_recipe('homeshick::install')
    chef.add_recipe('homeshick::setup')
    chef.add_recipe('ssh::setup')

    # Datastores
    chef.add_recipe('postgres::install')
    chef.add_recipe('postgres::setup')
    chef.add_recipe('sqlite::install')

    # Headless browsers
    chef.add_recipe('phantomjs::install')

    # Cleanup
    chef.add_recipe('helper::cleanup')
  end
end
