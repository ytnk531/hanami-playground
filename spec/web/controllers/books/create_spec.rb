RSpec.describe Web::Controllers::Books::Create, type: :action do
  let(:action) { described_class.new }
  let(:repository) { BookRepository.new }
  let(:params) { Hash[book: {title: 'tkld', author: 'tjk'}] }

  before do
    repository.clear
  end

  it 'creates a new book' do
    action.call(params)
    book = repository.last

    expect(book.id).to_not be_nil
  end

  it 'redirects' do
    response = action.call(params)

    expect(response[0]).to eq(302)
    expect(response[1]['Location']).to eq('/books')
  end
end
