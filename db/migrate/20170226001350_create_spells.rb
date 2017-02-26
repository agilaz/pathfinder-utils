class CreateSpells < ActiveRecord::Migration[5.0]
  def change
    create_table :spells do |t|
      t.string "name"

      t.integer "sorcerer"
      t.integer "wizard"
      t.integer "cleric"
      t.integer "druid"
      t.integer "ranger"
      t.integer "bard"
      t.integer "paladin"
      t.integer "alchemist"
      t.integer "summoner"
      t.integer "witch"
      t.integer "inquisitor"
      t.integer "oracle"
      t.integer "antipaladin"
      t.integer "magus"
      t.integer "adept"
      t.integer "bloodrager"
      t.integer "shaman"
      t.integer "psychic"
      t.integer "medium"
      t.integer "mesmerist"
      t.integer "occultist"
      t.integer "spiritualist"
      t.integer "skald"
      t.integer "investigator"
      t.integer "hunter"

      t.timestamps
    end
  end
end
