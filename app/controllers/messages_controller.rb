class MessagesController < ApplicationController

    def index
      @user = User.find(params[:user_id])
      @message = Message.new
      @messages = Message.where(user_id: params[:user_id])
    end

 	  def create
      if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
        @message = Message.create(message_params.merge(user_id: current_user.id))#hidden fieldで@messageの中にroom_idを入れてパラメーターを送っている
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
		  params.require(:message).permit(:content,:room_id)
	  end

end
