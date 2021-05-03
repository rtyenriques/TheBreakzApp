class CreateTableMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.integer :combo_id
      t.string :move_name
    end
  end
end
