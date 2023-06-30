class Admin::LocationsController < Admin::BaseController
  before_action :set_location, only: [:show, :edit, :update,:destroy]
  after_action  :remove_images, only: :update

  def index
    @locations = policy_scope(Location)
  end

  def show
    authorize @location
  end

  def new
    @location = Location.new
    authorize @location
  end

  def edit
    authorize @location
  end

  def create
    @location = Location.new(location_params)
    authorize @location
    if @location.save
      redirect_to admin_location_path(@location), notice: t('messages.created', model: @location.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @location
    if @location.update(location_params)
      redirect_to admin_location_path(@location), notice: t('messages.updated', model: @location.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @location
    @location.destroy
    flash[:success] = t('messages.deleted', model: @location.class.model_name.human)
    redirect_to admin_locations_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_location
      @location = Location.find(params[:id])
    end

    # Removes images, selected during Editing
    def remove_images
      @location.cover_image.purge if location_params[:remove_cover_image] == '1'
      image_to_remove_ids = params['image_to_remove_ids']
      if image_to_remove_ids.present?
        image_to_remove_ids.each do |image_to_remove_id|
          @location.images.find(image_to_remove_id).purge
        end
      end
    end

    # Only allows a trusted parameter 'white list' through
    def location_params
      params.require(:location).permit(
        :number, :title, :comment, :status, :cover_image, :remove_cover_image, images: []
      )
    end
end
