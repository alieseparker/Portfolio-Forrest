class UserTest < ActiveSupport::TestCase
  def user
    @user ||= User.new
  end
end
