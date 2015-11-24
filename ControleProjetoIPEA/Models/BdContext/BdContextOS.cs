using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Models.OS;

namespace ControleProjetoIPEA.Models.BdContext
{
    
    public class BdContextOS : DbContext
    {
       

        public BdContextOS()
            : base("ControleProjetos")
        {

        }

        public DbSet<OSModel> OSModel { get; set; }


    }
}
        