jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  setTimeout (->
    $(".flash").fadeOut()
  ), 1000
