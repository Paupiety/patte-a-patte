document.addEventListener("DOMContentLoaded", function() {
  const typeOfferSelect = document.querySelector(".type_offer_select");
  const sections1 = document.querySelectorAll(".type_offer_section_1");
  const sections2 = document.querySelectorAll(".type_offer_section_2");
  const sectionsp = document.querySelectorAll(".type_offer_section_p");
  function toggleSections() {
    const typeOfferId = typeOfferSelect.value;

    if (typeOfferId == '1') { // Change '1' to the actual ID for the specific type offer
      sections1.forEach(section => section.style.display = '');
      sections2.forEach(section => section.style.display = 'none');
      sectionsp.forEach(section => section.style.display = '');
    } else if (typeOfferId == '2' || typeOfferId =='3') { // Change '2' to the actual ID for another type offer
      sections1.forEach(section => section.style.display = '');
      sections2.forEach(section => section.style.display = '');
      sectionsp.forEach(section => section.style.display = 'none');
    } else {
      sections1.forEach(section => section.style.display = '');
      sections2.forEach(section => section.style.display = '');
      sectionsp.forEach(section => section.style.display = 'none');
    }
  }

  typeOfferSelect.addEventListener('change', toggleSections);
  toggleSections();
});
