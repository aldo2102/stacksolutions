using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Models.teste
{
    
    public class OSModel
    {
        [Key]
        public int Id {get; set;}

        public string nivel {get; set;}

        public string servico {get; set;}

        public string problema {get; set;}

    }
}