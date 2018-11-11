class Species < ActiveRecord::Base
    has_many    :birds, dependent: :destroy

    def rating
      rate = 0
      sum = 0
      count = 0
      birds.each do |bird|
        if bird.rating != 0
          sum = sum + bird.rating
          count = count + 1
        end
      end
      if count > 0
        rate = (sum/count).round(1)
      end
      rate
    end

    def review_count
      sum = 0
      birds.each do |bird|
        sum = sum + bird.review_count
      end
      sum
    end
end
