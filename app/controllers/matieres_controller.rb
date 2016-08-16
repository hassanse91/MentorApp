class MatieresController < ApplicationController
  before_action :set_matiere, only: [:show, :edit, :update, :destroy]
  before_action :set_mentor
  # GET /matieres
  # GET /matieres.json
  def index
    @matieres = Matiere.all
  end

  # GET /matieres/1
  # GET /matieres/1.json
  def show
  end

  # GET /matieres/new
  def new
    @matiere = Matiere.new
  end

  # GET /matieres/1/edit
  def edit
  end

  # POST /matieres
  # POST /matieres.json
    def create
        @mentor = Mentor.find(params[:mentor_id])
        @matiere = @mentor.matieres.new(matiere_params)

        respond_to do |format|
          if @matiere.save
            format.html { redirect_to @mentor, notice: 'Matiere was successfully created.' }
            format.json { render json: @matiere, status: :created, location: @matiere }
          else
            format.html { render :new }
            format.json { render json: @matiere.errors, status: :unprocessable_entity }
          end
        end
      end

  # PATCH/PUT /matieres/1
  # PATCH/PUT /matieres/1.json
 def update
   
      if @matiere.update(matiere_params)
        redirect_to @mentor
      else
      render :edit
      end
   
  end

  # DELETE /matieres/1
  # DELETE /matieres/1.json
  def destroy
    @matiere.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Matiere was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matiere
      @matiere = Matiere.find(params[:id])
    end
    def set_mentor
     @mentor = Mentor.find(params[:mentor_id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matiere_params
      params.require(:matiere).permit(:Name, :Presentation, :mentor_id)
    end
end
