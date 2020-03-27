require 'rails_helper'

RSpec.describe 'Messageモデルのテスト', type: :model do
	describe 'アソシエーションのテスト' do
    	context 'Userモデルとの関係' do
      		it 'N:1となっている' do
        		expect(Post.reflect_on_association(:user)).to eq :belongs_to
      		end
    	end
 	 end

 	 describe 'アソシエーションのテスト' do
    	context 'Roomモデルとの関係' do
      		it 'N:1となっている' do
        		expect(User.reflect_on_association(:room)).to eq :belongs_to
      		end
    	end
 	 end

 	 context 'contentカラム' do
      it '空欄でないこと' do
        message.content = ''
        expect(post.valid?).to eq false;
      end
      it '100文字以下であること' do
        message.content = content.characters(number:101)
        expect(post.valid?).to eq false;
      end
    end

end
