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

  put :one, params: [:q1] do
    puts params
    @user.update(q1: params[:q1])
    redirect url(:questions, :two, id: @user.id)
  end

  get :two do
    render :question_two
  end

  put :two, params: [:q2] do
    @user.update(q2: params[:q2])
    redirect url(:questions, :three, id: @user.id)
  end

  get :three do
    render :question_three
  end

  put :three, params: [:q3] do
    @user.update(q3: params[:q3])
    redirect url(:questions, :four, id: @user.id)
  end

  get :four do
    render :question_four
  end

  put :four, params: [:q4] do
    @user.update(q4: params[:q4])
    redirect url(:questions, :five, id: @user.id)
  end

  get :five do
    render :question_five
  end

  put :five do
    @user.update(q5: params[:q5])
    redirect url(:questions, :result, id: @user.id)
  end

  get :result do
    render :result
  end

  post :result_create do

  end

end
