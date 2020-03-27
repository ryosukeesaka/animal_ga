require 'test_helper'

RSpec.describe 'Userモデルのテスト', type: :model do


  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { user.valid? }
    context 'last_nameカラム' do
      let(:user) { user }
      it '空欄でないこと' do
        user.last_name = ''
        is_expected.to eq false;
      end
    end
    context 'first_nameカラム' do
      let(:user) { user }
      it '空欄でないこと' do
        user.first_name = ''
        is_expected.to eq false;
      end
    end
    context 'last_name_kanaカラム' do
      let(:user) { user }
      it '空欄でないこと' do
        user.last_name_kana = ''
        is_expected.to eq false;
      end
    end
    context 'first_name_kanaカラム' do
      let(:user) { user }
      it '空欄でないこと' do
        user.first_name_kana = ''
        is_expected.to eq false;
      end
    end

    context 'Imageカラム' do
      let(:user) { user }
      it '空欄でないこと' do
        user.introduction = ''
        is_expected.to eq false
      end
    end

    context 'prefectureカラム' do
      let(:user) { user }
      it '空欄でないこと' do
        user.prefecture = ''
        is_expected.to eq false;
      end
    end

    context 'phone_numberカラム' do
      let(:user) { user }
      it '空欄でないこと' do
        user.phone_number = ''
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts)).to eq :has_many
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Post_commnetモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_commnents)).to eq :has_many
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites)).to eq :has_many
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts)).to eq :has_many
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Relationshipモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:relationships)).to eq :has_many
      end
    end
  end
end
