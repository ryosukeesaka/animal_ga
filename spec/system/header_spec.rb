require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content 'AnimalGram'
      end
      it 'Sign upリンクが表示される' do
        is_expected.to have_content 'Sign up'
      end
      it 'Log inリンクが表示される' do
        is_expected.to have_content 'Log in'
      end
    end
    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it '新規登録画面に遷移する' do
        click_link 'Sign up'
        is_expected.to eq(new_user_registration_path)
      end
      it 'ログイン画面に遷移する' do
        click_link 'login'
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
      click_button 'Log in'
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content 'AnimalGram'
      end
      it 'Topリンクが表示される' do
        is_expected.to have_content 'Top'
      end
      it 'Host familyリンクが表示される' do
        is_expected.to have_content 'Host family'
      end
      it 'My pageリンクが表示される' do
        is_expected.to have_content 'My page'
      end
      it 'Log outリンクが表示される' do
        is_expected.to have_content 'Log out'
      end
    end

    context 'ヘッダーのリンクを確認' do
      it 'Top画面に遷移する' do
        click_link 'Top'
        expect(current_path).to eq('/posts/')
      end
      it 'Users画面に遷移する' do
        click_link 'Users'
        expect(current_path).to eq('/posts/transfer')
      end
      it 'Books画面に遷移する' do
        click_link 'Books'
        expect(current_path).to eq('/users'+user.id.to_s)
      end
      it 'Log outする' do
        click_link 'Log out'
        expect(page).to have_content 'Signed out successfully.'
      end
    end
  end
end