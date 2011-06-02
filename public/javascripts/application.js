// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest("fieldset").hide();
}

function add_fields(link, association, content) {
  var regexp = new RegExp("new_" + association, "g")
  var new_id = new Date().getTime();
  $(link).before(content.replace(regexp, new_id));
}