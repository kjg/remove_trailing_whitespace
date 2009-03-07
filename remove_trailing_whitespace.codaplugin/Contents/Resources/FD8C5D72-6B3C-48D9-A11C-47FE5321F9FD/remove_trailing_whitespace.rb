#!/usr/bin/ruby

ip_line = ENV['CODA_LINE_NUMBER'].to_i
ip_index = ENV['CODA_LINE_INDEX'].to_i
$stdin.each_line do |line|
	line.rstrip!
	if $stdin.lineno == ip_line
		ip_index = line.length if (line.length) < ip_index
		line = line.insert(ip_index, "$$IP$$")
	end
	print line
	print ENV['CODA_LINE_ENDING']
end
