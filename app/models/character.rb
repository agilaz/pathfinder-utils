class Character < ApplicationRecord
  include SpellHelper
  has_many :abilities
  has_many :prepared_spells

  def add_ability(ability)
    abilities << ability
  end

  def remove_ability(ability)
    abilities.destroy(ability)
  end

  def add_prepared_spell(spell)
    if has_slots_left(spell.level)
      index = nil
      for i in 0..prepared_spells.length-1
        if prepared_spells[i].name.eql?spell.name
          index = i
        end
      end
      if index.nil?
        prepared_spells << spell
      else
        prepared_spells[index].update(:uses => prepared_spells[index].uses+1)
      end
    end
    return true
  end

  def remove_prepared_spell(spell)
    prepared_spells.destroy(spell)
  end

  def spells_prepared(level)
    num_prepared = 0
    prepared_spells.each do |spell|
      if spell.level == level
        num_prepared += spell.uses
      end
    end
    return num_prepared
  end

  def has_slots_left(level)
    spells_prepared(level) < spells_per_day(self)[level]
  end
end
