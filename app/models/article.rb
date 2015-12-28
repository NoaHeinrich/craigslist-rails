class Article < ActiveRecord::Base
  belongs_to :category

  def randomKey
    self.key = SecureRandom.hex(5)
  end
end
