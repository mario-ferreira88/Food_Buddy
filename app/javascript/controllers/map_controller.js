import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/cynthia86/clpqwedk9015701o04opm3zub"
    });

    this.addMarkersToMap()
    this.fitMapToMarkers()
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);
      popup.addClassName('map-card');

      new mapboxgl.Marker({ color: '#6168BD'})
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  selectRestaurant(event) {
    event.preventDefault()
    const restaurantIdField = document.getElementById('event_restaurant_id');

    restaurantIdField.value = event.target.dataset.restaurantId;
    restaurantIdField.form.submit()
  }
}
