require './compressor_mock'

class ControleTemperatura

	def initialize 
		
		@human_sensity = 2
		
	end

	def refrigera(temp_atual, temp_expected)
		custo_reducao = 0.0
		temp_final = temp_atual
		
		if (temp_atual - temp_expected) > @human_sensity
			@compressor = CompressorMock.new temp_atual
			
			t = temp_atual - (temp_expected - @human_sensity)
			t.to_i.times { 
				 temp_final = @compressor.reduz_um_grau
			}
			custo_reducao = @compressor.custo
		end

		result = Hash.new
		result[:temp_final] = temp_final
		result[:custo_reducao] = custo_reducao
		
		result
	end
end
