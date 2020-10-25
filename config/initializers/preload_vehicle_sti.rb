autoloader = Rails.autoloaders.main
sti_leaves = %w[user customer financial_planner]

sti_leaves.each do |leaf|
  autoloader.preload("#{ Rails.root }/app/models/#{ leaf }.rb")
end
