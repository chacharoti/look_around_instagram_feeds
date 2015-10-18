$(document).ready ->
  $('a#look_around').on 'click', ->
    latitude_value = $('#latitude-input').val()
    longitude_value = $('#longitude-input').val()
    radius_value = $('#radius-input').val()
    if radius_value == ''
      radius_value = '1000'
    @href = @href + '?latitude=' + latitude_value + '&longitude=' + longitude_value + '&radius=' + radius_value
    deleteMarkers()
    return
  return