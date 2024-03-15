FROM postgis/postgis:16-3.4
WORKDIR /build
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    cmake \
    g++ \
    libboost-graph-dev \
    libpq-dev \
    postgresql-server-dev-${PG_MAJOR} \
    libgdal-dev
RUN wget -O pgrouting-3.6.1.tar.gz https://github.com/pgRouting/pgrouting/archive/v3.6.1.tar.gz
RUN tar -xvzf pgrouting-3.6.1.tar.gz
WORKDIR /build/pgrouting-3.6.1/build
RUN cmake ..
RUN make
RUN make install
WORKDIR /build
RUN wget -O pgsql-ogr-fdw-1.1.4.tar.gz https://github.com/pramsey/pgsql-ogr-fdw/archive/refs/tags/v1.1.4.tar.gz
RUN tar -xvzf pgsql-ogr-fdw-1.1.4.tar.gz
WORKDIR /build/pgsql-ogr-fdw-1.1.4
RUN make
RUN make install
COPY ./sisaf.dump /sisaf.dump