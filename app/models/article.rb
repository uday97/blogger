class Article < ApplicationRecord
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings, dependent: :destroy

	def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(', ')
  end

  def tag_list=(tag_string)
    tags = tag_string.split(',').collect do |tag|
      tag.strip.downcase
    end
    tags = tags.uniq
    tag_objects = tags.collect do |tag|
      Tag.find_or_create_by(name: tag)
    end
    self.tags = tag_objects
  end
end
