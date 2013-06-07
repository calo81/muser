Muser.SubscriptionsController = Ember.ArrayController.extend({
    newSubscriptionName: null,
    addSubscription: function () {
        var subscription = Muser.Subscription.createRecord({
            url: this.get("newSubscriptionName")
        });

        subscription.get('transaction').commit();
        this.set('newSubscriptionName', null);
    },

    showEntries: function (record) {
        this.set("selectedSubscription", Muser.Subscription.find(record.get("_id")));
    }
});