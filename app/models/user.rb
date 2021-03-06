class User < ApplicationRecord

  devise :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :trackable,
        :validatable,
        :confirmable

  #include Auth

  has_many :created_test, class_name: 'Test',foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  def tests_passed(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
  
end
