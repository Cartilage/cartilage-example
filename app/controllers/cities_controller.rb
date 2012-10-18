class CitiesController < ApplicationController

  respond_to :json

  def index
    # A simple mapping of ids usable for retrieving the yahoo!
    # weather forecast in the ForecastsController. Also, so we
    # have real cities objects on the front-end that work normally.
    cities = [
      { :id => '2502265', :name => 'Sunnyvale, CA' },
      { :id => '12792285', :name => 'Austin, TX' },
      { :id => '2475688', :name => 'Portland, ME' },
      { :id => '2459115', :name => 'New York, NY' },
      { :id => '2507854', :name => 'Trenton, NJ' },
      { :id => '2352824', :name =>'Albuquerque, NM' }
    ]

    return render :json => cities.to_json
  end
end
