class CreateLotes < ActiveRecord::Migration
  def change
    create_table :lotes do |t|
      t.references :fazenda, index: true, foreign_key: true
      t.references :cultura, index: true, foreign_key: true
      t.references :sistema_irrigacao, index: true, foreign_key: true
      t.date :iniciou_em
      t.float :vazao_litro_hora
      t.float :raio_copa
      t.integer :quantidade_plantas
      t.float :espacamento_plantas
      t.float :espacamento_linhas
      t.float :consumo_bomba_kwh

      t.timestamps null: false
    end
  end
end
