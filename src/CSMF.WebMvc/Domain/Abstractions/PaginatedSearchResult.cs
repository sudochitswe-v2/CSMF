using Microsoft.EntityFrameworkCore;

namespace CSMF.WebMvc.Domain.Abstractions
{
    public class PaginatedSearchResult<T>
    {
        public IEnumerable<T> Items { get; set; } = [];
        public int TotalCount { get; set; }
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public int TotalItems { get; set; }
        public int TotalPages => (int)Math.Ceiling((double)TotalItems / PageSize);
        public bool HasPreviousPage => PageNumber > 1;
        public bool HasNextPage => PageNumber < TotalPages;
        public string SearchTerm { get; set; } = string.Empty;

        public static async Task<PaginatedSearchResult<T>> PaginatedQueryAsync(IQueryable<T> query, int pageNumber, int pageSize)
        {
            var result = new PaginatedSearchResult<T>
            {
                PageNumber = pageNumber,
                PageSize = pageSize,
                TotalItems = await query.CountAsync(),
                Items = await query.Skip((pageNumber - 1) * pageSize)
                                   .Take(pageSize)
                                   .ToListAsync()
            };

            return result;
        }
    }
}
