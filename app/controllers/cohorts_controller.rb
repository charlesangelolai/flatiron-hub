### User.find_by(cohort_id: Cohort.all.first.cohort_id)

class CohortsController < ApplicationController
  get '/cohorts' do
    @cohorts = Cohort.all
    erb :'/cohorts/list'
  end

  get '/cohorts/:cohort_name' do
    find_cohort
    redirect_if_cohort_not_found
    find_students
    erb :'/cohorts/students'
  end

  private

  def find_cohort
    @cohort = Cohort.find_by(name: params[:cohort_name])
  end

  def find_students
    @students = find_cohort.users
  end
  
  def redirect_if_cohort_not_found
    unless @cohort
      flash[:errors] = ["Cohort not found."]
      redirect "/cohorts"
    end
  end
end