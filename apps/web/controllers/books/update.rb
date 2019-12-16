module Web
  module Controllers
    module Books
      class Update
        include Web::Action

        def call(params)
          BookRepository.new.update(params[:id], params[:book])
          redirect_to routes.books_path
        end
      end
    end
  end
end
