require 'rbconfig'

class OsType
  class << self
    def current_os
      os_type
    end

    def linux?
      os_type == 'linux'
    end

    def macosx?
      os_type == 'macosx'
    end

    private

    def os_type
      @os ||= begin
        host_os = RbConfig::CONFIG['host_os']
        case host_os
        when /darwin|mac os/
          'macosx'
        when /linux/
          'linux'
        else
          'unknown'
        end
      end
    end
  end
end
