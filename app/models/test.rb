class Test < ApplicationRecord
  def Test.sort_by_category(category)
    Test.joins(:category).where(category_id: category.id).order('title DESC')
  end
end
