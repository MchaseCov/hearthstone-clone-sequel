class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :cost
      t.string :card_type
      t.integer :attack
      t.integer :health
      t.jsonb :effects, default: []
      t.string :rarity

      t.timestamps
    end
  end
end
