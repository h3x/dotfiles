#!/bin/bash

input=$(cat)
# Parse JSON and assign to variables
username=$(echo "${input}" | jq -r '.databases.mysql.username')
password=$(echo "${input}" | jq -r '.databases.mysql.password')
hostname=$(echo "${input}" | jq -r '.databases.mysql.hostname')
port=$(echo "${input}" | jq -r '.databases.mysql.port')
name=$(echo "${input}" | jq -r '.databases.mysql.name')


UUID=$(uuidgen -r)
source="
#DataSourceSettings#
#LocalDataSource: New Connection
#BEGIN#
<data-source source='LOCAL' name='New Connection' uuid='${UUID}'>
        <database-info product='MySQL' version='8.0.32' jdbc-version='4.2' driver-name='MySQL Connector/J' driver-version='mysql-connector-j-8.2.0 (Revision: 06a1f724497fd81c6a659131fda822c9e5085b6c)' dbms='MYSQL_AURORA' exact-version='3.5.2' exact-driver-version='8.2'>
                <extra-name-characters>#@</extra-name-characters>
                <identifier-quote-string>\`</identifier-quote-string>
                <jdbc-catalog-is-schema>true</jdbc-catalog-is-schema>
        </database-info>
        <case-sensitivity plain-identifiers='exact' quoted-identifiers='exact'/>
        <driver-ref>mysql.8</driver-ref>
        <synchronize>true</synchronize>
        <jdbc-driver>com.mysql.cj.jdbc.Driver</jdbc-driver>
        <jdbc-url>jdbc:mysql://${hostname}:${port}</jdbc-url>
        <secret-storage>master_key</secret-storage>
        <user-name>${username}</user-name>
        <password>${password}</password>
        <schema-mapping>
        <introspection-scope>
        <node kind='schema'>
                <name qname='@'/>
                <name qname='${name}'/>
        </node>
        </introspection-scope>
        </schema-mapping>
        <working-dir>$ProjectFileDir$</working-dir>
</data-source>
#END#"


echo "${source}"
