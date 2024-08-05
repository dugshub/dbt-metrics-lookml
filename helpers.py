import json
from models import Metric, Dimension
import pandas as pd


def fields_to_csvs(dimensions=False,metrics=False):
    if dimensions:
        dimensions = json.load(open('dimensions.json'))['data']['dimensions']
        dims = []
        for dimension in dimensions:
            dim = Dimension(
                name=dimension['name'],
                label=dimension['label'],
                description=dimension['description'],
                qualified_name=dimension['qualifiedName'],
                type=dimension['type']
            )
            dims.append(dim)
        pd.DataFrame(dims).to_csv('dimensions.csv')
        json.dump(dims, open('dimensionsx.json', 'w'))
    if metrics:
        metrics = json.load(open('metrics.json'))['data']['metrics']
        mtx = []
        for metric in metrics:
            metric = Metric(
                name=metric['name'],
                label=metric['label'],
                description=metric['description'],
                type=metric['type'],
                metric_category=metric['config']['meta']['metric_type'],
                group=metric['config']['meta']['group'],

            )
            mtx.append(metric)
        pd.DataFrame(mtx).to_csv('metrics.csv')

    if not dimensions and not metrics:
        return "No inputs provided - csvs not updated"

    else:
        return f"Metrics updated: {metrics}, dimensions updated: {dimensions}"

def create_lookml(metrics=None, dimensions=None, header=None):
    dimension_list = []
    for dimension in dimensions:
        dim = Dimension(
            name=dimension['name'],
            label=dimension['label'],
            description=dimension['description'],
            qualified_name=dimension['qualifiedName'],
            type=dimension['type'],
            primary_tag=dimension['primary_tag'],
            secondary_tag=dimension['secondary_tag'],

        )
        dimension_list.append(dim)

    metric_list = []
    for metric in metrics:
        metric = Metric(
            name=metric['name'],
            label=metric['label'],
            description=metric['description'],
            type=metric['type'],
            metric_category=metric['config']['meta']['metric_type'],
            group=metric['config']['meta']['group'],

        )
        metric_list.append(metric)

    lkml = [metric.looker_metric() for metric in metric_list]
    [lkml.append(dimension.looker_dim()) for dimension in dimension_list]

    with open('explore.lkml', 'w') as f:

        f.write(f"{header}")

        for line in lkml:
            f.write(f"{line}\n")
        f.write("}")

    return lkml

