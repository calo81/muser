class SubscriptionsController < AuthenticatedController
  respond_to :json

  def index
    subscriptions = Subscription.where(user: current_user).to_a
    subscriptions = {:subscriptions => subscriptions}
    render :json => subscriptions
  end

  def show
    if(params[:page])
      subscription = (Subscription.where(:id => params[:id], :user_id => current_user.id).slice({:entries => [ params[:page].to_i * 25, 25 ]}).first)
    else
      Subscription.find(params[:id]).reload
      subscription = (Subscription.where(:id => params[:id], :user_id => current_user.id).slice({:entries => [0, 25]}).first)
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
  
  def search
    Subscription.full_text_search(params[:text])
  end

  def destroy
    Subscription.find(params[:id]).destroy
    render :json => {message: 'OK'}, :status => 204
  end

  def update
    Subscription.find(params[:id]).update_attributes(params[:subscription])
    render :json => {message: 'OK'}, :status => 204
  end

  def upload
    Subscription.create_from_opml(params[:opml].read, current_user)
    redirect_to "/"
  end
end
