class PlacesController < ApplicationController
    
    before_action :set_place, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user, only: [:new, :edit, :show, :index]
    before_action :ensure_correct_user, only: [:edit,:update,:destroy]
    before_action :place_params, only: [:create]

    def index
        @places = Place.all
    end
    
    def new
      if params[:back]
        @place = Place.new(place_params)
      else
        @place = Place.new
      end
    end
    
    def list
      keyword = params[:search]
      @client = GooglePlaces::Client.new( ENV['GOOGLE_API_KEY'] )
      @places = @client.spots_by_query( keyword )
      
      @hash = Gmaps4rails.build_markers(@places) do |place,marker|
        marker.lat place.lat
        marker.lng place.lng
        marker.json({title: place.name})
      end
    end

    def create
      @place = Place.new(place_params)
#      @place.user_id = current_user.id

      if @place.save
#        PlaceMailer.place_mail(@place).deliver
        redirect_to new_album_path( place_id: @place.id )
      else
        render 'new', notice: "#{@place.name} の位置情報を保存できませんでした"
      end
    end
    
    def confirm
      @place = Place.new(place_params)
      render :new if @place.invalid?
    end
    
    def show
      @hash = Gmaps4rails.build_markers(@place) do |place,marker|
        marker.lat place.latitude
        marker.lng place.longitude
        marker.json({title: place.name})
      end
    end
    
    def edit
    end
    
    def update
      if @place.update(place_params)
        redirect_to places_path, notice: "Mapを編集しました‼"
      else
        render 'edit'
      end
    end
    
    def destroy
      @place.destroy
      redirect_to places_path, notice: "Mapを削除しました‼"
    end
    
    private
    def place_params
        params.require(:place).permit( :name, :latitude, :longitude, :address, :user_id, :start_date, :last_date )
    end
    
    def set_place
        @place = Place.find(params[:id])
    end
    
    def authenticate_user
      if logged_in?
      else
        redirect_to new_session_path
      end
    end

    def ensure_correct_user
      @place = Place.find_by(id: params[:id])
      @current_user = User.find(current_user.id)
      if @current_user.id != @place.user_id
        flash[:notice] = "編集の権限がありません"
        redirect_to places_path
      end
    end
    
end
