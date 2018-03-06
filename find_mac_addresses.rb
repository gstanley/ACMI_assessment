def find_mac_addresses(directory)
  Dir.entries(directory).each do |filename|
    next if File.directory?(filename)
    File.foreach(filename).with_index do |line, number|
      match = /(..):(..):(..):(..):(..):(..)/.match(line)
      if match && match[1..6].all? {|octet| octet.to_i(16) < 256}
        puts "file: #{filename}"
        puts "line: #{number + 1}"
        puts "address: #{match[1..6].join(':')}"
        puts
      end
    end
  end
end

find_mac_addresses(".")
