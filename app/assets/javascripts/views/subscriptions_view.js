Muser.SubscriptionsView = Ember.View.extend({
    templateName: 'subscriptions',
    elementId: 'subscriptions'
});

Muser.TextField = Ember.TextField.extend(Ember.TargetActionSupport, {
    insertNewline: function() {
        this.triggerAction();
    }
});

Muser.SubscriptionListItemView = Ember.View.extend({
    template: Ember.Handlebars.compile('{{title}}'),

    classNames: ['subscriptionListItem'],


    click: function() {
        this.get('controller').showEntries(this.get('content'));
    }

});

Muser.SubscriptionEntryItemView = Ember.View.extend({
    template: Ember.Handlebars.compile('{{title}}'),
    tagName: 'h3',
    classNames: ['subscriptionEntryItem'],


    click: function() {
        this.get('controller').showEntryContent(this.get('content'));
    }

});

Muser.SubscriptionView = Ember.View.extend({
    templateName: 'subscription',
    elementId: 'subscription'
});