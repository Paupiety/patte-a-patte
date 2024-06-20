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
      "author": {
        "@type": "Person",
        "name": offer.user.first_name
      }
    }.to_json.html_safe
  end
end
