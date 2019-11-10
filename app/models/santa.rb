require 'securerandom'

class Santa < ApplicationRecord  
  belongs_to :family
  has_many   :gifts
  has_one    :gift_to_buy, -> { where(year: Time.current.year) }, class_name: 'Gift', foreign_key: :secret_santa_id
  has_one    :recipient, through: :gift_to_buy

  before_create :save_token

  def save_token
    self.token ||= SecureRandom.urlsafe_base64(5)
  end
end
