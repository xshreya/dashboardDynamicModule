resource "newrelic_one_dashboard" "shreya-dash" {
    name = var.dashboard_details.name
    permissions =  var.dashboard_details.permissions 

    # In addition to all arguments above, the following attributes are exported:
    # 1. guid - The unique entity identifier of the dashboard in New Relic.
    # 2. permalink - The URL for viewing the dashboard.

    dynamic "page" { 
        for_each = var.dashboard_details.page
        content {
            name = page.value.name
            
            dynamic "widget_area" {
                # for_each = page.value.widget_area != null ? page.value.widget_area : []
                for_each = try(page.value.widget_area, {})
                content {
                  
                    title             = widget_area.value.title
                    row               = widget_area.value.row
                    column            = widget_area.value.column
                    width             = widget_area.value.width
                    height            = widget_area.value.height
                    ignore_time_range = widget_area.value.ignore_time_range
                    y_axis_left_max = widget_area.value.y_axis_left_max  
                    y_axis_left_min = widget_area.value.y_axis_left_min 
                    legend_enabled = widget_area.value.legend_enabled 

                    dynamic "nrql_query" {
                        for_each = widget_area.value.nrql_query
                        content {
                            query = nrql_query.value.query
                        }
                    }

                    null_values {
                        null_value = widget_area.value.null_values.null_value
                        dynamic "series_overrides" {
                            for_each = widget_area.value.null_values.series_overrides
                            content {
                                null_value  = series_overrides.value.null_value
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    units {
                        unit = widget_area.value.units.unit
                        dynamic "series_overrides" {
                            for_each = widget_area.value.units.series_overrides
                            content {
                                unit        = series_overrides.value.unit
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    colors {
                        color = widget_area.value.colors.color
                        dynamic "series_overrides" {
                            for_each = widget_area.value.colors.series_overrides
                            content {
                                color       = series_overrides.value.color
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }
                }
            }

            dynamic "widget_bar" {
                for_each = try(page.value.widget_bar, {})
                content {
                    title             = widget_bar.value.title
                    row               = widget_bar.value.row
                    column            = widget_bar.value.column
                    width             = widget_bar.value.width
                    height            = widget_bar.value.height
                    ignore_time_range = widget_bar.value.ignore_time_range
                    y_axis_left_max = widget_bar.value.y_axis_left_max  
                    y_axis_left_min = widget_bar.value.y_axis_left_min 
                    legend_enabled = widget_bar.value.legend_enabled 

                    nrql_query {
                        query = widget_bar.value.nrql_query.query
                    }

                    null_values {
                        null_value = widget_bar.value.null_values.null_value
                        series_overrides {
                            null_value  = widget_bar.value.null_values.series_overrides.null_value
                            series_name = widget_bar.value.null_values.series_overrides.series_name
                        }
                    }

                    units {
                        unit = widget_bar.value.units.unit
                        series_overrides {
                            unit        = widget_bar.value.units.series_overrides.unit
                            series_name = widget_bar.value.units.series_overrides.series_name
                        }
                    }

                    colors {
                        color = widget_bar.value.colors.color
                        series_overrides {
                            color       = widget_bar.value.colors.series_overrides.color
                            series_name = widget_bar.value.colors.series_overrides.series_name
                        }
                    }

                    linked_entity_guids = widget_bar.value.linked_entity_guids
                    filter_current_dashboard = widget_bar.value.filter_current_dashboard
                }
            }

            dynamic "widget_billboard" {
                for_each = try(page.value.widget_billboard, {})
                content {
                    title             = widget_billboard.value.title
                    row               = widget_billboard.value.row
                    column            = widget_billboard.value.column
                    width             = widget_billboard.value.width
                    height            = widget_billboard.value.height
                    ignore_time_range = widget_billboard.value.ignore_time_range
                    y_axis_left_max = widget_billboard.value.y_axis_left_max  
                    y_axis_left_min = widget_billboard.value.y_axis_left_min 
                    legend_enabled = widget_billboard.value.legend_enabled 

                    nrql_query {
                        query = widget_billboard.value.nrql_query.query
                    }

                    null_values {
                        null_value = widget_billboard.value.null_values.null_value
                        series_overrides {
                            null_value  =  widget_billboard.value.null_values.series_overrides.null_value
                            series_name =  widget_billboard.value.null_values.series_overrides.series_name
                        }
                    }

                    units {
                        unit = widget_billboard.value.units.unit
                        series_overrides {
                            unit        = widget_billboard.value.units.series_overrides.unit
                            series_name = widget_billboard.value.units.series_overrides.series_name
                        }
                    }

                    colors {
                        color = widget_billboard.value.colors.color
                        series_overrides {
                            color       = widget_billboard.value.colors.series_overrides.color
                            series_name = widget_billboard.value.colors.series_overrides.series_name
                        }
                    }

                    critical = widget_billboard.value.critical
                    warning = widget_billboard.value.warning

                }
            }

            dynamic "widget_bullet" {
                for_each = try(page.value.widget_bullet, {})
                content {
                    title             = widget_bullet.value.title
                    row               = widget_bullet.value.row
                    column            = widget_bullet.value.column
                    width             = widget_bullet.value.width
                    height            = widget_bullet.value.height
                    ignore_time_range = widget_bullet.value.ignore_time_range
                    y_axis_left_max = widget_bullet.value.y_axis_left_max  
                    y_axis_left_min = widget_bullet.value.y_axis_left_min 
                    legend_enabled = widget_bullet.value.legend_enabled 

                    dynamic "nrql_query" {
                        for_each = widget_bullet.value.nrql_query
                        content {
                            query = nrql_query.value.query
                        }
                    }

                    null_values {
                        null_value = widget_bullet.value.null_values.null_value
                        dynamic "series_overrides" {
                            for_each = widget_bullet.value.null_values.series_overrides
                            content {
                                null_value  = series_overrides.value.null_value
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    units {
                        unit = widget_bullet.value.units.unit
                        dynamic "series_overrides" {
                            for_each = widget_bullet.value.units.series_overrides
                            content {
                                unit        = series_overrides.value.unit
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    colors {
                        color = widget_bullet.value.colors.color
                        dynamic "series_overrides" {
                            for_each = widget_bullet.value.colors.series_overrides
                            content {
                                color       = series_overrides.value.color
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    limit = widget_bullet.value.limit
                }
            }

            dynamic "widget_funnel" {
                for_each = try(page.value.widget_funnel, {})
                content {
                  
                    title             = widget_funnel.value.title
                    row               = widget_funnel.value.row
                    column            = widget_funnel.value.column
                    width             = widget_funnel.value.width
                    height            = widget_funnel.value.height
                    ignore_time_range = widget_funnel.value.ignore_time_range
                    y_axis_left_max = widget_funnel.value.y_axis_left_max  
                    y_axis_left_min = widget_funnel.value.y_axis_left_min 
                    legend_enabled = widget_funnel.value.legend_enabled 

                    dynamic "nrql_query" {
                        for_each = widget_funnel.value.nrql_query
                        content {
                            query = nrql_query.value.query
                        }
                    }

                    null_values {
                        null_value = widget_funnel.value.null_values.null_value
                        dynamic "series_overrides" {
                            for_each = widget_funnel.value.null_values.series_overrides
                            content {
                                null_value  = series_overrides.value.null_value
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    units {
                        unit = widget_funnel.value.units.unit
                        dynamic "series_overrides" {
                            for_each = widget_funnel.value.units.series_overrides
                            content {
                                unit        = series_overrides.value.unit
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    colors {
                        color = widget_funnel.value.colors.color
                        dynamic "series_overrides" {
                            for_each = widget_funnel.value.colors.series_overrides
                            content {
                                color       = series_overrides.value.color
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }
                }
            }

            dynamic "widget_json" {
                for_each = try(page.value.widget_json, {})
                content {
                  
                    title             = widget_json.value.title
                    row               = widget_json.value.row
                    column            = widget_json.value.column
                    width             = widget_json.value.width
                    height            = widget_json.value.height
                    ignore_time_range = widget_json.value.ignore_time_range
                    y_axis_left_max = widget_json.value.y_axis_left_max  
                    y_axis_left_min = widget_json.value.y_axis_left_min 
                    legend_enabled = widget_json.value.legend_enabled 

                    dynamic "nrql_query" {
                        for_each = widget_json.value.nrql_query
                        content {
                            query = nrql_query.value.query
                        }
                    }

                    null_values {
                        null_value = widget_json.value.null_values.null_value
                        dynamic "series_overrides" {
                            for_each = widget_json.value.null_values.series_overrides
                            content {
                                null_value  = series_overrides.value.null_value
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    units {
                        unit = widget_json.value.units.unit
                        dynamic "series_overrides" {
                            for_each = widget_json.value.units.series_overrides
                            content {
                                unit        = series_overrides.value.unit
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    colors {
                        color = widget_json.value.colors.color
                        dynamic "series_overrides" {
                            for_each = widget_json.value.colors.series_overrides
                            content {
                                color       = series_overrides.value.color
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }
                }
            }

            dynamic "widget_heatmap" {
                for_each = try(page.value.widget_heatmap, {})
                content {
                  
                    title             = widget_heatmap.value.title
                    row               = widget_heatmap.value.row
                    column            = widget_heatmap.value.column
                    width             = widget_heatmap.value.width
                    height            = widget_heatmap.value.height
                    ignore_time_range = widget_heatmap.value.ignore_time_range
                    y_axis_left_max = widget_heatmap.value.y_axis_left_max  
                    y_axis_left_min = widget_heatmap.value.y_axis_left_min 
                    legend_enabled = widget_heatmap.value.legend_enabled 

                    nrql_query {
                        query = nrql_query.value.query
                    }

                    null_values {
                        null_value = widget_heatmap.value.null_values.null_value
                        series_overrides {
                            null_value  = widget_heatmap.value.null_values.series_overrides.null_value
                            series_name = widget_heatmap.value.null_values.series_overrides.series_name
                        }
                    }

                    units {
                        unit = widget_heatmap.value.units.unit
                        series_overrides {
                                unit        = widget_heatmap.value.units.series_overrides.unit
                                series_name = widget_heatmap.value.units.series_overrides.series_name
                        }
                    }

                    colors {
                        color = widget_heatmap.value.colors.color
                        series_overrides {
                            color       = widget_heatmap.value.colors.series_overrides.color
                            series_name = widget_heatmap.value.colors.series_overrides.series_name
                        }
                    }
                    
                    linked_entity_guids = widget_heatmap.value.linked_entity_guids
                    filter_current_dashboard = widget_heatmap.value.filter_current_dashboard
                }
            }

            dynamic "widget_histogram" {
                for_each = try(page.value.widget_histogram, {})
                content {
                  
                    title             = widget_histogram.value.title
                    row               = widget_histogram.value.row
                    column            = widget_histogram.value.column
                    width             = widget_histogram.value.width
                    height            = widget_histogram.value.height
                    ignore_time_range = widget_histogram.value.ignore_time_range
                    y_axis_left_max = widget_histogram.value.y_axis_left_max  
                    y_axis_left_min = widget_histogram.value.y_axis_left_min 
                    legend_enabled = widget_histogram.value.legend_enabled 

                    dynamic "nrql_query" {
                        for_each = widget_histogram.value.nrql_query
                        content {
                            query = nrql_query.value.query
                        }
                    }

                    null_values {
                        null_value = widget_histogram.value.null_values.null_value
                        dynamic "series_overrides" {
                            for_each = widget_histogram.value.null_values.series_overrides
                            content {
                                null_value  = series_overrides.value.null_value
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    units {
                        unit = widget_histogram.value.units.unit
                        dynamic "series_overrides" {
                            for_each = widget_histogram.value.units.series_overrides
                            content {
                                unit        = series_overrides.value.unit
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    colors {
                        color = widget_histogram.value.colors.color
                        dynamic "series_overrides" {
                            for_each = widget_histogram.value.colors.series_overrides
                            content {
                                color       = series_overrides.value.color
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }
                }
            }

            dynamic "widget_line" {
                for_each = try(page.value.widget_line, {})
                content {
                  
                    title             = widget_line.value.title
                    row               = widget_line.value.row
                    column            = widget_line.value.column
                    width             = widget_line.value.width
                    height            = widget_line.value.height
                    ignore_time_range = widget_line.value.ignore_time_range
                    y_axis_left_max = widget_line.value.y_axis_left_max  
                    y_axis_left_min = widget_line.value.y_axis_left_min 
                    legend_enabled = widget_line.value.legend_enabled 

                    nrql_query {
                        query = widget_line.value.nrql_query.query
                    }

                    null_values {
                        null_value = widget_line.value.null_values.null_value
                        series_overrides {
                            null_value  = widget_line.value.null_values.series_overrides.null_value
                            series_name = widget_line.value.null_values.series_overrides.series_name
                        }
                    }

                    units {
                        unit = widget_line.value.units.unit
                        series_overrides {
                            unit        = widget_line.value.units.series_overrides.unit
                            series_name = widget_line.value.units.series_overrides.series_name
                        }
                    }

                    colors {
                        color = widget_line.value.colors.color
                        series_overrides {
                            color       = widget_line.value.colors.series_overrides.color
                            series_name = widget_line.value.colors.series_overrides.series_name
                        }
                    }

                    y_axis_left_zero = widget_line.value.y_axis_left_zero
                
                    y_axis_right {
                        y_axis_right_max = widget_line.value.y_axis_right.y_axis_right_max
                        y_axis_right_min = widget_line.value.y_axis_right.y_axis_right_min
                        y_axis_right_series = widget_line.value.y_axis_right.y_axis_right_series
                        y_axis_right_zero = widget_line.value.y_axis_right.y_axis_right_zero
                    }
                    
                    threshold {
                        name = widget_line.value.threshold.name
                        from = widget_line.value.threshold.from
                        to = widget_line.value.threshold.to
                        severity = widget_line.threshold.value.severity
                    }
                    
                    is_label_visible = widget_line.value.is_label_visible
                }
            }

            dynamic "widget_markdown" {
                for_each = try(page.value.widget_markdown, {})
                content {
                  
                    title             = widget_markdown.value.title
                    row               = widget_markdown.value.row
                    column            = widget_markdown.value.column
                    width             = widget_markdown.value.width
                    height            = widget_markdown.value.height
                    ignore_time_range = widget_markdown.value.ignore_time_range
                    y_axis_left_max = widget_markdown.value.y_axis_left_max  
                    y_axis_left_min = widget_markdown.value.y_axis_left_min 
                    legend_enabled = widget_markdown.value.legend_enabled 

                    text = widget_markdown.value.text

                    null_values {
                        null_value = widget_markdown.value.null_values.null_value
                        series_overrides {
                            null_value  = widget_line.value.null_values.series_overrides.null_value
                            series_name = widget_line.value.null_values.series_overrides.series_name
                        }
                    }

                    units {
                        unit = widget_markdown.value.units.unit
                        series_overrides {
                            unit        = widget_line.value.units.series_overrides.unit
                            series_name = widget_line.value.units.series_overrides.series_name
                        }
                    }

                    colors {
                        color = widget_markdown.value.colors.color
                        series_overrides {
                            color       = widget_markdown.value.colors.series_overrides.color
                            series_name = widget_markdown.value.colors.series_overrides.series_name
                        }
                    }
                }
            }

            dynamic "widget_stacked_bar" {
                for_each = try(page.value.widget_stacked_bar, {})
                content {
                  
                    title             = widget_stacked_bar.value.title
                    row               = widget_stacked_bar.value.row
                    column            = widget_stacked_bar.value.column
                    width             = widget_stacked_bar.value.width
                    height            = widget_stacked_bar.value.height
                    ignore_time_range = widget_stacked_bar.value.ignore_time_range
                    y_axis_left_max = widget_stacked_bar.value.y_axis_left_max  
                    y_axis_left_min = widget_stacked_bar.value.y_axis_left_min 
                    legend_enabled = widget_stacked_bar.value.legend_enabled 

                    dynamic "nrql_query" {
                        for_each = widget_stacked_bar.value.nrql_query
                        content {
                            query = nrql_query.value.query
                        }
                    }

                    null_values {
                        null_value = widget_stacked_bar.value.null_values.null_value
                        dynamic "series_overrides" {
                            for_each = widget_stacked_bar.value.null_values.series_overrides
                            content {
                                null_value  = series_overrides.value.null_value
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    units {
                        unit = widget_stacked_bar.value.units.unit
                        dynamic "series_overrides" {
                            for_each = widget_stacked_bar.value.units.series_overrides
                            content {
                                unit        = series_overrides.value.unit
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }

                    colors {
                        color = widget_stacked_bar.value.colors.color
                        dynamic "series_overrides" {
                            for_each = widget_stacked_bar.value.colors.series_overrides
                            content {
                                color       = series_overrides.value.color
                                series_name = series_overrides.value.series_name
                            }
                        }
                    }
                }
            }

            dynamic "widget_pie" {
                for_each = try(page.value.widget_pie, {})
                content {
                    title             = widget_pie.value.title
                    row               = widget_pie.value.row
                    column            = widget_pie.value.column
                    width             = widget_pie.value.width
                    height            = widget_pie.value.height
                    ignore_time_range = widget_pie.value.ignore_time_range
                    y_axis_left_max = widget_pie.value.y_axis_left_max  
                    y_axis_left_min = widget_pie.value.y_axis_left_min 
                    legend_enabled = widget_pie.value.legend_enabled 

                    nrql_query {
                        query = widget_pie.value.nrql_query.value.query
                    }

                    null_values {
                        null_value = widget_pie.value.null_values.null_value
                        series_overrides {
                            null_value  = widget_pie.value.null_values.series_overrides.value.null_value
                            series_name = widget_pie.value.null_values.series_overrides.value.series_name
                        }
                    }

                    units {
                        unit = widget_pie.value.units.unit
                        series_overrides {
                            unit        = widget_pie.value.units.series_overrides.unit
                            series_name = widget_pie.value.units.series_overrides.series_name
                        }
                    }

                    colors {
                        color = widget_pie.value.colors.color
                        series_overrides {
                            color       = widget_pie.value.colors.series_overrides.value.color
                            series_name = widget_pie.value.colors.series_overrides.value.series_name
                        }
                    }

                    linked_entity_guids = widget_pie.value.linked_entity_guids
                    filter_current_dashboard = widget_pie.value.filter_current_dashboard
                }
            }

            dynamic "widget_log_table" {
                for_each = try(page.value.widget_log_table, {})
                content {
                  
                    title             = widget_log_table.value.title
                    row               = widget_log_table.value.row
                    column            = widget_log_table.value.column
                    width             = widget_log_table.value.width
                    height            = widget_log_table.value.height
                    ignore_time_range = widget_log_table.value.ignore_time_range
                    y_axis_left_max = widget_log_table.value.y_axis_left_max  
                    y_axis_left_min = widget_log_table.value.y_axis_left_min 
                    legend_enabled = widget_log_table.value.legend_enabled 

                    nrql_query {
                        query = nrql_query.value.query
                    }

                    null_values {
                        null_value = widget_log_table.value.null_values.null_value
                        series_overrides {
                            null_value  = widget_log_table.value.null_values.series_overrides.null_value
                            series_name = widget_log_table.value.null_values.series_overrides.series_name
                        }
                    }

                    units {
                        unit = widget_log_table.value.units.unit
                        series_overrides {
                            unit        = widget_log_table.value.units.series_overrides.unit
                            series_name = widget_log_table.value.units.series_overrides.series_name
                        }
                    }

                    colors {
                        color = widget_log_table.value.colors.color
                        series_overrides {
                            color       = widget_log_table.value.colors.series_overrides.color
                            series_name = widget_log_table.value.colors.series_overrides.series_name
                        }
                    }
                }
            }

            dynamic "widget_table" {
                for_each = try(page.value.widget_table, {})
                content {
                    title             = widget_table.value.title
                    row               = widget_table.value.row
                    column            = widget_table.value.column
                    width             = widget_table.value.width
                    height            = widget_table.value.height
                    ignore_time_range = widget_table.value.ignore_time_range
                    y_axis_left_max = widget_table.value.y_axis_left_max  
                    y_axis_left_min = widget_table.value.y_axis_left_min 
                    legend_enabled = widget_table.value.legend_enabled 

                    nrql_query {
                        query = widget_table.value.nrql_query.query
                    }

                    null_values {
                        null_value = widget_table.value.null_values.null_value
                        series_overrides {
                            null_value  =  widget_table.value.null_values.series_overrides.null_value
                            series_name =  widget_table.value.null_values.series_overrides.series_name
                        }
                    }

                    units {
                        unit = widget_table.value.units.unit
                        series_overrides {
                            unit        = widget_table.value.units.series_overrides.unit
                            series_name = widget_table.value.units.series_overrides.series_name
                        }
                    }

                    colors {
                        color = widget_table.value.colors.color
                        series_overrides {
                            color       = widget_table.value.colors.series_overrides.color
                            series_name = widget_table.value.colors.series_overrides.series_name
                        }
                    }

                    linked_entity_guids = widget_table.value.linked_entity_guids
                    filter_current_dashboard = widget_table.value.filter_current_dashboard

                    threshold {
                        column_name = widget_table.value.threshold.column_name
                        from        = widget_table.value.threshold.from       
                        to          = widget_table.value.threshold.to         
                        severity    = widget_table.value.threshold.severity   
                    }

                }
            }

        }
    }

    # variable {
    #     name            = "transaction_name"
    #     default_values  = ["*"] # ["*"] selects all values as default
    #     is_multi_selection = true
    #     item {
    #         title = "All Transactions"
    #         value = "*"
    #     }
    #     nrql_query {
    #         query = "SELECT uniques(city) FROM PageAction WHERE appName = 'relicstaurants'"
    #     }
    #     replacement_strategy = "string" # default, identifier, number, or string
    #     title              = "Transaction Name"
    #     type               = "nrql"
    #     options {
    #         ignore_time_range = false
    #     }
    # }
}