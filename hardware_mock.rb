
class HardwareMock
	attr_accessor :temp, :temp_expected

	def initialize (temp_actual, temp_expected)
		@temp = temp_actual
		@temp_expected = temp_expected
		@cost = 0
	end

	def add_cost (cost)
		@cost = @cost + cost
	end

	def cost
    @cost
  end	
end