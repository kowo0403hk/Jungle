class Sale < ApplicationRecord
  def finished?
    self.ends_on < Date.current
  end

end
