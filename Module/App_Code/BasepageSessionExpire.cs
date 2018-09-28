using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Module
{
    public class BasepageSessionExpire : System.Web.UI.Page
    {
        public BasepageSessionExpire()
        {
        }

        override protected void OnInit(EventArgs e)
        {
            base.OnInit(e);

            bool bSessionEnd = false;

            string sMsg = "Please login.";

            //It appears from testing that the Request and Response both share the 
            // same cookie collection.  If I set a cookie myself in the Reponse, it is 
            // also immediately visible to the Request collection.  This just means that 
            // since the ASP.Net_SessionID is set in the Session HTTPModule (which 
            // has already run), thatwe can't use our own code to see if the cookie was 
            // actually sent by the agent with the request using the collection. Check if 
            // the given page supports session or not (this tested as reliable indicator 
            // if EnableSessionState is true), should not care about a page that does 
            // not need session
            if (Context.Session != null)
            {
                #region Session Check
                //Tested and the IsNewSession is more advanced then simply checking if 
                // a cookie is present, it does take into account a session timeout, because 
                // I tested a timeout and it did show as a new session
                if (Session.IsNewSession)
                {
                    Utils.Log("[BasepageSessionExpire.cs] New session");
                    // If it says it is a new session, but an existing cookie exists, then it must 
                    // have timed out (can't use the cookie collection because even on first 
                    // request it already contains the cookie (request and response
                    // seem to share the collection)
                    string szCookieHeader = Request.Headers["Cookie"];
                    if ((null != szCookieHeader) && (szCookieHeader.IndexOf("ASP.NET_SessionId") >= 0))
                    {
                        Utils.Log("[BasepageSessionExpire.cs] Session Timeout!");

                        sMsg = "Session Timeout!";

                        bSessionEnd = true;
                    }
                }

                if (UserSession.loginID == null)
                {
                    bSessionEnd = true;
                }
                #endregion


                if (bSessionEnd)
                {
                    //if (UserSession.bio_access_id == null)
                    //{                        
                    //    HiddenField hdMaster = (HiddenField)Master.FindControl("hd_bio_access_id");

                    //    DevExpress.Web.ASPxHiddenField hfMaster = (DevExpress.Web.ASPxHiddenField)Master.FindControl("hfId");

                    //    if (hdMaster != null && hdMaster.Value != null)
                    //    {
                    //        UserSession.bio_access_id = hdMaster.Value.ToString();
                    //    }

                    //    if (hfMaster != null && hfMaster.Get("bio_access_id") != null)
                    //    {
                    //        UserSession.bio_access_id = hfMaster.Get("bio_access_id").ToString();
                    //    }
                    //}

                    Utils.LogoutBioris();

                    Session.Abandon();
                    Session.Clear();

                    Response.Cookies.Clear();

                    Session["msg"] = sMsg;

                    if (Page.IsCallback)
                    {
                        DevExpress.Web.ASPxWebControl.RedirectOnCallback("~/Account/Login.aspx");
                    }
                    else 
                    {
                        Page.Response.Redirect("~/Account/Login.aspx");
                    }
                    
                }
                //else
                //{
                //    //check permission can access the page or not
                //    string sPath = Request.Url.AbsolutePath.ToLower(); //SLIS/Clerk/Dashboard.aspx
                //    //System.IO.FileInfo oInfo = new System.IO.FileInfo(sPath);
                //    //string sRet = oInfo.Name;

                //    string userRole = UserSession.role.ToString().ToLower();

                //    if (sPath.IndexOf(userRole) == -1)
                //    {
                //        if ((sPath.IndexOf("viewtestreport.aspx") > -1 || sPath.IndexOf("viewtestcert.aspx") > -1)  && UserSession.role == Utils.Role.Signatory)
                //        {
                //            //do nothing
                //        }
                //        else if ((sPath.IndexOf("viewtestreport.aspx") > -1 || sPath.IndexOf("viewtestcert.aspx") > -1 || sPath.IndexOf("riapplication.aspx") > -1 || sPath.IndexOf("ristatus.aspx") > -1 || sPath.IndexOf("ilsapplication.aspx") > -1 || sPath.IndexOf("ilsstatus.aspx") > -1) && UserSession.role == Utils.Role.LabManager)
                //        {
                //            //do nothing
                //        }
                //        else
                //            Page.Response.Redirect("~/Account/Login.aspx");
                //    }

                //}
            }
        }
    }
}