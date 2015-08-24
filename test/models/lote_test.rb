require 'test_helper'

class LoteTest < ActiveSupport::TestCase
  setup do
    @lote = Lote.first
  end

   test "area da copa" do
     assert_equal @lote.area_copa, 7.069
   end

   test ".percentual_mensal_horas_luz_solar" do
     assert_equal @lote.percentual_mensal_horas_luz_solar(8), 8.18
   end

   test ".evapotranspiracao_potencial" do
     assert_equal @lote.evapotranspiracao_potencial(25), 5.23
   end

   test ".evapotranspiracao_da_cultura" do
     assert_equal @lote.evapotranspiracao_da_cultura(25, 0.85), 5.25
   end

end
