(function( $ ){
  $.fn.colorize = function() {

    return this.each(function() {
      var chars = $(this).text().split('');

      // Step 3: wrap each character in a span tag with the appropriate color
      var colors = ["#097054", "#FFDE00", "#6599FF", "#FF9900", "#587058",
                    "#587498", "#E86850", "#99CCFF", "#FF9900", "#00CC00", "#993366"];

      for (var i = 0; i < chars.length; i++) {
        var letter = chars[i];
        chars[i] = "<span style = 'color: " + colors[i % colors.length] + "'>" + letter + "</span>"
      };

      // Step 4: replace the html of the list with the colorized
      $(this).html(chars);
    });
  };
})(jQuery);