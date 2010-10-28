(function() {
  var __bind = function(func, context) {
    return function(){ return func.apply(context, arguments); };
  };
  document.observe('dom:loaded', function() {
    return $('where_to_put').on('click', 'td', __bind(function(e, td) {
      return td.toggleClassName('gigantic');
    }, this));
  });
})();
