Muser.EntryView = Ember.View.extend({
    templateName: 'entry',
    isVisible: false,
    visibility: function(sender, key, value, rev){
      if(sender === this){
          this.set("isVisible", true)
      }else{
          this.set("isVisible", false)
      }
    }.observes("controller.visibleEntry")
});