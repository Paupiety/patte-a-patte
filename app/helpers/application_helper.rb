module ApplicationHelper
  def canonical_url
    request.original_url
  end

  module ApplicationHelper
    def product_jsonld(offer)
      {
        "@context": "https://schema.org",
        "@type": "Product",
        "name": offer.title,
        "description": offer.description,
        "image": offer.photo_1,
        "brand": "Patte à Patte",
        "sku": offer.id.to_s,
        "offers": {
          "@type": "Offer",
          "priceCurrency": "USD",
          "price": offer.price,
          "itemCondition": "https://schema.org/NewCondition",
          "availability": "https://schema.org/InStock",
          "seller": {
            "@type": "Organization",
            "name": "Patte à Patte"
          }
        },
        "aggregateRating": {
          "@type": "AggregateRating",
          "ratingValue": offer.average_rating,
          "reviewCount": offer.review_count
        }
      }.to_json
    end

    def service_jsonld(offer)
      {
        "@context": "https://schema.org",
        "@type": "Service",
        "serviceType": offer.type_offer,
        "provider": {
          "@type": "Person",
          "name": "#{offer.user.first_name} #{offer.user.last_name}",
          "email": offer.user.email
        },
        "areaServed": offer.user.address.city_name,
        "description": offer.description,
        "offers": {
          "@type": "Offer",
          "priceCurrency": "USD",
          "price": offer.price
        },
        "aggregateRating": {
          "@type": "AggregateRating",
          "ratingValue": offer.average_rating,
          "reviewCount": offer.review_count
        }
      }.to_json
    end

    def adoption_jsonld(pet)
      {
        "@context": "https://schema.org",
        "@type": "Offer",
        "itemOffered": {
          "@type": "Pet",
          "name": pet.first_name,
          "breed": pet.breed,
          "age": pet.age,
          "gender": pet.sex,
          "image": pet.profile_picture,
          "description": "un joli #{pet.breed} recherche une nouvelle maison..."
        },
        "offeredBy": {
          "@type": "Organization",
          "name": "Patte à Patte",
          "url": "https://www.patteapatte.com"
        },
        "price": "0.00",
        "priceCurrency": "USD"
      }.to_json
    end
  end

  end
