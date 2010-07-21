if Rails.env.test?

  require 'drb'
  require 'factory_girl'
  require File.join(RAILS_ROOT,'spec/factories')

  class DRbActiveRecordInstanceFactory
    @@port = 9001

    def get_port_for_factory_product(factory_product)
      port = get_new_port
      inst = Factory.create(factory_product)
      DRb.start_service("druby://localhost:#{port}",inst)
      port
    end

    def get_port_for(class_name,id)
      port = get_new_port
      inst = ActiveRecord::Base.const_get(class_name).find(id)
      DRb.start_service("druby://localhost:#{port}",inst)
      port
    end

    def truncate_tables
      %w(people).each do |table|
        ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table}")
      end
    end


    private
    def get_new_port
      port = @@port
      @@port += 1
      port
    end
  end

  DRb.start_service('druby://localhost:9000',DRbActiveRecordInstanceFactory.new)
end
