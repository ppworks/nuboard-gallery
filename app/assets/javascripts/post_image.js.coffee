jQuery ->
  post_image = new PostImage('.post_image .image')

class PostImage
  constructor: (elements) ->
    @elements = elements
    @init()

  init: ->
    @listen()
    @update_elements_height()

  listen: ->
    @listen_resize()
    @listen_load()

  listen_resize: =>
    $(window).on 'resize', @update_elements_height
    setTimeout @update_body_width, 1000

  listen_load: =>
    $(window).on 'load', @update_body_width

  update_elements_height: =>
    $(@elements).css('height', $(window).height())

  update_body_width: =>
    width = 0
    $(@elements).each (i, element) ->
      width += $(element).width()
    $('html, body').css('width', width)
