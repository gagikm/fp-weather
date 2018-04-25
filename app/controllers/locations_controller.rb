class LocationsController < ApplicationController
  def index
    search_query = params[:query]

    if !search_query
      return
    end

    search_query = search_query.downcase
    existing_entry = CacheEntry.find_by(query: search_query)

    if existing_entry
      @locations = JSON.parse(existing_entry.response)
    else
      @locations = MetaWeather.new(params).search if search_query
      entry = CacheEntry.new
      entry.query = search_query
      entry.response = @locations.to_json
      entry.save
    end
  end

  def show
    @location = MetaWeather.new(params).location_data
  end
end