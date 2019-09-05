class User < ApplicationRecord
  def tests_passed(level)
    Test.joins('JOIN test_passages ON tests.id = test_passages.test_id').where(test_passages: {user_id: id}, level: level)
  end
end
