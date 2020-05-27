# config/stripe/plans.rb 

# This file contains descriptions of all your stripe plans

# Example
# Stripe::Plans::PRIMO #=> 'primo'

Stripe.plan :platinum_plan do |plan|
  # plan name as it will appear on credit card statements
  plan.name = 'platinum_plan'

  # amount in cents.
  plan.amount = 1000000

  # currency to use for the plan (default 'usd')
  plan.currency = 'usd'

  # interval must be either 'day', 'week', 'month' or 'year'
  plan.interval = 'month'

  # only bill once every three months (default 1)
  plan.interval_count = 12

  # number of days before charging customer's card (default 0)
  plan.trial_period_days = 30
end

# Once you have your plans defined, you can run
#
#   rake stripe:prepare
#
# This will export any new plans to stripe.com so that you can
# begin using them in your API calls.
