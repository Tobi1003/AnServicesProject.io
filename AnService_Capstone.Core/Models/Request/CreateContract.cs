using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AnService_Capstone.Core.Models.Request
{
    public class CreateContract
    {
        public class UpdatePriceRequestDetail
        {
            public int RequestDetailID { get; set; }
            /*public string RequestDetailDescription { get; set; }*/
            public float RequestDetailPrice { get; set; }
        }

        [Required]
        public int UserId { get; set; }
        [Required]
        public string Username { get; set; }
        [Required]
        public string ContractUrl { get; set; }
        [Required]
        public int RequestId { get; set; }
        [Required]
        public DateTime ContractStartDate { get; set; }
        [Required]
        public DateTime ContractEndDate { get; set; }
        [Required]
        public float ContractDeposit { get; set; }
        [Required]
        public float ContractTotalPrice { get; set; }
        [Required]
        public IEnumerable<UpdatePriceRequestDetail> updatePriceRequestDetails { get; set; }
    }
}
