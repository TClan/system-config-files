IRB.conf[:AUTO_INDENT] = true

if ENV.include?('RAILS_ENV')
  if !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
  end

  def sql query
    ActiveRecord::Base.connection.select_all(query)
  end

elsif defined?(Rails) && !Rails.env.nil?
  if Rails.logger
    Rails.logger =Logger.new(STDOUT)
    ActiveRecord::Base.logger = Rails.logger
  end
else
  # nothing to do
end

# annotate column names of an AR model
def show(obj)
  y(obj.send("column_names"))
end

class Object
   def local_methods
    (methods - Object.instance_methods).sort
  end
end

def pbcopy(string)
  `echo "#{string}" | pbcopy`
  string
end
