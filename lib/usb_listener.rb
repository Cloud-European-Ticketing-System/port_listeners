require 'serialport'
require 'yaml'

class UsbListener

  attr_accessor :serial_port
  attr_accessor :consumer

  def initialize(consumer)
    config = YAML::load(File.open(File.expand_path('../../config/serial.yml', __FILE__)))
    @serial_port = SerialPort.new(config['port'], config['baud_rate'], config['data_bits'], config['stop_bits'], SerialPort::NONE)
    @consumer = consumer
  end

  def listen
    while true do
      while (received_id = @serial_port.gets.chomp) do
        consumer.consume(received_id)
      end
    end
  end

  def close_connection
    @serial_port.close
  end

end
