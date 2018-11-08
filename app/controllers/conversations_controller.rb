class ConversationsController < ApplicationController
    before_action :authenticate_user!

def index
 @users = User.all
 @conversations = Conversation.all
 end

def create
#  if Conversation.between(params[:sender_id], params[:recepient_id]).present?
#     @conversation = Conversation.between(params[:sender_id],
#      params[:recepient_id]).first
#  else
 @conversation = Conversation.new
 redirect_to('/conversations/new')
end

def new
    @conversations = Conversation.all
    @users = User.all
    @user = User.all
    new_conversation = Conversation.new(sender_id: current_user.id, recipient_id: 1)
    new_conversation.save
end

def show
    @conversations = Conversation.all
end

private
 def conversation_params
  params.permit(:sender_id, :recepient_id)
 end

end