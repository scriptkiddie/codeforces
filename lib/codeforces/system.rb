require 'rbconfig'

module Codeforces
  # true if you're running Windows
  WINDOWS = RbConfig::CONFIG['host_os'] =~ /windows|mswin32/i
end
