class CreateAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :abilities do |t|
      t.string "name"
      t.integer "max_uses"
      t.integer "uses_left"

      t.timestamps
    end
  end
end
