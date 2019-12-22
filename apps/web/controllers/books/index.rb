# frozen_string_literal: true

module Web
  module Controllers
    module Books
      class Index
        include Web::Action

        expose :books
        expose :page

        def call(params)
          @page = params[:page].to_i
          @books = BookRepository.new.pagenate(@page)
        end
      end
    end
  end
end
