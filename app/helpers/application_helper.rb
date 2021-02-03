module ApplicationHelper
  def display_errors(model)
    return unless model.errors.full_messages.any?

    content_tag :p, "model could not be saved. #{model.errors.full_messages.join('. ')}",
                class: 'errors text-center alert alert-danger '
  end

  def flash_message
    flash[:notice] || flash.now[:alert]
  end
end
