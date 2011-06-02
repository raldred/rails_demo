class EmailConversationsController < ApplicationController

  before_filter :get_conversation, :only => [:edit, :show, :update, :destroy]

  def index
    @email_conversations = EmailConversation.order("id DESC")
  end
  
  def new 
    @email_conversation = EmailConversation.new
  end
  
  def edit
  end
  
  def destroy    
    @email_conversation.destroy
    redirect_to url_for({:action => :index}), :notice => "Deleted email conversation"
  end
  
  def create
    @email_conversation = EmailConversation.new(params[:email_conversation])
    
    if @email_conversation.save
      redirect_to :action => :index
    else
      flash.now[:error] = "Failed to save email conversation#{@email_conversation.errors.any? ? ' : ' + @email_conversation.errors.full_messages.join(', ') : ''}"
      render :new
    end
  end
  
  def update
    if @email_conversation.update_attributes(params[:email_conversation])
      redirect_to edit_email_conversation_path(@email_conversation), :notice => "Saved successfuly"
    else
      flash.now[:error] = "Failed to save email conversation#{@email_conversation.errors.any? ? ' : ' + @email_conversation.errors.full_messages.join(', ') : ''}"
      render :edit
    end
  end
  
  private
  
  def get_conversation
    @email_conversation = EmailConversation.find(params[:id])
  end

end
