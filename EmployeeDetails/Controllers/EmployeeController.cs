using ClosedXML.Excel;
using Dapper;
using DocumentFormat.OpenXml.EMMA;
using DocumentFormat.OpenXml.Wordprocessing;
using EmployeeDetails.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace EmployeeDetails.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly static string _connectionString = @"Data Source=192.168.174.1;Initial Catalog=DapperDB;User ID=sa;Password=123;";
        static int  numRecords1 = 5;
        public ActionResult Index(int page = 1)
        {
            int pageSize = numRecords1;
            try
            {
                List<EmployeeModel> employees;
                int totalRecords;
                int numRecords = !string.IsNullOrEmpty(Request["numRecords"]) ? int.Parse(Request["numRecords"]) : pageSize;
                numRecords1 = numRecords;
                using (IDbConnection dbConnection = new SqlConnection(_connectionString))
                {
                    dbConnection.Open();
                    employees = dbConnection.Query<EmployeeModel>("GetPagedEmp", new { Offset = (page - 1) * numRecords, PageSize = numRecords }).ToList();
                    totalRecords = dbConnection.ExecuteScalar<int>("GetPagedCount");
                }
                var paginationInfo = new PaginationInfo
                {
                    CurrentPage = page,
                    PageSize = numRecords,
                    TotalItems = totalRecords
                };
                
                ViewBag.PaginationInfo = paginationInfo;
                return View(employees);
            }
            catch (Exception)
            {
                return View("Error");
            }
        }

        public ActionResult Create()
        {
            return View();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(EmployeeModel employee)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    using (IDbConnection dbConnection = new SqlConnection(_connectionString))
                    {
                        // Get selected skills from form collection
                        List<string> selectedSkills = employee.Skill;

                       
                        string skillsAsString="";
                        foreach (string skill in selectedSkills)
                        {
                            if(skill!="false")
                            {
                                skillsAsString = skillsAsString + skill+" ";
                            }
                        }

                         employee.Skills= skillsAsString;

                        dbConnection.Open();
                        dbConnection.Execute("InsertEmployee", new
                        {
                            EName = employee.EName,
                            DeptName = employee.DeptName,
                            Age = employee.Age,
                            Salary = employee.Salary,
                            Skills = employee.Skills
                        }, commandType: CommandType.StoredProcedure); ;
                    }
                    return RedirectToAction("Index");
                }

                catch (Exception)
                {
                    return View("Error");
                }
            }
            else { return View(); } 
        }

        public ActionResult Update(int id)
        {
            try
            {
                EmployeeModel employee;
                using (IDbConnection dbConnection = new SqlConnection(_connectionString))
                {
                    dbConnection.Open();
                    employee = dbConnection.Query<EmployeeModel>("GetEmployeeById", new { EmpID = id }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                    
                }
                return View(employee);
            }
            catch (Exception)
            {
                return View("Error");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(EmployeeModel employee)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    using (IDbConnection dbConnection = new SqlConnection(_connectionString))
                    {
                        // Get selected skills from form collection
                        List<string> selectedSkills = employee.Skill;


                        string skillsAsString = "";
                        foreach (string skill in selectedSkills)
                        {
                            if (skill != "false")
                            {
                                skillsAsString = skillsAsString + skill + " ";
                            }
                        }
                        employee.Skills = skillsAsString;

                        dbConnection.Open();
                        dbConnection.Execute("UpdateEmp", new
                        {
                            EmpID = employee.EmpID,
                            EName = employee.EName,
                            DeptName = employee.DeptName,
                            Age = employee.Age,
                            Salary = employee.Salary,
                            Skills = employee.Skills
                        }, commandType: CommandType.StoredProcedure);
                    }
                    return RedirectToAction("Index");
                }
                catch (SqlException ex)
                {
                    // Log the exception details for debugging
                    Console.WriteLine("SQL Exception: " + ex.Message);
                    return View("Error");
                }
                catch (Exception ex)
                {
                    // Log the exception details for debugging
                    Console.WriteLine("Exception: " + ex.Message);
                    return View("Error");
                }
            }
            else { return View(); }
        }

        public ActionResult Delete(int id)
        {
            try
            {
                using (IDbConnection dbConnection = new SqlConnection(_connectionString))
                {
                    dbConnection.Open();
                    dbConnection.Execute("DeleteEmployee", new { EmpID = id }, commandType: CommandType.StoredProcedure);
                }
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return View("Error");
            }
        }

        public ActionResult Details(int id)
        {
            try
            {
                EmployeeModel employee;
                using (IDbConnection dbConnection = new SqlConnection(_connectionString))
                {
                    dbConnection.Open();
                    employee = dbConnection.Query<EmployeeModel>("GetEmployeeBy", new { EmpID = id }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
                if (employee == null)
                {
                    return HttpNotFound(); // Return a 404 Not Found if the employee is not found
                }
                return View(employee);
            }
            catch (Exception)
            {
                return View("Error");
            }
        }

        public ActionResult DeleteTemp(int id)
        {
            try
            {
                using (IDbConnection dbConnection = new SqlConnection(_connectionString))
                {
                    dbConnection.Open();
                    dbConnection.Execute("SoftDeleteRecord", new { EmpID = id }, commandType: CommandType.StoredProcedure);
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                // Log the exception details for debugging
                Console.WriteLine("Exception: " + ex.Message);
                return View("Error");
            }
        }

        public ActionResult GetDeletedRecords()
        {
            try
            {
                List<EmployeeModel> deletedRecords;

                using (IDbConnection dbConnection = new SqlConnection(_connectionString))
                {
                    dbConnection.Open();
                    deletedRecords = dbConnection.Query<EmployeeModel>("DeletedRecords", commandType: CommandType.StoredProcedure).ToList();
                }
                return View(deletedRecords);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return View("Error");
            }
        }

        public ActionResult Restore(int id)
        {
            try
            {
                using (IDbConnection dbConnection = new SqlConnection(_connectionString))
                {
                    dbConnection.Open();
                    dbConnection.Execute("GetBackDeletedRecord", new { EmpID = id }, commandType: CommandType.StoredProcedure);
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                // Log the exception details for debugging
                Console.WriteLine("Exception: " + ex.Message);
                return View("Error");
            }
        }

        public ActionResult ExportToExcel()
        {
            List<EmployeeModel> data;
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                dbConnection.Open();
                data = dbConnection.Query<EmployeeModel>("GetAllEmployees", commandType: CommandType.StoredProcedure).ToList();
            }
            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Sheet1");
                // Add headers
                var properties = typeof(EmployeeModel).GetProperties();
                for (int i = 0; i < properties.Length; i++)
                {
                    worksheet.Cell(1, i + 1).Value = properties[i].Name;
                }
                // Add data
                for (int i = 0; i < data.Count; i++)
                {
                    for (int j = 0; j < properties.Length; j++)
                    {
                        worksheet.Cell(i + 2, j + 1).Value = Convert.ToString(properties[j].GetValue(data[i]));
                    }
                }
                // Save the workbook to a memory stream
                using (var stream = new System.IO.MemoryStream())
                {
                    workbook.SaveAs(stream);
                    stream.Position = 0;
                    // Set the content type and file name for the response
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=ExportedData.xlsx");
                    // Copy the stream to the response output stream
                    stream.CopyTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
            return new EmptyResult();
        }

        public ActionResult PrintTable()
        {
            List<EmployeeModel> employees;
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                dbConnection.Open();
                // Ensure that your EmployeeModel properties match the columns in the Employee table
                employees = dbConnection.Query<EmployeeModel>("GetAllEmployees", commandType: CommandType.StoredProcedure).ToList();
            }
            // Build HTML string for the table
            StringBuilder htmlBuilder = new StringBuilder();
            htmlBuilder.AppendLine("<html><head><title>Table Print</title></head><body>");
            htmlBuilder.AppendLine("<style>table {border-collapse: collapse; width: 100%;} th, td {border: 1px solid black; padding: 8px; text-align: left;}</style>");
            htmlBuilder.AppendLine("<table class='table table-bordered'><thead><tr><th>Name</th><th>Department</th><th>Age</th><th>Skills</th><th>Salary</th></tr></thead><tbody>");

            foreach (var employee in employees)
            {
                htmlBuilder.AppendLine("<tr>");
                //htmlBuilder.AppendLine($"<td>{employee.EmpID}</td>");
                htmlBuilder.AppendLine($"<td>{employee.EName}</td>");
                htmlBuilder.AppendLine($"<td>{employee.DeptName}</td>");
                htmlBuilder.AppendLine($"<td>{employee.Age}</td>");
                htmlBuilder.AppendLine($"<td>{employee.Skills}</td>");
                htmlBuilder.AppendLine($"<td>{employee.Salary}</td>");
                htmlBuilder.AppendLine("</tr>");
            }
            htmlBuilder.AppendLine("</tbody></table></body></html>");
            //   Open a new window for printing
            string htmlContent = htmlBuilder.ToString();
            //   Add JavaScript to trigger the print dialog
            htmlContent += "<script>window.onload = function() { window.print(); }</script>";
            return Content(htmlContent, "text/html");
        }

        private List<string> GetSkills()
        {
            // Replace this with your actual logic to retrieve skills
            return new List<string> { "HTML", "CSS", "JavaScript" };
        }
    }
}




