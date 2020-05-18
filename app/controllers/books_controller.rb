class BooksController < ApplicationController
	def top 
	end
	def index
		@books = Book.all
		@book = Book.new
    end
	def new
		# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
		@book = Book.new
	end
	def create
        # ストロングパラメーターを使用
        @books = Book.all
        @book = Book.new(list_params)
        # DBへ保存する
        if @book.save
            redirect_to "http://localhost:3000/bookers-level1.herokuapp.com/books/#{@book.id}", notice: "Book was successfully created."
        else
            render template: "books/index.html.erb"
        end
    end
    def show
    	@book = Book.find(params[:id])
  	end
  	def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        # DBへ保存する
        if @book.update(list_params)
            redirect_to "http://localhost:3000/bookers-level1.herokuapp.com/books/#{@book.id}", notice: "Book was successfully updated."
        else
            render template: "books/edit.html.erb"
        end
    end
    def destroy
        book = Book.find(params[:id]) #データ(レコード)を1件取得
        book.destroy #データ（レコード）を削除
        redirect_to "http://localhost:3000/bookers-level1.herokuapp.com/books", notice: "Book was successfully destroyed." #List一覧画面へリダイレクト
    end

    private
   
    def list_params
        params.require(:book).permit(:title, :body)
    end
    protect_from_forgery
end
