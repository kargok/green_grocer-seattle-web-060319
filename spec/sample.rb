require 'pry'
arr1 = [
{name: "ryan"},
{name: "karen"}]

puts arr1

names_only = Array.new

for x in 0..arr1.length-1
	names_only << arr1[x][:name]
	# binding.pry
end

puts names_only
# binding.pry

def initialize(hello)
	@hello = hello
end