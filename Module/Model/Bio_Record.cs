using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using DevExpress.Xpo;


namespace Module.Model
{
    //[TypeConverter(typeof(Bio_RecordTypeConverter))]
    public class Bio_Record
    {
        internal static int Count;

        public string record_id { get; set; }
        public string record_type_id { get; set; }
        public string date_registered { get; set; }
        public string parent_id { get; set; }
        public string stakeholder_id { get; set; }
        public string title_structure { get; set; }
        public string title { get; set; }
        public bool is_final { get; set; }
        public bool is_check_out { get; set; }
        public string user_defined_field { get; set; }
        public string record_no { get; set; }
        public string bio_access_id { get; set; }
        public string action { get; set; }
        public List<Section> record_metadata { get; set; }

        public Bio_Record(string recordId, string recordTypeId, string dateReg, string parentId, string title, bool isFinal, bool isCheckOut, string userDefinedField, string recordNo, string bioAccessId, string action, List<Section> recordMetadata)
        {
            this.record_id = recordId;
            this.record_type_id = recordTypeId;
            this.date_registered = dateReg;
            this.parent_id = parent_id;
            this.title = title;
            this.is_final = isFinal;
            this.is_check_out = isCheckOut;
            this.user_defined_field = userDefinedField;
            this.record_no = recordNo;
            this.bio_access_id = bioAccessId;
            this.action = action;
            this.record_metadata = recordMetadata;
        }

        public Bio_Record()
        {
        }

        public Bio_Record(string recordTypeId, string parentId, string title, string sectionId)
        {
            List<CustomField> customFields = new List<CustomField>();
            customFields.Add(new CustomField("title", title));

            if (!Utils.IsEmpty(parentId))
                customFields.Add(new CustomField("parent_id", parentId));

            Section sec = new Section(sectionId, customFields);
            List<Section> listSec = new List<Section>();
            listSec.Add(sec);

            this.record_metadata = listSec;
            this.record_type_id = recordTypeId;
            this.title = title;

            if (!Utils.IsEmpty(parentId))
                this.parent_id = parentId;
        }

        public Bio_Record(string recordTypeId, string parentId, string stakeholderId, string title, string sectionId)
        {
            List<CustomField> customFields = new List<CustomField>();
            customFields.Add(new CustomField("title", title));

            if (!Utils.IsEmpty(parentId))
            {
                customFields.Add(new CustomField("parent_id", parentId));

                this.parent_id = parentId;
            }

            if (!Utils.IsEmpty(stakeholderId))
            {
                customFields.Add(new CustomField("stakeholder_id", stakeholderId));

                this.stakeholder_id = stakeholder_id;
            }

            Section sec = new Section(sectionId, customFields);
            List<Section> listSec = new List<Section>();
            listSec.Add(sec);

            this.record_metadata = listSec;
            this.record_type_id = recordTypeId;
            this.title = title;
   
        }
    }

    public class Section
    {
        public string section_id { get; set; }
        public List<CustomField> section_field { get; set; }

        public Section(string sectionId, List<CustomField> sectionField)
        {
            this.section_id = sectionId;
            this.section_field = sectionField;
        }

        public Section()
        {

        }
    }

    public class CustomField
    {
        public string custom_field_id { get; set; }
        public object value { get; set; }

        public CustomField(string customFieldId, object val)
        {
            this.custom_field_id = customFieldId;
            this.value = val;
        }

        public CustomField()
        {

        }
    }

    public class Bio_RecordTypeConverter : TypeConverter
    {
        public override object ConvertTo(ITypeDescriptorContext context,
        System.Globalization.CultureInfo culture,
        object value,
        Type destinationType)
        {
            Bio_Record childClass = (Bio_Record)value;
            return childClass.record_id;
        }    
    }
}