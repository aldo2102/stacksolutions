using Models.OS;
using ControleProjetoIPEA.Models.Os;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ControleProjetoIPEA.Models.BdContext;
using Microsoft.AspNet.Identity;

namespace ControleProjetoIPEA
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<OSModel> CarregarGrid()
        {
            var db = new OSCrud();
            var _db = new BdContextOS();
            var user = Context.User.Identity.GetUserId();
            IQueryable<OSModel> query = _db.OSModel.Where(p => p.idUsuario == user);
             query.Select(b => new { b.nivel, b.problema, b.servico });
             return query;
        }

        public void FormCadastro_InsertItem()
        {
            var db = new OSCrud();
            var item2 = new OSModel();
            var usuario = Context.User.Identity.Name;
            TryUpdateModel(item2);
            if (ModelState.IsValid)
            {
                db.InsertOrUpdate(item2);
                gridDados.DataBind();
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            var OS = new OSCrud();
            var objOS = new OSModel();

            objOS.Id = Convert.ToInt32(hdn.Value);
            objOS.servico = txtServicoModal.Text;
            objOS.problema = txtProblemaModal.Text;

            OS.InsertOrUpdate(objOS);

            gridDados.DataBind();

        }



        protected void gridDados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var os = new OSCrud();
            var objeOS = new OSModel();
            var id = Convert.ToInt32(e.CommandArgument);
            hdn.Value = id.ToString();

            switch (e.CommandName)
            {
                case "Excluir":
                    os.Delete(id);
                    gridDados.DataBind();
                    break;

                case "Editar":

                    CarregarModal(id);
                    //ModalUpdate.Show();
                    break;

                default:
                    break;
            }
        }



        public void CarregarModal(int id)
        {
            var user = new OSCrud();

            var objUser = user.PesquisarPorId(id);

            txtNivelModal.Text = objUser.nivel;
            txtServicoModal.Text = objUser.servico;
            txtProblemaModal.Text = objUser.problema;

        }





    }
}