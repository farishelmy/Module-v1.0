using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Module.Model;

namespace Module
{
    public class UserSession
    {
        public static string sessionID
        {
            get
            {
                return (string)HttpContext.Current.Session["sessionID"];
            }
            set
            {
                HttpContext.Current.Session["sessionID"] = value;
            }
        }
        public static string loginID
        {
            get
            {
                return (string)HttpContext.Current.Session["loginID"];
            }
            set
            {
                HttpContext.Current.Session["loginID"] = value;
            }
        }

        public static string lab_record_id
        {
            get
            {
                if (HttpContext.Current.Session["lab_record_id"] == null)
                {
                    if (bioRecord_lab != null)
                    {
                        HttpContext.Current.Session["lab_record_id"] = bioRecord_lab.record_id;

                        return (string)HttpContext.Current.Session["lab_record_id"];
                    }

                    return "";
                }
                else
                    return (string)HttpContext.Current.Session["lab_record_id"];
            }
            set
            {
                HttpContext.Current.Session["lab_record_id"] = value;
            }
        }

        public static Bio_Record bioRecord_lab
        {
            get
            {
                if (HttpContext.Current.Session["bioRecord_lab"] == null)
                {
                    HttpContext.Current.Session["bioRecord_lab"] = Utils.SearchLabByStakeholderOrg();

                    return (Bio_Record)HttpContext.Current.Session["bioRecord_lab"];
                }
                else
                    return (Bio_Record)HttpContext.Current.Session["bioRecord_lab"];
            }
            set
            {
                HttpContext.Current.Session["bioRecord_lab"] = value;
            }
        }

        //public static Utils.Role role
        //{
        //    get
        //    {
        //        try
        //        {
        //            Utils.Role r = Utils.Role.None;

        //            if (HttpContext.Current.Session["role"] != null)
        //            {
        //                Enum.TryParse(HttpContext.Current.Session["role"].ToString(), out r);
        //            }

        //            return r;
        //        }
        //        catch (Exception)
        //        {
        //            return Utils.Role.None;
        //        }

        //        //return (string)HttpContext.Current.Session["role"];
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["role"] = value;
        //    }
        //}

        public static string roles_tittle
        {
            get
            {
                return (string)HttpContext.Current.Session["title"];
            }
            set
            {
                HttpContext.Current.Session["title"] = value;
            }
        }

        public static string bio_access_id
        {
            get
            {
                return (string)HttpContext.Current.Session["bio_access_id"];
            }
            set
            {
                HttpContext.Current.Session["bio_access_id"] = value;
            }
        }

        public static string stakeholder_id
        {
            get
            {
                return (string)HttpContext.Current.Session["stakeholder_id"];
            }
            set
            {
                HttpContext.Current.Session["stakeholder_id"] = value;
            }
        }

        public static string stakeholder_name
        {
            get
            {
                return (string)HttpContext.Current.Session["stakeholder_name"];
            }
            set
            {
                HttpContext.Current.Session["stakeholder_name"] = value;
            }
        }

        public static string lab_record_no
        {
            get
            {
                if (HttpContext.Current.Session["lab_record_no"] == null)
                {
                    if (bioRecord_lab != null)
                    {
                        HttpContext.Current.Session["lab_record_no"] = bioRecord_lab.record_no;

                        return (string)HttpContext.Current.Session["lab_record_no"];
                    }

                    return "";
                }
                else
                    return (string)HttpContext.Current.Session["lab_record_no"];
            }
            set
            {
                HttpContext.Current.Session["lab_record_no"] = value;
            }
        }


        public static string stakeholder_org_id//to get folder
        {
            get
            {
                if (HttpContext.Current.Session["stakeholder_org_id"] == null)
                {
                    string sOrgId = "";
                    string sMsg = "";
                    if (Utils.getStakeholderOrganizationId(0, ref sOrgId, ref sMsg))
                    {
                        HttpContext.Current.Session["stakeholder_org_id"] = sOrgId;

                        return (string)HttpContext.Current.Session["stakeholder_org_id"];
                    }

                    return null;
                }
                else
                    return (string)HttpContext.Current.Session["stakeholder_org_id"];
            }
            set
            {
                HttpContext.Current.Session["stakeholder_org_id"] = value;
            }
        }

        //public static string stakeholder_group_id//to get folder
        //{
        //    get
        //    {
        //        return (string)HttpContext.Current.Session["stakeholder_group_id"];
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["stakeholder_group_id"] = value;
        //    }
        //}

        //public static string stakeholder_group_name//role name
        //{
        //    get
        //    {
        //        return (string)HttpContext.Current.Session["stakeholder_group_name"];
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["stakeholder_group_name"] = value;
        //    }
        //}

        //public static string lab_record_id
        //{
        //    get
        //    {
        //        if (HttpContext.Current.Session["lab_record_id"] == null)
        //        {
        //            if (bioRecord_lab != null)
        //            {
        //                HttpContext.Current.Session["lab_record_id"] = bioRecord_lab.record_id;

        //                return (string)HttpContext.Current.Session["lab_record_id"];
        //            }

        //            return "";
        //        }
        //        else
        //            return (string)HttpContext.Current.Session["lab_record_id"];
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["lab_record_id"] = value;
        //    }
        //}

        //public static Bio_Record bioRecord_lab
        //{
        //    get
        //    {
        //        if (HttpContext.Current.Session["bioRecord_lab"] == null)
        //        {
        //            HttpContext.Current.Session["bioRecord_lab"] = Utils.SearchLabByStakeholderOrg();

        //            return (Bio_Record)HttpContext.Current.Session["bioRecord_lab"];
        //        }
        //        else
        //            return (Bio_Record)HttpContext.Current.Session["bioRecord_lab"];
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["bioRecord_lab"] = value;
        //    }
        //}

        //public static string stakeholder_org_id//to get folder
        //{
        //    get
        //    {
        //        if (HttpContext.Current.Session["stakeholder_org_id"] == null)
        //        {
        //            string sOrgId = "";
        //            string sMsg = "";
        //            if (Utils.getStakeholderOrganizationId(0, ref sOrgId, ref sMsg))
        //            {
        //                HttpContext.Current.Session["stakeholder_org_id"] = sOrgId;

        //                return (string)HttpContext.Current.Session["stakeholder_org_id"];
        //            }

        //            return null;
        //        }
        //        else
        //            return (string)HttpContext.Current.Session["stakeholder_org_id"];
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["stakeholder_org_id"] = value;
        //    }
        //}

        //public static Bio_Record bioRecord_fac
        //{
        //    get
        //    {
        //        if (HttpContext.Current.Session["bioRecord_fac"] == null)
        //        {
        //            HttpContext.Current.Session["bioRecord_fac"] = Utils.SearchFactoryByStakeholderOrg();

        //            return (Bio_Record)HttpContext.Current.Session["bioRecord_fac"];
        //        }
        //        else
        //            return (Bio_Record)HttpContext.Current.Session["bioRecord_fac"];
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["bioRecord_fac"] = value;
        //    }
        //}

        //public static string lab_record_no
        //{
        //    get
        //    {
        //        if (HttpContext.Current.Session["lab_record_no"] == null)
        //        {
        //            if (bioRecord_lab != null)
        //            {
        //                HttpContext.Current.Session["lab_record_no"] = bioRecord_lab.record_no;

        //                return (string)HttpContext.Current.Session["lab_record_no"];
        //            }

        //            return "";
        //        }
        //        else
        //            return (string)HttpContext.Current.Session["lab_record_no"];
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["lab_record_no"] = value;
        //    }
        //}


    }
}