class CreateCulturas < ActiveRecord::Migration
  def change
    create_table :culturas do |t|
      t.string :nome
      t.boolean :anual

      t.timestamps null: false
    end
  end
end
