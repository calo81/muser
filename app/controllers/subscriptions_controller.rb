class SubscriptionsController < AuthenticatedController
  respond_to :json

  def index
    subscriptions = Subscription.where(user: current_user).to_a
    subscriptions = {:subscriptions => subscriptions}
    render :json => subscriptions
  end

  def show
    subscription = Subscription.find(params[:id])
    subscription.reload
    render :json =>  {:subscription => subscription}
  end

  def create
    subscription = Subscription.create_from_url(params[:subscription][:url], current_user)
    if subscription
      subscription.user = current_user
      subscription.save!
      render :json => {subscription: subscription}, :location => subscription_path(subscription), :status => 201
    else
      render :json => {error: 'Incorrect subscription request'}, :status => 422
    end
  end
end
