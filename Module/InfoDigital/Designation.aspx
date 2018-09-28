<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Designation.aspx.cs" Inherits="Module.InfoDigital.Designation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
        
    <div class="breadcrumb-holder">
        <div class="container-fluid">
          <div class="breadcrumb">
            <div class="breadcrumb-item"><a href="/InfoDigital/Dashboard.aspx">Home</a></div>
            <div class="breadcrumb-item active">Designation</div>
          </div>
        </div>
      </div>
    
    <section class="forms">

        <div class="container-fluid">

            <header>
                <h1 class="h3 display">Designation</h1>
            </header>

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card">
                                    <img src="../Content/img/Org.jpg" alt="Card image cap" class="background-image card-img-top img-fluid"><!-- Background Img-->
                                    <div id="overlay" class="overlay">
                                        <img src="../Content/img/StakeList/Designation.svg" alt="Card image cap" class="img"><!-- Img User-->
                                    </div>
                                </div>
                                <div>
                                    <h5 id="header" class="card-title d-inline">Select groups to view details</h5>
                                    <a id="url">
                                        <input runat="server" class="btn btn-link d-inline" type="image" src="~/Content/img/edit.svg" data-toggle="tooltip" data-placement="top" title="Edit Details" /></a>
                                </div>
                                <!-- Card header -->
                                <div class="card-body">
                                    <p><strong>Members</strong></p>
                                    <div id="memberpanel" class="row">
                                    </div>
                                </div>
                                <%--<div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-12 mt-2 mb-2"> 
                                                <a href="Organization.aspx?Id=' + item.stakeholder_id + '"/>                                               
                                                <div class="d-flex justify-content-start align-items-center">
                                                    <img src="../Content/img/StakeList/Group.svg" alt="person" class="img-fluid img-list" />
                                                    <p class="ml-2">Aria Smith</p>
                                                </div>
                                            </div>                                     
                                        </div>
                                    </div> <!-- content -->--%>
                            </div>
                            <!-- Card -->
                        </div>
                        <!-- Col-6 -->

                        <div class="col-lg-6">
                            <p>If you want to get details of specific groups, you might use filter to search it, or you can select the items that listed below.</p>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" placeholder="Filter Groups" class="form-control">
                                        <div class="input-group-append">
                                            <button type="button" class="btn btn-primary icon-search"></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card-body">
                                <div id="CardRow" class="row">
                                </div>
                            </div>

                        </div>
                        <!-- col-6 -->
                    </div>
                    <!-- Row -->
                </div>
                <!-- Card body -->
            </div>
            <!-- Card -->
        </div>
        <!-- Container -->
    </section>

    <svg class='hideSvgSoThatItSupportsFirefox'>
        <filter id='sharpBlur'>
            <feGaussianBlur stdDeviation='3'></feGaussianBlur>
            <feColorMatrix type='matrix' values='1 0 0 0 0, 0 1 0 0 0, 0 0 1 0 0, 0 0 0 9 0'></feColorMatrix>
            <feComposite in2='SourceGraphic' operator='in'></feComposite>
        </filter>
    </svg>

    <footer class="main-footer">
        <div class="container-fluid">
            <div class="row">
                <div class="font-italic text-right">
                    <p>
                        <a href="http://www.bizobjek.com/">BIZ OBJEK SDN BHD</a> &copy; 
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
          
         var StakeholderList = {
         serviceAPI: '<%=ConfigurationManager.AppSettings["ApiPath"]%>',              

            getStakeholder: function (SubURI,Type) {
                
                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: {Type},
                        async: true,
                        success: function (response) { StakeholderList.getStakeholderSuccess(response); },
                        error: function (error) { StakeholderList.getStakeholderError(error); },
                    });
                } catch (ex) { alert('Something went wrong!'); }
            },

            getStakeholderSuccess: function (response) {
                var data = $.parseJSON(response);
                var table = $("#CardRow");                
                
                // LOOP through each member record to appeand to the body
                $.each(data, function (index, item) {
                    var card = $(' <div name=' + item.stakeholder_id + ' fullname=' + item.full_name + '  class=" CardDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2"><div class="d-flex justify-content-start align-items-center"><img src="../Content/img/StakeList/' + item.stakeh_type_name + '.svg" alt="person" class="img-fluid img-list" /><p class=" stakehName ml-2 text-truncate">' + item.full_name + '</p></div></div>');
                    table.append(card);   
                });

            }, getStakeholderError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
            },

             getMember: function (SubURI, Id) {

                      try {
                          $.ajax({
                              url: this.serviceAPI + SubURI,
                              type: "GET",
                              contentType: "application/json; charset=utf-8",
                              datatype: "json",
                              data: { Id },
                              async: true,
                              success: function (response) { StakeholderList.getMemberSuccess(response); },
                              error: function (error) { StakeholderList.getMemberError(error); },

                          });
                      } catch (ex) { alert('Something went wrong!'); }                      
                  },

              getMemberSuccess: function (response) {
                  var data = $.parseJSON(response);
                  var table = $("#memberpanel");
                  table.empty();
                  
                  //console.log($("#group-full_name"));

                  //$.each(data[0], function (key, val) {                    
                  //   $("#member-" + key).val(decodeURIComponent(val));
                  //   $("#member-" + key).html(decodeURIComponent(val));                  
                  //});

                  $.each(data, function (index, item) {
                      var cardMember = $('  <div name=' + item.stakeholder_id + ' class=" MemberDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2"><a href="User.aspx?Id=' + item.stakeholder_id + '"><div class="d-flex justify-content-start align-items-center"><img src="../Content/img/StakeList/' + item.stakeh_type_name + '.svg" alt="person" class="img-fluid img-list" /><p class=" stakehMember ml-2">' + item.full_name + '</p></div></a></div>');
                      table.append(cardMember);
                  });


              }, getMemberError: function (error) {
                  var err = $.parseJSON(error.responseText);
                  alert(err.ExceptionMessage);

              },

        };  
         


          /////////////// SELECT ///////////

          $(document).ready(function () {

              StakeholderList.getStakeholder('stake/GetTypeStakeholder', 4);

              $("#CardRow").on("click", ".CardDet", function () {
                  $("#CardRow > .CardDet").removeClass('bg-primary');
                  $("#CardRow > .CardDet > div > .stakehName").removeClass('text-light');
                  $(this).toggleClass('bg-primary');
                  $(this).find('.stakehName').toggleClass('text-light');

                  //$("#groupTittle").attr("name");                 
                  //console.log($(this).attr("name"));             
                  
                  document.getElementById("url").setAttribute("href", "StakeholderDetail.aspx?Id=" + $(this).attr("name"));

                  StakeholderList.getMember('stake/GetMemberStakeholder', $(this).attr("name"));             

                  document.getElementById("overlay").style.display = "block";                  

                  $("#header").text($(this).attr("fullname"));

                  console.log($(this).attr("fullname"));



              });

              ///////////////////////// Member Panel //////////////////////////

              $("#memberpanel").on("click", ".MemberDet", function () {
                  $("#memberpanel > .MemberDet").removeClass('bg-primary');
                  $("#memberpanel > .MemberDet > div > .stakehMember").removeClass('text-light');
                  $(this).toggleClass('bg-primary');
                  $(this).find('.stakehMember').toggleClass('text-light');

                  

              });             



          });

       
    


    </script>
    

</asp:Content>
