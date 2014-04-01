jQuery ->
  post_image = new PostImage('.post_image .image')

class PostImage
  constructor: (elements) ->
    @elements = elements
    @init()

  init: ->
    @listen()
    @update_height()

  listen: ->
    @listen_resize()

  listen_resize: =>
    $(window).on 'resize', @update_height
    setTimeout =>
      width = $(window).width()
      $(@elements).each (i, element) ->
        width += $(element).width()
      $('html, body').css('width', width)
    , 500


  update_height: =>
    $(@elements).css('height', $(window).height())
