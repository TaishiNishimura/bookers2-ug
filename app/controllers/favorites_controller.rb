class FavoritesController < ApplicationController

  before_action :set_book

  def create
    @favorite = Favorite.new(user_id: current_user.id, book_id: @book.id)
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, book_id:  @book.id)
    @favorite.destroy
  end

  private

  def set_book
    @book = Book.find_by(id: params[:book_id])
  end
end
