class MessagesController < ApplicationController
    #before_action do
        # @conversation = Conversation.find[:id]
        #  if @conversation[:id] != nil
        #     @conversation = Conversation[:id]
        #  else 
        #      @conversation = Conversation.new[:id]
        #  end
       
   # end

     def index
      @messages = @conversation.messages
       if @messages.length > 10
        @over_ten = true
        @messages = @messages[-10..-1]
       end
       if params[:m]
        @over_ten = false
        @messages = @conversation.messages
       end
      if @messages.last
       if @messages.last.user_id != current_user.id
        @messages.last.read = true;
       end
      end
     
     @message = @conversation.messages.new
      end
     
     def new
        @conversation = Conversation.new
        @message = Message.new
     end

     def show
     end
     
     def create
        message = Message.new(users_id: current_user.id)
        message.users_id = message_params[:user_id]
        message.save
        # redirect_to '/conversations/params[:conversation_id]/messages'
     end
     
     private
      def message_params
       params.require(:message).permit(:body, :user_id)
      end
end
