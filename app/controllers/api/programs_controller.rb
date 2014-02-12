class Api::ProgramsController < Api::BaseController
  def index
    @programs = Program.all
    @activities = Activity.all
    respond_with @activities
  end

  def show
    respond_with :api, Program.find(params[:id])
  end

  def create
    respond_with :api, Program.create(params[:program])
  end

  def update
    respond_with :api, Program.update(params[:id], params[:program])
  end

  def destroy
    respond_with :api, Program.destroy(params[:id])
  end
end
