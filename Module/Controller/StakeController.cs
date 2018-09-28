using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using Module.Model;
using Newtonsoft.Json;

namespace Module.Controller
{
    public class StakeController : ApiController
    {
        
        StakeholderVar _repos = new StakeholderVar();        

        /////////////////////// ROLE ////////////////////////

        [HttpGet]
        [ActionName("GetAllRole")]
        public string GetAllRole()
        {
            List<SecRole> list = _repos.GetAllRole();

            return JsonConvert.SerializeObject(list);

        }

        ///////////////////////GET ALL STAKEHOLDER////////////////////////

        [HttpGet]
        [ActionName("GetAllStakeholder")]
        public string GetAllStakeholder()
        {
            List<Stakeholder> list = _repos.GetStakeholder();

            return JsonConvert.SerializeObject(list);

        }

        /////////////////////// GET STAKEHOLDER GROUP////////////////////////

        [HttpGet]
        [ActionName("GetGroupStakeholder")]
        public string GetGroupStakeholder(string Id)
        {
            List<Stakeholder> list = _repos.GetGroupStakeholder(Id);

            return JsonConvert.SerializeObject(list);

        }

        /////////////////////// GET ANCESTOR(ALL TYPE GROUP) ////////////////////////

        [HttpGet]
        [ActionName("GetAllTypeGroup")]
        public string GetAllTypeGroup(string Type)
        {

            int iType = Convert.ToInt32(Type);

            List<Stakeholder> list = _repos.GetAllTypeGroup(iType);

            return JsonConvert.SerializeObject(list);

        }

        /////////////////////// GET DESCENDANT(ALL TYPE MEMBER) ////////////////////////

        [HttpGet]
        [ActionName("GetAllTypeMember")]
        public string GetAllTypeMember(string Type)
        {

            int iType = Convert.ToInt32(Type);

            List<Stakeholder> list = _repos.GetAllTypeMember(iType);

            return JsonConvert.SerializeObject(list);

        }

        /////////////////////// GET STAKEHOLDER ACC////////////////////////

        [HttpGet]
        [ActionName("GetAccStakeholder")]
        public string GetAccStakeholder(string Id)
        {
            List<Stakeholder> list = _repos.GetAccStakeholder(Id);

            return JsonConvert.SerializeObject(list);

        }

        /////////////////////// GET STAKEHOLDER MEMBER////////////////////////

        [HttpGet]
        [ActionName("GetMemberStakeholder")]
        public string GetMemberStakeholder(string Id)
        {
            List<Stakeholder> list = _repos.GetMemberStakeholder(Id);

            return JsonConvert.SerializeObject(list);

        }

        ///////////////////////GET TYPE STAKEHOLDER////////////////////////

        [HttpGet]
        [ActionName("GetTypeStakeholder")]
        public string GetTypeStakeholder(string Type)
        {
            //Utils.Log(Type);

            int iType = Convert.ToInt32(Type);

            List<Stakeholder> list = _repos.GetTypeStakeholder(iType);

            return JsonConvert.SerializeObject(list);
            

        }

        ///////////////////////GET DETAILS STAKEHOLDER////////////////////////

        [HttpGet]
        [ActionName("GetStakeholderId")]
        public string GetStakeholderId(string Id)
        {
            
            List<Stakeholder> list = _repos.GetStakeholderId(Id);

            return JsonConvert.SerializeObject(list);

        }

        ///////////////////////DELETE////////////////////////

        [HttpGet]
        [ActionName("DeleteStakeholder")]
        public string DeleteStakeholder(string Id)
        {
            
            List<Stakeholder> list = _repos.DeleteStakeholder(Id);

            return JsonConvert.SerializeObject(list);

        }

        //////////////// UPDATE STAKEHOLDER//////////////
        public class AuthorRequest
        {
            public Stakeholder author { get; set; }            
        }
        
        [HttpPut]
        [ActionName("PutUpdateStakeholder")]
        public string PutUpdateStakeholder(AuthorRequest request)
        {
            var author = request.author;            

            List <Stakeholder> list = _repos.PutUpdateStakeholder(author);           
       

            return JsonConvert.SerializeObject(list);

        }


        //////////////// CREATE STAKEHOLDER//////////////
        [HttpPut]
        [ActionName("PutAddStakeholder")]
        public string PutAddStakeholder(AuthorRequest request)
        {
            var author = request.author;

            //Utils.Log("Create" + author);

            List<Stakeholder> list = _repos.PutAddStakeholder(author);

            return JsonConvert.SerializeObject(list);

        }

        /////////////////////// ADD CHILD////////////////////////      
        [HttpGet]
        [ActionName("AddChild")]
        public string AddChild(string parent_id, string child_id)
        {
            //var dataMember = request.author;

            List<Stakeholder> list = _repos.AddChild(parent_id, child_id);

            return JsonConvert.SerializeObject(list);

        }

        //////////////// CREATE ADD CHILD//////////////
        [HttpPut]
        [ActionName("PutAddChild")]
        public string PutAddChild(AuthorRequest request)
        {
            var author = request.author;

            //Utils.Log("Create" + author);

            List<Stakeholder> list = _repos.PutAddChild(author);

            return JsonConvert.SerializeObject(list);

        }

        /////////////////////// REMOVE CHILD////////////////////////      
        [HttpGet]
        [ActionName("RemoveChild")]
        public string RemoveChild(string parent_id, string child_id)
        {
            //var dataMember = request.author;

            List<Stakeholder> list = _repos.RemoveChild(parent_id, child_id);

            return JsonConvert.SerializeObject(list);

        }



    }


}



