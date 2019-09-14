class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User', foreign_key: user_id


  def Test.sort_by_category(category)
    Test.joins(:category).where(categories: {title: category}).order('title DESC')
  end
end
