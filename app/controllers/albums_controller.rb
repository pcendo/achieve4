class AlbumsController < ApplicationController
    before_action :set_album, only: [ :show, :edit, :update, :destroy]

    def new
        @place = Place.find(params[:place_id])
        @albums = Album.where(place_id: params[:place_id])

        @hash = Gmaps4rails.build_markers(@albums) do |album, marker|
          marker.lat album.latitude
          marker.lng album.longitude
          marker.picture album.image
          marker.json({title: album.content})
        end
        
        if params[:back]
          @album = Album.new(album_params)
        else
          @album = Album.new
        end
    end
    
    def confirm
        @album = Album.new(album_params)
        render :new if @album.invalid?
    end
    
    def create
        @album = Album.new(album_params)
        @album.image.retrieve_from_cache! params[:cache][:image]

        if @album.save
#          AlbumMailer.album_mail(@album).deliver
          redirect_to :action => "new", :place_id => @album.place_id
        else
          render 'new', notice: "PHOTOを選択してください‼"
        end
    end
    
    def index
        @albums = Album.where(place_id: params[:place_id])
        @place = Place.find(params[:place_id])
        if @albums.last == nil
            redirect_to new_album_path(place_id: @place.id)
        else
        end
    end

    def destroy
        @album.destroy
        redirect_to :action => "index", :place_id => @album.place_id
    end

    def list
        @place = Place.find(params[:place_id])
        @albums = Album.where(place_id: params[:place_id])

        @hash = Gmaps4rails.build_markers(@albums) do |album, marker|
          marker.lat album.latitude
          marker.lng album.longitude
          marker.picture album.image
          marker.json({title: album.content})
        end
    end

    def list2
        @place = Place.find(params[:place_id])
        @albums = Album.where(place_id: params[:place_id])

        @hash = Gmaps4rails.build_markers(@albums) do |album, marker|
          marker.lat album.latitude
          marker.lng album.longitude
          marker.picture album.image
          marker.json({title: album.content})
        end
    end
    
private
    def album_params
        params.require(:album).permit(:image, :content, :place_id, :latitude, :longitude )
    end
    
    def set_album
        @album = Album.find(params[:id])
    end
end
