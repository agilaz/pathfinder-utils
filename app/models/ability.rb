class Ability < ApplicationRecord
  def use_ability
    if self.uses_left > 0
      self.update(:uses_left => (self.uses_left-1))
    end
  end

  def refresh_ability
    self.update(:uses_left => self.max_uses)
  end
end
