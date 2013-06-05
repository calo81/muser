Muser.SubscriptionController = Ember.ObjectController.extend({
    contentBinding: 'subscriptionsController.selectedSubscription',
    subscriptionsController: null,
    visibleEntry: false,

    showEntryContent: function (record) {
        this.set("visibleEntry", "sdfsdf");
    }
});