class User < ApplicationRecord

  has_and_belongs_to_many :tests
  has_many :created_test_id
  has_many :test_passages
  has_many :tests, through: test_passages

  def tests_passed(level)
    Test.joins('JOIN test_passages ON tests.id = test_passages.test_id').where(test_passages: {user_id: id}, level: level)
  end
end
