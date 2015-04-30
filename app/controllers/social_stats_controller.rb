class SocialStatsController < ApplicationController
  before_action :set_social_stat, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token

  # POST /social_stats
  # POST /social_stats.json
  def create
    @social_stat = SocialStat.new(social_stat_params)
    respond_to do |format|
      if @social_stat.save
        format.html { redirect_to @social_stat, notice: 'Social stat was successfully created.' }
        format.json { render :show, status: :created, location: @social_stat }
      else
        format.html { render :new }
        format.json { render json: @social_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_stats/1
  # PATCH/PUT /social_stats/1.json
  def update
    respond_to do |format|
      if @social_stat.update(social_stat_params)
        format.html { redirect_to @social_stat, notice: 'Social stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_stat }
      else
        format.html { render :edit }
        format.json { render json: @social_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /social_stats
  # GET /social_stats.json
  def index
    @social_stats = SocialStat.all
  end

  # GET /social_stats/1
  # GET /social_stats/1.json
  def show
  end

  # GET /social_stats/new
  def new
    @social_stat = SocialStat.new
  end

  # GET /social_stats/1/edit
  def edit
  end

  # DELETE /social_stats/1
  # DELETE /social_stats/1.json
  def destroy
    @social_stat.destroy
    respond_to do |format|
      format.html { redirect_to social_stats_url, notice: 'Social stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_stat
      @social_stat = SocialStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_stat_params
      params.permit(:site_id, :is_multisite, :wp_version, :plugin_version).tap do |whitelisted|
        whitelisted[:plugin_settings] = params[:plugin_settings]
        whitelisted[:conn_status] = params[:conn_status]
      end
    end
end
