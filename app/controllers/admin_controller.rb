class AdminController < ApplicationController
  def index
  	@cached_entries = CacheEntry.all.order('id desc')
  end

  def destroy
  	puts params[:id]
  	puts "HELLO"
    CacheEntry.destroy(params[:id])
    redirect_to request.referrer
  end

  def create
  	query_to_cache = params[:query]

  	if query_to_cache and !CacheEntry.find_by(query: query_to_cache)
      @locations = MetaWeather.new(params).search if query_to_cache
      entry = CacheEntry.new
      entry.query = query_to_cache
      entry.response = @locations.to_json
      entry.save
    end
    redirect_to request.referrer
  end
end
