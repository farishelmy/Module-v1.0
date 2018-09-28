using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Module
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogout(object sender, EventArgs e)
        {
            Utils.LogoutBioris();

            Session.Abandon();
            Session.Clear();

            Response.Cookies.Clear();

            Session["msg"] = "Successfully logout.";
            base.Response.Redirect("~/Account/Login.aspx");


        }



        protected void Page_Init(object sender, EventArgs e)
        {
            if (!Utils.IsEmpty(UserSession.loginID))
            {
                if (!IsPostBack)
                {
                    
                    lblName.InnerHtml = "";
                    lblRoles.InnerHtml = "";

                    if (UserSession.roles_tittle != null)
                    {
                        lblName.InnerHtml = UserSession.stakeholder_name;
                        lblRoles.InnerHtml = UserSession.roles_tittle;
                    }                    
                    else
                    {
                        Utils.Log("[SiteMaster.aspx][Page_Init] No role found: " + UserSession.roles_tittle);

                        string sMsg = "No role found";

                        if (Page.IsCallback)
                        {
                            DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/Account/Login.aspx?msg=" + sMsg);
                        }
                        else
                        {
                            Page.Response.Redirect("~/Account/Login.aspx?msg=" + sMsg);
                        }
                    }                  

                    //hd_bio_access_id.Value = UserSession.bio_access_id;
                    //hfId.Add("bio_access_id", UserSession.bio_access_id);
                }
            }
            else
            {
                Utils.Log("[SiteMaster.aspx][Page_Init] No session found.");
                // base.Response.Redirect("~/Account/Login.aspx?errorMsg=No role found");
            }
        }



    }
}
 