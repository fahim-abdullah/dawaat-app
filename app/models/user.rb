class User < ApplicationRecord
	has_many :orders
	has_secure_password

  validates :name, :username, presence: true
  validates :username, uniqueness: true

  enum order_connection_status: { connected_to_order: 1, not_connected_to_order: 0 }

  def get_api_token
    reset_api_token if self.api_token.nil?
    self.api_token
  end

  def reset_api_token
    api_token = generate_unique_api_token
    self.update_attribute(:api_token, api_token)
  end

  def generate_unique_api_token
    loop do
      token = (SecureRandom.base64(10).tr('+/=', 'xyz') + '-' + DateTime.now.to_s).parameterize
      break token unless User.where(api_token: token).exists?
    end
  end

  def set_order_connection_status(online:)
    self.update_attribute(order_connection_status, online)
  end
end
