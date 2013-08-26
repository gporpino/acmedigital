
require 'clockwork'
require './hardware_mock'
require './controle_temperatura'
include Clockwork

@hardware = HardwareMock.new 30, 20

@count = 0
@times = 360

every(15.second, 'refrigera.job') do |job|
	
  control = ControleTemperatura.new 
  result = control.refrigera(@hardware.temp, @hardware.temp_expected)

  @hardware.temp = result[:temp_final]
  @hardware.add_cost result[:custo_reducao]
  
  puts "temp: #{result[:temp_final]} cost_of_reduction: #{result[:custo_reducao]}"
end

every(1.minute, 'uptemp.job')  do |job|
  @hardware.temp = @hardware.temp + 0.5

  @count = @count + 1
  if @count > @times
  	puts "Custo Total em #{@times} minutos: #{@hardware.cost}"
  	exit
  end
end




