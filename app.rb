require_relative 'lib/usb_listener'
require_relative 'lib/consumers/consumer'
require_relative 'lib/consumers/bus_reader'

read_mode = BusReader
listener = UsbListener.new(read_mode)
listener.listen

