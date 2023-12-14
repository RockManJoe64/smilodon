require "./user"

module Smilodon::User
  abstract class UserRepository
    abstract def find(id : Int32) : User?
  end

  class InMemoryUserRepository < UserRepository
    def initialize
      @users = [
        User.new(1, "captain_america"),
        User.new(2, "iron_man"),
        User.new(3, "thor"),
      ]
    end

    def find(id : Int32) : User?
      @users[id]
    end

    def find(username : String) : User?
      @users.find { |user| user.username == username }
    end
  end
end
