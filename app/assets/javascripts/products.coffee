$(document).on 'change', '#js-sorts', ({target}) ->
  $target = $(target)
  query = $.param({q: {s: $target.val()}})
  location.href = "#{$target.data('url')}?#{query}"
