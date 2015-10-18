var mapGlobal;
var infowindow;
var news_feed_markers = [];
function initMap() {
  var myLatLng = {lat: 37.7749, lng: -122.4194};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: myLatLng
  });
  mapGlobal = map;
  infowindow = new google.maps.InfoWindow();
  var marker;

  google.maps.event.addListener(map, 'click', function(e) {
    if (marker) {
      marker.setPosition(e.latLng);
      update_lat_lng_value(e.latLng);
    } else {        
      marker = new google.maps.Marker({
        position: e.latLng,
        map: map,
        draggable:true,
        icon : "https://google-developers.appspot.com/maps/documentation/javascript/examples/full/images/beachflag.png"
      });

      update_lat_lng_value(e.latLng);

      google.maps.event.addListener(marker, 'dragend', function() {
        update_lat_lng_value( marker.position );
      });
    }

    map.panTo(marker.getPosition());
  });    
}

function update_lat_lng_value( position ){
  marker_latitude = position.lat();
  marker_longitude = position.lng();

  $('#latitude-input').val( marker_latitude );
  $('#longitude-input').val( marker_longitude );
}

function init_instagram_marker( feed_latitude, feed_longitude, short_info ) {
  feed_location_lat = feed_latitude;
  feed_location_lng = feed_longitude;
  feed_location = new google.maps.LatLng( feed_location_lat, feed_location_lng );

  add_marker( feed_location, short_info )
}


function add_marker( location_log, short_info ) {
  var news_feed_marker;
  news_feed_marker = new google.maps.Marker({
    position: location_log,
    map: mapGlobal
  });

  google.maps.event.addListener(news_feed_marker, "click", function() {
    infowindow.close();
    infowindow.setContent( short_info );
    infowindow.open(mapGlobal, news_feed_marker);
  });
  news_feed_markers.push(news_feed_marker);
}

function setMapOnAll(map) {
for (var i = 0; i < news_feed_markers.length; i++) {
  news_feed_markers[i].setMap(map);
  }
}

function clearMarkers() {
  setMapOnAll(null);
}

function deleteMarkers() {
  clearMarkers();
  markers = [];
}