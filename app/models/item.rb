class Item < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :list

  validates :content, presence: true

  def as_json
    {
      data: attributes,
      links: {
        self: list_item_url(self.list_id, self.id)
      }
    }
  end
end
