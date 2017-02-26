module SpellHelper
  SPELL_TABLE={
      9 => [
          [nil, 3, nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, 4, nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, 5, nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, 6, 3, nil, nil, nil, nil, nil, nil, nil],
          [nil, 6, 4, nil, nil, nil, nil, nil, nil, nil],
          [nil, 6, 5, 3, nil, nil, nil, nil, nil, nil],
          [nil, 6, 6, 4, nil, nil, nil, nil, nil, nil],
          [nil, 6, 6, 5, 3, nil, nil, nil, nil, nil],
          [nil, 6, 6, 6, 4, nil, nil, nil, nil, nil],
          [nil, 6, 6, 6, 5, 3, nil, nil, nil, nil],
          [nil, 6, 6, 6, 6, 4, nil, nil, nil, nil],
          [nil, 6, 6, 6, 6, 5, 3, nil, nil, nil],
          [nil, 6, 6, 6, 6, 6, 4, nil, nil, nil],
          [nil, 6, 6, 6, 6, 6, 5, 3, nil, nil],
          [nil, 6, 6, 6, 6, 6, 6, 4, nil, nil],
          [nil, 6, 6, 6, 6, 6, 6, 5, 3, nil],
          [nil, 6, 6, 6, 6, 6, 6, 6, 4, nil],
          [nil, 6, 6, 6, 6, 6, 6, 6, 5, 3],
          [nil, 6, 6, 6, 6, 6, 6, 6, 6, 4],
          [nil, 6, 6, 6, 6, 6, 6, 6, 6, 6]
      ],
      6 => [
          [nil, 1, nil, nil, nil, nil, nil],
          [nil, 2, nil, nil, nil, nil, nil],
          [nil, 3, nil, nil, nil, nil, nil],
          [nil, 3, 1, nil, nil, nil, nil],
          [nil, 4, 2, nil, nil, nil, nil],
          [nil, 4, 3, nil, nil, nil, nil],
          [nil, 4, 3, 1, nil, nil, nil],
          [nil, 4, 4, 2, nil, nil, nil],
          [nil, 5, 4, 3, nil, nil, nil],
          [nil, 5, 5, 3, 1, nil, nil],
          [nil, 5, 5, 4, 2, nil, nil],
          [nil, 5, 5, 4, 3, nil, nil],
          [nil, 5, 5, 5, 3, 1, nil],
          [nil, 5, 5, 5, 4, 2, nil],
          [nil, 5, 5, 5, 4, 3, nil],
          [nil, 5, 5, 5, 4, 3, 1],
          [nil, 5, 5, 5, 4, 4, 2],
          [nil, 5, 5, 5, 5, 4, 3],
          [nil, 5, 5, 5, 5, 5, 4],
          [nil, 5, 5, 5, 5, 5, 5],
      ],
      4 => [
          [nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil],
          [nil, 0, nil, nil, nil],
          [nil, 1, nil, nil, nil],
          [nil, 1, nil, nil, nil],
          [nil, 1, 0, nil, nil],
          [nil, 1, 1, nil, nil],
          [nil, 2, 1, nil, nil],
          [nil, 2, 1, 0, nil],
          [nil, 2, 1, 1, nil],
          [nil, 2, 2, 1, nil],
          [nil, 3, 2, 1, 0],
          [nil, 3, 2, 1, 1],
          [nil, 3, 2, 2, 1],
          [nil, 3, 3, 2, 1],
          [nil, 4, 3, 2, 1],
          [nil, 4, 3, 2, 2],
          [nil, 4, 3, 3, 2],
          [nil, 4, 4, 3, 3],
      ]}
  CASTER_TYPE={
      :sorcerer => 9,
      :wizard => 9,
      :cleric => 9,
      :druid => 9,
      :ranger => 4,
      :bard => 6,
      :paladin => 4,
      :alchemist => 6,
      :summoner => 6,
      :witch => 9,
      :inquisitor => 6,
      :oracle => 9,
      :antipaladin => 4,
      :magus => 6,
      :adept => 6,
      :bloodrager => 6,
      :shaman => 9,
      :psychic => 9,
      :medium => 4,
      :mesmerist => 6,
      :occultist => 6,
      :spiritualist => 6,
      :skald => 6,
      :investigator => 6,
      :hunter => 6,
  }

  def spells_per_day(character)
    if !CASTER_TYPE[character.char_class.to_sym].nil?
      type = CASTER_TYPE[character.char_class.to_sym]
      all_spells = SPELL_TABLE[type]
      base_spells = all_spells[character.level-1]
      bonuses = bonus_spells(character)
      spells_allowed = []
      for i in 0..base_spells.length-1
        if base_spells[i].nil?
          spells_allowed[i] = nil
        else
          spells_allowed[i] = base_spells[i]+bonuses[i]
        end
      end
      return spells_allowed
    else
      return [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    end
  end

  def bonus_spells(character)
    spell_amts = []
    for i in 0..9
      spell_amts[i] = 0
    end
    ability_mod = (character.spellcasting_score - 10)/2
    while ability_mod > 0
      for i in 1..[ability_mod, 9].min
        spell_amts[i]+=1
      end
      ability_mod -= 4
    end
    return spell_amts
  end
end