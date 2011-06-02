class EmailConversationsController < ApplicationController
  def index
    @email_conversations = EmailConversation.all
  end
  
  def new
    @email_conversation = EmailConversation.new(params[:email_conversation])
    @email_conversation.email_messages.build
    render :action => :edit
  end
  
  def create
    @email_conversation = EmailConversation.new(params[:email_conversation])
    if @email_conversation.save
      flash[:notice] = 'Created'
    else
      flash[:error] = 'Failed to create ' + @email_conversation.errors.full_messages.join(',')
    end
    redirect_to :action => :index
  end
  
  def edit
    @email_conversation = EmailConversation.find(params[:id])
    @email_conversation.email_messages.build
  end
  
  def update
    @email_conversation = EmailConversation.find(params[:id])
    if @email_conversation.update_attributes(params[:email_conversation])
      flash[:notice] = 'Updated'
    else
      flash[:error] = 'Failed to update ' + @email_conversation.errors.full_messages.join(',')
    end
    redirect_to :action => :edit
  end
end