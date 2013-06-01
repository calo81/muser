Muser.SubscriptionController = Ember.ObjectController.extend({
    contentBinding: 'subscriptionsController.selectedSubscription',
    subscriptionsController: null,

    showEntryContent: function (record) {
        this.set("selectedEntry", record);
    }
});