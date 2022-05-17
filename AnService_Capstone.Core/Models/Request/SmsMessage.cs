using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AnService_Capstone.Core.Models.Request
{
    public class SmsMessage
    {
        [Required]
        //[Range(100000000000, 999999999999, ErrorMessage = "Phone number incorrect format 10 numbers")]
        public string To { get; set; }
    }
}
