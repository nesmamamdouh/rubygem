require 'deplist/version'
require 'deplist/dep_logger'
require 'deplist/os_type'
require 'deplist/gem_server'
require 'deplist/install'

module Depan
  require 'depan/railtie.rb' if defined?(Rails)
end
