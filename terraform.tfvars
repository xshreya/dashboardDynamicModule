region = "US"

dashboard_details = {
    "0" = {
        name = "shreya_dashboard"
        permissions = "public_read_only" #  private, public_read_only, public_read_write, Defaults to public_read_only.
        page = {
            "0" = {
                name = "MY-DASHBOARD-PAGE-1-BROWSER"

                widget_area = {
                    "0" = {

                        title = "Relicstaurants Browser Monitoring"
                        row = 1
                        column = 1
                        width = 4
                        height = 3
                        ignore_time_range = false
                        y_axis_left_max = 100
                        y_axis_left_min = 0
                        legend_enabled = true
                        # Nested nrql_query blocks allow you to make one or more NRQL queries within a widget, against a specified account.
                        nrql_query = {
                            "0" = {
                                query = "SELECT average(duration) AS 'Page Load Time' FROM PageView WHERE appName = 'relicstaurants' SINCE 1 hour ago TIMESERIES"
                            }
                            "1" = {
                                query = "SELECT count(*) AS 'Error Rate' FROM JavaScriptError WHERE appName = 'relicstaurants' SINCE 1 hour ago TIMESERIES"
                            }
                            "2" = {
                                query = "SELECT count(*) AS 'User Sessions' FROM Session WHERE appName = 'relicstaurants' SINCE 1 hour ago TIMESERIES"
                            }
                        }

                        null_values = {
                            null_value = "zero" # default, preserve, remove, zero
                            series_overrides = { # used to customize null values of individual charts
                                "0" = {
                                    null_value = "zero"
                                    series_name = "Page Load Time"
                                }
                                "1" = {
                                    null_value = "zero"
                                    series_name = "Error Rate"
                                }
                                "2" = {
                                    null_value = "zero"
                                    series_name = "User Sessions"
                                }
                            }
                        }

                        units = { # unit on your Y axis and in each of your series.
                            unit = "seconds"
                            series_overrides = {
                                "0" = {
                                    unit = "seconds"
                                    series_name = "Page Load Time"
                                }
                                "1" =  {
                                    unit = "errors"
                                    series_name = "Error Rate"
                                }
                                "2" = {
                                    unit = "sessions"
                                    series_name = "User Sessions"
                                }
                            }
                        }
                        # A nested block that describes colors of your charts per series.
                        colors = {
                            color = "blue"
                            series_overrides = {
                                "0" = {
                                    color = "blue"
                                    series_name = "Page Load Time"
                                }
                                "1" = {
                                    color = "red"
                                    series_name = "Error Rate"
                                }
                                "2" = {
                                    color = "green"
                                    series_name = "User Sessions"
                                }
                            }
                        }
                    }

                }

                widget_bar = {
                    "0" = {
                        title = "Browser Performance Metrics"
                        row = 1
                        column = 5
                        width = 4
                        height = 3
                        ignore_time_range = false
                        y_axis_left_max = 100
                        y_axis_left_min = 0
                        legend_enabled = true
                        nrql_query = {
                            query = "SELECT count(*) AS 'Page Views' FROM PageView WHERE appName = 'relicstaurants' SINCE 1 day ago TIMESERIES"
                        }
                        null_values = {
                            null_value = "zero" 
                            series_overrides = {
                                null_value = "zero"
                                series_name = "Page Views"
                            }
                            
                        }
                        
                        units = {
                            unit = "count"
                            series_overrides = {
                                unit = "count"
                                series_name = "Page Views"
                            }
                        }
                        
                        colors = {
                            color = "#1f77b4"
                            series_overrides = {
                                color = "#1f77b4"
                                series_name = "Page Views"
                            }
                        }
                    
                        linked_entity_guids = []
                        filter_current_dashboard = true
                    }
                }

                widget_billboard = {
                    "0" = {
                        title = "Key Metrics Overview"
                        row = 1
                        column = 9
                        width = 4
                        height = 3
                        ignore_time_range = false
                        y_axis_left_max = 100
                        y_axis_left_min = 0
                        legend_enabled = true
                        nrql_query = {
                            query = "SELECT average(duration) AS 'Avg Page Load Time' FROM PageView WHERE appName = 'relicstaurants' SINCE 1 day ago"
                        }
                        null_values = {
                            null_value = "zero" # default, preserve, remove, zero
                            series_overrides = {
                                null_value = "zero"
                                series_name = "Avg Page Load Time"
                            }
                        }
                        units = { # unit on your Y axis and in each of your series.
                            unit = "seconds"
                            series_overrides = {
                                unit = "seconds"
                                series_name = "Avg Page Load Time"
                            }
                        }
                        colors = {
                            color = "#1f77b4"
                            series_overrides = {
                                color = "#1f77b4"
                                series_name = "Avg Page Load Time"
                            }
                        }
                    
                        critical = 3.0
                        warning = 2.0
                    }
                }
        
            }

        }
    }   
}