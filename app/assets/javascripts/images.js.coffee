jQuery ->
  $('#fileupload').fileupload
    dataType: "script"
    done: (e, data) ->
      id = data.files[0].name.replace(".", "")
      $('.progress:first').fadeOut()
    add: (e, data) ->
      id = data.files[0].name.replace(".", "")
      data.context = $('<div id="'+id+'" class="progress progress-striped"><div class="bar"></div></div>')
      $('ul.thumbnails:last').after(data.context)
      data.submit()
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')


