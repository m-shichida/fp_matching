module FinancialPlannerPostsHelper
  def current_customer_not_appoint?(post)
    current_customer && post.financial_planner.appointments.appointed_by_customer(current_customer).empty?
  end
end
