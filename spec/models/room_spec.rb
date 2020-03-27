require 'rails_helper'

RSpec.describe 'Roomモデルのテスト', type: :model do
	describe 'アソシエーションのテスト' do
    	context 'Entryモデルとの関係' do
      		it '1:Nとなっている' do
        		expect(Entry.reflect_on_association(:entries)).to eq :has_many
      		end
    	end
 	 end

 	 describe 'アソシエーションのテスト' do
    	context 'Messageモデルとの関係' do
      		it '1:Nとなっている' do
        		expect(Message.reflect_on_association(:messages)).to eq :has_many
      		end
    	end
 	 end