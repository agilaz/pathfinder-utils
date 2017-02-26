class Character < ApplicationRecord
  has_many :abilities

  def add_ability(ability)
    abilities << ability
  end

  def remove_ability(ability)
    abilities.destroy(ability)
  end

  def bonus_spells
    spell_amts = []
    for i in 0..9
      spell_amts[i] = 0
    end
    ability_mod = (self.spellcasting_score - 10)/2
    while ability_mod > 0
      for i in 1..[ability_mod,9].min
        spell_amts[i]+=1
      end
      ability_mod -= 4
    end
    spell_amts
  end
end
