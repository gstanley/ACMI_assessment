def netmask_to_bits(netmask)
  match_result = /(\d+)\.(\d+)\.(\d+)\.(\d+)/.match(netmask)
  octets = match_result[1..4]
  binary = octets.map {|octet| "%08b" % octet}.join
  ones, zeros = /(1*)(0*)/.match(binary)[1..2]
  if zeros.to_i(2) == 0 && ones.size + zeros.size == 32
    ones.size
  else
    -1
  end
end

puts netmask_to_bits("255.255.255.252")
puts netmask_to_bits("255.1.2.3")

