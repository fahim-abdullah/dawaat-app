module ApplicationHelper
  def init_cable(cable_name:)
    if logged_in?
      "App.#{cable_name} = ActionCable.createConsumer('/cable?api_token=#{current_user.get_api_token}');"
    end
  end

  def get_page_title
    if controller_name == 'orders' && action_name == 'show'
      "Dawaat.co-Invoice-#{@order.id}"
    else
      'Dawaat.co'
    end
  rescue => e
    'Dawaat.co'
  end
end
