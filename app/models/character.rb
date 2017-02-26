class Character < ApplicationRecord
  has_many :abilities
  has_many :prepared_spells

  def add_ability(ability)
    abilities << ability
  end

  def remove_ability(ability)
    abilities.destroy(ability)
  end

  def add_prepared_spell(spell)
    prepared_spells << spell
  end

  def remove_prepared_spell(spell)
    prepared_spells.destroy(spell)
  end
end
