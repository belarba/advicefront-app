# frozen_string_literal: true

# Defines what a book is and fetches data from the API
class Book
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include HTTParty
  attr_accessor :id, :title, :isbn, :coverUrl, :description

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  # INDEX
  def self.all
    info = get('/books')
    return unless info.success?

    info = info.parsed_response
    books = []
    info['data'].each do |b|
      books << Book.new(b)
    end
    books
  end

  # SHOW
  def self.find(id)
    info = get("/books/#{id}")
    return unless info.success?

    info = info.parsed_response
    Book.new(info['data'])
  end

  base_uri 'http://localhost'
  headers 'Accept' => 'application/json'
  headers 'Content-Type' => 'application/json'
  format :json
end
