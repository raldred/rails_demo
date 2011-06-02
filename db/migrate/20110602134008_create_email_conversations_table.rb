class CreateEmailConversationsTable < ActiveRecord::Migration
  def up
    create_table :email_conversations, :force => true do |t|
      t.string :title
      t.timestamps
    end
  end

  def down
    drop_table :email_conversations
  end
end