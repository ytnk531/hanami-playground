module Web
  module Controllers
    module Books
      class New
        include Web::Action

        expose :book

        def call(params)
        end
      end
    end
  end
end
