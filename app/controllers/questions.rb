Leadgen::App.controllers :questions do
  before :except => :index do
    @user = User.find(params[:id])
  end

  get :index do
    render :index
  end

  post :index, params: [:name] do
    @user = User.new(params)
    return redirect url(:questions, :one, id: @user.id) if @user.save
  end

  get :one do
    render :question_one
  end

  put :one do
    puts params
    @user.update(q1: params[:q1])
    redirect url(:questions, :two, id: @user.id)
  end

  get :two do
    render :question_two
  end

  post :two do
    @user = User.find_by(params[:id])
    @user.update(params[:q2])
  end

  get :three do
    @user = User.find_by(params[:id])
  end

  post :three do
    @user = User.find_by(params[:id])
    @user.update(params[:q3])
  end

  get :four do
    @user = User.find_by(params[:id])
  end

  post :four do
    @user = User.find_by(params[:id])
    @user.update(params[:q4])
  end

  get :five do
    @user = User.find_by(params[:id])
  end

  post :five do
    @user = User.find_by(params[:id])
    @user.update(params[:q5])
  end

  get :result do
    @user = User.find_by(params[:id])
  end

  post :result_create do

  end

end
