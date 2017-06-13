class Invite < ApplicationRecord

  belongs_to :league
  belongs_to :sender,        :class_name => "User"
  belongs_to :recipient,     :class_name => "User"

end
