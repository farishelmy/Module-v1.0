<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="UpdateDetail.aspx.cs" Inherits="Module.UserDirectory.UpdateDetail" %>

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
                <div class="breadcrumb-item"><a id="head-stakeh_type_name">Stakeholder</a></div>
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

                    <div class="card wizard-card wizard-page" data-color="blue" id="wizardProfile">
                        <!-- You can switch " data-color="orange" "  with one of the next bright colors: "blue", "green", "orange", "red", "azure"          -->

                       

                            <div class="wizard-header text-center">
                                <h3 id="head-full_name" class="wizard-title"></h3>
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
                                    <li>
                                        <a href="#control" data-toggle="tab">
                                            <div class="icon-circle">
                                                <i class="ti-sa"></i>
                                            </div>
                                            Access Control
                                        </a>
                                    </li>
                                     <li>
                                        <a href="#groupMember" data-toggle="tab">
                                            <div class="icon-circle">
                                                <i class="ti-sa"></i>
                                            </div>
                                            Group & Associate
                                        </a>
                                    </li>
                                </ul>
                            </div><!-- Tab Nav -->
                        
                            <div class="tab-content">
                                                                
                                <div class="tab-pane mt-3" id="basic">
                                    <form id="BasicForm">
                                        <%--<h5 class="info-text"> Please tell us more about yourself.</h5>--%>
                                        <div class="col-sm-12">

                                            <input id="stakeholder_id" hidden="hidden" type="text" class="form-control">
                                            <input id="stakeh_type" hidden="" type="text" class="form-control">

                                            <div class="form-group">
                                                <label>Type</label>
                                                <input id="stakeh_type_name" readonly="" type="text" class="form-control">
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
                                                    <input id="full_name" type="text" class="form-control" placeholder="Smith Johnson">
                                                </div>
                                                <div class="col-sm-4 form-group">
                                                    <label>Email</label>
                                                    <input id="email" type="text" class="form-control" placeholder="Smith@htech.com...">
                                                </div>
                                                <div class="col-sm-4 form-group">
                                                    <label>Date of Birth</label>
                                                    <input id="date_of_birth" type="text" class="form-control input-datepicker">
                                                </div>
                                                <%--<div class="col-sm-6 form-group">
                                                    <label>Date Active Range:</label>
                                                    <div class="i-checks">
                                                        <input id="active" type="checkbox" name="active" value="true" class="form-control-custom">
                                                        <label for="active">Active</label>
                                                    </div>
                                                </div>--%>
                                            </div><!-- row-->
                                           <%-- <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <input id="date_active_from" type="text" placeholder="Date from" class="form-control input-datepicker">
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <input id="date_active_to" type="text" placeholder="Date to" class="form-control input-datepicker">
                                                </div>
                                            </div>--%>                                           
                                        </div>
                                        <div class="wizard-footer mt-3">
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
                                </div><!-- Basic-->                                    
                                                               
                                <div class="tab-pane mt-3" id="security">
                                    <form id="SecurityForm">
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
                                        <div class="wizard-footer mt-3">
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
                                </div><!-- Security-->                                   
                                                              
                                <div class="tab-pane mt-3" id="control">
                                    <form id="ControlForm">
                                        <div class="col-lg-12 col-md-12 col-sm-12">

                                            <input id="acl_id" hidden="hidden" type="text" class="form-control">

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
                                        <div class="wizard-footer mt-3">
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
                                </div><!-- control -->                               
                                                               
                                <div class="tab-pane mt-5" id="groupMember">
                                    <form id="GroupMemberForm">
                                        <div class="col-lg-12 col-md-12 col-sm-12">

                                            <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    
                                                    <header>
                                                        <div class="row">
                                                            <div class="col-auto mr-auto">
                                                                <h2>Group</h2>
                                                            </div>
                                                            <div class="col-auto mr-4">
                                                                <input runat="server" class="btn btn-delete-group btn-light" type="image" src="~/Content/img/trashcan.svg" data-toggle="tooltip" data-placement="top" title="Delete" />
                                                            </div>
                                                        </div>
                                                    </header>
                                                    
                                                    <div class="card-body">
                                                        <div id="GroupRow" class="row">
                                                        </div>
                                                    </div>
                                                    <label><strong>Group</strong></label>
                                                    <select class="select-js-group" multiple="multiple">
                                                    </select>
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <header>
                                                        <div class="row">
                                                            <div class="col-auto mr-auto">
                                                                <h2>Associate</h2>
                                                            </div>
                                                            <div class="col-auto mr-4">
                                                                <input runat="server" class="btn btn-delete-member btn-light" type="image" src="~/Content/img/trashcan.svg" data-toggle="tooltip" data-placement="top" title="Delete" />
                                                            </div>
                                                        </div>
                                                    </header>
                                                    <div class="card-body">
                                                        <div id="MemberRow" class="row">
                                                        </div>
                                                    </div>
                                                    <label><strong>Associate</strong></label>
                                                    <select class="select-js-member" multiple="multiple">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wizard-footer mt-3">
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
                                </div><!-- control -->                                    
                            </div><!-- Tab -->                        
                    </div><!-- wizard color -->
                </div><!-- wizard container -->
            </div><!-- col -->
        </div><!-- end row -->
    </div><!--  big container -->


    <script type="text/javascript">

    
        $(document).ready(function () {

               ///////////////////////  UPDATE BasicForm, SecurityForm, ControlForm  //////////////////////       
            
            $("#BasicForm, #SecurityForm, #ControlForm").submit(function (e) {
                e.preventDefault();

                

                //Aclselected();                               
                    
                //console.log( $("#BasicForm:input").val())
                var url = "/UserDirectory/ViewDetail.aspx?Id=" + Id;                     
                var apiurl = "<%=ConfigurationManager.AppSettings["ApiPath"]%>" + "stake/PutUpdateStakeholder";
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
                        stakeh_type: $("#stakeh_type").val(),
                        stakeholder_id: $("#stakeholder_id").val(),
                        id_number: $("#id_number").val(),
                        acl_id: $("#acl_id").val(),
                        Internal: $('#Internal').prop('checked'),
                        is_blocked: $('#blocked').prop('checked'),
                        can_login: $('#can_login').prop('checked'),
                        login_username: $("#login_username").val(),
                        //password: $("#password").val(),
                        role_value: $('.select-js-role').find(":selected").text(),
                        role_id: $('.select-js-role').val(),
                        //security_level_value: $("#security_level_value").val(),
                        //security_level_id: $("#security_level_id").val(),
                        active: $('#active').prop('checked'),
                        date_active_from: $("#date_active_from").val(),
                        date_active_to: $("#date_active_to").val(),
                        acl_entries : Aclselected(), 
                        //custom_field: $("#custom_field").val(),

                    }

                //var acl_entries = Aclselected();                                  
               
                //Default Value to Null
                for (var propName in author) {
                                      

                    if (author[propName] === "") {
                        author[propName] = null
                    }                    
                                  
                   
                }                  
              
                //console.log( author);

                $.ajax({
                    url: apiurl,
                    type: 'PUT',
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    data: JSON.stringify({ author }),
                    success: function () {
                        alert("Updated Successfully");
                        window.location.replace(url);
                        //document.getElementById("simpleform").reset();  
                    },


                    error: function () {
                        alert("Update Error please try again");
                    }


                });

            });

            

            ///////////////// UPDATE GROUPMEMBER ////////////

            $("#GroupMemberForm").submit(function (z) {
                z.preventDefault();

                var url = "<%=ConfigurationManager.AppSettings["ApiPath"]%>"+"stake/AddChild";
                var group = ($(".select-js-group").select2("data"))
                var member = ($(".select-js-member").select2("data"))
                //console.log(group);
                //console.log(member);

               $.each(group, function (index, item) {

                   var parent_id = item.id;     
                                      
                   StakeholderDetail.AddGroup("stake/AddChild", parent_id, child_id = Id);
                  
                   //console.log("parent="+parent_id,"child"+ child_id);

               });

                $.each(member, function (index, item) {

                    var child_id = item.id;

                    StakeholderDetail.AddMember("stake/AddChild", parent_id = Id , child_id);
                });            




            });
           

             ///////////////////// Group Select //////////
            $("#GroupRow").on("click", ".CardDet", function () {
                  $("#GroupRow > .CardDet").removeClass('bg-primary');
                  $("#GroupRow > .CardDet > div > .stakehName").removeClass('text-light');
                  $(this).toggleClass('bg-primary');
                  $(this).find('.stakehName').toggleClass('text-light');                   

                 var SelectId = $(this).attr("id");

                  //Delete Group
                  $(".btn-delete-group").click(function () {                   

                        StakeholderDetail.RemoveChild('stake/RemoveChild', parent_id = SelectId, child_id = Id);    

                        alert("Succesfully Delete");

                        StakeholderDetail.getGroup("stake/GetGroupStakeholder");                      
                                        
                  });                      

            });

            $("#MemberRow").on("click", ".CardDet", function () {
                  $("#MemberRow > .CardDet").removeClass('bg-primary');
                  $("#MemberRow > .CardDet > div > .stakehName").removeClass('text-light');
                  $(this).toggleClass('bg-primary');
                  $(this).find('.stakehName').toggleClass('text-light');                   

                var SelectId = $(this).attr("id");

                 //Delete Member
                $(".btn-delete-member").click(function () {                   

                    StakeholderDetail.RemoveChild('stake/RemoveChild', parent_id = Id, child_id = SelectId);    

                    alert("Succesfully Delete");

                    StakeholderDetail.getMember("stake/GetMemberStakeholder");                      
                                        
                });








            });

            //////////////////////////submit Acl////////////////////////////////
            function Aclselected() {
              
               var aclObj =
                    {
                        stakeholder_id: null,
                        stakeholder_name: null,
                        stakeholder_type_id: null,
                        attach: false,
                        modify_access: false,
                        remove: false,
                        remove_child: false,
                        update: false,
                        update_child: false,
                        view: false,
                        view_child: false,
                        parentId: null,
                        index: -1,
                        depth: 0,
                        expanded: false,
                        expandable: true,
                        checked: null,
                        leaf: false,
                        cls: null,
                        iconCls: null,
                        icon: null,
                        root: false,
                        isLast: false,
                        isFirst: false,
                        allowDrop: true,
                        allowDrag: true,
                        loaded: false,
                        loading: false,
                        href: null,
                        hrefTarget: null,
                        qtip: null,
                        qtitle: null,
                        qshowDelay: 0,
                        children: null
                    };

                var viewSource = ($(".select-js-view").select2("data"))
                var updateSource = ($(".select-js-update").select2("data"))
                var removeSource = ($(".select-js-remove").select2("data"))
                var modifySource = ($(".select-js-modify").select2("data"))
           

                var viewEntries =[]
                    $.each(viewSource,function (index,item) {
                        viewEntries.push({
                            stakeholder_id: item.id,
                            stakeholder_name: item.text,
                            stakeholder_type_id: item.value,
                            attach: false,
                            modify_access: false,
                            remove: false,
                            remove_child: false,
                            update: false,
                            update_child: false,
                            view: true,
                            view_child: false,
                            index: -1,
                            depth: 0,
                            expanded: false,
                            expandable: true,
                            checked: null,
                            leaf: false,
                            cls: null,
                            iconCls: null,
                            icon: null,
                            root: false,
                            isLast: false,
                            isFirst: false,
                            allowDrop: true,
                            allowDrag: true,
                            loaded: false,
                            loading: false,
                            href: null,
                            hrefTarget: null,
                            qtip: null,
                            qtitle: null,
                            qshowDelay: 0,
                            children: null
                        })                      
                    });              
               
                var update = acl_builder(updateSource, viewEntries, 'update')
                var remove = acl_builder(removeSource, update, 'remove')
                var modAcl = acl_builder(modifySource, remove, 'modify_access')
                                

                if (modAcl.length === 0)
                {
                    modAcl = null;
                }

                //console.log(modAcl) 

                return modAcl
            }


            ///////////////////////////////////recursive function//////////////////////////////////////////
            function acl_builder(selData,aclEntries,type) {
                //console.log('this is: '+type)
                $.each(selData, function (i, v) {
                    //console.log(v.text)
                            var targetI = aclEntries.findIndex(function (data) {return data.stakeholder_id === v.id })
                            //console.log(aclEntries)
                            if ( targetI!==-1) {
                                aclEntries[targetI][type] = true
                            } else {
                                 var aclObj =
                                     {                             
                                        stakeholder_id: null,
                                        stakeholder_name: null,
                                        stakeholder_type_id: null,
                                        attach: false,
                                        modify_access: false,
                                        remove: false,
                                        remove_child: false,
                                        update: false,
                                        update_child: false,
                                        view: false,
                                        view_child: false,
                                        index: -1,
                                        depth: 0,
                                        expanded: false,
                                        expandable: true,
                                        checked: null,
                                        leaf: false,
                                        cls: null,
                                        iconCls: null,
                                        icon: null,
                                        root: false,
                                        isLast: false,
                                        isFirst: false,
                                        allowDrop: true,
                                        allowDrag: true,
                                        loaded: false,
                                        loading: false,
                                        href: null,
                                        hrefTarget: null,
                                        qtip: null,
                                        qtitle: null,
                                        qshowDelay: 0,
                                        children: null
                                     };
                                aclObj.stakeholder_id= v.id
                                aclObj.stakeholder_name= v.text
                                aclObj.stakeholder_type_id= v.value
                                aclObj[type]=true
                                aclEntries.push(aclObj)
                            }
                })                       
                   
                return aclEntries;
              
            }


            ////////////////////////// SELECT & GET DETAIL ////////////////////////////////////

            $('.select-js-role').select2();            
            $('.select-js-view').select2();
            $('.select-js-update').select2();
            $('.select-js-remove').select2();
            $('.select-js-modify').select2();

            StakeholderDetail.getDetail("stake/GetStakeholderId");
            StakeholderDetail.getAccessControlList("stake/GetAllStakeholder");
            StakeholderDetail.getRole("stake/GetAllRole");
            StakeholderDetail.getGroup("stake/GetGroupStakeholder");
            StakeholderDetail.getMember("stake/GetMemberStakeholder");

            document.getElementById("stake").setAttribute("href", "ViewDetail.aspx?Id=" + Id);

            ///////////////CAN LOGIN/////////////

            $('#can_login').change(function () {
                if (this.checked) {
                    $('.autoUpdate').show();
                }
                else {
                    $('.autoUpdate').hide();
                }
            });

            //$("can_login").change(function () {
            //    $(".autoUpdate").toggle();
            //});

            //if ($('#can_login').prop('checked'))
            //{
            //  $('#autoUpdate').show();
            //}
            //  else ($('#can_login').prop('checked'))
            //{
            //  $('#autoUpdate').hide();
            //}

            ////////////////////////////////////////////////////////////

            // $(".select-js-view").change(function () {
            //     //console.log($(this.options).filter(":selected")));
            //     console.log($(this).select2("data"))
            //});      

           

                      


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

            var Id = getUrlParameter('Id');



        //////////////////////////////// GET DETAIL ////////////////////////////////////////

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
                //console.log(Id);
            },

            getDetailSuccess: function (response) {
                var data = $.parseJSON(response);
                var acl_ent = data[0].acl_entries;
                          
                                             
                $.each(data, function (index, item) {
                    document.getElementById("head-stakeh_type_name").setAttribute("href", '/UserDirectory/' + item.stakeh_type_name + '.aspx');
                    StakeholderDetail.getAllTypeGroup("stake/GetAllTypeGroup", item.stakeh_type);
                    StakeholderDetail.getAllTypeMember("stake/GetAllTypeMember", item.stakeh_type);
                    

                });


                $.each(data[0], function (key, val) {
                    $("#" + key).val(decodeURIComponent(val));
                    $("#" + key).html(decodeURIComponent(val));
                    $("#head-" + key).html(decodeURIComponent(val));
                    //$("#label-" + key).text(val);
                    //console.log(("#" + key));


                    //Active
                    if (key === 'active') {
                        var valActive = (val == 'true');                      
                        $("#active").prop("checked", valActive);
                    }                  

                    else (key === 'active')
                    { 
                       
                    }
                    
                    //Internal
                    if (key === 'Internal') {
                        var valInt = (val == 'true');                      
                        $("#Internal").prop("checked", valInt);
                    }                  

                    else (key === 'Internal')
                    { 
                       
                    }

                    //Is Blocked 
                    if (key === 'is_blocked') {
                        var valBlocked = (val == 'true');                      
                        $("#blocked").prop("checked", valBlocked);
                    }                  

                    else (key === 'is_blocked')
                    { 
                       
                    }

                    //Can Login 
                    if (key === 'can_login' &&  val === 'true' ) {
                        //var valLogin = (val == 'true');                      
                        $("#can_login").prop("checked", val);
                        $('.autoUpdate').show();
                        
                    }                  

                    else (key === 'can_login'  &&  val === 'false' )
                    { 
                        $('.autoUpdate').show();
                    }
                    
                   

                });

                //ROLE
                var rol = $.map(data, function (item) {

                    var select = new Option(item.role_value, item.role_id, true, true);
                     
                    return select
                });
                $(".select-js-role").append(rol).trigger('change'); 
               

               
                

                ////////////////////////////////////// POPULATE ACL //////////////////////////////////////


                //var display = $.map(acl_ent, function (item) {

                //   var select = $('<select>', { class: 'select-js-view', multiple: 'multiple' })
                //   var opt = $('<option/>', { selected:'selected', text: item.stakeholder_name })

                //    return opt

                //});
                //$(".select-js-view").append(display);      

                function acl_multi(array) {

                    const res = {
                        view: [],
                        update: [],
                        remove: [],
                        modify_access: []
                    }

                    const keys = Object.keys(array[0])

                    for (let i = 0; i < array.length; i++) {
                        keys.forEach(function (key) {
                            if (key !== 'stakeholder_name' && key !== 'stakeholder_id' && key !== 'stakeholder_type_id') {
                                if (array[i][key]) {
                                    res[key].push({
                                        stakeholder_name: array[i].stakeholder_name,
                                        stakeholder_id: array[i].stakeholder_id,
                                        stakeholder_type_id: array[i].stakeholder_type_id                                       

                                    })
                                }
                            }
                        })
                    }

                    return res

                }
                                
                 let { view, update, remove, modify_access: aclMod } = acl_multi(acl_ent) // returns object. Push to array if so desired           
               

                 //view
                 var dis = $.map(view, function (item) {
                    //var opt = $('<option/>', { tags: true, text: item.stakeholder_name,  id: item.stakeholder_id, value: item.stakeh_type })      
                    var newState = new Option(item.stakeholder_name, item.stakeholder_id, true, true);
                             
                    return newState

                 });
                $(".select-js-view").append(dis).trigger('change');  
                $(".select-js-view").trigger(
                {
                    type: 'select2:select',
                     params:
                     {
                        data: data
                     }
                });                                       
             
                 //update
                 var dis = $.map(update, function (item) {
                    
                    var newState = new Option(item.stakeholder_name, item.stakeholder_id, true, true);
                             
                    return newState

                });
                $(".select-js-update").append(dis).trigger('change');  
                 $(".select-js-update").trigger({
                    type: 'select2:select',
                     params:
                     {
                        data: data
                     }
                });

                //remove
                var dis = $.map(remove, function (item) {                    
                    var newState = new Option(item.stakeholder_name, item.stakeholder_id, true, true);
                             
                    return newState

                });
                $(".select-js-remove").append(dis).trigger('change');  
                 $(".select-js-remove").trigger({
                    type: 'select2:select',
                     params:
                    {
                        data: data
                    }
                });

                //modify
                var dis = $.map(aclMod, function (item) {                         
                    var newState = new Option(item.stakeholder_name, item.stakeholder_id, true, true);
                             
                    return newState

                });
                $(".select-js-modify").append(dis).trigger('change');  
                 $(".select-js-modify").trigger({
                    type: 'select2:select',
                     params:
                     {
                        data: data
                     }
                });                     
               
            },

            getDetailError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
            },

            //////////////////////////////// ROLE ////////////////////////////////////////


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

            getRoleSuccess: function (response) {
                var data = $.parseJSON(response);


                var list = $.map(data, function (item) {

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

            getAccessControlListSuccess: function (response) {
                var data = $.parseJSON(response);


                var list = $.map(data, function (item) {
                    return { text: item.full_name, id: item.stakeholder_id, value: item.stakeh_type }

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
                var table = $("#GroupRow");
                table.empty();

                $(".select-js-group").select2({maximumSelectionLength: 1});

                var list = $.map(data, function (item) {
                   
                    var container = $('<div/>', { id: item.stakeholder_id, fullname: item.full_name, class: 'CardDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2' })                    
                    var wrapper = $('<div/>', { class: 'd-flex justify-content-start align-items-center' })
                    var img = $('<img/>', { src: '../Content/img/StakeList/' + item.stakeh_type_name + '.svg', alt: 'person', class: 'img1 img-fluid img-list' })
                    var p = $('<p/>', { class: 'stakehName ml-2 text-truncate', text: item.full_name })

                    return container.append(wrapper.append(img).append(p))                              

                });         
                $('#GroupRow').append(list);                

                //var dis = $.map(data, function (item) {

                //    var opt = $('<option/>', { selected: 'selected', text: item.full_name })

                //    return opt

                //});
                //$(".select-js-group").append(dis, { maximumSelectionLength: 2 });              
                
            },

            getGroupError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);

            },

            ////////////////////////  ALL TYPE GROUP (Item List) //////////////////////////////////

            getAllTypeGroup: function (SubURI, Type) {

                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: { Type },
                        async: true,
                        success: function (response) { StakeholderDetail.getAllTypeGroupSuccess(response); },
                        error: function (error) { StakeholderDetail.getAllTypeGroupError(error); },

                    });
                } catch (ex) { alert('Something went wrong!'); }
                //console.log(Id);
            },

            getAllTypeGroupSuccess: function (response) {
                var data = $.parseJSON(response);

                var list = $.map(data, function (item) {
                    return { text: item.full_name, id: item.stakeholder_id }

                });

                $('.select-js-group').select2({ data: list });                 


            },



            getAllTypeGroupError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
            },
                      
            
           /////////////////ADD GROUP /////////////////
           AddGroup: function (SubURI, parent_id, child_id) {

                //console.log("parent=" + parent_id, "child=" + child_id)

                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: ({ parent_id,child_id }),
                        async: true,
                        success: function (response) { StakeholderDetail.AddGroupSuccess(response); },
                        error: function (error) { StakeholderDetail.AddGroupError(error); },
                        
                    });
                } catch (ex) { alert('Something went wrong!'); }
                //console.log(Id);
           },

            AddGroupSuccess: function (response)
            {
                var data = $.parseJSON(response);
                 alert("Update Successfully");
                 StakeholderDetail.getGroup("stake/GetGroupStakeholder");
            },

             AddGroupError: function (error) {
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
                var table = $("#MemberRow");
                table.empty();

                $(".select-js-member").select2({ maximumSelectionLength: 1 });

                 var list = $.map(data, function (item) {
                   
                    var container = $('<div/>', { id: item.stakeholder_id, fullname: item.full_name, class: 'CardDet col-lg-6 col-md-6 col-sm-12 mt-2 mb-2' })                    
                    var wrapper = $('<div/>', { class: 'd-flex justify-content-start align-items-center' })
                    var img = $('<img/>', { src: '../Content/img/StakeList/' + item.stakeh_type_name + '.svg', alt: 'person', class: 'img1 img-fluid img-list' })
                    var p = $('<p/>', { class: 'stakehName ml-2 text-truncate', text: item.full_name })

                    return container.append(wrapper.append(img).append(p))                              

                });         
                
                $('#MemberRow').append(list);

                //var dis = $.map(data, function (item) {

                //    var opt = $('<option/>', { selected: 'selected', text: item.full_name })

                //    return opt

                //});
                //$(".select-js-member").append(dis);
                 
            },

            getMemberError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);

            },

            ////////////////////////  ALL TYPE MEMBER (Item) //////////////////////////////////

            getAllTypeMember: function (SubURI, Type) {

                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: { Type },
                        async: true,
                        success: function (response) { StakeholderDetail.getAllTypeMemberSuccess(response); },
                        error: function (error) { StakeholderDetail.getAllTypeMemberError(error); },

                    });
                } catch (ex) { alert('Something went wrong!'); }
                //console.log(Id);
            },

            getAllTypeMemberSuccess: function (response) {
                var data = $.parseJSON(response);

                var list = $.map(data, function (item) {
                    return { text: item.full_name, id: item.stakeholder_id }

                });
                $('.select-js-member').select2({ data: list });


            },

            getAllTypeMemberError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
            },

            /////////////////ADD MEMBER /////////////////
           AddMember: function (SubURI, parent_id, child_id) {

                //console.log("parent=" + parent_id, "child=" + child_id)

                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: ({ parent_id,child_id }),
                        async: true,
                        success: function (response) { StakeholderDetail.AddMemberSuccess(response); },
                        error: function (error) { StakeholderDetail.AddMemberError(error); },
                        
                    });
                } catch (ex) { alert('Something went wrong!'); }
                //console.log(Id);
           },

            AddMemberSuccess: function (response)
            {
                var data = $.parseJSON(response);
                 alert("Update Successfully");
                 StakeholderDetail.getMember("stake/GetMemberStakeholder");
            },

             AddMemberError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
             },

             /////////////// Remove Child ////////////////////////////         

             RemoveChild: function (SubURI, Id) {
                
                try {
                    $.ajax({
                        url: this.serviceAPI + SubURI,
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        datatype: "json",
                        data: ({ parent_id,child_id }),
                        async: true,
                        success: function (response) { StakeholderList.RemoveChildSuccess(response); },
                        error: function (error) { StakeholderList.RemoveChildError(error); },
                    });
                } catch (ex) { alert('Something went wrong!'); }
            },

            RemoveChildSuccess: function (response)
            {
                var data = $.parseJSON(response);              
                          
            },

            RemoveChildError: function (error) {
                var err = $.parseJSON(error.responseText);
                alert(err.ExceptionMessage);
            },





        };













    </script>

</asp:Content>
