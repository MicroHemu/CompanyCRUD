namespace CompanyCRUD.Models
{
    public class PaginatedCompanyViewModel
    {
        public IEnumerable<Company> Companies { get; set; }
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public int TotalRecords { get; set; }
        public int TotalPages => (int)Math.Ceiling((double)TotalRecords / PageSize);
    }
}
