﻿from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

class Database(object):

    def __init__(self, db_path: str):
        self.db_path = db_path
        self.engine = create_engine("sqlite:///{db_path}".format(db_path=self.db_path))
        self.session = sessionmaker(bind=self.engine, autocommit=True, autoflush=True)()

        self.initialize()

    def initialize(self):
        from . import models
        Base.metadata.create_all(bind=self.engine)
