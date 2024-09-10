using CompanyCRUD.Models;

namespace CompanyCRUD.Repository
{
	public interface ICompanyRepository
	{
		Task<Company> GetCompanyByIdAsync(int id);
		Task<IEnumerable<Company>> GetAllCompaniesAsync();
		Task<int> CreateCompanyAsync(Company company);
		Task<int> UpdateCompanyAsync(Company company);
		Task<int> DeleteCompanyAsync(int id);
		Task<IEnumerable<Company>> GetPaginatedCompaniesAsync(int pageNumber, int pageSize);
		Task<int> GetTotalCompaniesCountAsync();
        Task<int> IsCompanyAvailable(string name);

    }
}
