class User < ApplicationRecord
  def tests_passed(level)
    Test.where(user_id: self.id, level: level)
  end
end
