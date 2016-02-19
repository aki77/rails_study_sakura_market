$(document).on 'change', '.js-line-item-quantity', ({target}) ->
  $target = $(target)
  $.ajax(
    url: $target.data('url')
    type: 'POST'
    data:
      _method: 'patch'
      line_item:
        quantity: $target.val()
  ).done( ->
    location.reload()
  ).fail( ->
    alert('数量の変更に失敗しました')
  )
