class List < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_many :items

  def as_json
    {
      data: attributes,
      links: {
        self: list_url(self.id),
        items: list_items_url(self.id)
      }
    }
  end
end
