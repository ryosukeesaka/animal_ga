require 'rails_helper'

RSpec.describe 'Post_commnetモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:post_comment) { build(:post_comment) }
    let(:user) { build(:user) }
    let(:post) { build(:post) }
    context 'commnetカラム' do
      it '空欄でないこと' do
        post_comment.comment = ''
        expect(post.valid?).to eq false;
      end
      it '100文字以下であること' do
        post_comment.comment = "#{'abcdefg'*20}"
        expect(post.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Postモデルとの関係' do
      it 'N:1となっている' do
       	expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end