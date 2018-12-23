class WelcomeController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    @recently_created_goals = Goal.most_recently_created(5)
  end
end
