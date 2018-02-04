require 'rest-client'
class Book < ApplicationRecord

  def self.search(url)
    response = RestClient.get('https://www.googleapis.com/books/v1/volumes?q='+url)
    books = JSON.parse(response.body)["items"].map do |book|
      Book.create(
        title: book["volumeInfo"]["title"],
        description: book["volumeInfo"]["description"],
        author: book["volumeInfo"]["authors"][0],
        image: book["volumeInfo"]["imageLinks"]["thumbnail"]
      )
    end
    books
  end

end
