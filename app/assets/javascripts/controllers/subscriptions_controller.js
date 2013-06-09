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
        var controller = this;
        var store = DS.get('defaultStore');
        var adapter = store.adapterForType("Muser.Subscription");

        return $.ajax("/subscriptions/"+record.id, "GET").
            then(function(json){
                adapter.didFindRecord(store, Muser.Subscription, json, record.id);
                controller.set("selectedSubscription", record);
            });

    }
});