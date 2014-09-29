def save_list(str)
	File.open("out.txt", "w") do |f|
		f <<str
	end
	puts "Saved"
end
