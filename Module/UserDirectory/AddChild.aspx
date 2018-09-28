<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="AddChild.aspx.cs" Inherits="Module.UserDirectory.AddChild" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <!-- Bootstrap Wizard-->
    <link href="../Content/wizard/assets/css/paper-bootstrap-wizard.css" rel="stylesheet" />
     
	
    <!-- Wizard-->  
    <script src="../Content/wizard/assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="../Content/wizard/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Content/wizard/assets/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Content/wizard/assets/js/paper-bootstrap-wizard.js" type="text/javascript"></script>
    <script src="../Content/wizard/assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
   

    <!-- Select-->
    <link href="../Content/Select/select2.css" rel="stylesheet" />
    <script src="../Content/Select/select2.js"></script>

    <!-- Bootstrap DatePicker-->
    <script src="/Content/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>


    <div class="breadcrumb-holder">
        <div class="container-fluid">
          <div class="breadcrumb">
            <div class="breadcrumb-item"><a href="/UserDirectory/Dashboard.aspx">Home</a></div>              
                <div class="breadcrumb-item active">New Stakeholder</div>
          </div>
        </div>
      </div>      
             
	   <!--   Big container   -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12 col-sm-offset-2">

                <!--      Wizard container        -->
                <div class="wizard-container">

                    <div class="card wizard-card wizard-page" data-color="blue" id="wizardProfile">
                        <form id="simpleform">
                            <!-- You can switch " data-color="orange" "  with one of the next bright colors: "blue", "green", "orange", "red", "azure"          -->

                            <div class="wizard-header text-center">
                                <h3 class="wizard-title">Profile Information</h3>
                            </div>

                            <div class="wizard-navigation">
                                <div class="progress-with-circle">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="3" style="width: 21%;"></div>
                                </div>
                                <ul>
                                    <li>
                                        <a href="#basic" data-toggle="tab">
                                            <div class="icon-circle">
                                                <i class="ti-user"></i>
                                            </div>
                                            Basic
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#security" data-toggle="tab">
                                            <div class="icon-circle">
                                                <i class="ti-settings"></i>
                                            </div>
                                            Security
                                        </a>
                                    </li>
                                    <%--<li>
                                        <a href="#control" data-toggle="tab">
                                            <div class="icon-circle">
                                                <i class="ti-map"></i>
                                            </div>
                                            Access Control
                                        </a>
                                    </li>--%>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane mt-3" id="basic">                                   
                                    <div class="col-sm-12">

                                        <input id="parentId" hidden="hidden" type="text" class="form-control">
                                        <input id="childId" hidden="hidden" type="text" class="form-control">
                                    
                                        <div class="form-group">
                                            <label>Type</label>
                                            <select id="stakeh_type_name" name="stakeh_type_name" data-style="btn-outline-dark" title="Choose one of the following" class="selectpicker form-control">
                                                <option value="0">Group</option>
                                                <option value="1">Organization</option>
                                                <option value="2">Branch</option>
                                                <option value="3">Department</option>
                                                <option value="4">Designation</option>
                                                <option value="5">User</option>
                                            </select>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4 form-group">
                                                <label>Initials</label>
                                                <input id="initials" name="init" type="text" class="form-control">
                                            </div>
                                            <div class="col-sm-4 form-group">
                                                <label>First Name</label>
                                                <input id="first_name" type="text" class="form-control" placeholder="Smith...">
                                            </div>
                                            <div class="col-sm-4 form-group">
                                                <label>Last Name</label>
                                                <input id="last_name" type="text" class="form-control" placeholder="Johnson...">
                                            </div>
                                            <div class="col-sm-4 form-group">
                                                <label>Full Name</label>
                                                <input id="full_name" name="full_name" type="text" class="form-control" placeholder="Smith Johnson">
                                            </div>
                                            <div class="col-sm-4 form-group">
                                                <label>Email</label>
                                                <input id="email" type="text" class="form-control" placeholder="Smith@htech.com...">
                                            </div>
                                            <div class="col-sm-4 form-group">
                                                <label>Date of Birth</label>
                                                <input id="date_of_birth" type="text" class="form-control input-datepicker">
                                            </div>                                            
                                        </div>
                                        <!-- row-->
                                    </div>
                                </div>
                                <div class="tab-pane mt-3" id="security">
                                    
                                        <div class="col-sm-12">

                                            <input id="role_id" hidden="hidden" type="text" class="form-control">

                                            <div class="form-group">
                                                    <label>Date Active Range</label>
                                                    <div class="i-checks">
                                                        <input id="active" type="checkbox" name="active" value="true" class="form-control-custom">
                                                        <label for="active">Active</label>
                                                    </div>
                                            </div>
                                             <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <input id="date_active_from" type="text" placeholder="Date from" class="form-control input-datepicker">
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <input id="date_active_to" type="text" placeholder="Date to" class="form-control input-datepicker">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Role</label>
                                                <select class="select-js-role form-control">
                                                </select>
                                            </div>
                                            <div class="col-sm-6 form-group row">
                                                <div class="i-checks">
                                                    <input id="Internal" type="checkbox" value="" class="form-control-custom">
                                                    <label for="Internal">Internal</label>
                                                </div>
                                                <div class="i-checks">
                                                    <input id="blocked" type="checkbox" value="" class="form-control-custom">
                                                    <label for="blocked">Is Blocked</label>
                                                </div>
                                                <div class="i-checks">
                                                    <input id="can_login" type="checkbox" class="form-control-custom">
                                                    <label for="can_login">Can Login</label>
                                                </div>
                                            </div>
                                            <div class="autoUpdate row">
                                                <div class="col-sm-6 form-group">
                                                    <label>Username</label>
                                                    <input id="login_username" type="text" class="form-control">
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <label>Password</label>
                                                    <input id="password" type="password" class="form-control">
                                                </div>
                                            </div>
                                            <!-- row-->
                                        </div>                                       
                                </div><!-- Security-->
                                <%--<div class="tab-pane mt-3" id="control">
                                    
                                        <div class="col-sm-12">

                                            <div class="row">
                                                <div class="js-view col-lg-6 col-md-6 col-sm-6">
                                                <label class="test">View</label>                                                   
                                                <select class="select-js-view" multiple="multiple">                                                   
                                                </select>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6">
                                                <label>Update</label>
                                                <select class="select-js-update" multiple="multiple">
                                                </select>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-6 mt-2">
                                                <label>Remove</label>
                                                <select class="select-js-remove" multiple="multiple">
                                                </select>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 mt-2">
                                                <label>Modify</label>
                                                <select class="select-js-modify" multiple="multiple">
                                                </select>
                                            </div>
                                            </div>
                                        </div>
                                </div>--%>
                            </div>
                            <div class="wizard-footer">
                                <div class="pull-right">
                                    <input type="submit" class='btn btn-save btn-fill btn-success btn-wd' name='finish' value='Save' />
                                    <input type='button' class='btn btn-next btn-fill btn-info btn-wd' name='next' value='Next' />
                                    <input type="submit" class='btn btn-finish btn-fill btn-info btn-wd' name='finish' value='Finish' />
                                </div>

                                <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-default btn-wd' name='previous' value='Previous' />
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- wizard container -->
            </div>
        </div>
        <!-- end row -->
    </div> <!--  big container -->


    <script type="text/javascript">

        $(document).ready(function () {
            $('.select-js').select2();

            $('.select-js-role').select2();           
            $('.select-js-group').select2();                        
            $('.select-js-member').select2();
            $('.select-js-view').select2();
            $('.select-js-update').select2();
            $('.select-js-remove').select2();
            $('.select-js-modify').select2();

            //parentId
            $("#parentId").val(pId); 

            var parent_id = $("#parentId").val()
            //var parent = document.getElementById('parentId').value; 
                                            
            //Role
            StakeholderDetail.getRole("stake/GetAllRole"); 

            //Acl
            StakeholderDetail.getAccessControlList("stake/GetAllStakeholder");           

            //Create Child
             $("#simpleform").submit(function (e) {  
                e.preventDefault();

                var type = $( "#stakeh_type_name option:selected" ).text();
                var url = "/UserDirectory/" + type + ".aspx";
                var apiurl = "<%=ConfigurationManager.AppSettings["ApiPath"]%>"+"stake/PutAddChild";  
                var author =
                    {
                        stakeh_type_name: $("#stakeh_type_name").val(),
                        initials: $("#initials").val(),
                        first_name: $("#first_name").val(),
                        last_name: $("#last_name").val(),
                        full_name: $("#full_name").val(),
                        email: $("#email").val(),
                        date_of_birth: $("#date_of_birth").val(),
                        //version: $("#version").val(),
                        stakeh_type: $("#stakeh_type_name").val(),
                        stakeholder_id: $("#stakeholder_id").val(),
                        //id_number: $("#id_number").val(),
                        //acl_id: $("#acl_id").val(),
                        Internal: $('#Internal').prop('checked'),
                        is_blocked: $('#blocked').prop('checked'),
                        can_login: $('#can_login').prop('checked'),
                        login_username: $("#login_username").val(),
                        password: $("#password").val(),
                        role_value: $('.select-js-role').find(":selected").text(),
                        role_id: $('.select-js-role').val(),
                        security_level_value: $("#security_level_value").val(),
                        //security_level_id: $("#security_level_id").val(),
                        active: $('#active').prop('checked'),
                        date_active_from: $("#date_active_from").val(),
                        date_active_to: $("#date_active_to").val(),                        
                        //acl_entries: $("#acl_entries").val(),
                        //custom_field: $("#custom_field").val(),
                    
                    }
                
                console.log(author );

                 for (var propName in author) {                                      

                    if (author[propName] === "") {
                        author[propName] = null
                    }                                                      
                   
                 }   
                
                $.ajax({
                    url: apiurl,
                    type: 'PUT',
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    async: true,
                    data: JSON.stringify({ author }),  
                    success: function (response)
                    {
                        var data = $.parseJSON(response);
                        //console.log(data);

                        $.each(data, function (index,item) { 

                            var child_id = item.stakeholder_id;  

                            //Add Child
                            StakeholderDetail.AddChild("stake/AddChild", parent_id,child_id);
                            //console.log("parent"+parent_id,"child"+child_id)     
                           

                        })                           

                       alert("Create & Add Child Successfully");  
                       window.location.replace(url);                                    
                        
                    },                                           

                    error: function ()
                    {  
                        alert("Error please try again");  
                    }  
                     
                }); 




            });  

        });
       
        ///////////////////////////// URL ///////////////////////////////////////////
 
         var getUrlParameter = function getUrlParameter(sParam) {
                  var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                      sURLVariables = sPageURL.split('&'),
                      sParameterName,
                      i;

                  for (i = 0; i < sURLVariables.length; i++) {
                      sParameterName = sURLVariables[i].split('=');

                      if (sParameterName[0] === sParam) {
                          return sParameterName[1] === undefined ? true : sParameterName[1];
                      }
                  }
              };
        var pId = getUrlParameter('pId');

        //////////////////////////////// ROLE ////////////////////////////////////////
        var StakeholderDetail = {
            serviceAPI: '<%=ConfigurationManager.AppSettings["ApiPath"]%>',

            getRole: function (SubURI) {
             
                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: [],
                        async: true,
                        success: function (response) { StakeholderDetail.getRoleSuccess(response); },
                        error: function (error) { StakeholderDetail.getRoleError(error); },
                        
                    });
                } catch (ex) { alert('Something went wrong!'); }
                //console.log(Id);
            },

           getRoleSuccess: function (response)
             {
                var data = $.parseJSON(response); 
                
                  
                 var list = $.map(data, function (item)
                 {

                     return { text: item.title, id: item.role_id }      
                     
                 });

                $('.select-js-role').select2({ data: list });
               
                //console.log(list);                      


           },

             getRoleError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
            },


             //////////////////////////////// Access Control (Item List) ////////////////////////////////////////


            getAccessControlList: function (SubURI) {
             
                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: [],
                        async: true,
                        success: function (response) { StakeholderDetail.getAccessControlListSuccess(response); },
                        error: function (error) { StakeholderDetail.getAccessControlListError(error); },
                        
                    });
                } catch (ex) { alert('Something went wrong!'); }
                //console.log(Id);
            },

            getAccessControlListSuccess: function (response)
             {
                var data = $.parseJSON(response); 
                
                  
                 var list = $.map(data, function (item)
                 {
                     return { text: item.full_name, id: item.stakeholder_id }      
                     
                 });

                $('.select-js-view').select2({ data: list });
                $('.select-js-update').select2({ data: list });
                $('.select-js-remove').select2({ data: list });
                $('.select-js-modify').select2({ data: list });

                //console.log(list);
                             


             },

             getAccessControlListError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
             },


          


             //////////////////////////////// ADD CHILD ////////////////////////////////////////


            AddChild: function (SubURI, parent_id, child_id) {

                console.log("parent=" + parent_id, "child=" + child_id)

                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: ({ parent_id,child_id }),
                        async: true,
                        success: function (response) { StakeholderDetail.AddChildSuccess(response); },
                        error: function (error) { StakeholderDetail.AddChildError(error); },
                        
                    });
                } catch (ex) { alert('Something went wrong!'); }
                //console.log(Id);
            },

            AddChildSuccess: function (response)
             {
                var data = $.parseJSON(response);                


             },

             AddChildError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
             },



              


        };      


         

         <%--///////////////////////////UPDATE////////////////////////////////

          $(document).ready(function () {  
            $("#simpleform").submit(function (e) {  
                e.preventDefault();
                
                var apiurl = "<%=ConfigurationManager.AppSettings["ApiPath"]%>"+"stake/PutNewStakeholder";  
                var author =
                    {
                        stakeh_type_name: $("#stakeh_type_name").val(),
                        initials: $("#initials").val(),
                        first_name: $("#first_name").val(),
                        last_name: $("#last_name").val(),
                        full_name: $("#full_name").val(),
                        email: $("#email").val(),
                        date_of_birth: $("#date_of_birth").val(),
                        //version: $("#version").val(),
                        stakeh_type: $("#stakeh_type_name").val(),
                        stakeholder_id: $("#stakeholder_id").val(),
                        //id_number: $("#id_number").val(),
                        //acl_id: $("#acl_id").val(),
                        //internal: $("input[name=option1]:checked"),
                        //is_blocked: $('input[name=option2]:checked'),
                        //can_login: $('input[name=option3]:checked'),
                        login_username: $("#login_username").val(),
                        password: $("#password").val(),
                        role_value: $("#role_value").val(),
                        //role_id: $("#role_id").val(),
                        security_level_value: $("#security_level_value").val(),
                        //security_level_id: $("#security_level_id").val(),
                        //active: $('input[name=option4]:checked'),
                        date_active_from: $("#date_active_from").val(),
                        date_active_to: $("#date_active_to").val(),                        
                        //acl_entries: $("#acl_entries").val(),
                        //custom_field: $("#custom_field").val(),
                    
                }  

                console.log(author);

                $.ajax({
                    url: apiurl,
                    type: 'PUT',
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    data: JSON.stringify({ author }),  
                    success: function ()
                    {  
                        alert("Updated Successfully");  
                        //document.getElementById("simpleform").reset();  
                    },  
                    

                    error: function ()
                    {  
                        alert("Error please try again");  
                    }  

                     
               });  
            });  
         });--%>

         //$(document).ready(function () {  
         //   $("#simpleform").submit(function (e) {  
         //   e.preventDefault();  
         //       var apiurl = "http://localhost:54784/api/stake/PutStakeholder";  
         //       var data = {  
         //           stakeholder_id: $("#input1").val().trim(),
         //           last_name: $("#input5").val().trim(),
         //       }  

         //       $.ajax({  
         //           url: apiurl,  
         //           type: 'PUT', 
         //           contentType: "application/json; charset=utf-8",
         //           dataType: 'json',  
         //           data: data,  
         //           success: function (d)
         //           {  
         //               alert("Updated Successfully");  
         //               //document.getElementById("simpleform").reset();  
         //           },  

         //           error: function ()
         //           {  
         //               alert("Error please try again");  
         //           }  
         //      });  
         //   });  
         //});  

















    </script>

</asp:Content>
