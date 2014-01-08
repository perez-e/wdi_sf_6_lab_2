my_hash = {}

File.open("story.txt", "r") do |infile|
	while line = infile.gets
		if line.match /^~p/
			key = line.chomp
			my_hash[key]=""
		else
			my_hash[key]<<line
		end
	end
end

num = 0
my_hash.each_key do |key|
	if key.match /~p1$/
		puts my_hash[key]
	elsif key.match /~p1:c\d/
		num += 1
		puts my_hash[key].delete("\n") + " : press " + "c#{num}"
	end
end
num = 0
print ">>> "
choice = gets.chomp

crazy_key = ""
my_hash.each_key do |key|
	if key.index choice
		crazy_key = "~"+key[-2]+key[-1]
	end
end

puts my_hash[crazy_key]
