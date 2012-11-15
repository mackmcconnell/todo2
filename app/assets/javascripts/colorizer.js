var colorizeList = function() {
  // Colorize the text of a list title
  // Step 1: grab the text
  var list = $('h1 span.best_in_place');

  // Step 2: split the text into individual chars
  var chars = list.text().split('');

  // Step 3: wrap each character in a span tag with the appropriate color
  var colors = ["#097054", "#FFDE00", "#6599FF", "#FF9900", "#587058",
                "#587498", "#E86850", "#99CCFF", "#FF9900", "#00CC00", "#993366"];

  for (var i = 0; i < chars.length; i++) {
    var letter = chars[i];
    chars[i] = "<span style = 'color: " + colors[i % colors.length] + "'>" + letter + "</span>"
  };

  // Step 4: replace the html of the list with the colorized
  list.html(chars);
};

$(document).ready(function() {
  colorizeList();

  $('h1 span.best_in_place').bind("best_in_place:deactivate", function() { colorizeList() });
});