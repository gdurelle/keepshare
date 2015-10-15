module JsonErrorController
  extend ActiveSupport::Concern

  private

  def render_json_error
    resource_name = controller_name.singularize
    resource = instance_variable_get("@#{resource_name}")

    render json: {
      errors: resource.errors.full_messages.join(', '),
      links: { self: url_for(resource) }
    }, status: :unprocessable_entity
  end
end
