import dataclasses


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

    def __post_init__(self):
        self._get_entities()

    def _get_entities(self):
        entities = []
        parsed_name = self.qualified_name.split('__')
        entities = [string for idx, string in enumerate(parsed_name) if string != parsed_name[-1]]

        self.primary_entity = entities[0]
        if len(entities) > 1:
            self.secondary_entity = entities[1]

    def lookerDim(self):
        dim = f"""
                dimension: {self.name}{{
                    label: "{self.label}"
                    description: "{self.description}"
                    type: {self.convertType()}
                    sql: ${{TABLE}}.{self.qualified_name};;
                    view_label: "{self.primary_entity}"
            """

        if self.secondary_entity:
            dim = dim + f'        group_label: "{self.secondary_entity}"'
        dim = dim + "\n                 }"
        return dim

    def convertType(self):
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
    primary_entity: str = None
    secondary_entity: str = None

    def lookerMetric(self):
        metric = f"""
                measure: {self.name}{{
                    label: "{self.label}"
                    description: "{self.description}"
                    type: {self.convertType()}
                    sql: ${{TABLE}}.{self.name};;
                    view_label: "   Metrics"
            """

        if self.secondary_entity:
            metric = metric + f'        group_label: "{self.secondary_entity}"'
        metric = metric + "\n                 }"
        return metric

    def convertType(self):
        if self.type == 'SIMPLE':
            return 'sum'


        if self.type == 'RATIO':
            return 'avg'

@dataclasses.dataclass
class Entity:
    name: str
