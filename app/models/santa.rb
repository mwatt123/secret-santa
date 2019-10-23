class Santa < ApplicationRecord
  belongs_to :family
  has_many   :gifts
  has_one    :secret_santa, through: :gifts
  has_one    :recipient,    through: :gifts
end
