#!/usr/bin/env ruby
# this file should run in most environments without needing any additional gems.
# run it to get help.

require 'json'
require 'pry'

def generate_cube(x_count, y_count, z_count)
	a = []
	i = x_count + y_count + z_count
	(0..x_count).each do |x|
		(0..y_count).each do |y|
			(0..z_count).each do |z|
				a[i] = [x / 2.0 - x, y / 2.0 - y , z / 2.0 - z]
				i = i + 1
			end
		end
	end

	return a
end

def generate_matrix(x_count, y_count)
	a = []
	i = x_count + y_count
	(0..x_count).each do |x|
		(0..y_count).each do |y|
			a[i] = [x / 2.0 - x, y / 2.0 - y, 0.0]
			i = i + 1
		end
	end

	return a
end

def generate_strip(x)
	a = []
	(0..x).each do |i|
		a[i] = [0.0, x / 2.0 - i, 0.0]
		i = i + 1
	end
	return a
end


# given an array of points, produce a file ready for the open_gl simulator.
def to_layout(points)
	output = []

	points.each do |p|
		output.push({"point" => p})
	end

	return JSON::pretty_generate(output, indent:"  ")
end

puts to_layout generate_cube 8, 8, 8
