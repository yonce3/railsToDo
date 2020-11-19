class RecordController < ApplicationController

    def find
        @books = Book.find([1, 3, 5])
        render 'hello/list'
    end

    def find_by
        @book = Book.find_by(publish: 'f')
        render 'books/show'
    end

    def ph1
        @books = Book.where('publish = :publish AND price >= :price',
        publish: params[:publish], price: params[:prics¥e])
        render 'hello/list'
    end
end
