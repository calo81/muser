Muser.Router.map(function() {
    this.resource('subscriptions', { path: '/' });
    this.resource('subscription', { path: '/subscription/:subscription_id' });
});