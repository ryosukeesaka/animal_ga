require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { user.valid? }
    context 'last_nameカラム' do
      it '空欄でないこと' do
        user.last_name = ''
        is_expected.to eq false;
      end
    end
    context 'first_nameカラム' do
      it '空欄でないこと' do
        user.first_name = ''
        is_expected.to eq false;
      end
    end
    context 'last_name_kanaカラム' do
      it '空欄でないこと' do
        user.last_name_kana = ''
        is_expected.to eq false;
      end
    end
    context 'first_name_kanaカラム' do
      it '空欄でないこと' do
        user.first_name_kana = ''
        is_expected.to eq false;
      end
    end

    context 'Imageカラム' do
      it '空欄でないこと' do
        user.Image_id = ''
        is_expected.to eq false
      end
    end

    context 'prefecturesカラム' do
      it '空欄でないこと' do
        user.prefectures = ''
        is_expected.to eq false;
      end
    end

    context 'phone_numberカラム' do
      it '空欄でないこと' do
        user.phone_number = ''
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
    context 'Post_commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end
