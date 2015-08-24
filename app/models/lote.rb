class Lote < ActiveRecord::Base
  belongs_to :fazenda
  belongs_to :cultura
  belongs_to :sistema_irrigacao

  def area_copa
    (Math::PI * (raio_copa **  2)).round 3
  end

  def area_plantio
    espacamento_plantas * espacamento_linhas
  end

  def coeficiente_relacao_copa_area
    kl = area_copa / area_plantio
    kl > 1 ? 1 : kl
  end

  def fator_correcao velocidade = 6, humidade = 20
    FatorCorrecao.para_escala_brilho 'alto', velocidade, humidade
  end

  def percentual_mensal_horas_luz_solar mes=Time.now.month
    PercentualMensalHorasLuzSolar.para(fazenda.latitude, mes)
  end

  # em milímetros por dia
  def evapotranspiracao_potencial temperatura_media
    p fator_correcao
    (fator_correcao * ( (0.457 *  temperatura_media + 8.13) * percentual_mensal_horas_luz_solar))  / Time.now.days_in_month
  end

  def evapotranspiracao_da_cultura temperatura_media, kc, ks=1
    evapotranspiracao_potencial(temperatura_media) * kc * ks * coeficiente_relacao_copa_area
  end

  alias kl coeficiente_relacao_copa_area
  alias p percentual_mensal_horas_luz_solar
  alias c fator_correcao
  alias et0 evapotranspiracao_potencial
end
