class CreateFazendas < ActiveRecord::Migration
  def change
    create_table :fazendas do |t|
      t.string :nome
      t.float :custo_kwh

      t.timestamps null: false
    end
  end
end
