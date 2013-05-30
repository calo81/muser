Muser.SubscriptionsRoute = Ember.Route.extend({
    setupController: function(controller) {
        controller.set('content', Muser.Subscription.find());
        var selectedSubscriptionController = this.controllerFor('subscription');
        selectedSubscriptionController.set('subscriptionsController', controller);
    },
});


Muser.SubscriptionRoute = Ember.Route.extend({
    setupController: function(controller, subscription) {
        controller.set('model', subscription);
    }
});