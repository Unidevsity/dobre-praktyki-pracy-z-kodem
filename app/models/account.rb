class Account < ApplicationRecord
  belongs_to :company
  has_one :credit_card
end
