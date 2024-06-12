document.addEventListener("turbo:load", function() {
    var map = L.map('map').setView([51.505, -0.09], 13);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);

    function addMarker(lat, lng, title, description, openingHours, phone) {
        var popupContent = "<b>" + title + "</b><br>" + description;
        if (openingHours) {
            popupContent += "<br><b>Horaires:</b> " + openingHours;
        }
        if (phone) {
            popupContent += "<br><b>Téléphone:</b> " + phone;
        }

        var marker = L.marker([lat, lng]).addTo(map);
        marker.bindPopup(popupContent);
    }

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var userLat = position.coords.latitude;
            var userLng = position.coords.longitude;
            map.setView([userLat, userLng], 13);

            var query = `
            [out:json];
            (
              node["amenity"="veterinary"](around:10000,${userLat},${userLng});
              node["shop"="pet_grooming"](around:10000,${userLat},${userLng});
            );
            out;
            `;
            
            var url = 'https://overpass-api.de/api/interpreter?data=' + encodeURIComponent(query);

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    if (data.elements.length === 0) {
                        console.log("Aucun vétérinaire ou toiletteur trouvé dans la zone.");
                    } else {
                        data.elements.forEach(function(element) {
                            var name = element.tags.name || "Nom non disponible";
                            var type = element.tags.amenity || element.tags.shop;
                            var description = type === "veterinary" ? "Vétérinaire" : "Toiletteur";
                            var openingHours = element.tags.opening_hours || "Horaires non disponibles";
                            var phone = element.tags.phone || "Téléphone non disponible";

                            addMarker(element.lat, element.lon, name, description, openingHours, phone);
                        });
                    }
                })
                .catch(error => console.error('Erreur lors de la récupération des données:', error));
        }, function(error) {
            console.error("Erreur de géolocalisation: " + error.message);
        }, {
            timeout: 10000
        });
    } else {
        console.error("La géolocalisation n'est pas supportée par ce navigateur.");
    }
});
