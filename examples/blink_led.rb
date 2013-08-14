require 'bundler/setup'
require 'firmata'
require 'socket'

sp = TCPSocket.open '127.0.0.1', 8023
#sp = '/dev/tty.usbserial-A700636n'
board = Firmata::Board.new(sp)

board.connect

puts "Firmware name #{board.firmware_name}"
puts "Firmata version #{board.version}"

pin_number = 13
rate = 0.5

10.times do
  board.digital_write pin_number, Firmata::Board::HIGH
  puts '+'
  board.delay rate

  board.digital_write pin_number, Firmata::Board::LOW
  puts '-'
  board.delay rate
end
