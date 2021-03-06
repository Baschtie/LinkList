class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    delete_expired
    @links = Link.all.where(:belongs_to => current_user.id.to_i).page(params[:page])
  end

  # GET /links/1
  # GET /links/1.json
  def show
    delete_expired
  end

  # GET /links/new
  def new
    @link = Link.new
    @tags = Tag.all
  end

  # GET /links/1/edit
  def edit
    delete_expired
    @tags = Tag.all
    @selected = @link.tags
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params[:link].merge!(:belongs_to => current_user.id.to_i)
      params.require(:link).permit(:name, :description, :url, :does_expire, :experies_on, :belongs_to, :tags)
    end

    def delete_expired
      expired = Link.all.where(:does_expire => true).where("experies_on < ?", Time.now)
      expired.each do |current|
        if !current.destroy
          alert[:notice] = "There was a problem deleting an expired link, check the logs"
        end
      end
    end
end
