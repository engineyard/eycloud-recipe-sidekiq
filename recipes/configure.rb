#
# Cookbook Name:: sidekiq
# Recipe:: restart
#

if sidekiq_instance?

  node[:applications].each do |app_name, data|
    
    template "/etc/monit.d/sidekiq_#{app_name}.monitrc" do 
      owner 'root'
      group 'root'
      mode 0644
      source "monitrc.erb" 
      variables({ 
        :command_name => "sidekiq",
        :app_name => app_name
      }) 
    end
    
  end
end