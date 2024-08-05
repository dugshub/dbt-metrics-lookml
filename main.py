import json

import numpy as np
import yaml
from helpers import fields_to_csvs, create_lookml
import pandas as pd




def get_lookml():
    header = """
view: rental_performance_2 {
    derived_table: {
        sql: select * from dbt_looker.rental_performance  ;;
        sql_trigger_value: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*10)/(60*60*24));;
        sortkeys: ["metric_time__day"]

    }
    """

    # loading the metrics and dims from the saved query
    saved_query = yaml.safe_load(open('saved_query.yaml', 'r'))
    query_metric_list = saved_query['query_params']['metrics']
    query_dimension_list = saved_query['query_params']['group_by']
    query_dimension_list = [dimension.split("'")[1] for dimension in query_dimension_list]

    # filtering out the metrics and dimensions  not in the selected list (from the saved query)
    metric_list = json.load(open('metrics.json'))['data']['metrics']
    metric_list = [metric for metric in metric_list if metric['name'] in query_metric_list]

    dimension_list = metrics = json.load(open('dimensions.json'))['data']['dimensions']
    dimension_list = [dimension for dimension in dimension_list if dimension['name'] in query_dimension_list]
    dim_tags = pd.read_csv("dimensions_DOUG_UPDATED.csv").set_index('name')
    dim_tags = dim_tags.replace({np.nan: None})
    dim_tags = dim_tags.to_dict('index')

    for dimension in dimension_list:
        dimension['primary_tag'] = dim_tags[dimension['name']]['primary_tag']
        dimension['secondary_tag'] = dim_tags[dimension['name']]['secondary_tag']

    return create_lookml(metrics=metric_list, dimensions=dimension_list, header=header)
