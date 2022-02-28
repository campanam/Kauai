#!/usr/bin/env ruby

require 'congenlib'

snpcount = {} # Hash of SNP counts in ROH indexed by sample name

gz_file_open(ARGV[0]) do |f1|
	while line = f1.gets
		line_arr = line.split
		if line_arr[0] == 'RG'
			sample = line_arr[1]
			length = line_arr[5].to_i
			if snpcount.keys.include?(sample)
				snpcount[sample] += length
			else
				snpcount[sample] = length
			end
		end
	end
end
sortsnpcount = snpcount.sort_by { |key, value| key }
puts "Sample\tRoH_Length"
for sample in sortsnpcount
	puts sample[0] + "\t" + sample[1].to_s
end