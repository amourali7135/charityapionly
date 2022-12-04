class Api::V1::CharitiesController < Api::V1::BaseController
  before_action :set_charity, only: %i[show update destroy]

  def new
    @charity = Charity.new
    authorize @charity # Add this line
  end

  def create
    @charity = Charity.new(charity_params)
    @charity.user = current_user
    authorize @charity # Add this line
  end

  def show
    authorize @charity
  end

  def index
    @charities = policy_scope(Charity)
  end

  def update
    authorize @charity
    if @charity.update(charity_params)
      render :show
    else
      render_error
    end
  end

  def create
    @charity = Charity.new(charity_params)
    @charity.user = current_user
    authorize @charity
    if @charity.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    authorize @charity
    @charity.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  def edit
    
    authorize @charity
  end

  private

  def charity_params
    params.require(:charity).permit(:id, :name, :aged, :instagram, :facebook, :website, :city, :country, :income,
                                    :country_focus, :size, :program_percentage, :cost_to_100, :fiveohone, :phone, :email, :mission, :goal, :age, :issues, :photo)
  end

  def render_error
    render json: { errors: @charity.errors.full_messages },
           status: :unprocessable_entity
  end

  def set_charity
    @charity = Charity.find(params[:id])
    authorize @charity  # For Pundit
  end
end
