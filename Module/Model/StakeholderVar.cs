using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Module.Model
{
    public class StakeholderVar
    {
        ///////////////////////GET ALL ROLE///////////////////////////////////

        public List<SecRole> GetAllRole()
        {
            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);


                writer.WritePropertyName("action");
                writer.WriteValue("ITEM_LIST");

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            List<SecRole> list = new List<SecRole>();

            if (Utils.GenerateRequest("Role", sParam, "GET", ref sResp))
            {
                Utils.deserializeRoleResp(sResp, ref list, ref sMsg);
                //Utils.Log(sResp);
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }



        ///////////////////////GET ALL STAKEHOLDER///////////////////////////////////

        public List<Stakeholder> GetStakeholder()
        {
            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);


                writer.WritePropertyName("action");
                writer.WriteValue("ITEM_LIST");

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "GET", ref sResp))
            {
                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);               
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }

        /////////////////////// GET STAKEHOLDER GROUP ////////////////////////

        public List<Stakeholder> GetGroupStakeholder(string Id)
        {
            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("stakeholder_id");
                writer.WriteValue(Id);

                writer.WritePropertyName("action");
                writer.WriteValue("ITEM_LIST_GROUP");

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "GET", ref sResp))
            {
                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }

        ///////////////////////GET ALL TYPE GROUP ///////////////////////////////////

        public List<Stakeholder> GetAllTypeGroup(int iType)
        {

            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("action");
                writer.WriteValue("ITEM_LIST_ANCESTOR");                

                writer.WritePropertyName("stakeh_type");
                writer.WriteValue(iType);

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "GET", ref sResp))
            {
                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);
                //Utils.Log("ALLGROUP" + sResp);
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }

        ///////////////////////GET ALL TYPE MEMBER ///////////////////////////////////

        public List<Stakeholder> GetAllTypeMember(int iType)
        {

            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("action");
                writer.WriteValue("ITEM_LIST_DESCENDANT");

                writer.WritePropertyName("stakeh_type");
                writer.WriteValue(iType);

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "GET", ref sResp))
            {
                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);
                //Utils.Log("member" + sResp);
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }


        /////////////////////// GET STAKEHOLDER MEMBER ////////////////////////

        public List<Stakeholder> GetMemberStakeholder(string Id)
        {
            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("stakeholder_id");
                writer.WriteValue(Id);

                writer.WritePropertyName("action");
                writer.WriteValue("ITEM_LIST_MEMBER");

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "GET", ref sResp))
            {
                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }

        /////////////////////// GET STAKEHOLDER ACCESS ////////////////////////

        public List<Stakeholder> GetAccStakeholder(string Id)
        {
            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("stakeholder_id");
                writer.WriteValue(Id);

                writer.WritePropertyName("action");
                writer.WriteValue("ITEM_ACCESS");

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "GET", ref sResp))
            {
                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }

        ///////////////////////GET TYPE STAKEHOLDER///////////////////////////////////

        public List<Stakeholder> GetTypeStakeholder(int iType)
        {
            
            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("action");
                writer.WriteValue("ITEM_LIST_TYPE");

                writer.WritePropertyName("stakeholder_id");
                writer.WriteValue(UserSession.stakeholder_id);

                writer.WritePropertyName("stakeh_type");
                writer.WriteValue(iType);

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "GET", ref sResp))
            {
               Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);
                
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }

        ///////////////////////GET DETAILS STAKEHOLDER///////////////////////////////////

        public List<Stakeholder> GetStakeholderId(string Id)
        {
            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("stakeholder_id");
                writer.WriteValue(Id);

                writer.WritePropertyName("action");
                writer.WriteValue("ITEM_DETAIL");

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "GET", ref sResp))
            {
                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);

                //Utils.Log("StakeholderVar" + list);
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }
                

        ////////////////////////////// CREATE /////////////////////////////////

        public List<Stakeholder> PutAddStakeholder(Stakeholder author)
        {

            //Utils.Log("Var" + author);

            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                object obj = null;

                object fal = false;

                object val = 5;

                object vali = 0;

               
                writer.WritePropertyName("stakeh_type_name");
                writer.WriteRawValue(author.stakeh_type_name);             //java.lang.String cannot be cast to java.lang.Long

                writer.WritePropertyName("initials");
                writer.WriteValue(author.initials);

                writer.WritePropertyName("first_name");
                writer.WriteValue(author.first_name);

                writer.WritePropertyName("last_name");
                writer.WriteValue(author.last_name);

                writer.WritePropertyName("full_name");
                writer.WriteValue(author.full_name);                      //string or null

                writer.WritePropertyName("email");
                writer.WriteValue(author.email);

                writer.WritePropertyName("date_of_birth");
                writer.WriteValue(author.date_of_birth);

                writer.WritePropertyName("version");
                writer.WriteValue(vali);                        //java.lang.String cannot be cast to java.lang.Long

                writer.WritePropertyName("stakeh_type");
                writer.WriteRawValue(author.stakeh_type_name);                        //java.lang.String cannot be cast to java.lang.Long

                writer.WritePropertyName("stakeholder_id");
                writer.WriteValue(author.stakeholder_id);

                writer.WritePropertyName("id_number");
                writer.WriteValue(author.id_number);

                writer.WritePropertyName("acl_id");
                writer.WriteValue(author.acl_id);

                writer.WritePropertyName("internal");
                writer.WriteRawValue(author.Internal);                          //boolean

                writer.WritePropertyName("is_blocked");
                writer.WriteRawValue(author.is_blocked);                             //boolean

                writer.WritePropertyName("can_login");
                writer.WriteRawValue(author.can_login);                           //boolean

                writer.WritePropertyName("login_username");
                writer.WriteValue(author.login_username);

                writer.WritePropertyName("password");
                writer.WriteValue(author.password);

                writer.WritePropertyName("role_value");
                writer.WriteValue(author.role_value);

                writer.WritePropertyName("role_id");
                writer.WriteValue(author.role_id);

                writer.WritePropertyName("security_level_value");
                writer.WriteValue(obj);

                writer.WritePropertyName("security_lvl_id");
                writer.WriteValue(obj);

                writer.WritePropertyName("active");
                writer.WriteRawValue(author.active);                        //boolean

                writer.WritePropertyName("date_active_from");
                writer.WriteValue(author.date_active_from);

                writer.WritePropertyName("date_active_to");
                writer.WriteValue(author.date_active_to);

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("acl_entries");
                writer.WriteValue(obj);                     //array

                writer.WritePropertyName("custom_field");
                writer.WriteValue(obj);                  //array

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString()/*.Replace("\"","")*/;// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            //Utils.Log(sParam);

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "PUT", ref sResp))
            {
                //Utils.Log(" Response " + sResp);

                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);

               
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }

        ///////////////////////DELETE///////////////////////////////////

        public List<Stakeholder> DeleteStakeholder(string Id  )
        {
            string sMsg = "";

            StringWriter sw = new StringWriter();           

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                

                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("stakeholder_ids");
                writer.WriteStartArray();
                writer.WriteValue(Id);
                writer.WriteEnd();


                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "DELETE", ref sResp))
            {
                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);
               
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }

        ////////////////////////////// ADD CHILD /////////////////////////////////

        public List<Stakeholder> AddChild(string parent_id, string child_id)
        {

            //Utils.Log("Var" + author);

            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                object cond = false;                

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("action");
                writer.WriteValue("ADD_CHILD_ITEM");

                writer.WritePropertyName("parent_id");
                writer.WriteValue(parent_id);

                writer.WritePropertyName("child_id");
                writer.WriteValue(child_id);

                writer.WritePropertyName("def_organization");
                writer.WriteValue(cond);

                writer.WritePropertyName("def_group");
                writer.WriteValue(cond);

                writer.WritePropertyName("def_department");
                writer.WriteValue(cond);

                writer.WritePropertyName("def_designation");
                writer.WriteValue(cond);

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            //Utils.Log(sParam);

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "POST", ref sResp))
            {
                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);

                Utils.Log(" Response " + sResp);
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }

        ////////////////////////////// CREATE ADD CHILD /////////////////////////////////

        public List<Stakeholder> PutAddChild(Stakeholder author)
        {

            //Utils.Log("Var" + author);

            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                object obj = null;

                object fal = false;

                object val = 5;

                object vali = 0;


                writer.WritePropertyName("stakeh_type_name");
                writer.WriteRawValue(author.stakeh_type_name);             //java.lang.String cannot be cast to java.lang.Long

                writer.WritePropertyName("initials");
                writer.WriteValue(author.initials);

                writer.WritePropertyName("first_name");
                writer.WriteValue(author.first_name);

                writer.WritePropertyName("last_name");
                writer.WriteValue(author.last_name);

                writer.WritePropertyName("full_name");
                writer.WriteValue(author.full_name);                      //string or null

                writer.WritePropertyName("email");
                writer.WriteValue(author.email);

                writer.WritePropertyName("date_of_birth");
                writer.WriteValue(author.date_of_birth);

                writer.WritePropertyName("version");
                writer.WriteValue(vali);                        //java.lang.String cannot be cast to java.lang.Long

                writer.WritePropertyName("stakeh_type");
                writer.WriteRawValue(author.stakeh_type_name);                        //java.lang.String cannot be cast to java.lang.Long

                writer.WritePropertyName("stakeholder_id");
                writer.WriteValue(author.stakeholder_id);

                writer.WritePropertyName("id_number");
                writer.WriteValue(author.id_number);

                writer.WritePropertyName("acl_id");
                writer.WriteValue(author.acl_id);

                writer.WritePropertyName("internal");
                writer.WriteRawValue(author.Internal);                          //boolean

                writer.WritePropertyName("is_blocked");
                writer.WriteRawValue(author.is_blocked);                             //boolean

                writer.WritePropertyName("can_login");
                writer.WriteRawValue(author.can_login);                           //boolean

                writer.WritePropertyName("login_username");
                writer.WriteValue(author.login_username);

                writer.WritePropertyName("password");
                writer.WriteValue(author.password);

                writer.WritePropertyName("role_value");
                writer.WriteValue(author.role_value);

                writer.WritePropertyName("role_id");
                writer.WriteValue(author.role_id);

                writer.WritePropertyName("security_level_value");
                writer.WriteValue(obj);

                writer.WritePropertyName("security_lvl_id");
                writer.WriteValue(obj);

                writer.WritePropertyName("active");
                writer.WriteRawValue(author.active);                        //boolean

                writer.WritePropertyName("date_active_from");
                writer.WriteValue(author.date_active_from);

                writer.WritePropertyName("date_active_to");
                writer.WriteValue(author.date_active_to);

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("acl_entries");
                writer.WriteValue(obj);                     //array

                writer.WritePropertyName("custom_field");
                writer.WriteValue(obj);                  //array

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            //Utils.Log(sParam);

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "PUT", ref sResp))
            {
                //Utils.Log(" Response " + sResp);

                Utils.deserializeAddChild(sResp, ref list, ref sMsg);

            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }

        ////////////////////////////// UPDATE BASIC /////////////////////////////////

        public List<Stakeholder> PutUpdateStakeholder(Stakeholder author)
        {

            //JavaScriptSerializer serializera = new JavaScriptSerializer();
            //string res = serializera.Serialize(author.acl_entries);

            //string acl = JsonConvert.SerializeObject(author.acl_entries, Formatting.None);                      

            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();

                object obj = null;

                object fal = false;

                object tr = true;
                
                object val = 0;

                writer.WritePropertyName("stakeh_type_name");
                writer.WriteValue(author.stakeh_type_name);             //java.lang.String cannot be cast to java.lang.Long

                writer.WritePropertyName("initials");
                writer.WriteValue(author.initials);

                writer.WritePropertyName("first_name");
                writer.WriteValue(author.first_name);

                writer.WritePropertyName("last_name");
                writer.WriteValue(author.last_name);

                writer.WritePropertyName("full_name");
                writer.WriteValue(author.full_name);                      //string or null

                writer.WritePropertyName("email");
                writer.WriteValue(author.email);

                writer.WritePropertyName("date_of_birth");
                writer.WriteValue(author.date_of_birth);

                writer.WritePropertyName("version");
                writer.WriteValue(val);                        //java.lang.String cannot be cast to java.lang.Long

                writer.WritePropertyName("stakeh_type");
                writer.WriteRawValue(author.stakeh_type);                        //java.lang.String cannot be cast to java.lang.Long

                writer.WritePropertyName("stakeholder_id");
                writer.WriteValue(author.stakeholder_id);

                writer.WritePropertyName("id_number");
                writer.WriteValue(author.id_number);

                writer.WritePropertyName("acl_id");
                writer.WriteValue(author.acl_id);

                writer.WritePropertyName("internal");
                writer.WriteRawValue(author.Internal);                          //boolean

                writer.WritePropertyName("is_blocked");
                writer.WriteRawValue(author.is_blocked);                             //boolean

                writer.WritePropertyName("can_login");
                writer.WriteRawValue(author.can_login);                           //boolean

                writer.WritePropertyName("login_username");
                writer.WriteValue(author.login_username);

                writer.WritePropertyName("password");
                writer.WriteValue(author.password);

                writer.WritePropertyName("role_value");
                writer.WriteValue(author.role_value);

                writer.WritePropertyName("role_id");
                writer.WriteValue(author.role_id);

                writer.WritePropertyName("security_level_value");
                writer.WriteValue(obj);

                writer.WritePropertyName("security_lvl_id");
                writer.WriteValue(obj);

                writer.WritePropertyName("active");
                writer.WriteRawValue(author.active);                        //boolean

                writer.WritePropertyName("date_active_from");
                writer.WriteValue(author.date_active_from);

                writer.WritePropertyName("date_active_to");
                writer.WriteValue(author.date_active_to);

                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);
                              
                writer.WritePropertyName("acl_entries");
                //writer.WriteStartArray();

                writer.WriteRawValue(JsonConvert.SerializeObject(author.acl_entries, Formatting.None));

                //writer.WriteEndArray();

                writer.WritePropertyName("custom_field");
                writer.WriteValue(author.custom_field);                                     //array
                              

                writer.WriteEndObject();

            }        
            

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            //Utils.Log("Update_Writer>>>" + sParam);

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "PUT", ref sResp))
            {
                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);

                //Utils.Log("RESPONSE UPDATE" + sResp);
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }

        ////////////////////////////// REMOVE CHILD /////////////////////////////////

        public List<Stakeholder> RemoveChild(string parent_id, string child_id)
        {

            //Utils.Log("Var" + author);

            string sMsg = "";

            StringWriter sw = new StringWriter();

            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                writer.Formatting = Formatting.None;

                writer.WriteStartObject();
                
                writer.WritePropertyName("bio_access_id");
                writer.WriteValue(UserSession.bio_access_id);

                writer.WritePropertyName("action");
                writer.WriteValue("REMOVE_CHILD_ITEM");

                writer.WritePropertyName("parent_id");
                writer.WriteValue(parent_id);

                writer.WritePropertyName("child_id");
                writer.WriteValue(child_id);                

                writer.WriteEndObject();
            }

            string sParam = "param=" + sw.ToString();// HttpUtility.UrlEncode(sw.ToString());

            string sResp = "";

            //Utils.Log(sParam);

            List<Stakeholder> list = new List<Stakeholder>();

            if (Utils.GenerateRequest("Stakeholder", sParam, "POST", ref sResp))
            {
                Utils.deserializeStakeholderResp(sResp, ref list, ref sMsg);

                Utils.Log(" Response " + sResp);
            }
            else
            {
                sMsg += sResp;
            }

            return list;
        }






    }
}