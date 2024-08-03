module "dashboard" {
    source = "./dashboard"

    for_each = var.dashboard_details
    nr_account_id = var.nr_account_id
    nr_api_key = var.nr_api_key
    region = var.region

    providers = {
        newrelic = newrelic
    }
    dashboard_details = each.value
}  