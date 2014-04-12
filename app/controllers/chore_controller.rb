class ChoreController < ApplicationController

  before_filter :authorize

  before_action :set_chore, only: [:show, :edit, :update, :destroy]

  def index
    # TODO: single child only right now, will mod to select
    @child = Child.first

    @chores = Chore.where(complete_by: DateUtil.current_week).order(:complete_by)

    @current_earned = @child.current_earned(@chores)
  end


  def undo
    id = params[:id]
    chore = Chore.find(id)

    switch = chore.completed ? false : true
    chore.update(id: id, completed: switch)

    redirect_to root_path
  end


  # GET /chores/1
  # GET /chores/1.json
  def show
  end

  # GET /chores/new
  def new
    @chore = Chore.new
  end

  # GET /chores/1/edit
  def edit
  end

  # POST /chores
  # POST /chores.json
  def create
    @chore = Chore.new(chore_params)

    respond_to do |format|
      if @chore.save
        format.html { redirect_to @chore, notice: 'Chore was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chore }
      else
        format.html { render action: 'new' }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
  def update
    respond_to do |format|
      if @chore.update(chore_params)
        format.html { redirect_to @chore, notice: 'Chore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    @chore.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end


  private

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: "You must first login"
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_chore
      @chore = Chore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chore_params
      params.require(:chore).permit(:name, :complete_by, :completed)
    end


end
