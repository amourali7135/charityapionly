class Api::V1::CampaignsController < Api::V1::BaseController
  before_action :set_campaign, only: %i[show update destroy]

  def index
    @campaigns = policy_scope(Campaign)
  end

  def show
    authorize @campaign
  end

  def new
    @campaign = Campaign.new
    authorize @campaign
  end

  def edit
    authorize @campaign
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.charity = @charity
    authorize @campaign
  end

  def update
    authorize @campaign
  end

  def destroy
    authorize @campaign
  end

  private

  def campaign_params
    params.require(:campaign).permit(:id, :title, :goal, :completion_date, :fundraising_goal, :how, :end_date,
                                     :amount_raised, :charity_id)
  end

  def render_error
    render json: { errors: @campaign.errors.full_messages },
           status: :unprocessable_entity
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
    authorize @campaign  # For Pundit
  end
end
