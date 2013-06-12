Muser.SubscriptionsController = Ember.ArrayController.extend({
    newSubscriptionName: null,
    addSubscription: function () {
        var subscription = Muser.Subscription.createRecord({
            url: this.get("newSubscriptionName")
        });

        subscription.get('transaction').commit();
        this.set('newSubscriptionName', null);
    },

    remove: function() {
        var selectedSubscription = this.get('selectedSubscription');
        if (selectedSubscription) {
            this.get('content').removeObject(selectedSubscription);
            this.get('selectedSubscription').deleteRecord();
            this.get('selectedSubscription').get('transaction').commit();
            this.set('selectedNote', null);
        }
    },
    showEntries: function (record) {
        var controller = this;
        var store = DS.get('defaultStore');
        var adapter = store.adapterForType("Muser.Subscription");

        return $.ajax("/subscriptions/"+record.id, "GET").
            then(function(json){
                adapter.didFindRecord(store, Muser.Subscription, json, record.id);
                controller.set("selectedSubscription", record);
                // Now let's reset the page counter for the currentsubscription scroll
                controller.controllerFor("subscription").set("page",0);
            });

    }
});