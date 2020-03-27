require 'test_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'imageカラム' do
      it '空欄でないこと' do
        post.image = ''
        expect(post.valid?).to eq false;
      end
    end
    context 'pet_ageカラム' do
      it '空欄でないこと' do
        post.pet_age = ''
        expect(post.valid?).to eq false;
      end
    end
    context 'pet_genresカラム' do
      it '空欄でないこと' do
        post.pet_genres = ''
        expect(post.valid?).to eq false;
      end
    end
    context 'pet_nameカラム' do
      it '空欄でないこと' do
        post.pet_name = ''
        expect(post.valid?).to eq false;
      end
    end
    context 'bodyカラム' do
      it '空欄でないこと' do
        post.body = ''
        expect(post.valid?).to eq false;
      end
      it '200文字以下であること' do
        post.body = body.characters(number:201)
        expect(post.valid?).to eq false;
      end
    end
    context 'imageカラム' do
      it '空欄でないこと' do
        post.image = ''
        expect(post.valid?).to eq false;
      end
    end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Favoriteモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:favorite).macro).to eq :belongs_to
      end
    end
  end
end