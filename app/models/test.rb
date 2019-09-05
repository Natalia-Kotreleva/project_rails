class Test < ApplicationRecord
  def Test.sort_by_category(category)
    Test.joins(:category).where(categories: {title: category}).order('title DESC')
  end
end
