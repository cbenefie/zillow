class HomesController < ApplicationController
require 'open-uri'
require 'json'
require 'nokogiri'

  def index
  @homes = Home.all

    respond_to do |format|
      format.html
      format.csv { send_data @homes.to_csv }
      format.xls { send_data @homes.to_csv(col_sep: "\t") }

    end
  end

  def show
    @home = Home.find_by(id: params[:id])
  end

  def new
  end

  def create
    @home = Home.new
    @home.idcnum = params[:idcnum]
    @home.name = params[:name]
    @home.address = params[:address]
    @home.city = params[:city]
    @home.state = params[:state]

    @address = params[:address]
    @url_safe_address = URI.encode(@address)
    @city = params[:city]
    @url_safe_city= URI.encode(@city)
    @state = params[:state]
    @url ="http://www.zillow.com/webservice/GetDeepSearchResults.htm?zws-id=X1-ZWz1b9r2e8phjf_2xcn2&address=#{@url_safe_address}&citystatezip=#{@url_safe_city}+#{@state}"

      doc = Nokogiri::XML(open(@url))

    @home.zip = doc.xpath("//useCode").inner_text
    @home.hometype = doc.xpath("//useCode").inner_text
    @home.lot = doc.xpath("//lotSizeSqFt").inner_text
    @home.sqft = doc.xpath("//finishedSqFt").inner_text
    @home.bath = doc.xpath("//bathrooms").inner_text
    @home.bed = doc.xpath("//bedrooms").inner_text
    @home.total = doc.xpath("//totalRooms").inner_text

    if @home.save
      redirect_to homes_url, notice: "Home created successfully."
    else
      render 'new'
    end
  end

  def edit
    @home = Home.find_by(id: params[:id])
  end

  def update
    @home = Home.find_by(id: params[:id])
    @home.idcnum = params[:idcnum]
    @home.name = params[:name]
    @home.address = params[:address]
    @home.city = params[:city]
    @home.state = params[:state]
    @home.zip = params[:zip]
    @home.hometype = params[:hometype]
    @home.lot = params[:lot]
    @home.sqft = params[:sqft]
    @home.bath = params[:bath]
    @home.bed = params[:bed]
    @home.total = params[:total]

    if @home.save
      redirect_to homes_url, notice: "Home updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @home = Home.find_by(id: params[:id])
    @home.destroy

    redirect_to homes_url, notice: "Home deleted."
  end
end
