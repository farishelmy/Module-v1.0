using DevExpress.Web;
using Module.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace Module
{
    public static class Utils
    {
        public static string _BIORISUrl = ConfigurationManager.AppSettings["BIORISUrl"];
        public static string _RepoID = ConfigurationManager.AppSettings["RepoID"];
        public static string _BioDateFormat = ConfigurationManager.AppSettings["BioDateFormat"];
        public static string _SearchLimit = ConfigurationManager.AppSettings["SearchLimit"];

        public enum Role
        {
            None,
            Clerk,
            LabManager,
            FacManager,
            Supervisor,
            Root,
            Signatory,
            RQAP,
            Administrator,
            Admin,
            KnowledgeWorker
        };

        public static void LogoutBioris()
        {
            try
            {
                if (!Utils.IsEmpty(UserSession.bio_access_id))
                {
                    StringWriter sw = new StringWriter();

                    using (JsonWriter writer = new JsonTextWriter(sw))
                    {
                        writer.Formatting = Formatting.None;

                        writer.WriteStartObject();

                        writer.WritePropertyName("bio_access_id");
                        writer.WriteValue(UserSession.bio_access_id);

                        writer.WriteEndObject();
                    }

                    string sParam = "param=" + sw.ToString();

                    string sResp = "";

                    Utils.GenerateRequest("Logout", sParam, "POST", ref sResp);
                }
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
            }
        }

        #region LOG
        public static void Log(Exception Ex)
        {
            try
            {
                Log("[ERROR] " + Ex.Message + "\r\n" + Ex.StackTrace);
            }
            catch { }
            {
            }
        }

        const string ConfigDirectory = "~/Config/";
        static HttpContext Context { get { return HttpContext.Current; } }
        public static string RootDirectory { get { return Context.Request.MapPath(ConfigDirectory); } }

        public static void Log(string sEvent)
        {
            try
            {
                if (sEvent.IndexOf("Thread was being aborted") > 0)
                    return;

                string logDir = Path.Combine(RootDirectory, "Logs"); // @"c:\Logs\";
                string path = Path.Combine(logDir, DateTime.Today.ToString("yyyyMMdd") + "_SLIS.log");
                //string path = HttpContext.Current.Server.MapPath("/Logs/" + DateTime.Today.ToString("yyyyMMdd") + ".log");
                //string path = Path.GetFullPath(ConfigurationManager.AppSettings["SaffronWorkArea"]) + @"\Logs\" + DateTime.Today.ToString("yyyyMMdd") + ".log";

                if (!File.Exists(path))
                {
                    if (!Directory.Exists(logDir))
                        Directory.CreateDirectory(logDir);

                    using (StreamWriter sw = File.CreateText(path))
                    {
                        sw.WriteLine("[" + DateTime.Now.ToLongTimeString() + "]" + sEvent);
                        sw.Flush();
                        sw.Close();
                    }
                }
                else
                {
                    using (StreamWriter sw = File.AppendText(path))
                    {
                        sw.WriteLine("[" + DateTime.Now.ToLongTimeString() + "]" + sEvent);
                        sw.Flush();
                        sw.Close();
                    }
                }
            }
            catch
            {
            }
        }

        public static void LogDebug(string sEvent)
        {
            try
            {
                if (ConfigurationManager.AppSettings["EnableDebugLog"].Equals("true", StringComparison.OrdinalIgnoreCase))
                    Log("[DEBUG] " + sEvent);
            }
            catch { }
            {
            }
        }

        public static void LogDebug(Exception ex)
        {
            try
            {
                if (ConfigurationManager.AppSettings["EnableDebugLog"].Equals("true", StringComparison.OrdinalIgnoreCase))
                    Log("[DEBUG] " + ex.Message + "\n" + ex.StackTrace);
            }
            catch { }
            {
            }
        }
        #endregion

        public static bool AuthenticateBioris(string usrName, string repoName, string sPassword, ref string sMsg)
        {
            bool bSuccess = false;

            try
            {
                StringWriter sw = new StringWriter();

                using (JsonWriter writer = new JsonTextWriter(sw))
                {
                    writer.Formatting = Formatting.None;

                    writer.WriteStartObject();

                    writer.WritePropertyName("username");
                    writer.WriteValue(usrName);

                    writer.WritePropertyName("password");
                    writer.WriteValue(sPassword);

                    writer.WritePropertyName("repository_id");
                    writer.WriteValue(repoName);//repo1 - slis | repo2 - pcos

                    writer.WritePropertyName("language_id");
                    writer.WriteValue("en_US");

                    writer.WriteEndObject();
                }

                string sParam = "param=" + sw.ToString();

                string sResp = "";

                Utils.cookieContainer = new CookieContainer();

                if (Utils.GenerateRequest("Login", sParam, "POST", ref sResp))
                {

                    if (deserializeLoginResp(sResp, ref sMsg))//get ROLE
                    {
                        bSuccess = true;// getStakeholderGroup(ref sMsg);//get GROUP
                    }
                }               

                return bSuccess;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
                sMsg += ex.Message;
                return false;
            }
        }

        private static bool deserializeLoginResp(string sResponse, ref string sMsg)
        {
            try
            {
                JavaScriptSerializer deserializer = new JavaScriptSerializer();

                Dictionary<string, object> deserializedDictionary = deserializer.Deserialize<Dictionary<string, object>>(sResponse);

                if (deserializedDictionary != null)
                {
                    if (deserializedDictionary.Count > 0)
                    {
                        if (deserializedDictionary.ContainsKey("message"))
                        {
                            object value = null;

                            if (deserializedDictionary.TryGetValue("message", out value))
                            {
                                sMsg += value.ToString();
                            }
                        }

                        if (deserializedDictionary.ContainsKey("results"))
                        {
                            ArrayList alResults = (ArrayList)deserializedDictionary["results"];

                            if (alResults.Count > 0)
                            {
                                Dictionary<string, object> dic = (Dictionary<string, object>)alResults[0];

                                object value = null;

                                if (dic.TryGetValue("bio_access_id", out value))
                                {
                                    UserSession.bio_access_id = value.ToString();
                                }

                                if (dic.TryGetValue("stakeholder_id", out value))
                                {
                                    UserSession.stakeholder_id = value.ToString();
                                }

                                if (dic.TryGetValue("stakeholder_name", out value))
                                {
                                    UserSession.stakeholder_name = value.ToString();
                                }                                                               

                                ////Get ROLES
                                if (dic.ContainsKey("roles"))
                                {
                                    ArrayList alRoles = (ArrayList)dic["roles"];

                                    if (alRoles.Count > 0)
                                    {
                                        Dictionary<string, object> dic_roles = (Dictionary<string, object>)alRoles[0];

                                        //object obj_role_id = null;

                                        if (dic_roles.TryGetValue("title", out value))
                                        {
                                            UserSession.roles_tittle = value.ToString();
                                            //getRole(obj_role_id.ToString()); /////check the valida of roles
                                        }
                                    }
                                }
                            }


                        }
                    }
                }

                //even if login failed, the success return is still true, so have to check for results BioAccessId 
                if (!Utils.IsEmpty(UserSession.bio_access_id) && !Utils.IsEmpty(UserSession.stakeholder_id))
                {
                    Utils.LogDebug("[Utils.cs][deserializeLoginResp] bio_access_id: " + UserSession.bio_access_id);
                    Utils.LogDebug("[Utils.cs][deserializeLoginResp] stakeholder_id: " + UserSession.stakeholder_id);
                    sMsg = "";

                    if (UserSession.roles_tittle != null)
                    {
                        return true;
                    }
                    else
                    {
                        sMsg = "No role found.";
                    }
                }

                return false;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                sMsg += ex.Message;

                return false;
            }
        }

        //private static void getRole(string sRoleId)
        //{
        //    try
        //    {
        //        Utils.LogDebug("[Utils.cs][getRole] Role_id: " + sRoleId);

        //        switch (sRoleId)
        //        {

        //            case "role-1111111111":
        //            case "role-3333333333":
        //                UserSession.role = Role.Admin;
        //                break;
        //            case "role-b6a0793f60244d8c986a30a804420494":
        //                UserSession.role = Role.KnowledgeWorker;

        //                break;
        //            default:
        //                UserSession.role = Role.None;
        //                break;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Utils.Log(ex);
        //    }
        //}

        public static bool IsEmpty(string sText)
        {
            try
            {
                if (sText == null)
                {
                    return true;
                }

                if (string.IsNullOrEmpty(sText.Trim()))
                {
                    return true;
                }

                if (sText == "undefined" || sText == "null")
                {
                    return true;
                }

                return false;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                return false;
            }
        }

        public static CookieContainer cookieContainer
        {
            get
            {
                if (HttpContext.Current.Session["cookieContainer_" + UserSession.sessionID] != null)
                    return (CookieContainer)HttpContext.Current.Session["cookieContainer_" + UserSession.sessionID];

                return null;
            }
            set
            {
                if (UserSession.sessionID == null)
                    UserSession.sessionID = Guid.NewGuid().ToString();

                HttpContext.Current.Session["cookieContainer_" + UserSession.sessionID] = value;
            }
        }

        public static bool GenerateRequest(string sAction, string sQueryString, string sMethod, ref string sResponse)
        {
            try
            {
                string url = Utils._BIORISUrl + sAction;

                //sQueryString = HttpUtility.UrlEncode(sQueryString);

               
                
                if (sMethod == "GET" || sMethod == "PUT" || sMethod == "DELETE")
                {
                    //sQueryString = HttpUtility.UrlEncode(sQueryString);

                    url += "?" + sQueryString;

                    Utils.LogDebug("[Utils.cs][GenerateRequest] GET/PUT/DELETE Url: " + url);

                    //Utils.Log(url += "?" + sQueryString);
                }

                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

                request.CookieContainer = cookieContainer;

                request.Method = sMethod;

                request.Timeout = 900000; // 15 min

                if (sMethod == "POST")
                {
                    Utils.LogDebug("[Utils.cs][GenerateRequest] POST QueryString: " + sQueryString);

                    byte[] dataByte = Encoding.UTF8.GetBytes(sQueryString);

                    request.ContentType = "application/x-www-form-urlencoded";

                    request.ContentLength = sQueryString.Length;

                    using (Stream reqStream = request.GetRequestStream())
                    {
                        reqStream.Write(dataByte, 0, dataByte.Length);
                    }
                }

                //Get Response

                HttpWebResponse GETResponse = (HttpWebResponse)request.GetResponse();

                using (Stream GETResponseStream = GETResponse.GetResponseStream())
                {
                    using (StreamReader sr = new StreamReader(GETResponseStream))
                    {
                        sResponse = sr.ReadToEnd().ToString();//.ReadLine().ToString();

                        if (IsEmpty(sResponse))
                        {
                            sResponse = "No response from server.";

                            Utils.LogDebug("[Utils.cs][GenerateRequest] " + sResponse);

                            return false;
                        }
                        else
                            Utils.LogDebug("[Utils.cs][GenerateRequest] Response: " + sResponse);
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                sResponse = ex.Message;

                return false;
            }
        }

        /***************************************** END OF LOGIN **************************************************************/

        public static bool Contains(this string source, string toCheck, StringComparison comp)
        {
            return source.IndexOf(toCheck, comp) >= 0;
        }


        public static bool SearchRecord(string sQuery, List<string> listRecordTypeId, ref List<Bio_Record> listBioRecs, ref string sMsg)
        {
            try
            {
                StringWriter sw = new StringWriter();

                using (JsonWriter writer = new JsonTextWriter(sw))
                {
                    writer.Formatting = Formatting.None;

                    writer.WriteStartObject();

                    writer.WritePropertyName("bio_access_id");
                    writer.WriteValue(UserSession.bio_access_id);

                    writer.WritePropertyName("action");
                    writer.WriteValue("ADVANCED_SEARCH_PAGING");

                    writer.WritePropertyName("query");
                    writer.WriteValue(sQuery);

                    //add sorting
                    writer.WritePropertyName("sort_key");
                    writer.WriteValue("date_registered");

                    writer.WritePropertyName("sort_order");
                    writer.WriteValue("DESC");

                    if (listRecordTypeId != null && listRecordTypeId.Count > 0)
                    {
                        writer.WritePropertyName("record_type_ids");
                        writer.WriteStartArray();
                        foreach (string sRecordTypeId in listRecordTypeId)
                        {
                            if (!Utils.IsEmpty(sRecordTypeId))
                            {

                                writer.WriteValue(sRecordTypeId);//filter by rectype

                            }
                        }
                        writer.WriteEndArray();
                    }

                    writer.WriteEndObject();
                }

                string sParam = "param=" + HttpUtility.UrlEncode(sw.ToString()) + "&limit=" + Utils._SearchLimit;//&start

                string sResp = "";

                if (Utils.GenerateRequest("RecordSearch", sParam, "POST", ref sResp))
                {
                    int count = 0;

                    return deserializeSearchRecResp(sResp, ref listBioRecs, ref count, ref sMsg);
                }
                else
                {
                    sMsg += sResp;
                }

                return false;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
                return false;
            }
        }

        private static bool deserializeSearchRecResp(string sResponse, ref List<Bio_Record> listBioRecs, ref Int32 count, ref string sMsg)
        {
            try
            {
                JavaScriptSerializer deserializer = new JavaScriptSerializer();

                Dictionary<string, object> deserializedDictionary = deserializer.Deserialize<Dictionary<string, object>>(sResponse);

                if (deserializedDictionary != null)
                {
                    if (deserializedDictionary.Count > 0)
                    {
                        if (deserializedDictionary.ContainsKey("count"))
                        {
                            count = (Int32)deserializedDictionary["count"];
                        }

                        if (deserializedDictionary.ContainsKey("results"))
                        {
                            ArrayList alResults = (ArrayList)deserializedDictionary["results"];

                            if (alResults.Count > 0)
                            {
                                Utils.LogDebug("[Utils.cs][deserializeSearchRecResp] Search result count: " + alResults.Count);

                                listBioRecs = new List<Bio_Record>();

                                for (int i = 0; i < alResults.Count; i++)
                                {
                                    Bio_Record bioRec = new Bio_Record();

                                    Dictionary<string, object> dic = (Dictionary<string, object>)alResults[i];

                                    object value = null;

                                    if (dic.TryGetValue("record_id", out value))
                                    {
                                        if (value != null && !Utils.IsEmpty(value.ToString()))
                                        {
                                            //Utils.LogDebug("[Utils.cs][deserializeSearchRecResp] record_id: " + value.ToString());

                                            bioRec.record_id = value.ToString();
                                        }
                                    }

                                    value = null;

                                    if (dic.TryGetValue("record_no", out value))
                                    {
                                        if (value != null && !Utils.IsEmpty(value.ToString()))
                                        {
                                            //Utils.LogDebug("[Utils.cs][deserializeSearchRecResp] record_no: " + value.ToString());

                                            bioRec.record_no = value.ToString();
                                        }
                                    }

                                    value = null;

                                    if (dic.TryGetValue("title", out value))
                                    {
                                        if (value != null && !Utils.IsEmpty(value.ToString()))
                                        {
                                            //Utils.LogDebug("[Utils.cs][deserializeSearchRecResp] title: " + value.ToString());

                                            bioRec.title = value.ToString();
                                        }
                                    }

                                    value = null;

                                    if (dic.TryGetValue("parent_id", out value))
                                    {
                                        if (value != null && !Utils.IsEmpty(value.ToString()))
                                        {
                                            //Utils.LogDebug("[Utils.cs][deserializeSearchRecResp] parent_id: " + value.ToString());

                                            bioRec.parent_id = value.ToString();
                                        }
                                    }

                                    value = null;

                                    if (dic.TryGetValue("record_type_id", out value))
                                    {
                                        if (value != null && !Utils.IsEmpty(value.ToString()))
                                        {
                                            //Utils.LogDebug("[Utils.cs][deserializeSearchRecResp] record_type_id: " + value.ToString());

                                            bioRec.record_type_id = value.ToString();
                                        }
                                    }

                                    listBioRecs.Add(bioRec);
                                }//for
                            }
                        }
                    }
                }

                if (listBioRecs != null && listBioRecs.Count > 0)
                    return true;

                sMsg += "No records found.";

                return false;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                sMsg += ex.Message;

                return false;
            }
        }       

        public static bool ViewRecord(string sRecordId, ref Bio_Record bioRecord, ref string sMsg)
        {
            try
            {
                StringWriter sw = new StringWriter();

                using (JsonWriter writer = new JsonTextWriter(sw))
                {
                    writer.Formatting = Formatting.None;

                    writer.WriteStartObject();

                    writer.WritePropertyName("bio_access_id");
                    writer.WriteValue(UserSession.bio_access_id);

                    writer.WritePropertyName("action");
                    writer.WriteValue("ITEM_DETAIL");

                    writer.WritePropertyName("record_id");
                    writer.WriteValue(sRecordId);

                    writer.WriteEndObject();
                }

                string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

                string sResp = "";

                if (Utils.GenerateRequest("Record", sParam, "GET", ref sResp))
                {
                    deserializeRecordResp(sResp, ref bioRecord, ref sMsg);
                }
                else
                {
                    sMsg += sResp;
                }

                if (bioRecord != null)
                    return true;

                return false;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
                sMsg += ex.Message;
                return false;
            }
        }

        public static string GetCustomFieldValue(ref Bio_Record biorecord, string custom_field_id)
        {
            //try
            //{

            CustomField cf = biorecord.record_metadata[0].section_field.Find(x => x.custom_field_id == custom_field_id);

            if (cf != null)
            {
                object v = cf.value;

                if (v != null)
                    return HttpUtility.UrlDecode(v.ToString());
            }
            else
            {
                Utils.Log("[Utils.cs][GetCustomFieldValue] Unable to find custom field [" + custom_field_id + "] in record [" + biorecord.record_id + "]");
            }

            return "";
            //}
            //catch (Exception ex)
            //{
            //    Utils.Log(ex);
            //    return "";
            //}
        }

        public static Bio_Record GetLabRecord(ref Bio_Record bioRec)
        {
            string sMsg = "";

            try
            {
                if (bioRec.parent_id != null && bioRec.parent_id != "")
                {
                    Bio_Record labRecord = null;

                    if (Utils.ViewRecord(bioRec.parent_id, ref labRecord, ref sMsg))
                    {
                        return labRecord;
                    }
                }
                else
                    Utils.Log("[Utils.cs][GetLabRecord] BioRecord.parent_id is null: " + bioRec.record_id);

                return null;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
                return null;
            }
        }

        private static bool deserializeRecordResp(string sResponse, ref Bio_Record bioRecord, ref string sMsg)
        {
            bool bSuccess = false;

            try
            {
                JavaScriptSerializer deserializer = new JavaScriptSerializer();

                Dictionary<string, object> deserializedDictionary = deserializer.Deserialize<Dictionary<string, object>>(sResponse);

                if (deserializedDictionary != null)
                {
                    if (deserializedDictionary.Count > 0)
                    {
                        if (deserializedDictionary.ContainsKey("results"))
                        {
                            ArrayList alResults = (ArrayList)deserializedDictionary["results"];

                            if (alResults.Count > 0)
                            {
                                Dictionary<string, object> dic = (Dictionary<string, object>)alResults[0];

                                string json = JsonConvert.SerializeObject(dic, Formatting.None);

                                //Utils.LogDebug("[Utils.cs][deserializeRecordResp] Json: " + json);

                                bioRecord = JsonConvert.DeserializeObject<Bio_Record>(json);

                                bSuccess = true;
                            }
                        }
                    }
                }

                return bSuccess;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                sMsg += ex.Message;

                return false;
            }
        }        

        private static bool deserializeStakeholderResp(string sResponse, ref string sFirst_Name, ref string sStakeholderId, ref string sMsg)
        {
            bool bSuccess = true;

            try
            {
                JavaScriptSerializer deserializer = new JavaScriptSerializer();

                Dictionary<string, object> deserializedDictionary = deserializer.Deserialize<Dictionary<string, object>>(sResponse);

                if (deserializedDictionary != null)
                {
                    if (deserializedDictionary.Count > 0)
                    {
                        if (deserializedDictionary.ContainsKey("results"))
                        {
                            ArrayList alResults = (ArrayList)deserializedDictionary["results"];

                            if (alResults.Count > 0)
                            {
                                Dictionary<string, object> dic = (Dictionary<string, object>)alResults[0];

                                object value = null;

                                if (dic.TryGetValue("first_name", out value))
                                {
                                    if (value != null && !Utils.IsEmpty(value.ToString()))
                                    {
                                        sFirst_Name = value.ToString();
                                        Utils.LogDebug("[Utils.cs][deserializeStakeholderResp] first_name: " + value.ToString());
                                    }
                                }

                                value = null;

                                if (dic.TryGetValue("stakeholder_id", out value))
                                {
                                    if (value != null && !Utils.IsEmpty(value.ToString()))
                                    {
                                        sStakeholderId = value.ToString();
                                        Utils.LogDebug("[Utils.cs][deserializeStakeholderResp] stakeholder_id: " + value.ToString());
                                    }
                                }
                            }
                        }
                    }
                }

                if (Utils.IsEmpty(sFirst_Name) || Utils.IsEmpty(sStakeholderId))
                {
                    return false;
                }

                return bSuccess;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                sMsg += ex.Message;

                return false;
            }
        }

        public static bool deserializeStakeholderResp(string sResponse, ref List<Stakeholder> listStkh, ref string sMsg)
        {
            try
            {
                listStkh = new List<Stakeholder>();

                JavaScriptSerializer deserializer = new JavaScriptSerializer();

                Dictionary<string, object> deserializedDictionary = deserializer.Deserialize<Dictionary<string, object>>(sResponse);                

                if (deserializedDictionary != null)
                {
                    if (deserializedDictionary.Count > 0)
                    {
                        if (deserializedDictionary.ContainsKey("results"))
                        {
                            ArrayList alResults = (ArrayList)deserializedDictionary["results"];                                                      

                            if (alResults.Count > 0)
                            {
                                for (int i = 0; i < alResults.Count; i++)
                                {
                                    Stakeholder stkh = new Stakeholder();

                                    Dictionary<string, object> dic = (Dictionary<string, object>)alResults[i];

                                    string json = JsonConvert.SerializeObject(dic, Formatting.None);                                  

                                    Utils.LogDebug("[Utils.cs][deserializeRecordResp] Json: " + json);                                    

                                    stkh = JsonConvert.DeserializeObject<Stakeholder>(json);
                                    stkh.Id = i;

                                    listStkh.Add(stkh);

                                   

                                                                     
                                                //        }

                                                //    }

                                                //}



                                                /*
                                                object value = null;

                                                if (dic.TryGetValue("first_name", out value))
                                                {
                                                    if (value != null && !Utils.IsEmpty(value.ToString()))
                                                    {
                                                        stkh.first_name = value.ToString();
                                                        //Utils.LogDebug("[Utils.cs][deserializeStakeholderResp] first_name: " + value.ToString());
                                                    }
                                                }

                                                if (dic.TryGetValue("full_name", out value))
                                                {
                                                    if (value != null && !Utils.IsEmpty(value.ToString()))
                                                    {
                                                        stkh.first_name = value.ToString();
                                                        //Utils.LogDebug("[Utils.cs][deserializeStakeholderResp] first_name: " + value.ToString());
                                                    }
                                                }

                                                if (dic.TryGetValue("stakeholder_id", out value))
                                                {
                                                    if (value != null && !Utils.IsEmpty(value.ToString()))
                                                    {
                                                        stkh.stakeholder_id = value.ToString();
                                                        //Utils.LogDebug("[Utils.cs][deserializeStakeholderResp] stakeholder_id: " + value.ToString());
                                                    }
                                                }
                                                */

                                          
                                }
                            }
                        }
                    }
                }

                if (listStkh != null && listStkh.Count > 0)
                {
                    return true;
                }

                return false;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                sMsg += ex.Message;

                return false;
            }
        }

        public static bool deserializeRoleResp(string sResponse, ref List<SecRole> listRole, ref string sMsg)
        {
            try
            {
                listRole = new List<SecRole>();

                JavaScriptSerializer deserializer = new JavaScriptSerializer();

                Dictionary<string, object> deserializedDictionary = deserializer.Deserialize<Dictionary<string, object>>(sResponse);

                if (deserializedDictionary != null)
                {
                    if (deserializedDictionary.Count > 0)
                    {
                        if (deserializedDictionary.ContainsKey("results"))
                        {
                            ArrayList alResults = (ArrayList)deserializedDictionary["results"];

                            if (alResults.Count > 0)
                            {
                                for (int i = 0; i < alResults.Count; i++)
                                {
                                    SecRole rol = new SecRole();

                                    Dictionary<string, object> dic = (Dictionary<string, object>)alResults[i];

                                    string json = JsonConvert.SerializeObject(dic, Formatting.None);

                                    Utils.LogDebug("[Utils.cs][deserializeRecordResp] Json: " + json);

                                    rol = JsonConvert.DeserializeObject<SecRole>(json);
                                    rol.Id = i;

                                    listRole.Add(rol);


                                    


                                }
                            }
                        }
                    }
                }

                if (listRole != null && listRole.Count > 0)
                {
                    return true;
                }

                return false;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                sMsg += ex.Message;

                return false;
            }
        }

        public static bool deserializeAddChild(string sResponse, ref List<Stakeholder> listStkh, ref string sMsg)
        {
            Utils.Log("util"+sResponse);

            try
            {
                listStkh = new List<Stakeholder>();

                Stakeholder child = new Stakeholder();

                JavaScriptSerializer deserializer = new JavaScriptSerializer();

                Dictionary<string, object> deserializedDictionary = deserializer.Deserialize<Dictionary<string, object>>(sResponse);

                Dictionary<string, object> dic = (Dictionary<string, object>)deserializedDictionary;

                string json = JsonConvert.SerializeObject(dic, Formatting.None);

                Utils.LogDebug("[Utils.cs][deserializeRecordResp] Json: " + json);

                child = JsonConvert.DeserializeObject<Stakeholder>(json);                

                listStkh.Add(child);

                if (listStkh != null && listStkh.Count > 0)
                {
                    return true;
                }

                return false;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                sMsg += ex.Message;

                return false;
            }
        }

        public static void SetCustomFieldValue(ref Bio_Record biorecord, string custom_field_id, string value)
        {
            CustomField cf = biorecord.record_metadata[0].section_field.Find(x => x.custom_field_id == custom_field_id);

            if (cf != null)
            {
                cf.value = value;
            }
            else
            {
                biorecord.record_metadata[0].section_field.Add(new CustomField(custom_field_id, value));
            }
        }


        public static float? GetCustomFieldValueDecimal(ref Bio_Record biorecord, string custom_field_id)
        {
            //try
            //{
            CustomField cf = biorecord.record_metadata[0].section_field.Find(x => x.custom_field_id == custom_field_id);

            if (cf != null)
            {
                object v = biorecord.record_metadata[0].section_field.Find(x => x.custom_field_id == custom_field_id).value;

                float iVal = 0;
                if (v != null && !Utils.IsEmpty(v.ToString()) && float.TryParse(v.ToString(), out iVal))
                    return iVal;
            }
            else
            {
                Utils.Log("[Utils.cs][GetCustomFieldValueDecimal] Unable to find custom field [" + custom_field_id + "] in record [" + biorecord.record_id + "]");
            }

            return null;
            //}
            //catch (Exception ex)
            //{
            //    Utils.Log(ex);
            //    return null;
            //}
        }

        private static bool deserializePOSTFormResp(string sResponse, ref string sRecord_Id, ref string sMsg)
        {
            bool bSuccess = false;

            try
            {
                JavaScriptSerializer deserializer = new JavaScriptSerializer();

                Dictionary<string, object> deserializedDictionary = deserializer.Deserialize<Dictionary<string, object>>(sResponse);

                if (deserializedDictionary != null)
                {
                    if (deserializedDictionary.Count > 0)
                    {
                        if (deserializedDictionary.ContainsKey("success"))
                        {
                            object value = null;

                            if (deserializedDictionary.TryGetValue("success", out value))
                            {
                                if (value.ToString().ToUpper() == "TRUE")
                                    bSuccess = true;
                            }
                        }

                        if (!bSuccess)//if not sucess, get the message
                        {
                            if (deserializedDictionary.ContainsKey("message"))
                            {
                                object value = null;

                                if (deserializedDictionary.TryGetValue("message", out value))
                                {
                                    sMsg += value.ToString();
                                }
                            }
                        }

                        if (deserializedDictionary.ContainsKey("record_id"))
                        {
                            object value = null;

                            if (deserializedDictionary.TryGetValue("record_id", out value))
                            {
                                sRecord_Id = value.ToString();
                            }
                        }
                    }
                }

                return bSuccess;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                sMsg += ex.Message;

                return false;
            }
        }

        public static void CheckJsonBioris(ref Bio_Record bioRec)
        {
            try
            {
                if (!Utils.IsEmpty(bioRec.record_no))
                {
                    CustomField cf = bioRec.record_metadata[0].section_field.Find(x => x.custom_field_id == "record_no");
                    if (cf == null)
                    {
                        bioRec.record_metadata[0].section_field.Add(new CustomField("record_no", bioRec.record_no));
                    }
                }

                if (!Utils.IsEmpty(bioRec.parent_id))
                {
                    CustomField cf = bioRec.record_metadata[0].section_field.Find(x => x.custom_field_id == "parent_id");
                    if (cf == null)
                    {
                        bioRec.record_metadata[0].section_field.Add(new CustomField("parent_id", bioRec.parent_id));
                    }
                }

                if (!Utils.IsEmpty(bioRec.title))
                {
                    CustomField cf = bioRec.record_metadata[0].section_field.Find(x => x.custom_field_id == "title");
                    if (cf == null)
                    {
                        bioRec.record_metadata[0].section_field.Add(new CustomField("title", bioRec.title));
                    }
                }
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
            }
        }

        private static string getContentType(string sFileExtension)
        {
            try
            {
                string sContentType = "";

                switch (sFileExtension.ToLower())
                {

                    case "doc":
                    case "docx":
                        sContentType = "application/msword";
                        break;
                    case "ppt":
                        sContentType = "application/mspowerpoint";
                        break;
                    case "xls":
                        sContentType = "application/msexcel";
                        break;
                    case "pdf":
                        sContentType = "application/pdf";
                        break;
                    case "rtf":
                        sContentType = "application/rtf";
                        break;
                    case "zip":
                        sContentType = "application/zip";
                        break;
                    case "html":
                    case "htm":
                        sContentType = "text/html";
                        break;
                    case "txt":
                        sContentType = "text/plain";
                        break;
                    case "gif":
                        sContentType = "image/gif";
                        break;
                    case "png":
                        sContentType = "image/x-png";
                        break;
                    case "jpeg":
                    case "jpg":
                        sContentType = "image/jpeg";
                        break;
                    case "tiff":
                    case "tif":
                        sContentType = "image/tiff";
                        break;

                    case "msg":
                        sContentType = "application/vnd.ms-outlook";
                        break;

                    default:
                        sContentType = "application/OCTET-STREAM";
                        break;
                }

                return sContentType;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
                return "";
            }
        }

        public static bool POSTFormRequest(string sAction, string sFilePath, ref Bio_Record bioRecord, ref string sRecord_Id, ref string sMsg)
        {
            bool bSuccess = false;

            try
            {
                if (Utils.IsEmpty(UserSession.bio_access_id))
                {
                    sMsg += "Bio_access_id is empty.";
                    return bSuccess;
                }

                bioRecord.bio_access_id = UserSession.bio_access_id;
                bioRecord.action = "SAVE_RECORD";

                CheckJsonBioris(ref bioRecord);

                string sParam = JsonConvert.SerializeObject(bioRecord, Formatting.None);

                Utils.LogDebug("[Utils.cs][POSTFormRequest] Param: " + sParam);
                // Generate post objects
                Dictionary<string, object> dicPostParameters = new Dictionary<string, object>();
                dicPostParameters.Add("param", sParam);

                if (!Utils.IsEmpty(sFilePath) && File.Exists(sFilePath))
                {
                    string sFileName = Path.GetFileName(sFilePath);
                    string sFileFormat = Path.GetExtension(sFilePath).Remove(0, 1);
                    string sContentType = getContentType(sFileFormat);

                    FileStream fs = new FileStream(sFilePath, FileMode.Open, FileAccess.Read);
                    byte[] data = new byte[fs.Length];
                    fs.Read(data, 0, data.Length);
                    fs.Close();

                    dicPostParameters.Add("_file", new FormUpload.FileParameter(data, sFileName, sContentType));
                }

                // Create request and receive response
                string sPostURL = Utils._BIORISUrl + sAction;
                string sUserAgent = "BIORIS";

                Utils.LogDebug("[Utils.cs][POSTFormRequest] PostURL: " + sPostURL);

                HttpWebResponse webResponse = FormUpload.MultipartFormDataPost(sPostURL, sUserAgent, dicPostParameters);

                // Process response
                StreamReader responseReader = new StreamReader(webResponse.GetResponseStream());

                string sResp = responseReader.ReadToEnd();

                Utils.LogDebug("[Utils.cs][POSTFormRequest] Response: " + sResp);

                webResponse.Close();

                bSuccess = deserializePOSTFormResp(sResp, ref sRecord_Id, ref sMsg);

                return bSuccess;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                sMsg += ex.Message;

                return false;
            }
        }

        public static int GetTotalRecord(string sQuery, ref List<string> listFilterRT, ref string sMsg)
        {
            int iCount = 0;
            try
            {
                List<Bio_Record> listRecords = null;

                if (Utils.SearchRecord(sQuery, listFilterRT, ref listRecords, ref sMsg))
                {
                    if (listRecords != null)
                    {
                        iCount = listRecords.Count;
                    }
                }

                return iCount;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
                return iCount;
            }
        }                    

        public static bool ListContainer(int iLevel, ref List<Bio_Record> listBioRecs, ref string sMsg)
        {
            try
            {
                StringWriter sw = new StringWriter();

                using (JsonWriter writer = new JsonTextWriter(sw))
                {
                    writer.Formatting = Formatting.None;

                    writer.WriteStartObject();

                    writer.WritePropertyName("bio_access_id");
                    writer.WriteValue(UserSession.bio_access_id);

                    writer.WritePropertyName("action");
                    writer.WriteValue("LIST_CONTAINER");

                    writer.WritePropertyName("level");
                    writer.WriteValue(iLevel);

                    writer.WriteEndObject();
                }

                string sParam = "param=" + HttpUtility.UrlEncode(sw.ToString());

                string sResp = "";

                if (Utils.GenerateRequest("Record", sParam, "GET", ref sResp))
                {
                    int count = 0;

                    return deserializeSearchRecResp(sResp, ref listBioRecs, ref count, ref sMsg);
                }
                else
                {
                    sMsg += sResp;
                }

                return false;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
                return false;
            }
        }

        public static int GetTotalFacByYear()
        {
            int iTotalLot = 7;
            string sMsg = "";

            try
            {
                string sLabRecNo = UserSession.lab_record_no;

                if (sLabRecNo != "")
                {
                    List<string> listFilterRT = new List<string>();
                    listFilterRT.Add("rect-9e2e1ba359f44137a1f67b0ec3e59773");

                    DateTime today = DateTime.Now;
                    string sDtFrom = new DateTime(2017, 1, 1).ToString(Utils._BioDateFormat);
                    string sDtTo = new DateTime(today.Year, 12, 31).ToString(Utils._BioDateFormat);

                    //"query":"record_no:%22quostr%3BMKL/*%22quostr%3B&&(date_reg…22quostr%3BTO%22quostr%3B31/12/2018%22quostr%3B])","sort_key":"date_registered","sort_order":"DESC","record_type_ids":["rect-1fd4926de43741328c3c5e222e43e199"]}&limit=1000
                    //(date_registered:[%22quostr%3B01/01/2018%22quostr%3BTO%22quostr%3B31/12/2018%22quostr%3B])
                    iTotalLot = Utils.GetTotalRecord("(date_registered:[%22quostr%3B" + sDtFrom + "%22quostr%3BTO%22quostr%3B" + sDtTo + "%22quostr%3B])", ref listFilterRT, ref sMsg);
                }

                return iTotalLot;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
                return 0;
            }
        }

        public static Bio_Record SearchLabByStakeholderOrg()
        {
            string sMsg = "";

            try
            {
                //get user organization stakeholder id
                if (UserSession.stakeholder_org_id != null) //(Utils.getStakeholderOrganizationId(ref sOrgId, ref sMsg))
                {
                    //search lab container by stakeholderOrgId
                    List<Bio_Record> listLabRecords = null;

                    List<string> listFilterLab = new List<string>();
                    listFilterLab.Add("rect-86bcfa4ee1fb40eabfee96e576e4a9ea");

                    if (Utils.SearchRecord("stakeholder_id:%22quostr%3B" + UserSession.stakeholder_org_id + "%22quostr%3B", listFilterLab, ref listLabRecords, ref sMsg))
                    {
                        if (listLabRecords != null && listLabRecords.Count > 0)
                        {
                            return listLabRecords[0];
                        }
                        else
                            Utils.Log("[Utils.cs][SearchLabByStakeholderOrg] No lab found - " + UserSession.stakeholder_org_id);
                    }
                }
                else
                    Utils.Log("[Utils.cs][SearchLabByStakeholderOrg] stakeholder_org_id is empty.");

                return null;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);
                return null;
            }
        }

        public static bool getStakeholderOrganizationId(int stakeh_type, ref string sOrgId, ref string sMsg)
        {
            try
            {
                Utils.LogDebug("[Utils.cs][getStakeholderOrganization] Get stakeholder org by list ancestor type...");

                StringWriter sw = new StringWriter();

                using (JsonWriter writer = new JsonTextWriter(sw))
                {
                    writer.Formatting = Formatting.None;

                    writer.WriteStartObject();

                    writer.WritePropertyName("bio_access_id");
                    writer.WriteValue(UserSession.bio_access_id);

                    writer.WritePropertyName("stakeholder_id");
                    writer.WriteValue(UserSession.stakeholder_id);

                    writer.WritePropertyName("action");
                    writer.WriteValue("LIST_ANCESTOR_BY_TYPE");

                    writer.WritePropertyName("stakeh_type");
                    writer.WriteValue(stakeh_type);

                    writer.WriteEndObject();
                }

                string sParam = "param=" + sw.ToString();

                string sResp = "";

                if (Utils.GenerateRequest("Stakeholder", sParam, "GET", ref sResp))
                {
                    string sOrgName = "";
                    if (deserializeStakeholderResp(sResp, ref sOrgName, ref sOrgId, ref sMsg))
                    {
                        return true;
                    }
                    else
                    {
                        sMsg = "No organization found.";
                        Utils.Log("[Utils.cs][getStakeholderOrganizationId] No organization found for stakeholder: " + UserSession.stakeholder_id);
                    }
                }
                else
                {
                    sMsg += sResp;
                }

                return false;
            }
            catch (Exception ex)
            {
                Utils.Log(ex);

                sMsg += ex.Message;

                return false;
            }
        }






    }
}