# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


#Ajax kaminari not working yet
$ ->
#  $('#paginator').html('= escape_javascript(paginate(@images, :remote => true).to_s)')
  $('.wtfornot').click (e)->
    window.location = this.firstElementChild.getAttribute('value')
    return false
#  $(".img_link").click (e)-> 
#    e.preventDefault()
#    image_id = this.getAttribute('value')
#    $.post("images/add_point", 
#      {image_id: image_id}, 
#      (data) -> 
#        alert('data')
#      )
#    return false

