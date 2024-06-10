
document.addEventListener("DOMContentLoaded", function() {
  const mainImage = document.getElementById('main-image');
  const thumbnails = document.querySelectorAll('.thumbnail');

  thumbnails.forEach(thumbnail => {
    thumbnail.addEventListener('click', function(event) {
      event.preventDefault();
      mainImage.src = thumbnail.dataset.large;
    });
  });
});
