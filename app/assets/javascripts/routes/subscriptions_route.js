Muser.SubscriptionsRoute = Ember.Route.extend({
    setupController: function(controller) {
        Muser.subscriptionsController.set('content', Muser.Subscription.find());
    }
});

Muser.SubscriptionRoute = Ember.Route.extend({
    setupController: function(controller, subscription) {
        this.controllerFor('subscription').set('content', subscription);
    }
});