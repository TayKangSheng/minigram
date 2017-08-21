class GramsController < ApplicationController
  before_action :set_gram, only: [:show, :edit, :update, :destroy]

  # GET /grams
  # GET /grams.json
  def index

    if current_user
      @grams = current_user.grams.page(params[:page]).per(2)
    else
      @grams = Gram.page(params[:page]).per(2)
    end
  end

  # GET /grams/1
  # GET /grams/1.json
  def show
  end

  # GET /grams/new
  def new
    unless current_user
      flash[:error] = "You need to log in before creating a new gram."
      redirect_to grams_path
    end

    @gram = Gram.new
  end

  # GET /grams/1/edit
  def edit
  end

  # POST /grams
  # POST /grams.json
  def create
    @current_user = current_user

    # user1 = Users.find(1)
    # user1.grams
    # user1.grams.create

    @gram = @current_user.grams.new(gram_params)

    respond_to do |format|
      if @gram.save
        format.html { redirect_to @gram, notice: 'Gram was successfully created.' }
        format.json { render :show, status: :created, location: @gram }
      else
        format.html { render :new }
        format.json { render json: @gram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grams/1
  # PATCH/PUT /grams/1.json
  def update
    respond_to do |format|
      if @gram.update(gram_params)
        format.html { redirect_to @gram, notice: 'Gram was successfully updated.' }
        format.json { render :show, status: :ok, location: @gram }
      else
        format.html { render :edit }
        format.json { render json: @gram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grams/1
  # DELETE /grams/1.json
  def destroy
    @gram.destroy
    respond_to do |format|
      format.html { redirect_to grams_url, notice: 'Gram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def custom

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gram
      @gram = Gram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gram_params
      # params.fetch(:gram, {})
      params.require(:gram).permit(:title, :content, :location, :country_code, :image_url)
    end
end
