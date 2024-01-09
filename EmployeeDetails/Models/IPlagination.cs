using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeDetails.Models
{
    internal interface IPlagination
    {
       
            int CurrentPage { get; }
            int PageSize { get; }
            int TotalItems { get; }
            int TotalPages { get; }

            int GetStartIndex();
            int GetEndIndex();
        
    }
}
