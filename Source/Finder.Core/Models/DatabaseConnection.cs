namespace Finder.Core.Models
{
    using System;
    using System.Collections.Generic;
    using MySql.Data.MySqlClient;
    using System.Data;

    /// <summary>
    /// Class to connect to a mysql database server
    /// </summary>
    public class DatabaseConnection
    {
        /// <summary>
        /// Database Specs
        /// </summary>
        private MySqlConnection connection;
        private string server;
        private string database;
        private string userId;
        private string password;

        /// <summary>
        /// Constructor
        /// </summary>
        public DatabaseConnection()
        {
            this.Initialize();
        }
        /// <summary>
        /// Initialize specs of the database
        /// </summary>
        private void Initialize()
        {
            //############# ENTER LOG IN HERE #############################################################
            var conn_string = new MySqlConnectionStringBuilder();
            conn_string.Server = "127.0.0.1";
            conn_string.Database = "finderdb";
            conn_string.UserID = "root";
            conn_string.Password = "DEINPASSWORT";
            conn_string.SslMode = MySqlSslMode.None;
            //#############################################################################################
            this.connection = new MySqlConnection(conn_string.ToString());
        }

        /// <summary>
        /// Opens a connection to the database
        /// </summary>
        /// <returns>Boolean value if the connection was successful or not</returns>
        private bool OpenConnection()
        {
            try
            {
                this.connection.Open();
                Console.WriteLine("Connection successful");
                return true;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Connection NOT successful");
                Console.WriteLine(ex);
                return false;
            }
        }
        /// <summary>
        /// Closes a connection to the database
        /// </summary>
        /// <returns>Boolean value if the connection was closed or not</returns>
        public bool CloseConnection()
        {
            try
            {
                this.connection.Close();
                Console.WriteLine("Database closed successful");
                return true;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Database NOT closed successful");
                Console.WriteLine(ex);
                return false;
            }
        }

        /// <summary>
        /// Insert statement
        /// </summary>
        /// <param name="query"></param>
        public void QueryInsert(String query)
        {
            if (this.OpenConnection() == true)
            {
                var command = new MySqlCommand(query, this.connection);
                command.ExecuteNonQuery();
                this.CloseConnection();
            }
        }

        /// <summary>
        /// Update statement
        /// </summary>
        /// <param name="query"></param>
        public void QueryUpdate(String query)
        {
            if (this.OpenConnection() == true)
            {
                var command = new MySqlCommand
                {
                    CommandText = query,
                    Connection = this.connection
                };

                command.ExecuteNonQuery();
                this.CloseConnection();
            }
        }

        /// <summary>
        /// Delete statement
        /// </summary>
        /// <param name="query"></param>
        public void QueryDelete(String query)
        {
            if (this.OpenConnection() == true)
            {
                var command = new MySqlCommand(query, this.connection);
                command.ExecuteNonQuery();
                this.CloseConnection();
            }
        }

        /// <summary>
        /// Method to count columns inside a table
        /// </summary>
        /// <param name="tableName">Table name</param>
        /// <returns>Int value of counted columns</returns>
        public int QueryColumnCount(String tableName)
        {
            var count = 0;
            var query = "DESCRIBE " + tableName;
            if (this.OpenConnection() == true)
            {
                var command = new MySqlCommand(query, this.connection);
                MySqlDataReader reader;
                if (this.OpenConnection() == true)
                {
                    reader = command.ExecuteReader();
                    count = reader.FieldCount;
                }
                return count;
            }
            return count = -1;

        }

        public List<string> GetColumnNames(String tableName)
        {

            var columnCount = this.QueryColumnCount(tableName);

            var columnNames = new List<string>();

            DataTable schema = null;
            if (this.OpenConnection() == true)
            {
                using (var schemaCommand = new MySqlCommand("Select * FROM " + tableName))
                {
                    using (var reader = schemaCommand.ExecuteReader(CommandBehavior.SchemaOnly))
                    {
                        schema = reader.GetSchemaTable();
                    }

                }
                foreach (DataColumn col in schema.Rows)
                {
                    columnNames.Add(col.ColumnName);
                }
            }
            return columnNames;
        }

        /// <summary>
        /// Returns data from a select query as a list
        /// </summary>
        /// <param name="query">mysql query</param>
        /// <returns>list filled with data</returns>
        public List<object[]> GetData(string query)
        {
            List<object[]> dataList = new List<object[]>();
            if (this.OpenConnection() == true)
            {
                using (var schemaCommand = new MySqlCommand(query, this.connection))
                {
                    MySqlDataReader reader = schemaCommand.ExecuteReader();
                    while (reader.Read())
                    {
                        object[] tempRow = new object[reader.FieldCount];
                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            tempRow[i] = reader[i];
                        }
                        dataList.Add(tempRow);
                    }
                    reader.Close();
                }

            }
            return dataList;
        }
    }
}
