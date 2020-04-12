require 'rails_helper'

describe 'コメント機能のテスト' do
	let(:user) { create(:user) }
	before do
      visit posts_path
    end
	context '表示の確認' , js: true do
		  it '送信ボタンが表示される' do
	    	expect(page).to have_content '送信'
		  end
		  it 'commentフォームが表示される' do
		  	expect(page).to have_field 'post_comment[comment]'
		  end
		  it 'commnen数が表示される' do
		  	expect(page).to have_content 'コメント'
		  end
		  it 'commnen本文が表示される' do
		  	expect(page).to have_content 'post_comment.comment'
		  end
		  it 'コメントした人の名前が表示される' do
		  	expect(page).to have_content 'post_comment.user.last_name'
		  end
		  it 'コメントした人のプロフィール写真が表示される' do
		  	expect(page).to have_content post_comment.user.Image
		  end
		  it 'コメント削除ボタンが表示される' do
		  	expect(page).to have_link '', href: post_post_comment(post_comment.id, post.id)
		  end
	end
end