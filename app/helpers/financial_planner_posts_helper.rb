module FinancialPlannerPostsHelper
  def not_appoint?(post)
    post.financial_planner.appointments.appointed_by_customer(current_customer).empty?
  end
end
