<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="Module.UserDirectory.Department" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

     <div class="breadcrumb-holder">
        <div class="container-fluid">
          <div class="breadcrumb">
            <div class="breadcrumb-item"><a href="/UserDirectory/Dashboard.aspx">Home</a></div>
            <div class="breadcrumb-item active">Department</div>
          </div>
        </div>
      </div>
    
    <section class="forms">        

        <div class="container-fluid">

            <header>
                <h1 class="h3 display">Department</h1>
            </header>

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 ">
                            <div class="form-group">
                                <div class="input-group input-filter">
                                    <input id="myInput" name="filter" type="text" placeholder="Name" class="form-control">
                                    <div class="mr-4">
                                    <a id="btnReset">
                                            <input runat="server" class="btn btn-light" type="image" src="~/Content/img/repeat.svg" data-toggle="tooltip" data-placement="top" title="Reset" /></a>
                                    </div>
                                    <div class="mr-4 ml-3">
                                        <a id="editUrl">
                                            <input runat="server" class="btn btn-light" type="image" src="~/Content/img/edit.svg" data-toggle="tooltip" data-placement="top" title="Edit" /></a>
                                    </div>
                                    <div class="mr-4">
                                    <a id="newUrl">
                                            <input runat="server" class="btn btn-light" type="image" src="~/Content/img/Add.svg" data-toggle="tooltip" data-placement="top" title="New Stakeholder" /></a>
                                    </div>
                                    <div class="mr-4">
                                    <a id="delUrl">
                                            <input runat="server" class="btn btn-delete btn-light" type="image" src="~/Content/img/trashcan.svg" data-toggle="tooltip" data-placement="top" title="Delete" /></a>
                                    </div>
                                </div>
                            </div>
                        </div><!-- Col -->

                    </div><!-- Row -->

                    <div class="card-body">
                        <div id="CardRow" class="row">
                        </div>
                    </div>

                </div>
            </div>
        </div>
        
    </section>    

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
                table.empty();
                
                //$.each(data, function (index, item) {
                //    var card = $(' <div name=' + item.stakeholder_id + ' fullname=' + item.full_name + ' class=" CardDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2"><div class="d-flex justify-content-start align-items-center"><img src="../Content/img/StakeList/' + item.stakeh_type_name + '.svg" alt="person" class=" img1 img-fluid img-list" /><p class=" stakehName ml-2 text-truncate">' + item.full_name + '</p></div></div>');
                //    table.append(card);   
                //});

                // LOOP through each member record to appeand to the body
                var list = $.map(data, function (item) {
                   
                    var container = $('<div/>', { name: item.stakeholder_id, fullname: item.full_name, class: 'CardDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2' })                    
                    var wrapper = $('<div/>', { class: 'd-flex justify-content-start align-items-center' })
                    var img = $('<img/>', { src: '../Content/img/StakeList/' + item.stakeh_type_name + '.svg', alt: 'person', class: 'img1 img-fluid img-list' })
                    var p = $('<p/>', { class: 'stakehName ml-2 text-truncate', text: item.full_name })

                    return container.append(wrapper.append(img).append(p))                              

                });             
                $('#CardRow').append(list);             
                               

            }, getStakeholderError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
            },

             /////////////// DELETE ////////////////////////////         

             DelStakeholder: function (SubURI, Id) {
                
                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: ({ Id }),
                        async: true,
                        success: function (response) { StakeholderList.DelStakeholderSuccess(response); },
                        error: function (error) { StakeholderList.DelStakeholderError(error); },
                    });
                } catch (ex) { alert('Something went wrong!'); }
            },

            DelStakeholderSuccess: function (response) {
                var data = $.parseJSON(response);
                var table = $("#CardRow");
                

                //$.each(data, function (index, item) {
                //    var card = $(' <div name=' + item.stakeholder_id + ' nameheader=' + item.full_name + '  class=" CardDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2"><div class="d-flex justify-content-start align-items-center"><img src="../Content/img/StakeList/' + item.stakeh_type_name + '.svg" alt="person" class="img-fluid img-list" /><p class=" stakehName ml-2 text-truncate">' + item.full_name + '</p></div></div>');
                //    table.append(card);   
                //});

                //var list = $.map(data, function (item) {
                   
                //    var container = $('<div/>', { name: item.stakeholder_id, fullname: item.full_name, class: 'CardDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2' })                    
                //    var wrapper = $('<div/>', { class: 'd-flex justify-content-start align-items-center' })
                //    var img = $('<img/>', { src: '../Content/img/StakeList/' + item.stakeh_type_name + '.svg', alt: 'person', class: 'img1 img-fluid img-list' })
                //    var p = $('<p/>', { class: 'stakehName ml-2 text-truncate', text: item.full_name })

                //    return container.append(wrapper.append(img).append(p))                              

                //});             
                //$('#CardRow').append(list);             
                               

            }, DelStakeholderError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
            },
             

        };  
         


          /////////////// SELECT ///////////

          $(document).ready(function () {

                         
              document.getElementById("newUrl").setAttribute("href", "NewStakeholder.aspx");

              StakeholderList.getStakeholder('stake/GetTypeStakeholder', 3);

              //Reset
              $('#btnReset').click(function () {
                   $('input[name=filter]').val("")
                  StakeholderList.getStakeholder('stake/GetTypeStakeholder', 3);                  
              });

              //Select
              $("#CardRow").on("click", ".CardDet", function () {
                  $("#CardRow > .CardDet").removeClass('bg-primary');
                  $("#CardRow > .CardDet > div > .stakehName").removeClass('text-light');
                  $(this).toggleClass('bg-primary');
                  $(this).find('.stakehName').toggleClass('text-light');

                  var Id = $(this).attr("name");

                  //$("#groupTittle").attr("name");                 
                  //console.log($(this).attr("name"));          

                  document.getElementById("editUrl").setAttribute("href", "ViewDetail.aspx?Id=" + Id);
                  
                  //Delete
                  $(".btn-delete").click(function () {
                  var confirmation = confirm("are you sure you want to remove the item?");
                  if (confirmation)
                      {

                       StakeholderList.DelStakeholder('stake/DeleteStakeholder', Id);  

                        alert("Succesfully Delete");

                        StakeholderList.getStakeholder('stake/GetTypeStakeholder', 3);
                        
                      }
                      
                  });
                  
                

              });

             //Search Filter             
              $("#myInput").on("keyup", function () {
                 var value = $(this).val().toUpperCase();
                 $("#CardRow").find(".CardDet").filter(function () {
                     if ($(this).text().toUpperCase().indexOf(value) > -1)
                     {
                       $(this).find(".stakehName").show();
                     }
                     else
                     {
                         $(this).hide();                         
                     }
                 });
              });
       



          });

       
    
                     


    </script>

</asp:Content>
