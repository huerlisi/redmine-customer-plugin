module CustomersHelper
  include ApplicationHelper

  # This method would better be in main redmine...
  # Display a link if user is authorized outside a project
  def link_to_if_globally_authorized(name, options = {}, html_options = nil, *parameters_for_method_reference)
    link_to(name, options, html_options, *parameters_for_method_reference) if authorize_for(options[:controller] || params[:controller], options[:action], true)
  end
end
