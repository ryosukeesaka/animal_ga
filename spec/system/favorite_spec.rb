require 'rails_helper'

  describe 'いいね機能のテスト' do
    context 'いいねをクリックした場合' , js: true do
        it 'いいねできる' do
          find('.far fa-heart').click
          expect(page).to have_css '.far fa-heart'
          expect(page).to have_css "div#like-post-#{post.id}", text: '1'
        end
    end

    context 'いいねを削除した場合', js: true do
        it 'いいねを取り消せる' do
          find('.far fa-heart').click
          expect(page).to have_css '.far fa-heart'
          expect(page).to have_css "div#like-post-#{post.id}", text: '0'
        end
    end
  end
end