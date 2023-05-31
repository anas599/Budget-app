class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  def index
    @groups = Group.where(user_id: current_user)
  end

  def show; end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to root_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity_group = EntityGroup.find_by(group_id: @group.id) # Use find_by instead of where to fetch a single record
    @entity_group.destroy if @entity_group.present? # Only destroy if the record exists

    @entities = Entity.where(group_id: @group.id)
    @entities.destroy_all if @entities.present? # Only destroy if records exist

    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:icon, :id, :user_id, :name)
  end
end
