CREATE TABLE log.syslog
(
    `appname` String,
    `facility` String,
    `hostname` String,
    `message` String,
    `msgid` String,
    `procid` Int32,
    `service` String,
    `severity` String,
    `source_type` String,
    `timestamp` String,
    `version` Int32
)
ENGINE = Log;