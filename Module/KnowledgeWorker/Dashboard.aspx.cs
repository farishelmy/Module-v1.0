using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Module.KnowledgeWorker
{
    public partial class Dashboard : BasepageSessionExpire
    {       
       
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    calTotalGroup();
                    calTotalFac();
                }
            }

            private void calTotalGroup()
            {
                try
                {
                     DateFac.Text = " Since - " + DateTime.Now.Year.ToString();

                    lblTotal.Text = Utils.GetTotalFacByYear().ToString();
                }
                catch (Exception ex)
                {
                    Utils.Log(ex);
                }
            }

            private void calTotalFac()
            {
                try
                {
                    DateFac.Text = " Since - " + DateTime.Now.Year.ToString();

                    lblTotalFac.Text = Utils.GetTotalFacByYear().ToString();
                }
                catch (Exception ex)
                {
                    Utils.Log(ex);
                }


            }
    }

    
}