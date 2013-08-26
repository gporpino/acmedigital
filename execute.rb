
require './hardware_mock'
require './controle_temperatura'

@hardware = HardwareMock.new 30, 20

@count = 0
@times = 360

360.times{
  control = ControleTemperatura.new 
  result = control.refrigera(@hardware.temp, @hardware.temp_expected)

  @hardware.temp = result[:temp_final]
  @hardware.add_cost result[:custo_reducao]
  
  puts "temp: #{result[:temp_final]} cost of reduction: #{result[:custo_reducao]}"

  @hardware.temp = @hardware.temp + 0.5
}

puts "Custo Total em #{@times} minutos: #{@hardware.cost}"


