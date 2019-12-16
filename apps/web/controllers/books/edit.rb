module Web
  module Controllers
    module Books
      class Edit
        include Web::Action

        expose :book

        def call(params)
          repo = BookRepository.new
          @book = repo.find(params[:id])
        end
      end
    end
  end
end
