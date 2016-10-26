class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :clickbait?

  def clickbait?
    clickbait = [/Won't Believe/, /Secret/, /Top[number]/, /Guess/]

    if clickbait.none? { |bait| bait.match(title)}
      errors.add(:title, "not enough clickbait")
    end
  end

end
