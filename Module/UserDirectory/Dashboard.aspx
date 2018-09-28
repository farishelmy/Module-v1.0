<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Module.UserDirectory.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
           
    <div class="breadcrumb">
        <h4 class="modal-title">DASHBOARD</h4>
    </div>

  

    <section class="dashboard-counts section-padding">



        <section class="statistics">
            <div class="container-fluid">
                <div class="row d-flex">



                    <div class="col-lg-4">
                        <!-- Monthly Usage-->
                        <div class="card data-usage">
                            <h2 class="display h4">Group</h2>
                            <div class="row d-flex align-items-center">
                                <div class="col-sm-6">
                                    <div class="card">
                                        <a id="GroupLink">
                                            <img src="../Content/img/Stakeh/group.svg" alt="Card image cap" class="card-img-top img-fluid" data-toggle="tooltip" data-placement="top" title="Group">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-6"><strong runat="server" id="GroupTot" class="text-primary">34</strong><span runat="server" id="GroupDate"></span></div>
                            </div>

                        </div>
                    </div>





                    <div class="col-lg-4">
                        <!-- Monthly Usage-->
                        <div class="card data-usage">
                            <h2 class="display h4">Organization</h2>
                            <div class="row d-flex align-items-center">
                                <div class="col-sm-6">
                                    <div class="card">
                                        <a id="OrgLink">
                                            <img src="../Content/img/Stakeh/organization.svg" alt="Card image cap" class="card-img-top img-fluid" data-toggle="tooltip" data-placement="top" title="Organization">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-6"><strong class="text-primary">19</strong><small>Last 3 months</small></div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-4">
                        <!-- Monthly Usage-->
                        <div class="card data-usage">
                            <h2 class="display h4">Branch</h2>
                            <div class="row d-flex align-items-center">
                                <div class="col-sm-6">
                                    <div class="card">
                                        <a id="BranchLink">
                                            <img src="../Content/img/Stakeh/Branch.svg" alt="Card image cap" class="card-img-top img-fluid" data-toggle="tooltip" data-placement="top" title="Branch">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-6"><strong class="text-primary">5</strong><small>Last 8 days</small></div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </section>


        <section class="statistics mt-3">
            <div class="container-fluid">
                <div class="row d-flex">


                    <div class="col-lg-4">
                        <!-- Monthly Usage-->
                        <div class="card data-usage">
                            <h2 class="display h4">Department</h2>
                            <div class="row d-flex align-items-center">
                                <div class="col-sm-6">
                                    <div class="card">
                                        <a id="DprtLink">
                                            <img src="../Content/img/Stakeh/Department.svg" alt="Card image cap" class="card-img-top img-fluid" data-toggle="tooltip" data-placement="top" title="Department">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-6"><strong class="text-primary">2</strong><small>Last 5 days</small></div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-4">
                        <!-- Monthly Usage-->
                        <div class="card data-usage">
                            <h2 class="display h4">Designation</h2>
                            <div class="row d-flex align-items-center">
                                <div class="col-sm-6">
                                    <div class="card">
                                        <a id="DsgLink">
                                            <img src="../Content/img/Stakeh/Designation.svg" alt="Card image cap" class="card-img-top img-fluid" data-toggle="tooltip" data-placement="top" title="Designation">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-6"><strong class="text-primary">7</strong><small>Last 5 days</small></div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-4">
                        <!-- Monthly Usage-->
                        <div class="card data-usage">
                            <h2 class="display h4">User</h2>
                            <div class="row d-flex align-items-center">
                                <div class="col-sm-6">
                                    <div class="card">
                                        <a id="UsrLink">
                                            <img src="../Content/img/Stakeh/User.svg" alt="Card image cap" class="card-img-top img-fluid" data-toggle="tooltip" data-placement="top" title="User">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-6"><strong class="text-primary">8</strong><small>Last 2 days</small></div>
                            </div>

                        </div>
                    </div>




                </div>
            </div>

        </section>



    </section>




















    
    <script type="text/javascript">

        document.getElementById("GroupLink").setAttribute("href", "Group.aspx");
        document.getElementById("OrgLink").setAttribute("href", "Organization.aspx");
        document.getElementById("BranchLink").setAttribute("href", "Branch.aspx");
        document.getElementById("DprtLink").setAttribute("href", "Department.aspx");
        document.getElementById("DsgLink").setAttribute("href", "Designation.aspx");
        document.getElementById("UsrLink").setAttribute("href", "User.aspx");
   


    </script>

</asp:Content>
