module Codeforces
  module System
    require 'rbconfig'
    # true if you're running Windows
    WINDOWS = RbConfig::CONFIG['host_os'] =~ /windows|mswin32/i
  end
end