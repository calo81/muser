Muser.SubscriptionController = Ember.ObjectController.extend({
    contentBinding: 'subscriptionsController.selectedSubscription',
    subscriptionsController: null,
    visibleEntry: false,
    page: 0,


    findMore: function(){
        var controller = this;
        var store = DS.get('defaultStore');
        var adapter = store.adapterForType("Muser.Subscription");
        controller.set("page",controller.get("page") + 1);

        return $.ajax("/subscriptions/"+controller.get("content")["id"]+"?page="+controller.get("page"), "GET").
            then(function(json){
                var record = controller.get("content");
                json.subscription.entries = record.get("data").attributes.entries.concat(json.subscription.entries)
                adapter.didFindRecord(store, Muser.Subscription, json, controller.get("content")["id"]);
        });
    }
});