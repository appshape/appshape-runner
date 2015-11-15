@options = Slop.parse do |o|
  o.array '--locations', 'list of locations that should be watched', delimiter: ','
end

unless @options[:locations].is_a?(Array) && @options[:locations].length > 0
  puts 'You need to specify at least one location! (--locations)'
  exit(-1)
end