require 'rails_helper'

RSpec.describe 'Favoriteモデルのテスト', type: :model do

	describe 'アソシエーションのテスト' do
    	context 'Postモデルとの関係' do
      		it 'N:1となっている' do
        		expect(Post.reflect_on_association(:post)).to eq :belongs_to
      		end
    	end
 	 end

 	 describe 'アソシエーションのテスト' do
    	context 'Userモデルとの関係' do
      		it 'N:1となっている' do
        		expect(User.reflect_on_association(:user)).to eq :belongs_to
      		end
    	end
 	 end

end