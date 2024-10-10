require 'nokogiri'
require 'open-uri'

page=Nokogiri::HTML(URI.open("https://www.aude.fr/annuaire-mairies-du-departement/"))

def get_townhall_email(townhall_url)

    begin
    townhall_link= Nokogiri::HTML(URI.open("https://www.aude.fr/annuaire-mairies-du-departement/mairie-#{townhall_url}"))
    rescue OpenURI::HTTPError => e
        return "Erreur : page non trouvée"
    end

    email=townhall_link.at_xpath('//a[contains(@class, "infos__item") and contains(@class, "-email")]').strip
    
    
    
   return email
    
end


    puts get_townhall_email("alzonne")
