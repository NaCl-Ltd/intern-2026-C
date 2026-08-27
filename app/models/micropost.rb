class Micropost < ApplicationRecord
  has_many :micropost_tags, dependent: :destroy
  has_many :tags, through: :micropost_tags
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message:   "should be less than 5MB" }
  
  after_save :save_hashtags, if: :saved_change_to_content?

  def save_hashtags
    micropost_tags.delete_all

    names = content.to_s.scan(/#([^\s#]+)/).flatten.uniq

      names.each do |name|
        tag = Tag.find_or_create_by!(name: name)
        micropost_tags.create!(tag: tag)
    end
  end
end