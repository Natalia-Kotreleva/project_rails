class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User', foreign_key: author_id
  has_many :test_passages
  has_many :users, through: test_passages

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates_numericality_of :level, :greater_than => 0,
                                     only_integer: true

  def Test.sort_by_category(category)
    Test.joins(:category).where(categories: {title: category}).order('title DESC')
  end

  scope :easy, -> { where("level < 2") }
  scope :middle, -> { where("level > 1 AND level < 5") }
  scope :hard, -> { where("level > 4") }
  scope :sort_by_category, -> { joins(:category).where(categories: {title: category}).order('title DESC') }
end
