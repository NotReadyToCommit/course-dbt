note: for relevant code, see week2.sqlbook

# Part 1. Models
## What is our user repeat rate?
79.83%

## What are good indicators of a user who will likely purchase again? 
## What about indicators of users who are likely NOT to purchase again? 
## If you had more data, what features would you want to look into to answer this question?
Likely to purchase again:
- Users who stored their payment credentials on site
- Users who created an account rather than checking out as guest
- Users who have bought more than once in the past
- Users who have opted into recurring shipments
- Users who are part of a loyaly/rewards program

Unlikely to purchase again
- Users who have purchased before but have not visited again recently (e.g. within 90 days)
- Users who abandon carts for over 14 days
- Users who requested a refund or chargeback
- Users who canceled their last order
- Users who unsubscribe from emails
- Users who cancel their account

This seems like a simple survey question to throw on the checkout page; 
e.g. 'How likely are you to shop with us again?'

## What are daily page views by product? 
## Daily orders by product?
## What’s getting a lot of traffic, but maybe not converting into purchases?
It looks like we had 100% conversion rate on 2/10 but not on 2/11, so something is wrong here :/

## Explain the product mart models you added. Why did you organize the models in the way you did?
I added a fact table for page_views to monitor product performance over time. how often do people view or purchase something. conversion rate is probably not worth having in this layer and should be in BI tool but why not include it

I opted not to create the optional models because I did not have time this week to fully dig into this project. Hopefully next week my company will be a bit more stable and i can be a better student.

## Use the dbt docs to visualize your model DAGs to ensure the model layers make sense. Paste in an image of your DAG from the docs.
see week2-dbt-dag.png

# Part 2. Tests 
## What assumptions are you making about each model? (i.e. why are you adding each test?)

there are only four event types
- page_view
- add_to_cart
- checkout
- package_shipped

there are only two event types tied to products
- page_view
- add_to_cart

there are only two event types tied to orders
- package_shipped
- checkout


## Did you find any “bad” data as you added and ran tests on your models? 
Nope, we're all good. I am sure there are some other issues in the intermediate tables i would have created for the optional marts

## How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
NA

## Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
Hopefully my orchestration tool is configured to test whenever new runs occur and any failed tests should be alerted to the AE oncall. It's up to the group whether we want to alert business users at this stage or not, but ideally there should be a first line review and reruns for minor errors prior to informing downstream users. if it can't be reconciled, let them know. we should probably have some sort of data quality review and dashboard which monitors uptime, days of failures, SEVs, etc

# Part 3. dbt Snapshots
## Which products had their inventory change from week 1 to week 2?
Pothos;
Philodendron;
Monstera;
String of pearls;