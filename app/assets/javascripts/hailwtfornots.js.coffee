# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


#Ajax kaminari not working yet
$ ->
#  $('#paginator').html('= escape_javascript(paginate(@images, :remote => true).to_s)')
  $('.wtfornot').click (e)->
    window.location = this.firstElementChild.getAttribute('value')
    return false

  $('.image-with-points').click (e)->
    window.location = this.firstElementChild.getAttribute('value')
    return false

  $('.user-with-image').click (e)->
    window.location = this.firstElementChild.getAttribute('value')
    return false

  $(".wtfornot").mouseover ->
    this.style.backgroundColor = "#ccc"
    this.style.cursor = "pointer"
    
  $(".wtfornot").mouseout ->
    this.style.backgroundColor = ""
    this.style.cursor = ""

  $(".image-with-points").mouseover ->
    this.style.backgroundColor = "#ccc"
    this.style.cursor = "pointer"
    
  $(".image-with-points").mouseout ->
    this.style.backgroundColor = ""
    this.style.cursor = ""

  $(".user-with-image").mouseover ->
    this.style.backgroundColor = "#ccc"
    this.style.cursor = "pointer"
    
  $(".user-with-image").mouseout ->
    this.style.backgroundColor = ""
    this.style.cursor = ""

#  $(".img_link").click (e)-> 
#    e.preventDefault()
#    image_id = this.getAttribute('value')
#    $.post("images/add_point", 
#      {image_id: image_id}, 
#      (data) -> 
#        alert('data')
#      )
#    return false

