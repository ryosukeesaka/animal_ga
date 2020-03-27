require 'rails_helper'

describe 'ユーザー認証のテスト' do
  describe 'ユーザー新規登録' do
    before do
      visit new_user_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'user[last_name]', with: 'taro'
        fill_in 'user[first_name]', with: 'yamada'
        fill_in 'user[last_name_kana]', with: 'タロウ'
        fill_in 'user[first_name_kana]', with: 'ヤマダ'
        fill_in 'user[prefectures]', with: '滋賀県'
        fill_in 'user[phonenumber]', with: '11111111111'
        fill_in 'user[Image_id]', with: '00000'
        fill_in 'user[email]', with: 'b@b'
        fill_in 'user[password]', with: '00000000'
        fill_in 'user[password_confirmation]', with: '00000000'
        click_button 'Sign up'

        expect(page).to have_content 'successfully'
      end
      it '新規登録に失敗する' do
        fill_in 'user[last_name]', with: ''
        fill_in 'user[first_name]', with: ''
        fill_in 'user[last_name_kana]', with: ''
        fill_in 'user[first_name_kana]', with: ''
        fill_in 'user[prefectures]', with: ''
        fill_in 'user[phonenumber]', with: ''
        fill_in 'user[Image_id]', with: ''
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        click_button 'Sign up'

        expect(page).to have_content 'error'
      end
    end
  end
  describe 'ユーザーログイン' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context 'ログイン画面に遷移' do
      let(:user) { user }
      it 'ログインに成功する' do
        fill_in 'user[email]', with: 'b@b'
        fill_in 'user[password]', with: '00000000'
        click_button 'Log in'

        expect(page).to have_content 'successfully'
      end

      it 'ログインに失敗する' do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'Log in'

        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end

describe 'ユーザーのテスト' do
  let(:user) { create(:user) }
  let!(:test_user2) { create(:user) }
  let!(:book) { create(:book, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end
  describe 'ユーザー詳細画面のテスト' do
    before do
      visit user_path(user)
    end
    context '表示の確認' do
      it 'User infoと表示される' do
        expect(page).to have_content('User info')
      end
      it '画像が表示される' do
        expect(page).to have_content(user.Image)
      end
      it '名前が表示される' do
        expect(page).to have_content(user.last_name, user.first_name)
      end
      it '自己紹介が表示される' do
        expect(page).to have_content(user.introduction)
      end
      it '都道府県が表示される' do
        expect(page).to have_content(user.prefectures)
      end
      it 'フォローワー数が表示される' do
        expect(page).to have_content(user.followed.count)
      end
      it 'フォロー数が表示される' do
        expect(page).to have_content(user.follower.count)
      end
      it '編集リンクが表示される' do
        visit user_path(user)
        expect(page).to have_link '', href: edit_user_path(current_user)
      end
      it 'Post indexと表示される' do
        expect(page).to have_content('Post index')
      end
      it 'Post indexのユーザーの名前のリンク先が正しい' do
        expect(page).to have_link '', href: user_path(current_user)
      end
      it 'Post indexに画像が表示される' do
        expect(page).to have_content(post.image)
      end
      it 'Post indexに本文が表示される' do
        expect(page).to have_content(post.body)
      end
      it 'Post indexにいいねが表示される' do
        expect(page).to have_content("far fa-heart")
      end
    end
  end

  describe '編集のテスト' do
    context '自分の編集画面への遷移' do
      it '遷移できる' do
        visit edit_user_path(user)
        expect(current_path).to eq('/users/' + user.id.to_s + '/edit')
      end
    end
    context '他人の編集画面への遷移' do
      it '遷移できない' do
        visit edit_user_path(test_user2)
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
    end

    context '表示の確認' do
      before do
        visit edit_user_path(user)
      end
      it 'Editと表示される' do
        expect(page).to have_content('Edit')
      end
      it '名前編集フォームに自分の苗字が表示される' do
        expect(page).to have_field 'user[first_name]', with: user.first_name
      end
      it '名前編集フォームに自分の名前が表示される' do
        expect(page).to have_field 'user[last_name]', with: user.last_name
      end
      it '名前編集フォームに自分の苗字（カナ）が表示される' do
        expect(page).to have_field 'user[first_name_kana]', with: user.first_name_kana
      end
      it '名前編集フォームに自分の名前(カナ）が表示される' do
        expect(page).to have_field 'user[last_name_kana]', with: user.last_name_kana
      end
      it '都道府県編集フォームに都道府県名が表示される' do
        expect(page).to have_field 'user[prefectures]', with: user.prefectures
      end
      it '市町村編集フォームに自分の名前が表示される' do
        expect(page).to have_field 'user[city]', with: user.city
      end
      it '画像編集フォームが表示される' do
        expect(page).to have_field 'user[Image]'
      end
      it '自己紹介編集フォームに自分の自己紹介が表示される' do
        expect(page).to have_field 'user[introduction]', with: user.introduction
      end
      it '電話番号編集フォームに自分の名前が表示される' do
        expect(page).to have_field 'user[phonenumber]', with: user.phonenumber
      end
      it '編集に成功する' do
        click_button 'Update you!!'
        expect(page).to have_content 'successfully'
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
      it '編集に失敗する' do
        fill_in 'user[name]', with: ''
        click_button 'Update you!!'
        expect(page).to have_content 'error'
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
    end
  end