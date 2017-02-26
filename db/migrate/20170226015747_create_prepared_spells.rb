class CreatePreparedSpells < ActiveRecord::Migration[5.0]
  def change
    create_table :prepared_spells do |t|
      t.string "name"
      t.integer "uses"
      t.integer "level"

      t.integer "character_id"
      t.timestamps
    end
    add_index('prepared_spells', 'character_id')
  end
end
