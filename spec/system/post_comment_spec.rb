require 'rails_helper'

describe 'コメント機能のテスト' do
	context '表示の確認' , js: true do
		  it 'submitボタンが表示される' do
	    	expect(page).to have_content 'submit'
		  end
		  it 'commentフォームが表示される' do
		  	expect(page).to have_field 'post_comment[comment]', with: post_comment.comment
		  end
		  it 'commnen数が表示される' do
		  	expect(page).to have_content 'commnents'
		  end
		  it 'commnen本文が表示される' do
		  	expect(page).to have_content post_comment.comment
		  end
		  it 'コメントした人の名前が表示される' do
		  	expect(page).to have_link '', href: user_path(post_comment.user)
		  end
		  it 'コメントした人のプロフィール写真が表示される' do
		  	expect(page).to have_content post_comment.user.Image
		  end
		  it 'コメント削除ボタンが表示される' do
		  	expect(page).to have_link '', href: post_post_comment(post_comment.id, post.id)
		  end
	end
end