class NestedHash < Hash
  def initialize(input)
    input.each do |line|
      parts = line.split('|')
      hash = self
      last = parts[-1]
      parts[0..-2].each.with_index do |part, index|
        puts part
        if hash[part]
          hash = hash[part]
        else
          hash[part] = {}
          hash = hash[part] if index < parts.size - 2
        end
      end
      hash[parts[-2]] = last
    end
  end
end

puts NestedHash.new([
'app1|server1|uptime|5',
'app1|server1|loadavg|0.01 0.02 0.03',
'app1|server1|conn1|state|up',
'app1|server2|uptime|10',
'app1|server2|loadavg|0.11 0.22 0.33',
'app1|server2|conn1|state|down',
'app1|running|true'
                    ])

        
