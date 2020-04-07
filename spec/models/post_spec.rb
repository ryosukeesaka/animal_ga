require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
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
        post.body = "#{'abcdefg'*40}"
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
      context 'Favoriteモデルとの関係' do
        it '1:Nとなっている' do
          expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
        end
      end
    end
  end
end