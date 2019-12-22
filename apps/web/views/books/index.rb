# frozen_string_literal: true

module Web
  module Views
    module Books
      class Index
        include Web::View

        def pager_last
          BookRepository.new.count < (page + 1) * 50
        end

        def pager_head
          @page
        end
      end
    end
  end
end
