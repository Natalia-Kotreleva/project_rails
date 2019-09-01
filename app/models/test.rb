class Test < ApplicationRecord
  def Test.sort_by_category(category)
    Test.where(category_title: category).order('title DESC')
  end
end
