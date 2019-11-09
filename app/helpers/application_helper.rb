module ApplicationHelper
  def init_cable(cable_name:)
    if logged_in?
      "App.#{cable_name} = ActionCable.createConsumer('/cable?api_token=#{current_user.get_api_token}');"
    end
  end
end
