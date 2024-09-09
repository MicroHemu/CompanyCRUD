using System.Data;

namespace CompanyCRUD.Services
{
	public interface IDapperService
	{
		Task<T> GetAsync<T>(string storedProcedure, object parameters = null, CommandType commandType = CommandType.StoredProcedure);
		Task<IEnumerable<T>> GetAllAsync<T>(string storedProcedure, object parameters = null, CommandType commandType = CommandType.StoredProcedure);
		Task<int> ExecuteAsync(string storedProcedure, object parameters = null, CommandType commandType = CommandType.StoredProcedure);
	}

}
