view: rental_performance_2 {
  derived_table: {
    sql: select * from dbt_looker.rental_performance_view  ;;
    persist_for: "24 hours"
  }

# Date and Time
  dimension: metric_time {
    label: "Metric Time"
    description: "Metric time dimension."
    type: date
    group_label: "Date and Time"
  }

# Event Destination
  dimension: state {
    label: "Destination State"
    description: "State of the destination."
    type: string
    sql: ${TABLE}.destination__state ;;
    group_label: "Event Destination"
  }

  dimension: street_address {
    label: "Destination Street Address"
    description: "Street address of the destination."
    type: string
    sql: ${TABLE}.destination__street_address ;;
    group_label: "Event Destination"
  }

  dimension: title_destination {
    label: "Destination Title"
    description: "Title of the destination."
    type: string
    sql: ${TABLE}.destination__title ;;
    group_label: "Event Destination"
  }

  dimension: venue_content_enabled {
    label: "Destination Venue Content Enabled"
    description: "Indicates if venue content is enabled for the destination."
    type: string
    sql: ${TABLE}.destination__venue_content_enabled ;;
    group_label: "Event Destination"
  }

  dimension: zipcode {
    label: "Destination Zipcode"
    description: "Zip code of the destination."
    type: string
    sql: ${TABLE}.destination__zipcode ;;
    group_label: "Event Destination"
  }

  dimension: can_have_events {
    label: "Destination Can Have Events"
    description: "Indicates if the destination can have events."
    type: string
    sql: ${TABLE}.destination__can_have_events ;;
    group_label: "Event Destination"
  }

  dimension: city {
    label: "Destination City"
    description: "City where the destination is located."
    type: string
    sql: ${TABLE}.destination__city ;;
    group_label: "Event Destination"
  }

  dimension: created_destination {
    label: "Destination Created"
    description: "Creation date of the destination."
    type: string
    sql: ${TABLE}.destination__created ;;
    group_label: "Event Destination"
  }

  dimension: default_event_length {
    label: "Destination Default Event Length"
    description: "Default event length for the destination."
    type: string
    sql: ${TABLE}.destination__default_event_length ;;
    group_label: "Event Destination"
  }

  dimension: destination_description {
    label: "Destination Description"
    description: "Description of the destination."
    type: string
    sql: ${TABLE}.destination__destination_description ;;
    group_label: "Event Destination"
  }

  dimension: last_updated_destination {
    label: "Destination Last Updated"
    description: "Last updated date of the destination."
    type: string
    sql: ${TABLE}.destination__last_updated ;;
    group_label: "Event Destination"
  }

# Event
  dimension: rental__event_id {
    label: "Rental Event ID"
    description: "Identifier for the event associated with the rental."
    type: string
    sql: ${TABLE}.rental__event_id ;;
    group_label: "Event"
  }

  dimension: title_event {
    label: "Event Title"
    description: "Title of the event."
    type: string
    sql: ${TABLE}.event__title ;;
    group_label: "Event"
  }

# Canonical Facility
  dimension: canonical_facility_title {
    label: "Canonical Facility Title"
    description: "Title of the canonical facility."
    type: string
    sql: ${TABLE}.canonical_facility__canonical_facility_title ;;
    group_label: "Canonical Facility"
  }

  dimension: facility_currency {
    label: "Canonical Facility Currency"
    description: "Currency used at the canonical facility."
    type: string
    sql: ${TABLE}.canonical_facility__facility_currency ;;
    group_label: "Canonical Facility"
  }

  dimension: is_airport_facility {
    label: "Canonical Facility Is Airport Facility"
    description: "Indicates if the canonical facility is an airport facility."
    type: string
    sql: ${TABLE}.canonical_facility__is_airport_facility ;;
    group_label: "Canonical Facility"
  }

# Facility
  dimension: account_owner {
    label: "Facility Account Owner"
    description: "Account owner of the facility."
    type: string
    sql: ${TABLE}.facility__account_owner ;;
    group_label: "Facility"
  }

  dimension: facility_created_at {
    label: "Facility Created At"
    description: "Creation date of the facility."
    type: string
    sql: ${TABLE}.facility__facility_created_at ;;
    group_label: "Facility"
  }

  dimension: facility_title {
    label: "Facility Title"
    description: "Title of the facility."
    type: string
    sql: ${TABLE}.facility__facility_title ;;
    group_label: "Facility"
  }

  dimension: facility_type {
    label: "Facility Type"
    description: "Type of the facility."
    type: string
    sql: ${TABLE}.facility__facility_type ;;
    group_label: "Facility"
  }

  dimension: default_facility_spaces {
    label: "Default Facility Spaces"
    description: "Default number of spaces at the facility."
    type: string
    sql: ${TABLE}.facility__default_facility_spaces ;;
    group_label: "Facility"
  }

  dimension: external_id_facility {
    label: "Facility External ID"
    description: "External identifier for the facility."
    type: string
    sql: ${TABLE}.facility__external_id ;;
    group_label: "Facility"
  }

# Geography
  dimension: country_name {
    label: "Geography Country Name"
    description: "Country name in the geography."
    type: string
    sql: ${TABLE}.geography__country_name ;;
    group_label: "Geography"
  }

  dimension: county_name {
    label: "Geography County Name"
    description: "County name in the geography."
    type: string
    sql: ${TABLE}.geography__county_name ;;
    group_label: "Geography"
  }

  dimension: geography_id {
    label: "Geography ID"
    description: "Unique identifier for the geography."
    type: string
    sql: ${TABLE}.geography__geography_id ;;
    group_label: "Geography"
  }

  dimension: locality_name {
    label: "Geography Locality Name"
    description: "Locality name in the geography."
    type: string
    sql: ${TABLE}.geography__locality_name ;;
    group_label: "Geography"
  }

  dimension: neighbourhood_name {
    label: "Geography Neighbourhood Name"
    description: "Neighbourhood name in the geography."
    type: string
    sql: ${TABLE}.geography__neighbourhood_name ;;
    group_label: "Geography"
  }

  dimension: region_name {
    label: "Geography Region Name"
    description: "Region name in the geography."
    type: string
    sql: ${TABLE}.geography__region_name ;;
    group_label: "Geography"
  }

  dimension: reporting_market {
    label: "Canonical Facility Reporting Market"
    description: "Reporting market of the canonical facility."
    type: string
    sql: ${TABLE}.canonical_facility__reporting_market ;;
    group_label: "Canonical Facility"
  }

  dimension: reporting_market_top_6_canada {
    label: "Canonical Facility Reporting Market Top 6 Canada"
    description: "Top 6 reporting markets in Canada for the canonical facility."
    type: string
    sql: ${TABLE}.canonical_facility__reporting_market_top_6_canada ;;
    group_label: "Canonical Facility"
  }

  dimension: reporting_market_top_8 {
    label: "Canonical Facility Reporting Market Top 8"
    description: "Top 8 reporting markets for the canonical facility."
    type: string
    sql: ${TABLE}.canonical_facility__reporting_market_top_8 ;;
    group_label: "Canonical Facility"
  }

# Rental
  dimension: rental_id {
    label: "Rental ID"
    description: "Unique identifier for the rental."
    type: string
    sql: ${TABLE}.rental__rental_id ;;
    group_label: "Rental"
  }

  dimension: payment_type_title {
    label: "Rental Payment Type Title"
    description: "Title of the payment type for the rental."
    type: string
    sql: ${TABLE}.rental__payment_type_title ;;
    group_label: "Rental"
  }

  dimension: rental_ends_at_local {
    label: "Rental Ends At Local"
    description: "End date of the rental in local time."
    type: string
    sql: ${TABLE}.rental__rental_ends_at_local ;;
    group_label: "Rental"
  }

  dimension: rental_length_hours {
    label: "Rental Length Hours"
    description: "Length of the rental in hours."
    type: string
    sql: ${TABLE}.rental__rental_length_hours ;;
    group_label: "Rental"
  }

  dimension: rental_length_minutes {
    label: "Rental Length Minutes"
    description: "Length of the rental in minutes."
    type: string
    sql: ${TABLE}.rental__rental_length_minutes ;;
    group_label: "Rental"
  }

  dimension: rental_payment_status {
    label: "Rental Payment Status"
    description: "Payment status of the rental."
    type: string
    sql: ${TABLE}.rental__rental_payment_status ;;
    group_label: "Rental"
  }

  dimension: rental_reservation_status {
    label: "Rental Reservation Status"
    description: "Reservation status of the rental."
    type: string
    sql: ${TABLE}.rental__rental_reservation_status ;;
    group_label: "Rental"
  }

  dimension: rental_rule_type_title {
    label: "Rental Rule Type Title"
    description: "Title of the rule type for the rental."
    type: string
    sql: ${TABLE}.rental__rental_rule_type_title ;;
    group_label: "Rental"
  }

  dimension: rental_segment {
    label: "Rental Segment"
    description: "Segment of the rental."
    type: string
    sql: ${TABLE}.rental__rental_segment ;;
    group_label: "Rental"
  }

  dimension: rental_segment_rollup {
    label: "Rental Segment Rollup"
    description: "Rollup segment of the rental."
    type: string
    sql: ${TABLE}.rental__rental_segment_rollup ;;
    group_label: "Rental"
  }

  dimension: rental_source_title {
    label: "Rental Source Title"
    description: "Title of the rental source."
    type: string
    sql: ${TABLE}.rental__rental_source_title ;;
    group_label: "Rental"
  }

  dimension: rental_created_at_cst_time {
    label: "Rental Created At CST Time"
    description: "Creation time of the rental in CST."
    type: string
    sql: ${TABLE}.rental__rental_created_at_cst_time ;;
    group_label: "Rental"
  }

  dimension: rental_created_at_local_time {
    label: "Rental Created At Local Time"
    description: "Creation time of the rental in local time."
    type: string
    sql: ${TABLE}.rental__rental_created_at_local_time ;;
    group_label: "Rental"
  }

  dimension: rental_starts_at_local_time {
    label: "Rental Starts At Local Time"
    description: "Start time of the rental in local time."
    type: string
    sql: ${TABLE}.rental__rental_starts_at_local_time ;;
    group_label: "Rental"
  }

  dimension: rental_ends_at_local_time {
    label: "Rental Ends At Local Time"
    description: "End time of the rental in local time."
    type: string
    sql: ${TABLE}.rental__rental_ends_at_local_time ;;
    group_label: "Rental"
  }

# Renter
  dimension: renter_id {
    label: "Renter ID"
    description: "Unique identifier for the renter."
    type: string
    sql: ${TABLE}.renter__renter_id ;;
    group_label: "Renter"
  }

  dimension: date_joined {
    label: "Renter Date Joined"
    description: "Date when the renter joined."
    type: string
    sql: ${TABLE}.renter__date_joined ;;
    group_label: "Renter"
  }

  dimension: days_since_first_rental {
    label: "Renter Days Since First Rental"
    description: "Number of days since the renter's first rental."
    type: string
    sql: ${TABLE}.renter__days_since_first_rental ;;
    group_label: "Renter"
  }

  dimension: days_since_last_rental {
    label: "Renter Days Since Last Rental"
    description: "Number of days since the renter's last rental."
    type: string
    sql: ${TABLE}.renter__days_since_last_rental ;;
    group_label: "Renter"
  }

  dimension: email {
    label: "Renter Email"
    description: "Email address of the renter."
    type: string
    sql: ${TABLE}.renter__email ;;
    group_label: "Renter"
  }

  dimension: first_name {
    label: "Renter First Name"
    description: "First name of the renter."
    type: string
    sql: ${TABLE}.renter__first_name ;;
    group_label: "Renter"
  }

  dimension: first_rental_date {
    label: "Renter First Rental Date"
    description: "Date of the renter's first rental."
    type: string
    sql: ${TABLE}.renter__first_rental_date ;;
    group_label: "Renter"
  }

  dimension: first_rental_id {
    label: "Renter First Rental ID"
    description: "ID of the renter's first rental."
    type: string
    sql: ${TABLE}.renter__first_rental_id ;;
    group_label: "Renter"
  }

  dimension: last_name {
    label: "Renter Last Name"
    description: "Last name of the renter."
    type: string
    sql: ${TABLE}.renter__last_name ;;
    group_label: "Renter"
  }

  dimension: last_rental_date {
    label: "Renter Last Rental Date"
    description: "Date of the renter's last rental."
    type: string
    sql: ${TABLE}.renter__last_rental_date ;;
    group_label: "Renter"
  }

  dimension: last_rental_id {
    label: "Renter Last Rental ID"
    description: "ID of the renter's last rental."
    type: string
    sql: ${TABLE}.renter__last_rental_id ;;
    group_label: "Renter"
  }

  dimension: lifetime_rentals {
    label: "Renter Lifetime Rentals"
    description: "Total lifetime rentals of the renter."
    type: string
    sql: ${TABLE}.renter__lifetime_rentals ;;
    group_label: "Renter"
  }

  dimension: lifetime_value {
    label: "Renter Lifetime Value"
    description: "Total lifetime value of the renter."
    type: string
    sql: ${TABLE}.renter__lifetime_value ;;
    group_label: "Renter"
  }

  dimension: phone_number {
    label: "Renter Phone Number"
    description: "Phone number of the renter."
    type: string
    sql: ${TABLE}.renter__phone_number ;;
    group_label: "Renter"
  }



}
