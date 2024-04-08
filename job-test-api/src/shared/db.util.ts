import { QueryError, createPool } from "mysql2/promise";

export const dbCom = createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'jobtest',
    multipleStatements: true,
    namedPlaceholders: true,
    charset: "utf8",
});
