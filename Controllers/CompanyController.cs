using CompanyCRUD.Models;
using CompanyCRUD.Repository;
using Microsoft.AspNetCore.Mvc;

namespace CompanyCRUD.Controllers
{
	public class CompanyController : Controller
	{
		private readonly ICompanyRepository _companyRepository;

		public CompanyController(ICompanyRepository companyRepository)
		{
			_companyRepository = companyRepository;
		}

		public async Task<IActionResult> Index(int pageNumber = 1, int pageSize = 10)
		{
            var totalCompanies = await _companyRepository.GetTotalCompaniesCountAsync();
            var companies = await _companyRepository.GetPaginatedCompaniesAsync(pageNumber, pageSize);

            var viewModel = new PaginatedCompanyViewModel
            {
                Companies = companies,
                PageNumber = pageNumber,
                PageSize = pageSize,
                TotalRecords = totalCompanies
            };

            return View(viewModel);
        }

		public IActionResult Create()
		{
			return View();
		}

		[HttpPost]
		public async Task<IActionResult> Create(Company company)
		{
			if (ModelState.IsValid)
			{
				await _companyRepository.CreateCompanyAsync(company);
				return RedirectToAction(nameof(Index));
			}
			return View(company);
		}

		public async Task<IActionResult> Edit(int id)
		{
			var company = await _companyRepository.GetCompanyByIdAsync(id);
			if (company == null)
			{
				return NotFound();
			}
			return View(company);
		}

		[HttpPost]
		public async Task<IActionResult> Edit(Company company)
		{
			if (ModelState.IsValid)
			{
				await _companyRepository.UpdateCompanyAsync(company);
				return RedirectToAction(nameof(Index));
			}
			return View(company);
		}

		public async Task<IActionResult> Delete(int id)
		{
			var company = await _companyRepository.GetCompanyByIdAsync(id);
			if (company == null)
			{
				return NotFound();
			}
			return View(company);
		}

		[HttpPost, ActionName("Delete")]
		public async Task<IActionResult> DeleteConfirmed(int id)
		{
			await _companyRepository.DeleteCompanyAsync(id);
			return RedirectToAction(nameof(Index));
		}

        [AcceptVerbs("Get", "Post")]
        public async Task<IActionResult> IsCompanyNameAvailable(Company company)
        {
			var exists = await _companyRepository.IsCompanyAvailable(company.CompanyName);

            if (exists > 0)
            {
                return Json($"Company name '{company.CompanyName}' is already taken.");
            }

            return Json(true);
        }
    }
}
