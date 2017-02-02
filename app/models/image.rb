class Image < ApplicationRecord
  validates :artist, presence: true
  validates :title, length: {minimum:3, maximum:20}
  validates :url, length: {minimum:1}
  validates :url, uniqueness: true
  validates_format_of :url, :with => URI::regexp(%w(http https))

  # private
  # def url_starts_http
  #   if Image.url
  #   end
end
