using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Module.Model
{
    //[Serializable]
    public class Stakeholder
    {
        private string firstName = "";
        private string fullName = "";

        public int Id { get; set; }
        public string stakeholder_id { get; set; }
        public string first_name
        {
            get
            {
                return firstName;
            }
            set
            {
                firstName = HttpUtility.UrlDecode(value);
            }
        }
        public string full_name
        {
            get
            {
                return fullName;
            }
            set
            {
                fullName = HttpUtility.UrlDecode(value);
            }
        }
        public string stakeh_type_name { get; set; }
        public string username { get; set; }
        public string initials { get; set; }
        public string last_name { get; set; }
        public string Internal { get; set; }
        public string is_blocked { get; set; }
        public string can_login { get; set; }
        public string security_lvl_id { get; set; }
        public string role_value { get; set; }
        public string date_active_from { get; set; }
        public string date_active_to { get; set; }
        public string email { get; set; }
        public string role_id { get; set; }
        public string date_of_birth { get; set; }
        public string version { get; set; }
        public string stakeh_type { get; set; }
        public string id_number { get; set; }
        public string acl_id { get; set; }
        public string login_username { get; set; }
        public string password { get; set; }
        public string security_level_value { get; set; }
        public string active { get; set; }
        public string success { get; set; }
        public string code { get; set; }
        public string message { get; set; }
        public string parent_id { get; set; }
        public string child_id { get; set; }
        public Acl_Entries[] acl_entries { get; set; }
        public Custom_Field[] custom_field { get; set; }

        public Stakeholder() { }

        public bool Equals(Stakeholder other)
        {
            return this.Id.Equals(other.Id);
        }
    }

    public class Custom_Field
    {
        public string field_id { get; set; }
        public string field { get; set; }
        public string value { get; set; }
    }

    public class Acl_Entries
    {
        public string stakeholder_id { get; set; }
        public string stakeholder_name { get; set; }
        public string stakeholder_type_id { get; set; }
        public bool attach { get; set; }
        public bool modify_access { get; set; }
        public bool remove { get; set; }
        public bool remove_child { get; set; }
        public bool update { get; set; }
        public bool update_child { get; set; }
        public bool view { get; set; }
        public bool view_child { get; set; }
        public int index { get; set; }
        public int depth { get; set; }
        public bool expanded { get; set; }
        public bool expandable { get; set; }
        public object _checked { get; set; }
        public bool leaf { get; set; }
        public object cls { get; set; }
        public object iconCls { get; set; }
        public object icon { get; set; }
        public bool root { get; set; }
        public bool isLast { get; set; }
        public bool isFirst { get; set; }
        public bool allowDrop { get; set; }
        public bool allowDrag { get; set; }
        public bool loaded { get; set; }
        public bool loading { get; set; }
        public object href { get; set; }
        public object hrefTarget { get; set; }
        public object qtip { get; set; }
        public object qtitle { get; set; }
        public int qshowDelay { get; set; }
        public object children { get; set; }


    }


    //public class AddChildMember
    //{
    //    public string parent_id { get; set; }
    //    public string child_id { get; set; }
    //    public string success { get; set; }
    //    public string code { get; set; }
    //    public string message { get; set; }

    //}


}