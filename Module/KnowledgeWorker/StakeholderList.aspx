<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="StakeholderList.aspx.cs" Inherits="Module.KnowledgeWorker.StakeholderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <div class="breadcrumb-holder">
        <div class="container-fluid">
          <div class="breadcrumb">
            <div class="breadcrumb-item"><a href="/KnowledgeWorker/Dashboard.aspx">Home</a></div>
            <div class="breadcrumb-item active">Stakeholder</div>
          </div>
        </div>
      </div>

    <section>     
        

       <div class="container-fluid">          
          <header> 
            <h1 class="h3 display">Stakeholder </h1>               
          </header>       
                     
         <div >
             <form class="form-inline">
                <div class="input-group">
                    <input type="text">
                        <div class="input-group-append">
                            <button type="button" class="btn btn-primary icon-search"></button>
                        </div>
              </div>     
                 &nbsp;  
                 &nbsp; 
                <div class="input-group">
                  <select id="my_select" data-style="btn-outline-dark" title="All Organizations" class="selectpicker">
                    <option value="5">User</option>
                    <option value="1">Organization</option>
                    <option value="0">Group</option>
                    <option value="4">Designation</option>
                    <option value="3">Department</option>
                    <option value="2">Branch</option>
                   </select>                   
                 </div>   
                <div class="input-group">               
                <a href="#"><input runat="server" type="image" src="../Content/img/backward.svg" class="btn btn-link" data-toggle="tooltip" data-placement="top" title="Reset"></a>
                   &nbsp;
                   &nbsp;
              <%--  <a href="/KnowledgeWorker/NewStakeholder.aspx"><input type="image" src="../Content/img/medical.svg" class="btn btn-link" data-toggle="tooltip" data-placement="top" title="New"></a>  
                   &nbsp;
                   &nbsp;
                <a href="#"><input type="image" src="../Content/img/trash.svg" class="btn btn-link" data-toggle="tooltip" data-placement="top" title="Delete"></a>--%>
               </div>
            </form>                 
          </div>  
            
          &nbsp;
       
              
           
               
<%--             
              
       
               
                     
         <div class="spinner-wrapper">
            <div class="spinner sk-spinner-pulse"></div>
         </div>--%>

          

               
                                         
            <div id="CardRow" class="row">                
                </div>
            
                        
          </div>
     </section>
        <footer class="main-footer">
        <div class="container-fluid">
          <div class="row">           
            <div class="font-italic text-right">
              <p><a href="http://www.bizobjek.com/">BIZ OBJEK SDN BHD</a> &copy; 
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
                        url: this.serviceAPI + SubURI ,
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
                
                // LOOP through each member record to appeand to the body
                $.each(data, function (index, item) {
                    var card = $('<div id="CardRow" class="col-6 col-md-4 col-lg-3 col-xl-2"><div class="card"><a href="StakeholderDetail.aspx?Id=' + item.stakeholder_id + '"><div class="text-center"><img src="/Content/img/Stakeh/' + item.stakeh_type_name + '.svg" alt="Image 1063" class="img-fluid w-75"></a></div><div class="card-body"><hr/><h5 class="card-title mb-1 text-truncate text-center">' + item.full_name + '</h5><p class="card-text text-xsmall text-muted text-center">' + item.stakeh_type_name + '</p> </div> </div></div>');
                    table.append(card);    

                    console.log(item.stakeh_type_name);
                });

            }, getStakeholderError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
            }
        };  
   
        $(function ()
        {          
           StakeholderList.getStakeholder('stake/GetAllStakeholder',[]);   
        });          

        ////////////////////////////Selector//////////////////////////////////

          $('select').change(function () {           
                        
              StakeholderList.getStakeholder('stake/GetTypeStakeholder',$(this).val())
             
          });

        ////////////////////////////////////////////////
          $("#reset").on("click", function () {
                $('#my_select').prop('selectedIndex',0);
          });




    </script>

</asp:Content>
