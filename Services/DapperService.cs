using Dapper;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace CompanyCRUD.Services
{
	public class DapperService : IDapperService
	{
		private readonly string _connectionString;

		public DapperService(IConfiguration configuration)
		{
			_connectionString = configuration.GetConnectionString("DefaultConnection");
		}

		private SqlConnection GetConnection()
		{
			return new SqlConnection(_connectionString);
		}

		public async Task<T> GetAsync<T>(string storedProcedure, object parameters = null, CommandType commandType = CommandType.StoredProcedure)
		{
			using (var connection = GetConnection())
			{
				return await connection.QuerySingleOrDefaultAsync<T>(storedProcedure, parameters, commandType: commandType);
			}
		}

		public async Task<IEnumerable<T>> GetAllAsync<T>(string storedProcedure, object parameters = null, CommandType commandType = CommandType.StoredProcedure)
		{
			using (var connection = GetConnection())
			{
				return await connection.QueryAsync<T>(storedProcedure, parameters, commandType: commandType);
			}
		}

		public async Task<int> ExecuteAsync(string storedProcedure, object parameters = null, CommandType commandType = CommandType.StoredProcedure)
		{
			using (var connection = GetConnection())
			{
				return await connection.ExecuteAsync(storedProcedure, parameters, commandType: commandType);
			}
		}

        public async Task<T> QuerySingleAsync<T>(string storedProcedure, object parameters = null, CommandType commandType = CommandType.StoredProcedure)
        {
			using (var connection = GetConnection())
			{
                return await connection.QuerySingleOrDefaultAsync<T>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
            }
        }
    }

}
