using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using ControleProjetoIPEA.Models.BdContext;
using System.Data.Entity;
using Models.OS;


namespace ControleProjetoIPEA.Models.Os
{
    public class OSCrud
    {
        BdContextOS bd = new BdContextOS();

        public void InsertOrUpdate(OSModel OS)
        {
            try
            {
                bd.Entry(OS).State = OS.Id == 0 ? EntityState.Added : EntityState.Modified;
                bd.SaveChanges();
            }
            catch (Exception)
            {
                throw new Exception("Error ao cadastrar um OS!");
            }
        }

        public IQueryable<OSModel> CarregarDados()
        {
            try
            {
                var dados = bd.OSModel;

                return dados;
            }
            catch (Exception ex)
            {
                throw new Exception("Error ao carregar os dados" + ex.Message);
            }
        }

        public void Delete(int id)
        {
            try
            {
                var OS = bd.OSModel.Find(id);
                bd.OSModel.Remove(OS);
                bd.SaveChanges();
            }
            catch (Exception)
            {

            }
        }



        public OSModel PesquisarPorId(int id)
        {
            try
            {
                return bd.OSModel.FirstOrDefault(x => x.Id == id);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}