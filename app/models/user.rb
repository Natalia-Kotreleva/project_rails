class User < ApplicationRecord

  #has_and_belongs_to_many :tests
  has_many :created_test, class_name: 'Test',foreign_key: 'test_id'
  has_many :test_passages
  has_many :tests, through: :test_passages


  validates :email, presence: true

  def tests_passed(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
