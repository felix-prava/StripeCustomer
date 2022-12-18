class StripeClientsJob
  include Sidekiq::Job
  def perform(stripe_id = nil)
    customers_data = Stripe::Customer.list({limit: 50, starting_after: stripe_id}) if stripe_id.present?
    customers_data = Stripe::Customer.list({limit: 50}) unless stripe_id.present?
    customers = customers_data["data"]
    customers.each do |customer|
    end
  end
end
