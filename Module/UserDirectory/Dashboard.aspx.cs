using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Module.UserDirectory
{
    public partial class Dashboard : BasepageSessionExpire
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
           
                if (!IsPostBack)
                {
                    calTotalGroup();
                   

                
                }
        }

            private void calTotalGroup()
            {
                try
                {
                    GroupDate.InnerHtml = " Last " + DateTime.Now.Year.ToString();

                    GroupTot.InnerHtml = Utils.GetTotalFacByYear().ToString();
                }
                catch (Exception ex)
                {
                    Utils.Log(ex);
                }
            }

          

        
    }
}