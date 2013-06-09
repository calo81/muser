Muser.SubscriptionController = Ember.ObjectController.extend({
    contentBinding: 'subscriptionsController.selectedSubscription',
    subscriptionsController: null,
    visibleEntry: false,
    page: 2,

    findMore: function(){
        var controller = this;
        var store = DS.get('defaultStore');
        var adapter = store.adapterForType("Muser.Subscription");

        return $.ajax("/subscriptions/"+controller.get("content")["id"]+"?page="+controller.get("page"), "GET").
            then(function(json){
                adapter.didFindRecord(store, Muser.Subscription, json, controller.get("content")["id"]);
        });
    }
});