require 'rails_helper'

RSpec.describe 'Post_commnetモデルのテスト', type: :model do
describe 'バリデーションのテスト'

  	 context 'commnetカラム' do
      it '空欄でないこと' do
        post_comment.comment = ''
        expect(post.valid?).to eq false;
      end
      it '100文字以下であること' do
        post_comment.comment = comment.characters(number:101)
        expect(post.valid?).to eq false;
      end
    end

    describe 'アソシエーションのテスト' do
    	context 'Userモデルとの関係' do
      		it 'N:1となっている' do
        		expect(Post_comment.reflect_on_association(:user)).to eq :belongs_to
      		end
    	end
  	end

  	describe 'アソシエーションのテスト' do
    	context 'Postモデルとの関係' do
      		it 'N:1となっている' do
       			expect(Post_comment.reflect_on_association(:post)).to eq :belongs_to
      		end
    	end
  	end
end

