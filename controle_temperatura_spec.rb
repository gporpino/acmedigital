require './controle_temperatura'

describe ControleTemperatura, "#refrigera" do

	it "check degrees 24 to 22" do
		controle = ControleTemperatura.new 
		result = controle.refrigera(24, 22)

		result[:temp_final].should eq(24)
		result[:custo_reducao].should eq(0)

	end	

	it "check degrees 23 to 22" do
		controle = ControleTemperatura.new 
		result = controle.refrigera(23, 22)

		result[:temp_final].should eq(23)
		result[:custo_reducao].should eq(0)
	end	

	it "check degrees 25 to 22" do
		controle = ControleTemperatura.new 
		result = controle.refrigera(25, 22)

		result[:temp_final].should eq(20)
		result[:custo_reducao].should eq(1)
	end	

	it "check degrees 22 to 22" do
		controle = ControleTemperatura.new 
		result = controle.refrigera(22, 22)

		result[:temp_final].should eq(22)
		result[:custo_reducao].should eq(0)
	end	

	it "check degrees 23 to 22" do
		controle = ControleTemperatura.new 
		result = controle.refrigera(21, 22)

		result[:temp_final].should eq(21)
		result[:custo_reducao].should eq(0)
	end	

	it "check degrees 27 to 20" do
		controle = ControleTemperatura.new 
		result = controle.refrigera(27, 20)

		result[:temp_final].should eq(18)
		result[:custo_reducao].should eq(1.4)
	end	

end

