class GroupsController < ApplicationController
  load_and_authorize_resource
  # skip_authorize_resource :only => [:join_group, :leave_group]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy

  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    @group.created_by_id = current_user.id
    @group.group_admins << GroupAdmin.new(user_id: current_user.id, admin_level: "standard")
    current_user.add_role "group_admin"
    # current_user ? @activity.created_by_id = current_user.id : @activity.created_by_id = AdminUser.first.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    # current_user ? @activity.created_by_id = current_user.id : @activity.created_by_id = AdminUser.first.id

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def join_group
    @group = Group.find(params[:id])
    current_user.groups << @group

    respond_to do |format|
      if current_user.save
        format.html { redirect_to @group, notice: "Successfully joined #{@group.name}." }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { redirect_to @group, notice: 'Failed to join #{@group.name}.' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def leave_group
    @user = User.find(params[:user])
    @group = Group.find(params[:id])
    @user.groups.delete(@group)

    respond_to do |format|
      if current_user.save
        format.html { redirect_to @group, notice: "Left group #{@group.name}." }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { redirect_to @group, notice: 'Failed to leave group #{@group.name}.' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_admin
    @user = User.find(params[:user])
    @group = Group.find(params[:id])
    @group.group_admins << GroupAdmin.new(user_id: @user.id, admin_level: "standard")
    @user.add_role "group_admin"

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: "Successfully Promoted to Admin." }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { redirect_to @group, notice: 'Failed to Promote to Admin.' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

end
