class Gift < ApplicationRecord
  belongs_to :secret_santa, class_name: 'Santa'
  belongs_to :recipient,    class_name: 'Santa'

  validates :secret_santa, :recipient, :year, presence: true

  validates_inclusion_of  :year, in: 2018..2050

  validates_uniqueness_of :recipient,    scope: :year
  validates_uniqueness_of :secret_santa, scope: :year
end
