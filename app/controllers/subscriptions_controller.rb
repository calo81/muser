class SubscriptionsController < AuthenticatedController
  respond_to :json

  def index
    subscriptions = Subscription.where(user: current_user).to_a
    subscriptions = {:subscriptions => subscriptions}
    render :json => subscriptions
  end

  def show
    if(params[:page])
      subscription = (Subscription.where(:id => params[:id]).slice({:entries => [ params[:page].to_i * 25, 25 ]}).first)
    else
      Subscription.find(params[:id]).reload
      subscription = (Subscription.where(:id => params[:id]).slice({:entries => [0, 25]}).first)
    end
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
