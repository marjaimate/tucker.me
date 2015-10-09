class Quote < ActiveRecord::Base
  before_save :generate_token

  def generate_token
    self.token ||= SecureRandom.hex(10)
  end
end
