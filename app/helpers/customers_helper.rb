module CustomersHelper
  include ApplicationHelper

  # These methods would better be in main redmine...
  # Display a link if user is authorized
  def globally_authorize_for(controller, action)
    User.current.allowed_to?({:controller => controller, :action => action, :global => true}, @project)
  end

  # Display a link if user is authorized outside a project
  def link_to_if_globally_authorized(name, options = {}, html_options = nil, *parameters_for_method_reference)
    link_to(name, options, html_options, *parameters_for_method_reference) if globally_authorize_for(options[:controller] || params[:controller], options[:action])
  end
end
