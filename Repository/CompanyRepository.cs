using CompanyCRUD.Models;
using CompanyCRUD.Services;
using System.Data;

namespace CompanyCRUD.Repository
{
	public class CompanyRepository : ICompanyRepository
	{
		private readonly IDapperService _dapperService;

		public CompanyRepository(IDapperService dapperService)
		{
			_dapperService = dapperService;
		}

		public async Task<Company> GetCompanyByIdAsync(int id)
		{
			var parameters = new { CompanyId = id };
			return await _dapperService.GetAsync<Company>("GetCompanyById", parameters, CommandType.StoredProcedure);
		}

		public async Task<IEnumerable<Company>> GetAllCompaniesAsync()
		{
			return await _dapperService.GetAllAsync<Company>("GetAllCompanies", null, CommandType.StoredProcedure);
		}

		public async Task<int> CreateCompanyAsync(Company company)
		{
			var parameters = new
			{
				CompanyName = company.CompanyName,
				Address = company.Address,
				IsActive = company.IsActive
			};
			return await _dapperService.ExecuteAsync("CreateCompany", parameters, CommandType.StoredProcedure);
		}

		public async Task<int> UpdateCompanyAsync(Company company)
		{
			var parameters = new
			{
				CompanyId = company.CompanyId,
				CompanyName = company.CompanyName,
				Address = company.Address,
				IsActive = company.IsActive
			};
			return await _dapperService.ExecuteAsync("UpdateCompany", parameters, CommandType.StoredProcedure);
		}

		public async Task<int> DeleteCompanyAsync(int id)
		{
			var parameters = new { CompanyId = id };
			return await _dapperService.ExecuteAsync("DeleteCompany", parameters, CommandType.StoredProcedure);
		}
	}

}
