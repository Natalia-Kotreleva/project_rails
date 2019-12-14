require 'digest/sha1'

class User < ApplicationRecord

  include Auth

  has_many :created_test, class_name: 'Test',foreign_key: 'test_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  def tests_passed(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
