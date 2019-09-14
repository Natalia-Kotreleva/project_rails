class User < ApplicationRecord

  has_and_belongs_to_many :tests
  has_many :created_test_id, class_name: 'Test', foreign_key: test_id
  def tests_passed(level)
    Test.joins('JOIN test_passages ON tests.id = test_passages.test_id').where(test_passages: {user_id: id}, level: level)
  end
end
