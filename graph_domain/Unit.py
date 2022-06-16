from dataclasses import dataclass
from enum import Enum

from dataclasses_json import dataclass_json
from py2neo.ogm import Property

from graph_domain.BaseNode import BaseNode

LABEL = 'TIMESERIES_UNIT'


@dataclass
@dataclass_json
class Unit(BaseNode):
    """
    Defines the unit of a timeseries
    Flat node without relationships, only containing properties.
    """
    # Identifier for the node-type:
    __primarylabel__ = LABEL

    # Additional properties:

    def validate_metamodel_conformance(self):
        """
        Used to validate if the current node (self) and its child elements is conformant to the defined metamodel.
        :return:
        """
        return super().validate_metamodel_conformance() and \
            self in [unit.value for unit in AllowedUnitsEnum]


class AllowedUnitsEnum(Enum):
    MILLIMETER = Unit(
        id_short='mm',
        iri='www.sintef.no/sindit/identifiers/units/mm',
        description='Distance measurement in millimeters'
    )
    DEG_CELSIUS = Unit(
        id_short='deg_celsius',
        iri='www.sintef.no/sindit/identifiers/units/deg_celsius',
        description='Temperature measurement in degrees celsius'
    )