Muser.subscriptionsController = Ember.ArrayController.create({
  // itemController: 'subscription'
    addSubscription: function(url) {
        var subscription = Muser.Subscription.createRecord({
            url: url
        });
        subscription.on('didError',function(store, type, record, xhr){
           alert(record.error);
        });
        subscription.get('transaction').commit();
    }
});

Muser.subscriptionController = Ember.ObjectController.create({

});