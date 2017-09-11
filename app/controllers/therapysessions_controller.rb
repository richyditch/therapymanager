  class TherapysessionsController < ApplicationController
  before_action :set_therapysession, only: [:show, :edit, :update, :destroy]

  # GET /therapysessions
  # GET /therapysessions.json
  def index
    conditions = String.new
    wheres = Array.new
 
    if params.has_key?(:therapist_id)
      conditions << " AND " unless conditions.length == 0
      conditions << "therapist_id = ?"
      wheres << params[:therapist_id]
    end
    if params.has_key?(:client_id)
      conditions << " AND " unless conditions.length == 0
      conditions << "client_id = ?"
      wheres << params[:client_id]
    end

    if !wheres.empty?
      wheres.insert(0, conditions)
      @therapysessions = Therapysession.where(wheres).order(:session_started_at)
    else
      @therapysessions = Therapysession.all.order(:session_started_at)
    end
  end

  # GET /therapysessions/1
  # GET /therapysessions/1.json
  def show
  end

  # GET /therapysessions/new
  def new
    @therapysession = Therapysession.new

    if params.has_key?(:therapist_id)
      @therapysession.therapist_id = params[:therapist_id]
    end

    if params.has_key?(:client_id)
      @therapysession.client_id = params[:client_id]
    end
  end

  # GET /therapysessions/1/edit
  def edit
  end

  # POST /therapysessions
  # POST /therapysessions.json
  def create
    @therapysession = Therapysession.new(therapysession_params)

    respond_to do |format|
      if @therapysession.save
        format.html { redirect_to @therapysession, notice: 'Therapysession was successfully created.' }
        format.json { render :show, status: :created, location: @therapysession }
      else
        format.html { render :new }
        format.json { render json: @therapysession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /therapysessions/1
  # PATCH/PUT /therapysessions/1.json
  def update
    respond_to do |format|
      if @therapysession.update(therapysession_params)
        format.html { redirect_to @therapysession, notice: 'Therapysession was successfully updated.' }
        format.json { render :show, status: :ok, location: @therapysession }
      else
        format.html { render :edit }
        format.json { render json: @therapysession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /therapysessions/1
  # DELETE /therapysessions/1.json
  def destroy
    @therapysession.destroy
    respond_to do |format|
      format.html { redirect_to therapysessions_url, notice: 'Therapysession was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_therapysession
      @therapysession = Therapysession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def therapysession_params
      params.require(:therapysession).permit(:therapist_id, :client_id, :invoice_id, :session_started_at, :session_duration_minutes, :location, :fee_pence, :new_client_assessment, :attendance)
    end
end
