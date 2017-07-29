require 'httparty'
require 'json'

class GemListServer
  include HTTParty

  base_uri 'http://localhost:3000'

  def initialize(gems)
    @options  = { query: { gems: gems, os: OsType.current_os } }
    @packages = load_packages(@options)
  end

  def self.create(unknown_gem, dependencies)
    options = { body: { gem: unknown_gem, dependencies: dependencies, os: OsType.current_os } }

    self.class.post('/system_lib', options)
  end

  def dependencies
    @packages['dependencies'].reject { |pkg| pkg_exists?(pkg) }
  end

  private

  def load_packages(options)
    packages = self.class.get('/dependencies', options)
    JSON.parse(packages.to_json)
  end

  def pkg_exists?(pkg)
    system("which #{pkg} >/dev/null 2>&1")
  end
end
