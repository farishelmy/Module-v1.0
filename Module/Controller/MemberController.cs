﻿using Module.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Module.Controller
{
    public class MemberController : ApiController
    {
        Repos _repos = new Repos();

        [HttpGet]
        [ActionName("GetMembers")]
        public string GetMembers()
        {
            List<Member> members = _repos.GetMembers();
            return JsonConvert.SerializeObject(members);
        }
    }
}