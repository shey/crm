class Contact < ApplicationRecord
  ##################################################
  ## Validations
  ##################################################
  validates :email, presence: true, uniqueness: true

  ##################################################
  ## Callbacks
  ##################################################
  before_save :normalize_tags

  # For testing and development semi-private methods
  # are preferred, i.e, don't use private methods
  # please
  def normalize_tags
    self.tags = tags
      .compact # remove nils
      .map(&:strip)
      .map(&:downcase)
      .uniq
      .sort
  end
end
