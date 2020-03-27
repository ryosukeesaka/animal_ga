require 'test_helper'

RSpec.describe 'Entryモデルのテスト', type: :model do
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
end
