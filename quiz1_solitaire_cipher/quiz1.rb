require File.dirname(__FILE__) + '/Encrypter.rb'

String message = "Code in Ruby, live longer!"
String key_stream = "DWJXH YRFDG TMSHP UURXJ"
#String message = "RubyMonk Is Pretty Brilliant!!!"

encrypter = Encrypter.new(message, key_stream)

out = encrypter.encrypt

p out

