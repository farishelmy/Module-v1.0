using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DevExpress.Web;
using System.DirectoryServices.Protocols;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using System.Web.Script.Serialization;
using System.Collections;

namespace Module.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblErrMsg.Text = "";

                if (this.Page.User.Identity.IsAuthenticated)
                {
                    if (UserSession.loginID != null && UserSession.roles_tittle != null)
                    {
                        Response.Redirect("~/UserDirectory/Dashboard.aspx"); //KnowledgeWorker @ UserDirectory
                    }
                }

                if (Session["msg"] != null)
                {
                    lblErrMsg.Text = Session["msg"].ToString();
                }

                if (!IsPostBack)
                {
                    Utils.LogoutBioris();

                    //start new
                    HttpContext.Current.Session.Clear();
                }

                Session["msg"] = null;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool bSuccess = false;
            string sMsg = "";

            try
            {
                //string sRole = btnEditUserName.Text; //*** for testing ***"clerk";// 

                //if (sRole.ToUpper() == "CLERK" || sRole.ToUpper() == "SUPERVISOR" || sRole.ToUpper() == "SIGNATORY" || sRole.ToUpper() == "LABMANAGER" || sRole.ToUpper() == "FACMANAGER" || sRole.ToUpper() == "RQAP")
                //{

                var usrInput = btnUserName.Value;
                var saperatorIdx = usrInput.IndexOf("@");
                var usrName = usrInput.Substring(0, saperatorIdx);
                var repoName = usrInput.Substring(saperatorIdx + 1);

                if (Utils.AuthenticateBioris(usrName, repoName, btnPassword.Value, ref sMsg))
                {
                    bSuccess = true;

                    UserSession.loginID = btnUserName.Value;

                    //Response.Redirect("~/" + sRole.ToLower() + "/ViewContent.aspx");
                   

                    if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                    {
                        FormsAuthentication.SetAuthCookie(btnUserName.Value, false);

                        //HttpCookie cookie = new HttpCookie("cookieUserName", btnEditUserName.Text);

                        Response.Redirect("~/UserDirectory/Dashboard.aspx"); //KnowledgeWorker @ UserDirectory 
                    }
                    else
                        FormsAuthentication.RedirectFromLoginPage(btnUserName.Value, false);

                }
                //}


                /*if (Membership.ValidateUser(btnEditUserName.Text, btnEditPassword.Text)) {
                    if(string.IsNullOrEmpty(Request.QueryString["ReturnUrl"])) {
                        FormsAuthentication.SetAuthCookie(btnEditUserName.Text, false);
                        Response.Redirect("~/");
                    }
                    else
                        FormsAuthentication.RedirectFromLoginPage(btnEditUserName.Text, false);
                }
                else {
                    btnEditUserName.ErrorText = "Invalid user";
                    btnEditUserName.IsValid = false;
                }*/

                if (!bSuccess)
                {
                    lblErrMsg.Text = "Unable to login. " + sMsg;
                }
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
            }
        }


        //private const int LDAPError_InvalidCredentials = 0x31;
        //private bool authenticateLDAP(string sUsername, string sPassword, ref string sMsg)
        //{
        //    try
        //    {
        //        return true;

        //        //sMsg += "Invalid user.";

        //        //return false;

        //        // Create the new LDAP connection
        //        LdapDirectoryIdentifier ldi = new LdapDirectoryIdentifier("10.1.1.7", 389);
        //        using (System.DirectoryServices.Protocols.LdapConnection ldapConnection = new System.DirectoryServices.Protocols.LdapConnection(ldi))
        //        {
        //            Utils.Log("LdapConnection is created successfully.");

        //            ldapConnection.AuthType = AuthType.Basic;
        //            ldapConnection.SessionOptions.ProtocolVersion = 3;
        //            //NetworkCredential nc = new NetworkCredential("uid=testa,ou=people,dc=ghashd,dc=servebeer,dc=com","zaq12wsx"); //password
        //            NetworkCredential nc = new NetworkCredential(sUsername, sPassword, "HPtrim");
        //            ldapConnection.Bind(nc);

        //            Utils.Log("LdapConnection authentication success");
        //            //ldapConnection.Dispose();

        //        }

        //        return true;
        //    }
        //    catch (LdapException e)
        //    {
        //        Utils.Log(e);

        //        if (e.ErrorCode.Equals(LDAPError_InvalidCredentials)) 
        //            sMsg += "Invalid username/password.";
        //        else
        //            sMsg += e.Message;

        //        return false;
        //    }
        //    catch (Exception e)
        //    {
        //        Utils.Log(e);
        //        sMsg += e.Message;
        //        return false;
        //    }
        //}

        //protected void btnEditUserName_TextChanged(object sender, EventArgs e)
        //{
        //    ASPxButtonEdit edit = sender as ASPxButtonEdit;
        //    edit.Buttons[0].Visible = false;// edit.Text == string.Empty;
        //    //edit.Properties.Buttons[0].Visible = edit.Text == string.Empty;
        //}
    }
}
