Muser.SubscriptionsView = Ember.View.extend({
    templateName: 'subscriptions',
    elementId: 'subscriptions',
    classNames: ['scrollable']
});

Muser.TextField = Ember.TextField.extend(Ember.TargetActionSupport, {
    insertNewline: function() {
        this.triggerAction();
    }
});

Muser.SubscriptionListItemView = Ember.View.extend({

    classNames: ['subscriptionListItem'],
    focused: false,

    click: function() {
        this.get('controller').set('selectedSubscription', this.get('content'));
        this.get('controller').showEntries(this.get('content'));
    },

    deleteClicked: function(){
        this.get('controller').set('selectedSubscription', this.get('content'));
        this.get('controller').remove();
    },

    mouseEnter: function(){
       this.set("focused",true);
    },

    mouseLeave: function(){
        this.set("focused",false);
    }

});

Muser.SubscriptionEntryItemView = Ember.View.extend({
    template: Ember.Handlebars.compile('{{title}}'),
    tagName: 'h6',
    classNames: ['subscriptionEntryItem'],
    showEntry: false,

    click: function() {
        var value = !this.get("showEntry")
        this.set('showEntry',value);
    }

});

Muser.SubscriptionView = Ember.View.extend({
    templateName: 'subscription',
    elementId: 'subscription',
    classNames: ['scrollable'],

    didInsertElement: function() {
        var controller = this.get("controller");
        $("#subscription").bind("scroll", function() {
            if($(this).scrollTop() >= $(this)[0].scrollHeight - $(this).outerHeight() - 10) {
                controller.findMore();
            }
        });
    }
});