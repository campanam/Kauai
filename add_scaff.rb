#! /usr/bin/env ruby

require 'congenlib'

gz_file_open(ARGV[0]) do |f1|
	while line = f1.gets
		if line[0].chr == "#"
			puts line
		else
			puts 'scaff' + line
		end
	end
end