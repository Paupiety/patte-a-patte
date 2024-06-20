module ApplicationHelper
  def canonical_url
    request.original_url
  end

  def offer_jsonld(offer)
    {
      "@context": "http://schema.org",
      "@type": "Offer",
      "name": offer.title,
      "description": offer.description,
      "price": offer.price,
      "priceCurrency": "EUR",

    }.to_json.html_safe
  end
end
