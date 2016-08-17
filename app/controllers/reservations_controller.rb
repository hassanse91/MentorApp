class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_mentor, only: [:new, :show, :create, :edit, :destroy, :update]
  
  # GET /reservations
  # GET /reservations.json
  def index
      @reservations = Reservation.all
  end

  def show
    
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
    
    @reservation = @mentor.reservations.new(reservation_params)
    @reservation.student_id = Student.where(user_id: current_user.id).first.id
    @reservation.save
    if @reservation.save 
        redirect_to mentor_reservations_path
      else
        render 'new'
      end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
   
      if @reservation.update(reservation_params)
        redirect_to @mentor
      else
        render 'edit'
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
   def set_student
     @student = Student.find(params[:student_id])
   end

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:matiere_id, :mentor_id, :student_id, :date, :time)
    end
end
