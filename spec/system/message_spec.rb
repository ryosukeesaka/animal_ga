require 'rails_helper'

  describe 'メッセージ機能のテスト' do
    let(:user) { create(:user) }
    let(:message) { create(:message, user: user) }
    before do
      visit room_path(room.id)
      @message = Message.new
      @message.content = "aaa"
      @message.save
    end
    context '送信の確認' , js: true do
      it 'メッセージが保存される' do
        click_button 'submit'
        expect(@post).to be_valid
      end
    end
  end