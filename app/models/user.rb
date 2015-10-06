class User < ActiveRecord::Base
  authenticates_with_sorcery!
  enum roles: { guest: 'guest', user: 'user', admin: 'admin' }
  has_one :list
end
