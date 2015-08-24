# Evapotranspiração de referência et0
class FatorCorrecao
  DATA = { 
    'baixo' => {
      2 => { 20 => 0.92, 50 => 0.82, 100 => 0.64 },
      5 => { 20 => 1.06, 50 => 0.91, 100 => 0.72 },
      8 => { 20 => 1.16, 50 => 0.98, 100 => 0.77 }
    },
    'medio' => {
      2 => { 20 => 1.02, 50 => 0.91, 100 => 0.75 },
      5 => { 20 => 1.19, 50 => 1.06, 100 => 0.83 },
      8 => { 20 => 1.35, 50 => 1.12, 100 => 0.88 }
    },
    'alto' => {
      2 => { 20 => 1.14, 50 => 1.02, 100 => 0.83 },
      5 => { 20 => 1.23, 50 => 1.12, 100 => 0.81 },
      8 => { 20 => 1.49, 50 => 1.24, 100 => 0.97 }
    }
  }
  def self.para_escala_brilho intensidade_lida, velocidade_vento_lida, humidade_lida
    DATA[intensidade_lida].each do |velocidade_vento, humidades|
      if velocidade_vento_lida <= velocidade_vento
        humidades.each do |humidade, fator_correcao|
          if humidade < humidade_lida
            return fator_correcao 
          end
        end
      end
    end
  end
end
