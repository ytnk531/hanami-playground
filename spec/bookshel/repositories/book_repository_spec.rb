# frozen_string_literal: true

RSpec.describe BookRepository, type: :repository do
  let(:tested) { described_class.new }

  before { tested.clear }

  describe '#by_title' do
    subject { tested.by_title(title) }
    let!(:title) { 'target' }

    let!(:matched_book) do
      tested.create Book.new(title: 'target', author: 'author1')
    end
    let!(:unmatched_book) { tested.create Book.new(title: 'title3', author: 'author2') }

    it { is_expected.to eq matched_book }

    context 'when there are multiple same titled books' do
      let!(:title) { 'multiple' }

      let!(:older) { tested.create Book.new(title: 'multiple', author: 'author3') }
      let!(:newer) { tested.create Book.new(title: 'multiple', author: 'author3') }

      it { is_expected.to eq older }
    end
  end

  describe '#create_many' do
    subject { tested.create_many(books) }

    let(:books) do
      [
        Book.new(title: 'title', author: 'author'),
        Book.new(title: 'title', author: 'author'),
        Book.new(title: 'title', author: 'author')
      ]
    end

    it { expect { subject }.to change { tested.all.size }.from(0).to(3) }
  end
end
