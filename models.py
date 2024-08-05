import dataclasses
from string import capwords


@dataclasses.dataclass
class Dimension:
    name: str
    label: str
    qualified_name: str
    type: str
    description: str
    primary_entity: str = None
    secondary_entity: str = None
    simplifiedName: str = None
    primary_tag: str = None
    secondary_tag: str = None

    def __post_init__(self):
        self._get_entities_from_name()

        if self.label:
            return
        self.label = capwords(self.name.split('__')[-1].replace('_', ' '))


        # if not self.primary_tag:
        #     self.primary_tag = self.primary_entity
        #     self.secondary_tag = self.secondary_entity

    def _get_entities_from_name(self):
        entities = []
        parsed_name = self.qualified_name.split('__')
        entities = [string for idx, string in enumerate(parsed_name) if string != parsed_name[-1]]

        self.primary_entity = entities[0]
        if len(entities) > 1:
            self.secondary_entity = entities[1]



    def looker_dim(self):
        dim = f"""
    dimension: {self.name}{{
        label: "{self.label}"
        description: "{self.description}"
        type: {self.convert_type()}
        sql: ${{TABLE}}.{self.qualified_name};;
        view_label: "{capwords(self.primary_tag)}"
        """

        if self.secondary_tag:
            dim = dim + f'group_label: "{capwords(self.secondary_tag)}"'
        dim = dim + "\n   }"
        return dim

    def convert_type(self):
        if self.type == 'CATEGORICAL':
            return 'string'

        else:
            return 'date'


@dataclasses.dataclass
class Metric:
    name: str
    label: str
    description: str
    type: str
    metric_category: str
    group: str
    primary_entity: str = None
    secondary_entity: str = None

    def __post_init__(self):
        if self.label:
            return
        name = self.name.split('__')
        self.label = name[-1]
        print(self.label)

    def looker_metric(self):
        metric = f"""
    measure: {self.name}{{
        label: "{self.label}"
        description: "{self.description}"
        type: {self.convert_type()}
        sql: ${{TABLE}}.{self.name};;
        view_label: "   Metrics"
        """

        if self.metric_category:
            metric = metric + f'group_label: "{self.metric_category}"'
        metric = metric + "\n   }"
        return metric

    def convert_type(self):
        if self.type == 'SIMPLE':
            return 'sum'

        if self.type == 'RATIO':
            return 'avg'


@dataclasses.dataclass
class Entity:
    name: str
