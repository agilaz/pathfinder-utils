class Ability < ApplicationRecord
  def use_ability
    @uses_left-=1
  end
end
