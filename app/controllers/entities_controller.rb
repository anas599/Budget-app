class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]
  def index
    @entities = Entity.where(user_id: current_user.id)
  end

  def show; end

  def new
    @entity = Entity.new
  end

  def edit; end

  def create
    @entity = Entity.new(entity_params)

    respond_to do |format|
      if @entity.save
        EntityGroup.new(group_id: @entity.group_id, entity_id: @entity.id).save

        format.html { redirect_to group_url(@entity.group_id), notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, :user_id, :group_id)
  end
end
