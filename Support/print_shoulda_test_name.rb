def parse_from_quotes(name)
  name.to_s.gsub(/^(?:.*"(.*)"|.*'(.*)').*$/) { $1 || $2 }
end

n = ENV['TM_LINE_NUMBER'].to_i

should, context, class_name = nil, nil, nil

File.open(ENV['TM_FILEPATH']) do |f|
  lines     = f.read.split("\n")[0...n].reverse
  context   = lines.find { |line| line =~ /^\s*context\b/ }
  should    = parse_from_quotes(lines.find { |line| line =~ /^\s*should\b/ })
  lines.find { |line| line =~ /^\s*class (\w*)Test/ }
  class_name = $1
end

if (context || class_name) && should
  puts "shoulda"
  context = parse_from_quotes( context )
  name = "#{context} should #{should}".gsub(/[\+\.\s\'\"\(\)]/,'.')
  print "--name=/#{name}/ -v v"  
else
  raise "No test could be automatically identified."
end