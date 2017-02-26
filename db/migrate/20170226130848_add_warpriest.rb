class AddWarpriest < ActiveRecord::Migration[5.0]
  def up
    add_column(:spells, :warpriest, :integer)
    Spell.update_all("warpriest = cleric")
  end

  def down
    remove_column(:spells, :warpriest)
  end
end
