class Admin::FamiliesController < Admin::BaseController
  before_action :set_family, only: [:show, :edit, :update,:destroy]

  def index
    @families = policy_scope(Family)
  end

  def show
    authorize @family
  end

  def new
    @family = Family.new
    authorize @family
  end

  def edit
    authorize @family
  end

  def create
    @family = Family.new(family_params)
    authorize @family
    if @family.save
      redirect_to admin_family_path(@family), notice: t('messages.created', model: @family.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @family
    if @family.update(family_params)
      redirect_to admin_family_path(@family), notice: t('messages.updated', model: @family.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @family
    @family.destroy
    flash[:success] = t('messages.deleted', model: @family.class.model_name.human)
    redirect_to admin_families_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_family
      @family = Family.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def family_params
      params.require(:family).permit(
        :name, :title, :comment, :status
      )
    end
end
