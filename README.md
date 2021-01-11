# DEV.to View Count

This project was created for the DEV.to Digital Ocean Hackathon: https://dev.to/devteam/announcing-the-digitalocean-app-platform-hackathon-on-dev-2i1k

It is a Rails app that tracks your DEV.to Article stats, and can create graphs of your views and commnets over time!

## Deploying To Digital Ocean

[![Deploy to DO](https://www.deploytodo.com/do-btn-blue.svg)](https://cloud.digitalocean.com/apps/new?repo=https://github.com/coreyja/devto-view-count-graphs/tree/main)

Click the button above to get started! Currently Digital Ocean only supports specifying a single service via the template. So this will create a web service and the required DB.
You will need to add a `worker` service to run the DelayedJobs. The template file at `.do/deploy.template.yaml` does have a workers section already filled out, both for reference and
in case Digital Ocean supports those in the future!

### Choosing ENV Vars

Required:
 - `DEV_TO_AUTH_TOKEN`: Your dev.to API Token from https://dev.to/settings/account

Optional (These can be removed from the wizard is desired):
 - `BASIC_AUTH_USERNAME`: If this and the follow are provided, the site will ONLY be available over HTTP Basic Auth
 - `BASIC_AUTH_PASSWORD`: If this and the above are provided, the site will ONLY be available over HTTP Basic Auth
 - `RAILS_SENTRY_DSN`: The URL to send errors to Sentry

### Post Deploy Setup

After getting the app deployed you will need to kick off the first DelayedJob to start fetching stats every 10 minutes.
This first job will enqueue the next one to run, so this is only needed once during initial setup.
The second job here will fetch your user information from the DEV.to API, including the profile picture

In a rail console (`bundle exec rails console`) run the following command:
```
Delayed::Job.enqueue FetchAllMyArticlesJob.new
Delayed::Job.enqueue FetchUserDetailsJob
```
