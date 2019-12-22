# frozen_string_literal: true

class BookRepository < Hanami::Repository
  PAGE_SIZE = 50

  def by_title(title)
    books
      .where(title: title)
      .order(:created_at)
      .first
  end

  def create_many(data)
    command(:create, books, use: [:timestamps], result: :many).call(data)
  end

  def pagenate(num)
    offset = PAGE_SIZE * num
    books
      .order(:title)
      .limit(PAGE_SIZE, offset)
  end

  def count
    books
      .count
  end
end
