### User.find_by(cohort_id: Cohort.all.first.cohort_id)

class CohortController < ApplicationController
  get '/cohort' do
    @cohorts = Cohort.all
    erb :'/cohorts/list'
  end

  get '/cohorts/:cohort_id' do
    @students = User.where(cohort_id: params[:cohort_id])
    erb :'/cohorts/students'
  end
end