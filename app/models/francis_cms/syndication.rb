module FrancisCms
  class Syndication < ActiveRecord::Base
    belongs_to :syndicatable, polymorphic: true

    validates :url, :name, presence: true
    validates :url, uniqueness: true, format: { with: URI.regexp(%w[http https]) }

    default_scope { order('name ASC') }
  end
end
