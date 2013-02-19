if sidekiq_instance?
  # for now
  worker_count = 1
  
  template "/engineyard/bin/sidekiq" do
    owner 'root'
    group 'root' 
    mode 0755
    source "sidekiq.erb" 
  end

  node[:applications].each do |app_name, data|
    template "/etc/monit.d/sidekiq_#{app_name}.monitrc" do 
      owner 'root' 
      group 'root' 
      mode 0644 
      source "monitrc.conf.erb" 
      variables({ 
        :num_workers => worker_count,
        :app_name => app_name, 
        :rails_env => node[:environment][:framework_env] 
      }) 
    end

    worker_count.times do |count|
      template "/data/#{app_name}/shared/config/sidekiq_#{count}.yml" do
        owner node[:owner_name]
        group node[:owner_name]
        mode 0644
        source "sidekiq.yml.erb"
        variables({
          :require => "/data/#{app_name}/current"
        })
      end
    end
  end 
end
