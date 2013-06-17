class SubscriptionsController < AuthenticatedController
  respond_to :json

  def index
    subscriptions = Subscription.where(user: current_user).to_a
    subscriptions = {:subscriptions => subscriptions}
    render :json => subscriptions
  end

  def show
    if(params[:page])
      page = params[:page]
    else
      page = 0
    end
    subscription = Subscription.find(params[:id])
    if(subscription.title.start_with?("search"))
      entries = Entry.full_text_search(subscription.title.split(':')[1])['results'].map{|result| result['obj']}
    else
      subscription.reload
      entries = Entry.where(:subscription_id => params[:id]).order_by("published DESC").skip(page.to_i*25).limit(25).to_a
    end
    subscription_json = subscription.as_json
    subscription_json['entries'] = entries
    render :json =>  {:subscription => subscription_json}
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
    subscription = Subscription.find_or_create_by(:title => "search:#{params[:text]}", :user => current_user)
    render :json => {:subscription => subscription}
  end

  def destroy
    Entry.delete_all(subscription_id: params[:id])
    Subscription.find(params[:id]).destroy
    render :json => {message: 'OK'}, :status => 204
  end

  def upload
    Subscription.create_from_opml(params[:opml].read, current_user)
    redirect_to "/"
  end
end
