<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Module.InfoDigital.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

     
    <div class="card-header">
         <h4 class="modal-title">DASHBOARD</h4>
    </div>
    
        <section class="dashboard-counts section-padding">
            <div class="container-fluid">
              <div class="row">
                <!-- Count item widget Lab-->
                <div class="col-xl-2 col-md-4 col-6">
                  <div class="wrapper count-title d-flex">
                    <div class="icon"><i class="icon-flask"></i></div>
                    <div class="name"><strong class="text-uppercase">Lab</strong><span><dx:ASPxLabel ID="DateLab" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
                    </span>
                        <div class="count-number">
                            <dx:ASPxLabel ID="lblTotal" runat="server" Text="0"></dx:ASPxLabel>
                        </div>
                    </div>
                  </div>
                </div>
              <!-- Count item widget Factory-->
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-home"></i></div>
                <div class="name"><strong class="text-uppercase">Factory</strong><span><dx:ASPxLabel ID="DateFac" runat="server" Text="ASPxLabel"/></span>
                  <div class="count-number">
                      <dx:ASPxLabel ID="lblTotalFac" runat="server" Text="0"></dx:ASPxLabel>
                  </div>
                </div>
              </div>
            </div> 
            <!-- Count item widget-->
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-check"></i></div>
                <div class="name"><strong class="text-uppercase">Factory</strong><span><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="ASPxLabel"/></span>
                  <div class="count-number">
                      <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="0"></dx:ASPxLabel>
                  </div>
                </div>
              </div>
            </div>
           <!-- Count item widget-->
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-grid"></i></div>
                <div class="name"><strong class="text-uppercase">Factory</strong><span><dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="ASPxLabel"/></span>
                  <div class="count-number">
                      <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="0"></dx:ASPxLabel>
                  </div>
                </div>
              </div>
            </div>
            <!-- Count item widget-->
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-form"></i></div>
                <div class="name"><strong class="text-uppercase">Factory</strong><span><dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="ASPxLabel"/></span>
                  <div class="count-number">
                      <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="0"></dx:ASPxLabel>
                  </div>
                </div>
              </div>
            </div>




            </div>
         </div>
      </section>
   


</asp:Content>
