#!/usr/bin/env ruby

require 'congenlib'

@snplist = [] # Array of SNP indices to retain
@current_index = 0 # Current SNP index

gz_file_open(ARGV[0]) do |f1|
	while line = f1.gets
		index = line.strip.split(",")[1].to_i
		@snplist.push(index)
	end
end

gz_file_open(ARGV[1]) do |f2|
	while line = f2.gets
		if line[0].chr == '#'
			puts line
		else
			@current_index += 1
			if @snplist.include?(@current_index)
				puts line
				@snplist.delete(@current_index)
			end
		end
	end
end