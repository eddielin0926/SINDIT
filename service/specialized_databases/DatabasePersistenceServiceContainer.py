from typing import Dict, List
from graph_domain.DatabaseConnectionNode import (
    DatabaseConnectionNode,
    DatabaseConnectionTypes,
)

from service.specialized_databases.SpecializedDatabasePersistenceService import (
    SpecializedDatabasePersistenceService,
)
from service.specialized_databases.timeseries.influx_db.InfluxDbPersistenceService import (
    InfluxDbPersistenceService,
)

DB_CONNECTION_MAPPING = {
    DatabaseConnectionTypes.INFLUX_DB.value: InfluxDbPersistenceService
}


class DatabasePersistenceServiceContainer:
    """
    Holds all current connections to specialized databases
    """

    __instance = None

    @classmethod
    def instance(cls):
        if cls.__instance is None:
            cls()
        return cls.__instance

    def __init__(self):
        if self.__instance is not None:
            raise Exception("Singleton instantiated multiple times!")

        DatabasePersistenceServiceContainer.__instance = self

        self.services: Dict[str, SpecializedDatabasePersistenceService] = {}

    def get_persistence_service(self, iri: str):
        return self.services.get(iri)

    def register_persistence_service(
        self, iri: str, service: SpecializedDatabasePersistenceService
    ):
        self.services[iri] = service

    def initialize_connections(self, connection_nodes: List[DatabaseConnectionNode]):
        con_node: DatabaseConnectionNode
        for con_node in connection_nodes:

            # TODO: implement S3 and remove this!
            if con_node.type == "S3":
                continue

            service_class: SpecializedDatabasePersistenceService = (
                DB_CONNECTION_MAPPING.get(con_node.type)
            )

            self.services[con_node.iri] = service_class.from_db_connection_node(
                con_node
            )