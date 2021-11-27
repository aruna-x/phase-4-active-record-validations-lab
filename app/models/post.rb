class Post < ApplicationRecord
    validates :title, presence: true
    validate :title, :is_clickbait  
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    def is_clickbait
        if title
            unless (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess"))
                errors.add(:title, "Title isn't clickbait-y enough!")
            end
        end
    end
end
