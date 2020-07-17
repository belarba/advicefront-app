# frozen_string_literal: true

# BooksController allows users to list and view single books
class BooksController < ApplicationController
# GET /books
def index
@books = Book.all
end

def contact_us; end
end
