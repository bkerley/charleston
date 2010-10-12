document.observe 'dom:loaded', ->
  $('where_to_put').on 'click', 'td', (e, td) =>
    td.toggleClassName('gigantic')