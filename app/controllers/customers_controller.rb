class CustomersController < ApplicationController
  def index
    @stripe_service ||= StripeService.new
    if params[:download_customers] == "true"
      StripeClientsJob.perform_async(nil)
      redirect_to root_path
    end
  end
end
