using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Module.Controller
{
    public class ProductController : ApiController
    {
        
            [HttpGet]
            [ActionName("GetHelloWorld")]
            public string GetHelloWorld()
            {
                ArrayList al = new ArrayList { "Hello", "World",
                 "From", "Sample", "Application" };
                return JsonConvert.SerializeObject(al);
            }
        
    }
}