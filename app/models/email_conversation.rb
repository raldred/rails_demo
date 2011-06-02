class EmailConversation < ActiveRecord::Base
  
  has_many :email_messages, :dependent => :destroy, :autosave => true
  accepts_nested_attributes_for :email_messages, :allow_destroy => true, :reject_if => :all_blank
  
  validates_presence_of :title
  validates_associated :email_messages
end