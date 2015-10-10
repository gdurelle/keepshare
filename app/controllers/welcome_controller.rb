class WelcomeController < ApplicationController
  def home
    render json: { data: { user: { id: current_user.id, email: current_user.email, role: current_user.role } },
                  links: {
                    self: root_url,
                    lists: lists_url
                  },
                  meta: {
                    author: 'Gregory Durelle'
                  },
                  jsonapi: {
                    version: 0.1,
                    links: {
                      specification: 'http://jsonapi.org'
                    },
                    description: 'Each URI returns a JSON object. Each JSON object contains data and links to related resources.',
                    usage: 'To update or destroy an object, call its "self" URI with proper HTTP VERBS: PATCH or DELETE.'
                  }
                }
  end
end
