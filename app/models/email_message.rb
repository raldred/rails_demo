class EmailMessage < ActiveRecord::Base
  belongs_to :email_conversation
  validates_presence_of :publish_at
end