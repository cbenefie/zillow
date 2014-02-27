
require 'open-uri'
require 'json'
require 'nokogiri'

class ZillowController < ApplicationController


    def fetch_zillow

    end

    def zillow_stat

      @address = params[:address]
      @url_safe_address = URI.encode(@address)
      @city = params[:city]
      @state = params[:state]
      @url ="http://www.zillow.com/webservice/GetDeepSearchResults.htm?zws-id=X1-ZWz1b9r2e8phjf_2xcn2&address=#{@url_safe_address}&citystatezip=#{@city}+#{@state}"

      doc = Nokogiri::XML(open(@url))

      @type = doc.xpath("//useCode")
      @lot = doc.xpath("//lotSizeSqFt")
      @sqft = doc.xpath("//finishedSqFt")
      @bath = doc.xpath("//bathrooms")
      @bed = doc.xpath("//bedrooms")
      @total = doc.xpath("//totalRooms")

    end
  end

