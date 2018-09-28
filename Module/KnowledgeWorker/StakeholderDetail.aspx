<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="StakeholderDetail.aspx.cs" Inherits="Module.KnowledgeWorker.StakeholderDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <div class="breadcrumb-holder">
        <div class="container-fluid">
            <div class="breadcrumb">
                <div class="breadcrumb-item"><a href="/KnowledgeWorker/Dashboard.aspx">Home</a></div>
                <div class="breadcrumb-item"><a href="/KnowledgeWorker/StakeholderList.aspx">Stakeholder</a></div>
                <div class="breadcrumb-item active">Stakeholder Detail</div>
            </div>
        </div>
    </div>

    &nbsp;

         <div class="container-fluid">
             <header>
                 <div class="row">
                     <div class="col-lg-11">
                         <h1 id="detail-first_name" class="h3 display"></h1>
                     </div>
                     <div class="col-lg-1">
                         <a id="url">
                             <input runat="server" class="btn btn-link" type="image" src="~/Content/img/edit.svg" data-toggle="tooltip" data-placement="top" title="Edit Details" /></a>
                     </div>
                 </div>
             </header>


             <div class="content">

                 <div class="row">

                     <div class="col-md-4">
                         <div class="card card-user">
                             <div class="card-image">
                                 <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="...">
                             </div>
                             <div class="card-body">
                                 <div class="author">
                                     <a>
                                         <img id="detail" src="../Content/img/avatar-1.jpg" class="avatar border-gray"  alt="...">
                                         <h5 class="title" id="detail-stakeh_type_name" />
                                     </a>
                                 </div>
                                 <p class="description text-center">
                                     <label id="detail-full_name"></label>
                                     <br />
                                     <label id="detail-email"></label>
                                     <br />
                                     <label for="dob" id="detail-date_of_birth"></label>
                                 </p>
                                 <hr>
                                 <h5 class="title text-center">Associate</h5>
                                      <div id="memberImg">                  
                                  </div>                               
                             </div>
                        </div>
                     </div>


                     <div class="col-md-8">

                         <form id="simpleform" name="simpleform">

                             <%--<div class="col-sm-12">
                                 <div class="card bg-light">
                                     <div class="card-header card-header-transparent d-flex align-items-center">
                                         <h4>Members</h4>
                                     </div>
                                     <div class="card-body">
                                         <div class="form-group row">
                                             <div class="sidenav-header-inner text-center">                                                                          
                                                     
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>--%>

                             <div class="col-sm-12">
                                 <div class="card bg-light flex-column">
                                     <div class="card-header card-header-transparent d-flex align-items-center">
                                         <h4>Details</h4>
                                     </div>
                                     <div class="card-body">

                                         <input hidden="hidden" id="input1" type="text" value="" class="form-control">

                                         <div class="form-group row">
                                             <label class="col-sm-6">Username:</label>
                                             <div>
                                                 <label id="detail-login_username" />
                                             </div>
                                         </div>

                                         <div class="form-group row">
                                             <label class="col-sm-6">Role:</label>
                                             <div>
                                                 <label id="detail-role_value" />
                                             </div>
                                         </div>

                                         <div class="form-group row">
                                             <label class="col-sm-4">Date Active Range:</label>
                                         </div>

                                         <div class="row">
                                             <div class="col-md-6">
                                                 <div class="form-group row">
                                                     <label class="col-md-3">From:</label>
                                                     <label id="detail-date_active_from" />
                                                 </div>
                                             </div>
                                             <div class="col-md-6">
                                                 <div class="form-group row">
                                                     <label class="col-md-3">To:</label>
                                                     <label id="detail-date_active_to" />
                                                 </div>
                                             </div>
                                         </div>
                                         <!-- row -->
                                     </div>
                                     <!-- forms -->
                                 </div>
                                 <!-- card -->
                             </div>
                             <!-- col -->
                         </form>

                         <div class="col-sm-12">
                             <div class="card bg-light">
                                 <div class="card-header card-header-transparent d-flex align-items-center">
                                     <h4>Groups</h4>
                                 </div>
                                 <div class="card-body">
                                     <div class="col-6 row">
                                         <div id="group"></div>                                        
                                     </div>
                                 </div>
                             </div>
                         </div>                       

                         <div class="col-sm-12">
                             <div class="card bg-light">
                                 <div class="card-header card-header-transparent d-flex align-items-center">
                                     <h4>Access Control</h4>
                                 </div>
                                 <div class="card-body">
                                     <div class="form-group row">
                                         <label class="col-sm-6">User:</label>
                                         <div>
                                             <label id="" />
                                         </div>
                                     </div>
                                     <div class="form-group row">
                                         <label class="col-sm-6">Type:</label>
                                         <div>
                                             <label id="" />
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>

                         <div class="col-sm-12">
                             <div class="card bg-light">
                                 <div class="card-header card-header-transparent d-flex align-items-center">
                                     <h4>Custom Field</h4>
                                 </div>
                                 <div class="card-body">
                                     <div class="form-group row">
                                         <label class="col-sm-6">Field:</label>
                                         <div>
                                             <label id="" />
                                         </div>
                                     </div>
                                     <div class="form-group row">
                                         <label class="col-sm-6">Value:</label>
                                         <div>
                                             <label id="" />
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>


                     </div>
                     <!-- col-8 -->


                 </div>
                 <!-- row -->






             </div>
             <!-- content-->
         </div> <!-- container-fluid -->
            

            <footer class="main-footer">
                <div class="container-fluid">
                  <div class="row">           
                    <div class="font-italic text-right">
                      <p>BIZ OBJEK SDN BHD &copy; 
                          <script>
                              document.write(new Date().getFullYear())
                          </script>
                       </p>
                    </div>
                  </div>
                </div>
              </footer>


    

<%-- SCRIPT SECTION --%>
      <script type="text/javascript">

          /////////////////////// URL /////////////////////////////////////
          
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
         
      /////////////////////// GetStakeholderDetail /////////////////////////////////////
                
        var StakeholderDetail = {
            serviceAPI: '<%=ConfigurationManager.AppSettings["ApiPath"]%>',
            

            getDetail: function (SubURI) {
             
                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
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
                
                //console.log($("#detail-stakeh_type_name"));
                                
                $.each(data[0], function (key, val) {                    
                    $("#detail-" + key).val(decodeURIComponent(val));
                    $("#detail-" + key).html(decodeURIComponent(val));                  
                    
                });

             
               
            },getDetailError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
            },

            ////////////////////////group ////////////////

            getGroup: function (SubURI) {
             
                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: {Id},
                        async: true,
                        success: function (response) { StakeholderDetail.getGroupSuccess(response); },
                        error: function (error) { StakeholderDetail.getGroupError(error); },
                        
                    });
                } catch (ex) { alert('Something went wrong!'); }
                //console.log(Id);
            },

            getGroupSuccess: function (response) {
                var data = $.parseJSON(response);
                var memberImg = $("#group");               

                //$.each(data[0], function (key, val) {                    
                //   $("#group-" + key).val(decodeURIComponent(val));
                //   $("#group-" + key).html(decodeURIComponent(val));
                //});

                $.each(data, function (index, item) {
                    var imgGroup = $('  <div id="memberImg" class="text-center"><img src="../Content/img/Stakeh/' + item.stakeh_type_name + '.svg" alt="person" class="img-fluid"><a href="StakeholderDetail.aspx?Id='+ item.stakeholder_id+'"><input value="' + item.full_name + '" type="button" class="btn btn-link"/></a>');
                     memberImg.append(imgGroup);
                  });   
                
               
            }, getGroupError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);

            },

             /////////////////////// member ///////////////////////////

            getMember: function (SubURI) {
             
                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: {Id},
                        async: true,
                        success: function (response) { StakeholderDetail.getMemberSuccess(response); },
                        error: function (error) { StakeholderDetail.getMemberError(error); },
                        
                    });
                } catch (ex) { alert('Something went wrong!'); }
                //console.log(Id);
            },

             getMemberSuccess: function (response) {
                 var data = $.parseJSON(response);
                 var memberImg = $("#memberImg");
                 
                                  
                //console.log($("#group-full_name"));

                 //$.each(data[0], function (key, val) {                    
                 //   $("#member-" + key).val(decodeURIComponent(val));
                 //   $("#member-" + key).html(decodeURIComponent(val));                  
                 //});

                 $.each(data, function (index, item) {
                     var imgMember = $(' <div id="memberImg" class="description text-center"><img src="../Content/img/Stakeh/' + item.stakeh_type_name + '.svg" alt="person" class="img-fluid-panel"><a href="StakeholderDetail.aspx?Id='+ item.stakeholder_id+'"><input value="' + item.full_name + '" type="button" class="btn btn-link"/></a>   ');
                     memberImg.append(imgMember);                 

                 });

               
            }, getMemberError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);

            }

        };
              
        $(function ()
        {         
            StakeholderDetail.getDetail("stake/GetStakeholderId");   
            StakeholderDetail.getGroup("stake/GetGroupStakeholder"); 
            StakeholderDetail.getMember("stake/GetMemberStakeholder");
        });    
                 

          /////////////////////////// LINK ////////////////////////////////

          (function () {
              var Link = "EditStakeholder.aspx?Id=" + Id;              
              document.getElementById("url").setAttribute("href", Link); 

              //var hd = $("input[name=hdf]").val();
              //var Link = "StakeholderDetail.aspx?Id=" + hd;
              //document.getElementById("linkURL").setAttribute("href", Link);        

              //console.log(hd);

              
          })();

          








          

    </script>

</asp:Content>
