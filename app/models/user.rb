class User < ActiveRecord::Base
  authenticates_with_sorcery!
  enum roles: %i{ guest user admin }
end
