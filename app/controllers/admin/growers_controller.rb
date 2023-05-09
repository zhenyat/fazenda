class Admin::GrowersController < Admin::BaseController
  before_action :set_grower, only: [:show, :edit, :update,:destroy]
  after_action  :remove_avatar, only: :update

  def index
    @growers = policy_scope(Grower)
  end

  def show
    authorize @grower
  end

  def new
    @grower = Grower.new
    authorize @grower
  end

  def edit
    authorize @grower
  end

  def create
    @grower = Grower.new(grower_params)
    authorize @grower
    if @grower.save
      redirect_to admin_grower_path(@grower), notice: t('messages.created', model: @grower.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @grower
    if @grower.update(grower_params)
      redirect_to admin_grower_path(@grower), notice: t('messages.updated', model: @grower.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @grower
    @grower.destroy
    flash[:success] = t('messages.deleted', model: @grower.class.model_name.human)
    redirect_to admin_growers_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_grower
      @grower = Grower.find(params[:id])
    end

    # Removes avatar, if selected during Editing
    def remove_avatar
      @grower.avatar.purge if grower_params[:remove_avatar] == '1'
    end

    # Only allows a trusted parameter 'white list' through
    def grower_params
      params.require(:grower).permit(
        :name, :title, :address, :phone, :url, :about, :status, :avatar, :remove_avatar
      )
    end
end
