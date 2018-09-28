<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ViewDetail.aspx.cs" Inherits="Module.UserDirectory.ViewDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

     <div class="breadcrumb-holder">
        <div class="container-fluid">
            <div class="breadcrumb">
                <div class="breadcrumb-item"><a href="/UserDirectory/Dashboard.aspx">Home</a></div>
                <div class="breadcrumb-item"><a id="head-stakeh_type_name" class=""><div id="detail1-stakeh_type_name"></div></a></div>
                <div class="breadcrumb-item active">Stakeholder Detail</div>
            </div>
        </div>
    </div>

    

         <div class="container-fluid mt-3">
             <header>
                 <div class="row">
                     <div class="col-auto mr-auto">
                         <h1 id="detail-first_name" class="h3 display"></h1>
                     </div>
                     <div class="col-auto mr-4">
                         <a id="addChild">
                             <input runat="server" class="btn btn-link mr-3" type="image" src="~/Content/img/Add.svg" data-toggle="tooltip" data-placement="top" title="Add Stakeholder Child" /></a>
                         <a id="url">
                             <input runat="server" class="btn btn-link" type="image" src="~/Content/img/edit.svg" data-toggle="tooltip" data-placement="top" title="Edit Details" /></a>                         
                     </div>                     
                 </div>
             </header>


             <div class="content">

                 <div class="row">

                     <div class="col-lg-4 col-md-4 col-sm-4">
                         <div class="card card-user">
                             <div class="card-image">
                                 <img id="imgBg" src="" alt="...">
                             </div>
                             <div class="card-body">
                                 <div class="author">
                                     <a>
                                         <img id="imgStkh" src="" class="avatar border-gray" alt="...">
                                         <h5 class="title" id="detail-stakeh_type_name" />
                                     </a>
                                 </div>
                                 <p class="description text-center">
                                     <label id="detail-full_name"></label>
                                     <br />
                                     <label id="detail-email"></label>                                     
                                 </p>
                                 <hr>
                                 <h5 class="title text-center">Associate</h5>
                                 <div id="memberImg">
                                 </div>
                             </div>
                         </div>
                     </div>


                     <div class="col-lg-8 col-md-8 col-sm-8">

                         <form id="simpleform" name="simpleform">

                             <div class="col-lg-12 col-md-12 col-sm-12">
                                 <div class="card bg-light">
                                     <div class="card-header card-header-transparent d-flex align-items-center">
                                         <h4>Group</h4>
                                     </div>
                                     <div class="card-body">
                                         <div id="group" class="row"></div>
                                     </div>
                                 </div>
                             </div>

                             <div class="col-lg-12 col-md-12 col-sm-12">
                                 <div class="card bg-light flex-column">
                                     <div class="card-header card-header-transparent d-flex align-items-center">
                                         <h4>Access Control</h4>
                                     </div>
                                     <div class="card-body">
                                         <div id="access" class="row"></div>
                                     </div>                                     
                                 </div>
                                 <!-- card -->
                             </div>
                             <!-- col -->

                         </form>

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

          /////////////////////// Init /////////////////////////////////////

          $(document).ready(function () {         


             StakeholderDetail.getDetail("stake/GetStakeholderId");   
             StakeholderDetail.getGroup("stake/GetGroupStakeholder"); 
             StakeholderDetail.getMember("stake/GetMemberStakeholder");
             StakeholderDetail.getAcc("stake/GetAccStakeholder");

             

             document.getElementById("url").setAttribute("href", "UpdateDetail.aspx?Id=" + Id); 

              //var hd = $("input[name=hdf]").val();
              //var Link = "StakeholderDetail.aspx?Id=" + hd;
              //document.getElementById("linkURL").setAttribute("href", Link);        

              //console.log(hd);


        });    
                 

          
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
                          data: { Id },
                          async: true,
                          success: function (response) { StakeholderDetail.getDetailSuccess(response); },
                          error: function (error) { StakeholderDetail.getDetailError(error); },

                      });
                  } catch (ex) { alert('Something went wrong!'); }

              },

              getDetailSuccess: function (response) {
                  var data = $.parseJSON(response);
                  var custom_field = data[0].custom_field;
                  var acl_ent = data[0].acl_entries;
                  var table = $("#access");

                  //console.log(data);

                  $.each(data, function (index, item) {
                                          
                      document.getElementById("head-stakeh_type_name").setAttribute("href", '/UserDirectory/' + item.stakeh_type_name + '.aspx');
                      document.getElementById("imgStkh").setAttribute("src", '../Content/img/StakeList/' + item.stakeh_type_name + '.svg');
                      document.getElementById("imgBg").setAttribute("src", '../Content/img/ImgBackground/' + item.stakeh_type_name + '.jpg');

                      if (item.stakeh_type == 5) {
                          $('#addChild').hide()
                      }
                      else
                      {
                           document.getElementById("addChild").setAttribute("href", "AddChild.aspx?pId=" + Id);
                      }
                       
                      


                  });   
                 
                  
                  $.each(data[0], function (key, val) {
                      $("#detail-" + key).val(decodeURIComponent(val));
                      $("#detail-" + key).html(decodeURIComponent(val));
                      $("#detail1-" + key).html(decodeURIComponent(val));   

                  });

                  var cf = $.map(custom_field, function (a) {
                      var newLabel = $('<p/>', { name: a.field  , text: a.value})

                      //console.log(a.field);

                      return newLabel;                     
                    });
                  $('.description').append(cf);

                  var acl = $.map(acl_ent, function (item) {
                     var container = $('<div/>', { name: item.stakeholder_id, class: 'CardDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2' })
                     var wrapper = $('<div/>', { class: 'd-flex justify-content-start align-items-center' })
                     var img = $('<img/>', { src: '../Content/img/StakeList/' + item.stakeholder_type_id + '.svg', alt: 'person', class: 'img-fluid img-list' })
                     var a = $('<a/>', { class:'ml-2 text-truncate text-muted', href: 'ViewDetail.aspx?Id=' + item.stakeholder_id, text:item.stakeholder_name }) 

                      //console.log(item.stakeholder_type_id);

                     return container.append(wrapper.append(img).append(a))                              

                  });
                  table.append(acl);                                    



              },


              getDetailError: function (error) {
                  var err = $.parseJSON(error.responseText);
                  alert(err.ExceptionMessage);
              },

              //////////////////////// GROUP //////////////////////////////////

              getGroup: function (SubURI) {

                  try {
                      $.ajax({
                          url: this.serviceAPI + SubURI,
                          type: "GET",
                          contentType: "application/json; charset=utf-8",
                          datatype: "json",
                          data: { Id },
                          async: true,
                          success: function (response) { StakeholderDetail.getGroupSuccess(response); },
                          error: function (error) { StakeholderDetail.getGroupError(error); },

                      });
                  } catch (ex) { alert('Something went wrong!'); }
                  //console.log(Id);
              },

              getGroupSuccess: function (response) {
                  var data = $.parseJSON(response);
                  var table = $("#group");
                  

                  //$.each(data[0], function (key, val) {                    
                  //   $("#group-" + key).val(decodeURIComponent(val));
                  //   $("#group-" + key).html(decodeURIComponent(val));
                  //});

                var list = $.map(data, function (item) {

                    var container = $('<div/>', { name: item.stakeholder_id, class: 'CardDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2' })
                    var wrapper = $('<div/>', { class: 'd-flex justify-content-start align-items-center' })
                    var img = $('<img/>', { src: '../Content/img/StakeList/' + item.stakeh_type_name + '.svg', alt: 'person', class: 'img-fluid img-list' })
                    var a = $('<a/>', { class:'ml-2 text-truncate text-muted', href: 'ViewDetail.aspx?Id=' + item.stakeholder_id, text:item.full_name }) 

                    return container.append(wrapper.append(img).append(a))                              

                  });
                  table.append(list);  


                //    return container.append(wrapper.append(img).append(p))                              

                //});             
                //  $('#group').append(list);  


                   //$.each(data, function (index, item) {
                   // var card = $(' <div class=" CardDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2">' +
                   //     '<div class="d-flex justify-content-start align-items-center">' +
                   //     '<img src="../Content/img/StakeList/' + item.stakeh_type_name + '.svg" alt="person" class=" img1 img-fluid img-list" />' +
                   //     '<a href="ViewDetail.aspx?Id=' + item.stakeholder_id + '">' +
                   //     '<p class=" stakehName ml-2 text-truncate">' + item.full_name + '</p>' +
                   //        '</a></div></div>');                    
                   // table.append(card);   
                   // });    
                          


              },

              
              getGroupError: function (error) {
                  var err = $.parseJSON(error.responseText);
                  alert(err.ExceptionMessage);

              },

              /////////////////////// Member ///////////////////////////

              getMember: function (SubURI) {

                  try {
                      $.ajax({
                          url: this.serviceAPI + SubURI,
                          type: "GET",
                          contentType: "application/json; charset=utf-8",
                          datatype: "json",
                          data: { Id },
                          async: true,
                          success: function (response) { StakeholderDetail.getMemberSuccess(response); },
                          error: function (error) { StakeholderDetail.getMemberError(error); },

                      });
                  } catch (ex) { alert('Something went wrong!'); }
                  //console.log(Id);
              },

              getMemberSuccess: function (response) {
                  var data = $.parseJSON(response);
                  var table = $("#memberImg");

                   //$.each(data, function (index, item) {
                   // var card = $(' <div class=" CardDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2">' +
                   //     '<div class="d-flex justify-content-start align-items-center">' +
                   //     '<img src="../Content/img/StakeList/' + item.stakeh_type_name + '.svg" alt="person" class=" img1 img-fluid img-list" />' +
                   //     '<a href="ViewDetail.aspx?Id=' + item.stakeholder_id + '">' +
                   //     '<p class=" stakehName ml-2 text-truncate">' + item.full_name + '</p>' +
                   //     '</a></div></div>');                    
                   // table.append(card);   
                   // });    
                                   

                  var list = $.map(data, function (item) {

                    var container = $('<div/>', { name: item.stakeholder_id, class: 'CardDet col-lg-12 col-md-12 col-sm-12 mt-2 mb-2' })
                    var wrapper = $('<div/>', { class: 'd-flex justify-content-start align-items-center' })
                    var img = $('<img/>', { src: '../Content/img/StakeList/' + item.stakeh_type_name + '.svg', alt: 'person', class: 'img-fluid img-list' })
                    var a = $('<a/>', { class:'ml-2 text-truncate text-muted', href: 'ViewDetail.aspx?Id=' + item.stakeholder_id, text:item.full_name }) 

                    return container.append(wrapper.append(img).append(a))                              

                  });
                  table.append(list);   


              }, getMemberError: function (error) {
                  var err = $.parseJSON(error.responseText);
                  alert(err.ExceptionMessage);

              },

              //////////////////////// Access////////////////

                        getAcc: function (SubURI) {

                            try {
                                $.ajax({
                                    url: this.serviceAPI + SubURI,
                                    type: "GET",
                                    contentType: "application/json; charset=utf-8",
                                    datatype: "json",
                                    data: { Id },
                                    async: true,
                                    success: function (response) { StakeholderDetail.getAccSuccess(response); },
                                    error: function (error) { StakeholderDetail.getAccError(error); },

                                });
                            } catch (ex) { alert('Something went wrong!'); }
                            //console.log(Id);
                        },

                        getAccSuccess: function (response) {
                            var data = $.parseJSON(response);                           
                            var table = $("#access");

                          //$.each(data[0], function (key, val) {                    
                          //   $("#group-" + key).val(decodeURIComponent(val));
                          //   $("#group-" + key).html(decodeURIComponent(val));
                          //});

                          //  $.each(data[0], function (index, item) {
                          //      var imgGroup = $('  <div id="memberImg" class="text-center"><img src="../Content/img/StakeList/' + item + '.svg" alt="person" class="img-fluid"><a href="StakeholderDetail.aspx?Id=' + item.stakeholder_id + '"><input value="' + item.full_name + '" type="button" class="btn btn-link"/></a>');
                          //    memberImg.append(imgGroup);

                             
                          //});

                            

                        }, getAccError: function (error) {
                            var err = $.parseJSON(error.responseText);
                            alert(err.ExceptionMessage);

                        }


          };///StakeholderDetail

              
       

          








          

    </script>



</asp:Content>
