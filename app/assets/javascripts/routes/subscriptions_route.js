Muser.SubscriptionsRoute = Ember.Route.extend({
    setupController: function(controller) {
        controller.set('content', Muser.Subscription.find());
        var selectedSubscriptionController = this.controllerFor('subscription');
        selectedSubscriptionController.set('subscriptionsController', controller);
    }
});