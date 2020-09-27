
CREATE TABLE IF NOT EXISTS
    files
    (
        id SERIAL PRIMARY KEY,
        customer_id text NOT NULL,
        file_name text NOT NULL,
        file_path text NOT NULL,
        file_uuid text NOT NULL,
        file_length integer NOT NULL,
        file_date timestamp NOT NULL,
        file_permissions integer NOT NULL,
        file_version integer NOT NULL,
        file_version_next text,
        file_version_prev text,
        file_status integer,
        hash_algo integer,
        comp_algo integer,
        encr_algo integer,
        a_hash text,
        c_hash text,
        e_hash text,
        e_archive_date TIMESTAMP,
        e_file_length integer
    );


CREATE INDEX IF NOT EXISTS idx_cid_name ON files(customer_id);

CREATE INDEX IF NOT EXISTS idx_f_name ON files(file_name);

CREATE INDEX IF NOT EXISTS idx_f_path ON files(file_path);

CREATE UNIQUE INDEX IF NOT EXISTS idx_uuid ON files(file_uuid);

CREATE TABLE IF NOT EXISTS
    audit
    (
        id SERIAL PRIMARY KEY,
        customer_id text NOT NULL,
        file_name text NOT NULL,
        file_path text NOT NULL,
        file_uuid text NOT NULL,
        user_uuid text NOT NULL,
        operation_date timestamp,
        operation_type integer,
        persisted_to_cloud bool DEFAULT false
    );