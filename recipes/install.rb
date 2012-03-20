#
# Cookbook Name:: sidekiq
# Recipe:: install
#

if sidekiq_instance?

  template "/engineyard/bin/sidekiq" do
    source "sidekiq.erb"
    owner "root"
    group "root"
    mode 0655
    variables({
      :command_name => "sidekiq",
      :command => "bundle exec sidekiq"
    })
  end

end