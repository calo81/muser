Muser.SubscriptionsView = Ember.View.extend({
    templateName: 'subscriptions',
    elementId: 'subscriptions'
});

Muser.SubscriptionListItemView = Ember.View.extend({
    template: Ember.Handlebars.compile('' +
        '{{title}}'),

    classNames: ['pointer', 'subscriptionListItem'],

    classNameBindings: "isSelected",

    click: function() {
        this.get('controller').showEntries(this.get('content'));
    },

    isSelected: function() {
        return this.get('controller.selectedSubscription.name') === this.get('content.name');
    }.property('controller.selectedSubscription.name')


});

Muser.SubscriptionView = Ember.View.extend({
    templateName: 'subscription',
    elementId: 'subscription'
});