class Message < ActiveRecord::Base
  belongs_to :identity
  accepts_nested_attributes_for :identity
  def identity_attributes=(attributes)
    self.identity = Identity.find_or_create_by_public_key(attributes[:public_key])
  end
end
