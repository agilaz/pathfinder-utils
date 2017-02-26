class Character < ApplicationRecord
  has_many :abilities

  def add_ability(ability)
    abilities << ability
  end

  def remove_ability(ability)
    abilities.destroy(ability)
  end
end
