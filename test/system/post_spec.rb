require 'rails_helper'

describe '投稿のテスト' do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:post2) { create(:post, user: user2) }
  before do
  	visit new_user_session_path
  	fill_in 'user[email]', with: user.email
  	fill_in 'user[password]', with: user.password
  	click_button 'Log in'
  end
  describe 'サイドバーのテスト' do
		context '表示の確認' do
		  it 'Pet nameと表示される' do
	    	expect(page).to have_content 'Pet name'
		  end
		   it 'Pet nameフォームが表示される' do
		  	expect(page).to have_field 'post[pet_name]'
		  end
		  it 'Ageと表示される' do
		  	expect(page).to have_content 'Age'
		  end
		  it 'Pet genresと表示される' do
		  	expect(page).to have_content 'Pet genres'
		  end
		  it 'Imageと表示される' do
		  	expect(page).to have_content 'Image'
		  end
		  it 'Transferと表示される' do
		  	expect(page).to have_content 'Transfer'
		  end
		  it 'Bodyと表示される' do
		  	expect(page).to have_content 'Body'
		  end
		  it 'Bodyフォームが表示される' do
		  	expect(page).to have_field 'post[body]'
		  end
		  it '投稿ボタンが表示される' do
		  	expect(page).to have_button '投稿'
		  end
		  it '投稿に成功する' do
		  	fill_in 'post[pet_name]'
		  	fill_in 'post[pet_age]'
		  	fill_in 'post[pet_genres]'
		  	fill_in 'post[image]'
		  	fill_in 'post[transfer]'
		  	fill_in 'post[body]'
		  	click_button '投稿'
		  	expect(page).to have_content 'successfully'
		  end
		  it '投稿に失敗する' do
		  	click_button '投稿'
		  	expect(page).to have_content 'error'
		  	expect(current_path).to eq('/posts')
		  end
		end

	describe '編集のテスト' do
  		context '自分の投稿の編集画面への遷移' do
  	  		it '遷移できる' do
	  			visit edit_post_path(post)
	  			expect(current_path).to eq('/posts/' + post.id.to_s + '/edit')
	  	end
	  end
		context '表示の確認' do
			before do
				visit edit_post_path(post)
			end
			it 'Editと表示される' do
				expect(page).to have_content('Edit')
			end
			it 'pet_name編集フォームが表示される' do
				expect(page).to have_field 'post[pet_name]', with: post.pet_name
			end
			it 'Pet_age編集フォームが表示される' do
				expect(page).to have_field 'post[pet_age]', with: post.pet_age
			end
			it 'Pet_genre編集フォームが表示される' do
				expect(page).to have_field 'post[pet_genres]', with: post.pet_genres
			end
			it 'Body編集フォームが表示される' do
				expect(page).to have_field 'post[body]', with: post.body
			end
		end
		context 'フォームの確認' do
			it '編集に成功する' do
				visit edit_post_path(post)
				click_button 'Update back'
				expect(page).to have_content 'successfully'
				expect(current_path).to eq '/users/' + user.id.to_s
			end
			it '編集に失敗する' do
				visit edit_post_path(post)
				fill_in 'post[body]', with: ''
				click_button 'Update back'
				expect(page).to have_content 'error'
				expect(current_path).to eq '/posts/' + book.id.to_s + '/edit'
			end
		end

		describe '一覧画面のテスト' do
  			before do
  				visit posts_path
  			end
  			context '表示の確認' do
  				it 'Post indexと表示される' do
  					expect(page).to have_content 'Post index'
  				end
  				it '自分と他人の名前のリンク先が正しい' do
  					expect(page).to have_link '', href: user_path(post.user)
  					expect(page).to have_link '', href: user_path(post2.user)
  				end
  				it '自分と他人の本文が表示される' do
  					expect(page).to have_content post.body
  					expect(page).to have_content post2.body
  				end
  				it '自分と他人の画像が表示される' do
  					expect(page).to have_content post.image
  					expect(page).to have_content post2.image
  				end
  				it '自分と他人のペットの名前が表示される' do
  					expect(page).to have_content post.pet_name
  					expect(page).to have_content post2.pet_name
  				end
  				it '自分と他人のペットの年齢が表示される' do
  					expect(page).to have_content post.pet_age
  					expect(page).to have_content post2.pet_age
  				end
  				it '自分と他人のペットの種類が表示される' do
  					expect(page).to have_content post.pet_genres
  					expect(page).to have_content post2.pet_genres
  				end
  				it '自分と他人の投稿にいいねが表示される' do
  					expect(page).to have_link '', href: post_favorites(post.id)
  					expect(page).to have_link '', href: post_favorites(post2.id)
  				end
  				it '自分と他人の投稿にコメント投稿フォームが表示される' do
				expect(page).to have_field 'post_comment[comment]', with: post_comment.comment
				end
			end
  		end
	end
 end