class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    #リダイレクト先を削除（create.js.erbファイルを参照するようになる）
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    #リダイレクト先を削除（destroy.js.erbファイルを参照するようになる）
  end
end
