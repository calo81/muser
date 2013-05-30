Muser.SubscriptionsController = Ember.ArrayController.extend({
    addSubscription: function(url) {
        var subscription = Muser.Subscription.createRecord({
            url: url
        });

        subscription.get('transaction').commit();
    },

    showEntries: function(record) {
       this.set("selectedSubscription",Muser.Subscription.find(record.get("_id")));
    }
});