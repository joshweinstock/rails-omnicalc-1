class ZebraController < ApplicationController

  def home
    render({:template=>"template_views/home"})
  end

  def square_new
    render({:template=>"template_views/square_new"})
  end

  def square_results
    @number = params.fetch("number").to_f
    @square = @number ** 2
    render({:template=>"template_views/square_results"})
  end

  def square_root_new
    render({:template=>"template_views/square_root_new"})
  end

  def square_root_results
    @number=params.fetch("number").to_f
    @square_root=@number ** 0.5
    render({:template=>"template_views/square_root_results"})
  end

  def payment_new
    render({:template=>"template_views/payment_new"})
  end

  def payment_results
    @years = params.fetch("years_input").to_f
    @apr = params.fetch("apr_input").to_f
    @principal = params.fetch("principal_input").to_f
    @apr_rate = (@apr/100)/12
    @monthly = @years *12
    @payment = ( @apr_rate * @principal )/(1-(1+ @apr_rate )**- @monthly )
    @user_apr = @apr_rate.to_fs(:percentage, {:precision=>4})
    @user_payment = @payment.to_fs(:currency)
    @user_principal = @principal.to_fs(:currency)
    render({:template=>"template_views/payment_results"})
  end

  def random_new
    render({:template=>"template_views/random_new"})
  end

  def random_results
    @min_input = params.fetch("user_min").to_f
    @max_input = params.fetch("user_max").to_f
    @rand_num = rand(@min_input..@max_input)
    render({:template=>"template_views/random_results"})
  end

end
