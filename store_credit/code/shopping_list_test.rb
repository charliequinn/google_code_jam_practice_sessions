require 'shopping_list'

class ShoppingListTest
	def self.overall_test
		expected_results = IO.readlines('expected_test_results.txt')
		result_file_name = ShoppingList.create_shopping_list('test_input.txt')
		results =  IO.readlines(result_file_name)
		
		expected_results == results
	end
	
	def self.test_parse_file()
		file_to_read = 'test_input.txt'
		expected_file_lines = [	'3',
						'100',
						'3',
						'5 75 25',
						'200',
						'7',
						'150 24 79 50 88 345 3',
						'8',
						'8',
						'2 1 9 4 4 56 90 3']

		result = ShoppingList.parse_file(file_to_read)
		expected_file_lines == result
	end
	
	def self.test_pick_two_items_to_buy_a
		test_case = [	'100',
					'3',
					'5 75 25']
					
		expected_result = ['2','3']

		result = ShoppingList.pick_two_items_to_buy(test_case)
		expected_result == result
	end
	
	def self.test_pick_two_items_to_buy_b
		test_case = [	'200',
					'7',
					'24 150 79 50 88 345 3']
					
		expected_result = ['2','4']

		result = ShoppingList.pick_two_items_to_buy(test_case)

		expected_result == result
	end

	def self.test_extract_test_cases
		file_lines = ['3',
				'100',
				'3',
				'5 75 25',
				'200',
				'7',
				'150 24 79 50 88 345 3',
				'8',
				'8',
				'2 1 9 4 4 56 90 3']
				
		expected_result = [['100','3','5 75 25'],
					  ['200','7','150 24 79 50 88 345 3'],
					  ['8','8','2 1 9 4 4 56 90 3']]

		result = ShoppingList.extract_test_cases(file_lines)

		expected_result == result
	end
end

puts "overall_test -- #{ShoppingListTest.overall_test} --"
puts "test_parse_file -- #{ShoppingListTest.test_parse_file} --"
puts "return_two_items_to_buy_a -- #{ShoppingListTest.test_pick_two_items_to_buy_a} --"
puts "return_two_items_to_buy_b -- #{ShoppingListTest.test_pick_two_items_to_buy_b} --"
puts "extract_test_cases -- #{ShoppingListTest.test_extract_test_cases} --"