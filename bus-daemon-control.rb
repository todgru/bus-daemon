# this is myproc_control.rb
require 'daemons'
require './lib/bus-daemon'

Daemons.run_proc('lib/bus-daemon.rb') do

  arg = BusDaemon.new

  loop do
    arg.record
    sleep(10)
  end

end
