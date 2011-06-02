class CreateEmailMessagesTable < ActiveRecord::Migration
  def up
    create_table :email_messages, :force => true do |t|
      t.integer :email_conversation_id
      t.datetime :publish_at
      t.timestamps
    end
  end

  def down
  end
end