
class CompressorMock

	attr_accessor :custo, :temp

	def initialize (temp)
		@temp = temp
		@custo = 0.5
	end

	def reduz_um_grau 
		@custo = (@custo + 0.1).round(1)

		@temp = @temp - 1
	
		@temp
	end
end


