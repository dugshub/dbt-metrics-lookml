metrics = {
    "metrics": [
        {
            "name": "gov_local",
            "label": "Gov Local",
            "description": "The sum of checkout price including all fees. This only accounts rentals with 'payment_status' = 'success' and 'reservation_status' = 'valid'"
        },
        {
            "name": "remittable_fee_revenue_local",
            "label": "Remittable Fee Revenue Local",
            "description": "The sum of fees collected that are included in the Display Price. This only accounts rentals with 'payment_status' = 'success' and 'reservation_status' = 'valid'.  Note: This metric is included within the GMV metric. If this is selected alongside GMV  you will be double counting revenue.      "
        },
        {
            "name": "rental_remit_local",
            "label": "Rental Remit Local",
            "description": "The total value remitted to the operator from valid rentals."
        },
        {
            "name": "count_of_rentals_sold",
            "label": "Count Of Rentals Sold",
            "description": "Count of rentals created where payment status is 'success' and reservation status is 'valid'."
        },
        {
            "name": "count_of_rentals_ending",
            "label": "Count Of Rentals Ending",
            "description": "Count of rentals ending where payment status is 'success' and reservation status is 'valid'."
        },
        {
            "name": "count_of_rentals_starting",
            "label": "Count Of Rentals Starting",
            "description": "Count of rentals starting where payment status is 'success' and reservation status is 'valid'."
        },
        {
            "name": "facilities_with_rental_sold",
            "label": "Facilities With Rental Sold",
            "description": "Distinct count of facilities with a rental sold where payment status is 'success' and reservation status is 'valid'."
        },
        {
            "name": "facilities_with_rentals_ending",
            "label": "Facilities With Rentals Ending",
            "description": "Distinct count of facilities with rentals ending where payment status is 'success' and reservation status is 'valid'."
        },
        {
            "name": "facilities_with_rentals_starting",
            "label": "Facilities With Rentals Starting",
            "description": "Distinct count of facilities with rentals starting where payment status is 'success' and reservation status is 'valid'."
        },
        {
            "name": "renters_with_a_purchase",
            "label": "Renters With A Purchase",
            "description": "Distinct count of renters with a purchase where payment status is 'success' and reservation status is 'valid'."
        },
        {
            "name": "renters_with_rentals_ending",
            "label": "Renters With Rentals Ending",
            "description": "Distinct count of renters with rentals ending where payment status is 'success' and reservation status is 'valid'."
        },
        {
            "name": "renters_with_rentals_starting",
            "label": "Renters With Rentals Starting",
            "description": "Distinct count of renters with rentals starting where payment status is 'success' and reservation status is 'valid'."
        }]
}
