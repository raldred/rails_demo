class EmailConversation < ActiveRecord::Base
  
  has_many :email_messages, :dependent => :destroy, :autosave => true
  belongs_to :character

  accepts_nested_attributes_for :email_messages, :reject_if => :all_blank, :allow_destroy => true

  validates :email_messages, :length => {:minimum => 1}
  validates_associated :email_messages
  
  validates_presence_of :title
end