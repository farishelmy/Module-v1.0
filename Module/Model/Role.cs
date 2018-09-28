using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Module.Model
{
    public class SecRole
    {
        public int Id { get; set; }
        public string role_id { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public bool is_super { get; set; }
        public bool is_admin { get; set; }       

    }
}