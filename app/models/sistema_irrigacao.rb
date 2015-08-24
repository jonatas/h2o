class SistemaIrrigacao < ActiveRecord::Base
  validates :coeficiente_eficiencia, presence: true, numericality: { greater_than: 0.0, less_than_or_equal_to: 1}
end
