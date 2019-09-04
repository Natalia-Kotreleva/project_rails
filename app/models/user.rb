class User < ApplicationRecord
  def tests_passed(level)
    User.joins(:tests).where(Test.level: level)
  end
end
