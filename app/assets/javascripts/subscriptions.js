$(function() {
    setTimeout(updateSubscriptions, 100000);
});

function updateSubscriptions () {
  Console.log("polling");
  setTimeout(updateSubscriptions, 100000);
}