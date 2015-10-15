class User < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  extend Enumerize

  authenticates_with_sorcery!

  enumerize :role, in: %w(guest user admin), predicates: true

  has_many :lists, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, presence: true
  validates :email, uniqueness: true

  def as_json
    {
      data: {
        email: self.email,
        created_at: self.created_at,
        updated_at: self.updated_at
      },
      links: {
        self: user_url(self.id)
      }
    }
  end
end
