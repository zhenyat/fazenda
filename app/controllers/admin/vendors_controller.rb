class Admin::VendorsController < Admin::BaseController
  before_action :set_vendor, only: [:show, :edit, :update,:destroy]
  after_action  :remove_avatar, only: :update

  def index
    @vendors = policy_scope(Vendor)
  end

  def show
    authorize @vendor
  end

  def new
    @vendor = Vendor.new
    authorize @vendor
  end

  def edit
    authorize @vendor
  end

  def create
    @vendor = Vendor.new(vendor_params)
    authorize @vendor
    if @vendor.save
      redirect_to admin_vendor_path(@vendor), notice: t('messages.created', model: @vendor.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @vendor
    if @vendor.update(vendor_params)
      redirect_to admin_vendor_path(@vendor), notice: t('messages.updated', model: @vendor.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @vendor
    @vendor.destroy
    flash[:success] = t('messages.deleted', model: @vendor.class.model_name.human)
    redirect_to admin_vendors_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Removes avatar, if selected during Editing
    def remove_avatar
      @vendor.avatar.purge if vendor_params[:remove_avatar] == '1'
    end

    # Only allows a trusted parameter 'white list' through
    def vendor_params
      params.require(:vendor).permit(
        :name, :title, :address, :phone, :url, :about, :status, :avatar, :remove_avatar
      )
    end
end
