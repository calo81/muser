class SubscriptionsController < AuthenticatedController
  respond_to :json

  def index
   subscriptions = Subscription.find_by(user: current_user) || []
   render :json => subscriptions.as_json, :layout => false
  end

  def show

  end

  def create
    subscription = Subscription.create_from_url(params[:url], current_user)
    subscription.user = current_user
    subscription.save!
    render :text => '', :location => subscription_path(subscription), :status => 201
  end
end
