class User < ActiveRecord::Base
  extend Enumerize
  authenticates_with_sorcery!

  enumerize :role, in: %w(guest user admin), predicates: true

  has_many :lists
end
