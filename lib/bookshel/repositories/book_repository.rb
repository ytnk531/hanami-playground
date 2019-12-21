class BookRepository < Hanami::Repository
  def by_title(title)
    books
      .where(title: title)
      .order(:created_at)
      .first
  end

  def create_many(data)
    command(:create, books, use: [:timestamps], result: :many).call(data)
  end
end
