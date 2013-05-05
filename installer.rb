require 'webrick'

local_port = 2000
local_host = Socket.gethostname
local_ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address

message = "Starting server: http://#{local_host}:#{local_port} (http://#{local_ip}:#{local_port})"
full_length = message.length + 6

puts "=" * full_length
puts "== #{message} =="
puts "=" * full_length

server = WEBrick::HTTPServer.new( :Port=>local_port, :DocumentRoot=>Dir::pwd )
trap("INT"){ server.shutdown }
server.start