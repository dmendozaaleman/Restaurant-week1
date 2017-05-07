module ApplicationHelper
	def alert_message(title, options = {})
		css = options[:class] || 'alert alert-success'
		unless title.nil?
          content_tag :div, class: css do
            concat content_tag :p, title
          end
        end
	end

	def error_messages(resource)
      if resource.errors.any?
        content_tag :div, class: 'alert alert-danger' do
          content_tag :ul do
		        resource.errors.full_messages.each { |msg| concat content_tag(:li, msg) }
		      end
      	end
      end
  end
end
