class Chef
  class Recipe
    # Return which instance is to have redis installed on it
    # This is determind as follows:
    #   1. A utility prefixed with 'resque'
    #   2. A solo
    # Returns array of hash of instance data, including { "id" => "i-123456", }
    def sidekiq_instances
      @resque_instances ||= node[:engineyard][:environment][:instances].find do |x|
        x[:role] == "solo" || node[:instance_role] == "eylocal" || 
                        (node[:role] == "util" && node[:name] == "sidekiq"
      end
    end
    
    # Does this instance run resque?
    def sidekiq_instance?
      node[:instance_role] == "solo" || node[:instance_role] == "eylocal" || 
              (node[:instance_role] == "util" && node[:name] == "sidekiq"
    end
  end
end