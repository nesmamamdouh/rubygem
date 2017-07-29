require 'depan'
require 'rails'

module Depan
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'show_dep.rake'
    end
  end
end
