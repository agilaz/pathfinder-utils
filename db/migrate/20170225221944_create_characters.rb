class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string "name"
      t.string "char_class"
      t.integer "level"

      t.timestamps
    end
    add_column(:abilities, :character_id, :integer)
    add_index('abilities', 'character_id')
  end
end
