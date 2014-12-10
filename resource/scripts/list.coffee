#admin list
(->
  #
  ## register events
  #

  #del
  $('.del').click (event)->
    self = $(this)
    b = confirm '你确定要删除吗？'
    return unless b
    $.ajax
      type:'delete'
      url : "/movies/#{self.data('id')}"
      success: ->
        self.parents('tr').remove()
      error :(error) ->
        alert(error)
)();