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

    public class PaginatedList<T> : List<T>
    {
        public int PageNumber { get; private set; }
        public int TotalPages { get; private set; }

        public PaginatedList(IEnumerable<T> items, int totalCount, int pageNumber, int pageSize)
        {
            PageNumber = pageNumber;
            TotalPages = (int)Math.Ceiling(totalCount / (double)pageSize);

            AddRange(items);
        }

        public bool HasPreviousPage => PageNumber > 1;
        public bool HasNextPage => PageNumber < TotalPages;
    }
}
