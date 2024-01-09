using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeDetails.Models
{
    public class PaginationInfo : IPlagination
    {
        public int CurrentPage { get; set; }
        public int PageSize { get; set; }
        public int TotalItems { get; set; }
        public int TotalPages => (int)Math.Ceiling((double)TotalItems / PageSize);

        public int GetStartIndex() => (CurrentPage - 1) * PageSize;
        public int GetEndIndex() => Math.Min(CurrentPage * PageSize - 1, TotalItems - 1);
    }
}
