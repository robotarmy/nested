class Message < ActiveRecord::Base
  belongs_to :identity
  accepts_nested_attributes_for :identity
end
