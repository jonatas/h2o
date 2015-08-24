class CreateSistemaIrrigacaos < ActiveRecord::Migration
  def change
    create_table :sistema_irrigacaos do |t|
      t.string :nome
      t.float :coeficiente_eficiencia

      t.timestamps null: false
    end
  end
end
