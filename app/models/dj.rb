class Dj < ApplicationRecord
  has_many :archives
  validates :name, uniqueness: true

  def self.with_archives
    where("archives_count > 0")
  end

  def slug_name
    name.gsub(/\s+/, '').downcase
  end
end
