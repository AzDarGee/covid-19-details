class StaticPagesController < ApplicationController
  require 'net/http'
  require 'json'

  def home
    # @countries = Country.all
    # 1. Get list of 10 countries with the MOST cases of COVID-19 - DONE
    # 2. Access details for each of those 10 countries - 


    # Get summary for all countries
    summaryURL = URI('https://api.covid19api.com/summary')

    # Parse the request
    summary = JSON.parse(Net::HTTP.get(summaryURL))

    # Date of Request
    @date = summary["Date"]

    # Global Data
    @globalData = summary["Global"]

    # Summary of All Countries - unsorted
    countries = summary["Countries"]

    # Sort by Most COVID-19 cases
    @sortedCountries = countries.sort_by { |country| country['TotalConfirmed'].to_i }
    @sortedCountries.reverse!

    # Get the first 10 countries
    @mostCases = @sortedCountries.slice(0,10)
    
    # Recent Country Details
    countryDetails = []
    detailsURL = "https://api.covid19api.com/total/country/"
    @recentCountryData = []

    for country in @mostCases 
      countryDetails.append(JSON.parse(Net::HTTP.get( URI(detailsURL + country['CountryCode']))))
    end
    
    for country in countryDetails
      @recentCountryData.append(country.last)
    end
    
    

  end

end
