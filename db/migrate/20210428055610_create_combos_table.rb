class CreateCombosTable < ActiveRecord::Migration[6.1]
  def change
    create_table :combos do |t|
      t.integer :user_id
      t.string :name
    end

  end
end
