require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content "AnimalGram"
      end
      it 'サインアップリンクが表示される' do
        is_expected.to have_content "サインアップ"
      end
      it 'ログインリンクが表示される' do
        is_expected.to have_content "ログイン"
      end
    end
    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it '新規登録画面に遷移する' do
        click_link "サインアップ"
        is_expected.to eq(new_user_registration_path)
      end
      it 'ログイン画面に遷移する' do
        click_link "ログイン"
        is_expected.to eq(new_user_session_path)
      end
    end
  end

  describe 'ログインしている場合' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content 'AnimalGram'
      end
      it 'トップリンクが表示される' do
        is_expected.to have_content 'トップ'
      end
      it '里親募集リンクが表示される' do
        is_expected.to have_content '里親募集'
      end
      it 'マイページリンクが表示される' do
        is_expected.to have_content 'マイページ'
      end
      it 'ログインリンクが表示される' do
        is_expected.to have_content 'ログアウト'
      end
    end

    context 'ヘッダーのリンクを確認' do
      it 'トップ画面に遷移する' do
        click_link 'トップ'
        expect(current_path).to eq('/posts')
      end
      it '里親募集画面に遷移する' do
        click_link '里親募集'
        expect(current_path).to eq('/transfer')
      end
      it 'マイページ画面に遷移する' do
        click_link 'マイページ'
        expect(current_path).to eq('/users/1')
      end
      it 'ログアウトする' do
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウト'
      end
    end
  end
end