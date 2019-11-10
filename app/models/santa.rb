class Santa < ApplicationRecord
  has_secure_token
  
  belongs_to :family
  has_many   :gifts
  has_one    :gift_to_buy, -> { where(year: Time.current.year) }, class_name: 'Gift', foreign_key: :secret_santa_id
  has_one    :recipient, through: :gift_to_buy
end
