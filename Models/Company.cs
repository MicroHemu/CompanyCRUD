using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace CompanyCRUD.Models
{
	public class Company
	{
		public int CompanyId { get; set; }        
        public string CompanyName { get; set; }
		public string Address { get; set; }
		public bool IsActive { get; set; }
		public DateTime CreatedAt { get; set; }
	}
}
