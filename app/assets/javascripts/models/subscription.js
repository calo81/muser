Muser.Subscription  = DS.Model.extend({
    _id: DS.attr('string'),
    title: DS.attr('string'),
    url: DS.attr('string'),
    entries: DS.attr('raw')
});