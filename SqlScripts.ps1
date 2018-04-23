function sql:cmd($SQL_PROJECT_SERVER){
    SQLCMD -E -S $SQL_PROJECT_SERVER -Q $args
}