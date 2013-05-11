Muser.subscriptionsController = Ember.ArrayController.create({
    addSubscription: function(url) {
        var subscription = Muser.Subscription.createRecord({
            url: url
        });

        subscription.get('transaction').commit();
    },

    showEntries: function(record) {
        Muser.subscriptionController.find(record);
        alert("cdsc");
    }
});