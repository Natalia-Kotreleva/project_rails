class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User', foreign_key: author_id
  has_many :test_passages
  has_many :users, through: test_passages

  validates :title, presence: true
  add_index :tests, ["title", "level"], :unique => true
  validates_numericality_of :level, :greater_than => 0,
                                     only_integer: true

  def sort_by_category(category)
    sort_by_category(category).order('title DESC')
  end

  scope :easy, -> { where("level < 2") }
  scope :middle, -> { where("level > 1 AND level < 5") }
  scope :hard, -> { where("level > 4") }
  scope :sort_by_category, -> (category) { where("category = ?", category) }
end
