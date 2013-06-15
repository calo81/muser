Muser.SubscriptionsView = Ember.View.extend({
    templateName: 'subscriptions',
    elementId: 'subscriptions',
    classNames: ['scrollable'],
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
    },
    didInsertElement: function() {
		$(document).ready(function(){
		  $('#subscriptionsList div:nth-child(odd)').addClass('alternate');
		});
    }

});

Muser.SubscriptionEntryItemView = Ember.View.extend({
    tagName: 'div',
    subscriptionEntryItem: 'subscriptionEntryItem',
    visited: "non-visited",
    showEntry: false,

    click: function() {
        var value = !this.get("showEntry")
        this.set('showEntry',value);
        this.get("controller").markViewed(this.get("content"));
        //Two hours trying to make the binding work and it didn't work at all. So hack it!!
        //this.set("visited","yes-visited");
        var element = $("#"+this.get("elementId")+" div.non-visited");
        element.removeClass("non-visited")
        element.addClass("yes-visited")
    },

    didInsertElement: function() {
        if(this.get("content")["viewed"]){
            var element = $("#"+this.get("elementId")+" div.non-visited");
            element.removeClass("non-visited");
            element.addClass("yes-visited");
        }
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