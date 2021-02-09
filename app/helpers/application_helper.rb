module ApplicationHelper
  def display_errors(model)
    return unless model.errors.full_messages.any?

    content_tag :p, model.errors.full_messages.join('. ').to_s,
                class: 'errors text-center alert alert-danger '
  end

  def flash_message
    flash[:notice] || flash.now[:alert]
  end
end
