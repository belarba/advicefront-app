# frozen_string_literal: true

# BooksController allows users to list and view single books
class BooksController < ApplicationController
# GET /books
def index
  if params[:title].present?
    @books = Book.search(params[:title])
  else
    @books = Book.all
  end
end

def show
  @book = Book.find(params[:id])
end

def contact_us; end
end
