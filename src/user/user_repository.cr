require "./user"

module Smilodon::User
  abstract class UserRepository
    abstract def find(username : String) : User?
  end

  class InMemoryUserRepository < UserRepository
    def initialize
      @users = [
        User.new(1, "captain_america"),
        User.new(2, "iron_man"),
        User.new(3, "thor"),
      ]
    end

    def find(username : String) : User?
      @users.find { |user| user.username == username }
    end
  end
end
