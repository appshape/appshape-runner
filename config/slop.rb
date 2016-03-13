@options = Slop.parse do
  on :locations=, as: Array, delimiter: ','
end

unless @options[:locations].is_a?(Array) && @options[:locations].length > 0
  puts 'You need to specify at least one location! (--locations)'
  exit(-1)
end