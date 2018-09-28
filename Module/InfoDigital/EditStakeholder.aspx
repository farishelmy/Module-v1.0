<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="EditStakeholder.aspx.cs" Inherits="Module.InfoDigital.EditStakeholder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

     <!-- Bootstrap Wizard-->
    <link href="../Content/wizard/assets/css/paper-bootstrap-wizard.css" rel="stylesheet" />

     <!-- Wizard-->    
    <script src="../Content/wizard/assets/js/bootstrap.min.js"></script>
    <script src="../Content/wizard/assets/js/paper-bootstrap-wizard.js" type="text/javascript"></script>
    <script src="../Content/wizard/assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>


    <div class="breadcrumb-holder">
        <div class="container-fluid">
          <div class="breadcrumb">
            <div class="breadcrumb-item"><a href="/InfoDigital/Dashboard.aspx">Home</a></div>
              <%--<div class="breadcrumb-item"><a href="/InfoDigital/StakeholderList.aspx">Stakeholder</a></div>--%>
                <div class="breadcrumb-item"><a id="stake">Stakeholder Detail</a></div>
                <div class="breadcrumb-item active">Edit Details</div>
          </div>
        </div>
      </div>      
             
	   <!--   Big container   -->
	    <div class="container-fluid">
	        <div class="row">
		        <div class="col-sm-12 col-sm-offset-2">

		            <!--      Wizard container        -->
		            <div class="wizard-container">
                        
		                <div class="card wizard-card" data-color="blue" id="wizardProfile">
		                    <form id="simpleform" >
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
											<a href="#data" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-settings"></i>
												</div>
												Security & Active
											</a>
										</li>			                            
                                       <%-- <li>
											<a href="#setting" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-map"></i>
												</div>
												Settings
											</a>
										</li>  --%>                                      
			                        </ul>
								</div>
		                        <div class="tab-content">
		                            <div class="tab-pane" id="basic">	
                                      &nbsp;
											<%--<h5 class="info-text"> Please tell us more about yourself.</h5>--%>											
											<div class="col-sm-12">

                                                
                                                
											   <input id="stakeholder_id" hidden="hidden" type="text" class="form-control">
											

                                                <div class="form-group">
													<label>Type</label>
													<input id="stakeh_type_name" type="text" class="form-control">
												</div>
                                                <div class="row">
                                                <div class="col-sm-4 form-group">												        
													<label>Initials</label>
													<input id="initials" type="text" class="form-control">												        
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
													 <input id="full_name" type="text" class="form-control" placeholder="Andrew...">												        
                                                </div>                
												<div class="col-sm-4 form-group">
													<label>Email</label>
													<input id="email" type="text" class="form-control" placeholder="Smith@htech.com...">
												</div>
                                                <div class="col-sm-4 form-group">
													<label>Date of Birth</label>
													<input id="date_of_birth" type="text" class="form-control input-datepicker">
												</div>												
                                            </div> <!-- row-->
										</div>
		                            </div>
		                            <div class="tab-pane" id="data">
                                        &nbsp;		                              
		                               <div class="col-sm-12">                                                
                                                <div class="row">
                                                    <div class="col-sm-6 form-group">												        
													    <label>Username</label>
													    <input id="login_username" type="text" class="form-control">												        
                                                    </div>                
												    <div class="col-sm-6 form-group">
													    <label>Password</label>
													    <input id="password" type="text" class="form-control">
												    </div>
                                                    <div class="col-sm-6 form-group">
													    <label>Role</label>
													    <input id="role_value" type="text" class="form-control" >
												    </div>
                                                    <div class="col-sm-6 form-group">												        
													     <label>Security Level</label>
													     <input id="security_level_value" type="text" class="form-control">												        
                                                    </div>  
                                                
												    <div class="col-sm-6 form-group">
													    <label>Date Active Range:</label>													
												    </div>
                                                </div><!-- row-->
                                                <div class="row">
                                                    <div class="col-sm-6 form-group">													
													    <input id="date_active_from" type="text" placeholder="From" class="form-control input-datepicker">
												    </div>
                                                    <div class="col-sm-6 form-group">													
													    <input id="date_active_to" type="text" placeholder="To" class="form-control input-datepicker">
												    </div>
                                               </div> 
                                               <div class="row">
                                                <div class="col-sm-6">
                                                   <div class="row">
                                                    <div class="i-checks">
                                                      <input id="checkboxCustom1" type="checkbox" value="" class="form-control-custom">
                                                      <label for="checkboxCustom1">Internal</label>
                                                    </div>
                                                    <div class="i-checks">
                                                       <input id="checkboxCustom2" type="checkbox" value="" class="form-control-custom">
                                                       <label for="checkboxCustom2">Is Blocked</label>
                                                    </div>
                                                   </div>
                                                  </div>
                                                   <div class="col-sm-6">
                                                   <div class="row">
                                                    <div class="i-checks">
                                                       <input id="checkboxCustom3" type="checkbox" value="" class="form-control-custom">
                                                       <label for="checkboxCustom3">Can Login</label>
                                                    </div>
                                                    <div class="i-checks">
                                                       <input id="checkboxCustom4" type="checkbox" value="" class="form-control-custom">
                                                       <label for="checkboxCustom4">Active</label>
                                                    </div>
                                                   </div>
                                                  </div>
                                               </div>                                       
                                              </div><!-- col 12 -->
		                                    </div>
                                   <%-- <div class="tab-pane" id="setting">
                                        &nbsp;
		                                <div class="col-sm-12">
                                            <div class="card bg-light">
                                                <div class="card-header card-header-transparent">Groups</div>
                                                 <div class="card-body">                                                   
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th>#</th>
                                                                    <th>Full Name</th>
                                                                    <th>Username</th>
                                                                    <th>Type</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <th scope="row">1</th>
                                                                    <td>Akademi</td>
                                                                    <td></td>
                                                                    <td>Designation</td>
                                                                </tr>
                                                               
                                                                
                                                            </tbody>
                                                        </table>
                                                     </div>
                                                </div>
                                            </div>
                                        </div>
                                         
                                    </div>--%>
		                        </div>
		                        <div class="wizard-footer">
		                            <div class="pull-right">
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
		            </div> <!-- wizard container -->
		        </div>
	    	</div><!-- end row -->
		</div> <!--  big container -->


    <script type="text/javascript">

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
        var Id = getUrlParameter('Id');

        (function() {
            var stakeLink = "StakeholderDetail.aspx?Id=" + Id;
            document.getElementById("stake").setAttribute("href", stakeLink);

        })();


        //////////////////////////////// GET DETAIL ////////////////////////////////////////

         var StakeholderDetail = {
            serviceAPI: '<%=ConfigurationManager.AppSettings["ApiPath"]%>',
            

            getDetail: function () {
             
                try {
                    $.ajax({
                        url: this.serviceAPI + "stake/GetStakeholderId",
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: {Id},
                        async: true,
                        success: function (response) { StakeholderDetail.getDetailSuccess(response); },
                        error: function (error) { StakeholderDetail.getDetailError(error); },
                        
                    });
                } catch (ex) { alert('Something went wrong!'); }
                //console.log(Id);
            },

            getDetailSuccess: function (response) {
                var data = $.parseJSON(response);  
                              
                
                //console.log($("#label-stakeh_type_name"));
                
                
                $.each(data[0], function (key, val) {
                    $("#" + key).val(decodeURIComponent( val));
                    $("#" + key).html(decodeURIComponent( val));
                    //$("#label-" + key).text(val);
                    console.log(("#" + key));
                   
                });
               

            }, getDetailError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
            }
        };
              
        $(function ()
        {
            StakeholderDetail.getDetail();   
        });   

         ///////////////////////////UPDATE////////////////////////////////

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
                
                console.log(JSON.stringify(author ));
                     //encodeURIComponent(JSON.stringify( author ))
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
        });

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
