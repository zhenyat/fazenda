class Admin::AreasController < Admin::BaseController
  before_action :set_area, only: [:show, :edit, :update,:destroy]
  after_action  :remove_images, only: :update

  def index
    @areas = policy_scope(Area)
  end

  def show
    authorize @area
  end

  def new
    @area = Area.new
    authorize @area
  end

  def edit
    authorize @area
  end

  def create
    @area = Area.new(area_params)
    authorize @area
    if @area.save
      redirect_to admin_area_path(@area), notice: t('messages.created', model: @area.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @area
    if @area.update(area_params)
      redirect_to admin_area_path(@area), notice: t('messages.updated', model: @area.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @area
    @area.destroy
    flash[:success] = t('messages.deleted', model: @area.class.model_name.human)
    redirect_to admin_areas_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_area
      @area = Area.find(params[:id])
    end

    # Removes images, selected during Editing
    def remove_images
      @area.cover_image.purge if area_params[:remove_cover_image] == '1'
      image_to_remove_ids = params['image_to_remove_ids']
      if image_to_remove_ids.present?
        image_to_remove_ids.each do |image_to_remove_id|
          @area.images.find(image_to_remove_id).purge
        end
      end
    end

    # Only allows a trusted parameter 'white list' through
    def area_params
      params.require(:area).permit(
        :name, :title, :description, :status, :cover_image, :remove_cover_image, images: []
      )
    end
end
