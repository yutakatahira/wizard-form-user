$(document).on("turbolinks:load", function() {

  function removeQueryParameter(url) {
    var new_url = url.replace(/\?.*$/,"");
    return new_url;
  }

  var getUrl = window.location.href

  var getUrl = removeQueryParameter(getUrl)

  history.replaceState("","",getUrl);

});
