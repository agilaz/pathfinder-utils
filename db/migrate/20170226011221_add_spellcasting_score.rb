class AddSpellcastingScore < ActiveRecord::Migration[5.0]
  def change
    add_column(:characters, :spellcasting_score, :integer)
  end
end
