class Post < ActiveRecord::Base
  # validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction NonFiction)}
  validate :click_bait

  def click_bait
    if self.title
      arr = self.title.split
      errors.add(:title, "not click-baity enough") unless arr.include?("Won't"||"Believe"||"Secret"||"Top"||"Guess")
    else
      errors.add(:title, "title does not exist")
    end
  end

end
