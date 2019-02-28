class Record < ApplicationRecord
  enum book_read_status: [:unread, :half_read, :finished]

  validates :author, presence: true
  validates :title, presence: true
  validates :pages, presence: true, numericality: {integer_only: true}
  validates :dewey_decimal_code, presence: true
end
