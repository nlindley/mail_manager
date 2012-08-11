class AliasesController < ApplicationController
  before_filter :build_domain_alias, only: [:create]
  load_and_authorize_resource

  # GET /aliases
  # GET /aliases.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aliases }
    end
  end

  # GET /aliases/1
  # GET /aliases/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alias }
    end
  end

  # GET /aliases/new
  # GET /aliases/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alias }
    end
  end

  # GET /aliases/1/edit
  def edit
  end

  # POST /aliases
  # POST /aliases.json
  def create
    respond_to do |format|
      if @alias.save
        format.html { redirect_to @alias, notice: 'Alias was successfully created.' }
        format.json { render json: @alias, status: :created, location: @alias }
      else
        format.html { render action: "new" }
        format.json { render json: @alias.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aliases/1
  # PUT /aliases/1.json
  def update
    respond_to do |format|
      if @alias.update_attributes(params[:alias])
        format.html { redirect_to @alias, notice: 'Alias was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @alias.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aliases/1
  # DELETE /aliases/1.json
  def destroy
    @alias.destroy

    respond_to do |format|
      format.html { redirect_to aliases_url }
      format.json { head :no_content }
    end
  end

  private

  def build_domain_alias
    @alias = current_user.domain.aliases.build(params[:alias])
  end
end
