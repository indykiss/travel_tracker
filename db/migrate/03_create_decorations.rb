class CreateDecorations < ActiveRecord::Migration

  def change
    create_table :decorations do |t|
      t.string :dec_name
      t.string :color
      t.integer :plants_id
    end
  end
end