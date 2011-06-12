class ShoppingList
	def self.create_shopping_list(filename)
		results_file = "results_for_#{filename}"
		
		file_lines = ShoppingList.parse_file(filename)
		test_cases = ShoppingList.extract_test_cases(file_lines)		
		
		File.open(results_file,'w') do |file|
			count = 1
			test_cases.each do |test_case|
				result = ShoppingList.pick_two_items_to_buy(test_case)		
				file.puts("Case ##{count}: #{result[0]} #{result[1]}")
				count += 1
			end		
		end

		return results_file
	end
	
	def self.parse_file(filename)
		file_lines = []
		File.open(filename, 'rb') do |file|
			file.each_line do |line|
				file_lines << line.gsub(/\r\n?/, "")
			end
		end
		
		file_lines
	end
	
	def self.pick_two_items_to_buy(test_case)
		store_credit = test_case[0].to_i
		total_items = test_case[1].to_i 
		item_values = test_case[2].split(" ")

		i = 0
		while(i < item_values.length)
			item_value = item_values[i].to_i			
			value_to_find = store_credit - item_value
			
			remainder_of_item_values = item_values[i+1..item_values.length-1]
			
			second_item_index = remainder_of_item_values.index(value_to_find.to_s)
			
			if !second_item_index.nil?
				index_of_item_offset = i + 1
				second_item_index_offset = second_item_index + 1			
				return ["#{index_of_item_offset}","#{index_of_item_offset+second_item_index_offset}"] if !second_item_index.nil?
			end
			
			i += 1
		end		
	end
	
	def self.extract_test_cases(file_lines)
		test_cases = []
		
		i = 1
		while(i < file_lines.length)
			upper_limit = i + 2
			test_cases << file_lines[i..upper_limit]
			i += 3
		end
		
		test_cases
	end
	
end