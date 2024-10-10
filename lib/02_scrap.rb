require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://www.aude.fr/annuaire-mairies-du-departement/"))

def get_townhall_email(townhall_url)
  begin
    townhall_page = Nokogiri::HTML(URI.open("https://www.aude.fr/annuaire-mairies-du-departement/mairie-#{townhall_url}"))
  rescue OpenURI::HTTPError => e
    return "Erreur : page non trouvée"
  end

  email_element = townhall_page.at_xpath('//p[contains(@class, "infos__item") and contains(@class, "-email")]/a')
  
  if email_element
    email = email_element['href'].gsub('mailto:', '')
    return email
  else
    return "Email non trouvé"
  end
end

puts get_townhall_email("antugnac")


