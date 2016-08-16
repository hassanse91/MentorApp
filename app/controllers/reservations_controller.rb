class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  before_action :set_mentor
  before_action :set_matiere
  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  
def new
    @reservation = Reservation.new
  end
  # GET /reservations/new
  

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @mentor = Mentor.find(params[:mentor_id])
    @matiere = Matiere.find(params[:matiere_id])
    @reservation = @mentor.reservation.new(reservation_params)
    @reservation.matiere = @matiere

    if @reservation.save 
        redirect_to @mentor
      else
        render 'new'
      end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_mentor
     @mentor = Mentor.find(params[:mentor_id])
      
    end
    def set_matiere
     @matiere = Matiere.find(params[:matiere_id])
    end
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:matiere_id, :mentor_id, :date)
    end
end
