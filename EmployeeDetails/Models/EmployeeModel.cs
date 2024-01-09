using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EmployeeDetails.Models
{
    public class EmployeeModel
    {
        public int EmpID { get; set; }
        [Required(ErrorMessage = "Employee Name is required")]
        [StringLength(50, ErrorMessage = "Employee Name must be between 1 and 50 characters", MinimumLength = 1)]
        public string EName { get; set; }
        [Required(ErrorMessage = "Department Name is required")]
        [StringLength(50, ErrorMessage = "Department Name must be between 1 and 50 characters", MinimumLength = 1)]
        public string DeptName { get; set; }
        [Required(ErrorMessage = "Age is required")]
        [Range(18, 99, ErrorMessage = "Age must be between 18 and 99")]
        public int Age { get; set; }
        [Required(ErrorMessage = "Salary is required")]
        [Range(0, int.MaxValue, ErrorMessage = "Salary must be a non-negative value")]
        public int Salary { get; set; }

        [Display(Name = "Skills")]
        public string Skills { get; set; }
        public List<string> Skill { get; set; }

       
    }
}