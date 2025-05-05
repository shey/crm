class Contact < ApplicationRecord
  ##################################################
  ## Validations
  ##################################################
  validates :email, presence: true, uniqueness: true
end
