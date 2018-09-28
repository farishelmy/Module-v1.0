<%@ Page Title="" Language="C#" MasterPageFile="~/Origin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Module.Account.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
           
   
<div class="login-page sidebar-collapse">
    
    <div class="page-header" filter-color="black"> <!-- any color -->
        <div class="page-header-image" style="background-image:url(/Content/img/Grey.jpg)"></div> <!-- Content/assets/img/login.jpg -->
        <div class="container">
            <div class="col-md-4 content-center">
                <div class="card card-login card-plain">
                    
                        <div class="header header-primary text-center">
                            <div class="logo-container">
                                <img src="/Content/img/boflat.svg" alt="">
                            </div>
                        </div>

                        <!-- Login Form -->
                        <div class="content">
                            <div class="input-group form-group-no-border input-lg">                                     
                                <span class="input-group-addon">
                                    <i class="now-ui-icons users_circle-08"></i>
                                </span>
                                <input required="required" runat="server" id="btnUserName" type="text" class="form-control" placeholder="Username...">
                            </div> 

                                <%--<dx:BootstrapButtonEdit  ID="btnEditUserName" ClientInstanceName="userName" runat="server" Text="" NullText="Username" EncodeHtml="false">                   
                                    <ValidationSettings ValidationGroup="LoginUserValidationGroup" ErrorDisplayMode="ImageWithTooltip">
                                        <RequiredField ErrorText="User Name is required." IsRequired="true" />
                                    </ValidationSettings>
                                </dx:BootstrapButtonEdit>--%>                                        
                                 

                            <div class="input-group form-group-no-border input-lg">   
                                <span class="input-group-addon">
                                    <i class="now-ui-icons text_caps-small"></i>
                                </span>
                                <input required="required" runat="server" id="btnPassword" type="password" placeholder="Password..." class="form-control" />
                            </div>

                        </div>

                                <%--<dx:BootstrapButtonEdit ID="btnEditPassword" ClientInstanceName="password" runat="server" Password="true" NullText="Password" EncodeHtml="false">
                                    <ValidationSettings ValidationGroup="LoginUserValidationGroup" ErrorDisplayMode="ImageWithTooltip">
                                        <RequiredField ErrorText="Password is required." IsRequired="true" />
                                    </ValidationSettings>
                                </dx:BootstrapButtonEdit>--%>
                             
                                     

                        <!-- Submit Button -->
                        <div class="footer text-center">
                            <%--<dx:BootstrapButton ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click" ValidationGroup="LoginUserValidationGroup"></dx:BootstrapButton>--%>
                            <dx:ASPxLabel ID="lblErrMsg" runat="server" ForeColor="Red" Text="" ></dx:ASPxLabel>
                            <a runat="server" onserverclick="btnLogin_Click" class="btn btn-primary btn-round btn-lg btn-block">Log In</a> 
                        </div>
                        
                 
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container">                
                <div class="copyright">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>, Copyright ©
                    <a href="#" target="_blank">BIZ OBJEK SDN BHD</a> All rights reserved.
                </div>
            </div>
        </footer>
    </div>
</div>
    

    <%--<div style="padding-top:15px;">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" EncodeHtml="false" Text="Don't have an account? <a href='Register.aspx'>Request</a> your new account." ></dx:ASPxLabel>
    </div>--%>





</asp:Content>
