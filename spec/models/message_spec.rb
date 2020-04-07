require 'rails_helper'

RSpec.describe 'Messageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:message) { build(:message) }
    context 'contentカラム' do
      it '空欄でないこと' do
        message.content = ''
        expect(message.valid?).to eq false;
      end
      it '100文字以下であること' do
        message.content = "#{'abcdefg'*20}"
        expect(message.valid?).to eq false;
      end
    end
  end
	describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Message.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Roomモデルとの関係' do
      it 'N:1となっている' do
        expect(Message.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
 	end
end
