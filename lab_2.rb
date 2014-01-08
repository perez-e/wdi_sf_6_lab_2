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

restart = "yes"
page = 1;
while  restart.downcase.include?('yes') || restart.downcase.include?("y")
	num = 0
	my_hash.each_key do |key|
		if key.match /~p#{page}$/
			puts my_hash[key]
		elsif key.match /~p#{page}:c\d/
			num += 1
			puts my_hash[key].delete("\n") + " : type " + "c#{num}"
		end
	end

	puts
	num = 0
	print ">>> "
	choice = gets.chomp

	super_key = ""
	my_hash.each_key do |key|
		if key.index choice
			super_key = "~"+key[-2]+key[-1]
		end
	end

	puts
	puts my_hash[super_key].chomp
	puts

	print "Would you like to restart the story [y/n]: "
	restart = gets.chomp
	restart = "n" if restart == ""
end

puts "Story telling is over."