class BooksController < ApplicationController
  def index
    if params[:q]
      @books = Book.all.select do |book|
        book.title.downcase.include?(params[:q].downcase)
      end
    else
      @books = Book.all
    end

  end
end
