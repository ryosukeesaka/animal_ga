class MessagesController < ApplicationController

    def index
      @user = User.find(params[:user_id])
      @message = Message.new
      @messages = Message.where(user_id: params[:user_id])
    end

 	  def create
  		#@message = Message.new(message_params)
      #@message.user_id = current_user.id
    	#if @message.save
         #render 'create.js.erb'
    	#end
      if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present? #message=message.show form for @message?room_idにmessage? room cのmargeも
        @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
      else
        flash[:alert] = "メッセージ送信に失敗しました。"
      end
    end

  	def destroy
  		@message = Message.find(params[:id])
      @message.user_id = current_user.id
  		@message.destroy

  	end

  	private
	  def message_params
		  params.require(:message).permit(:content,:user_id,:room_id)
	  end

end
