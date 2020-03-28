require 'rails_helper'

describe 'roomのテスト' do
	describe '#message' do
		context '表示の確認' , js: true do
			before do
  				visit room_path(room.id)
  			end
      		it 'submitボタンが表示される' do
        		expect(page).to have_content 'submit'
      		end
      		it 'フォームが表示される' do
        		expect(page).to have_field 'message[content]', with: message.content
      		end
      		it 'message本文が表示される' do
        		expect(page).to have_content message.content
      		end
      		it 'コメントした人の名前が表示される' do
        		expect(page).to have_link '', href: user_path(message.user)
      		end
      		it 'コメントした人のプロフィール写真が表示される' do
        		expect(page).to have_content message.user.Image
      		end
      		it 'コメント削除ボタンが表示される' do
        		expect(page).to have_link '', href: message(message.id)
      		end
      	end
  	end
end