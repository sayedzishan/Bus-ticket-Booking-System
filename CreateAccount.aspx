<%@ Page Language="vb" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CreateAccount.aspx.vb" Inherits="USERS_CreateAccount" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
      function Validation()
      {
            
            //For User Name
            var UserName=document.getElementById("<%=txtUserName.ClientID %>").value;
            var UserNAmeLen=document.getElementById("<%=txtUserName.ClientID %>").value.length;
            if(UserName=="")
            {
                alert('Enter User Name');
                document.getElementById("<%=txtUserName.ClientID %>").focus();
                return false;
            }
            if(UserName.length<6 || UserName.length>20)
            {
                alert('Min. Length of User Name is 6 and Max. Length 20\n Current Length='+UserNAmeLen);
                document.getElementById("<%=txtUserName.ClientID %>").focus();
                return false;
            }
            var ExpUserName=/^[A-Za-z0-9/.@-_$#%&*()]+$/;
            if(!UserName.match(ExpUserName))
            {
                alert('UserName Contains Invalid Characters');
                document.getElementById("<%=txtUserName.ClientID%>").focus();                                    
                return false;
            }
              //For Password
            var Password=document.getElementById("<%=txtPassword.ClientID %>").value;
            var PasswordLen=document.getElementById("<%=txtPassword.ClientID %>").value.length;
            if(Password=="")
            {
                alert('Enter Password');
                document.getElementById("<%=txtPassword.ClientID %>").focus();
                return false;
            }
            if(Password.length<6 || Password.length>20)
            {
                alert('Min. Length of Password is 6 and Max. Length 20\n Current Length='+PasswordLen);
                document.getElementById("<%=txtPassword.ClientID %>").focus();
                return false;
            }
            var ExpPassword=/^[A-Za-z0-9/_@#$&~!%^*-.]+$/;
            if(!Password.match(ExpPassword))
            {
                alert('Password Contains invalid Characters');
                document.getElementById("<%=txtPassword.ClientID%>").focus();                                   
                return false;
            }
            //For confirm Password
            if(document.getElementById("<%=txtPassword.ClientID%>").value!=document.getElementById("<%=txtConfirmPwd.ClientID%>").value)
            {
                alert('Password and confirm password must be same');
                document.getElementById("<%=txtConfirmPwd.ClientID%>").focus();
                return false;
            }  
              //For Email
            var Email=document.getElementById("<%=txtEmail.ClientID %>").value;
            var EmailLen=document.getElementById("<%=txtEmail.ClientID %>").value.length;
            var EmailExp=/^(\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)+$/;
            if(Email=="")
            {
                alert('Enter EMailId');
                document.getElementById("<%=txtEmail.ClientID %>").focus();
                return false;
            }
            if(Email.length>40)
            {
                alert('Max. Length of Email is 40\n Current Length='+EmailLen);
                document.getElementById("<%=txtEmail.ClientID %>").focus();
                return false;
            }  
            if(!Email.match(EmailExp))
            {
                alert('Invalid EmailId');
                document.getElementById("<%=txtEmail.ClientID%>").focus();                                   
                return false;
            }
          
             //For Country
            if(document.getElementById("<%=ddlCountry.ClientID%>").selectedIndex==0)
            {
                alert('Select Country');
                document.getElementById("<%=ddlCountry.ClientID%>").focus();
                return false;
            }          
             //For City
           var ContactPerson=document.getElementById("<%=txtCity.ClientID %>").value;
            var ContactPersonLen=document.getElementById("<%=txtCity.ClientID %>").value.length;
            if(ContactPerson=="")
            {
                alert('Enter City');
                document.getElementById("<%=txtCity.ClientID %>").focus();
                return false;
            }
            if(ContactPerson.length<4 || ContactPerson.length>30)
            {
                alert('Min. Length of City is 4 and Max. Length 30\n Current Length='+ContactPersonLen);
                document.getElementById("<%=txtCity.ClientID %>").focus();
                return false;
            }
            var ExpContactPerson=/^[A-Z a-z/ .]+$/;
            if(!ContactPerson.match(ExpContactPerson))
            {
                alert('ContactPerson Allows Only Alphabets');
                document.getElementById("<%=txtCity.ClientID%>").focus();                                    
                return false;
            }
              //For Address
          
               var Address=document.getElementById("<%=txtAddress.ClientID%>").value;
               var AddressLen3=document.getElementById("<%=txtAddress.ClientID %>").value.length;  
               if(Address=="")
            {
                alert('Enter Address');
                document.getElementById("<%=txtAddress.ClientID %>").focus();
                return false;
            }
          
            //For Mobile Country Code
            var MobileCountryCode=document.getElementById("<%=txtMobileCountry.ClientID %>").value;
            var MobileCountryCodeLen=document.getElementById("<%=txtMobileCountry.ClientID %>").value.length;
            if(MobileCountryCode=="")
            {
                alert('Enter Country Code');
                document.getElementById("<%=txtMobileCountry.ClientID %>").focus();
                return false;
            }
            if(MobileCountryCode.length<1 || MobileCountryCode.length>3)
            {
                alert('Min. Length of Country Code is 1 and Max. Length 3\n Current Length='+MobileCountryCodeLen);
                document.getElementById("<%=txtMobileCountry.ClientID %>").focus();
                return false;
            }
            var ExpMobileCountryCode=/^[0-9]+$/;
            if(!MobileCountryCode.match(ExpMobileCountryCode))
            {
                alert('Country Code Allows Numerics Only');
                document.getElementById("<%=txtMobileCountry.ClientID%>").focus();                                   
                return false;
            }
            //For Mobile Number
            var MobileNumber=document.getElementById("<%=txtMobile.ClientID %>").value;
            var MobileNumberLen=document.getElementById("<%=txtMobile.ClientID %>").value.length;
            if(MobileNumber=="")
            {
                alert('Enter Mobile Number');
                document.getElementById("<%=txtMobile.ClientID %>").focus();
                return false;
            }
            var ExpMobileNumber=/^[0-9]+$/;
            if(!MobileNumber.match(ExpMobileNumber))
            {
                alert('Mobile Number Allows Numerics Only');
                document.getElementById("<%=txtMobile.ClientID%>").focus();                                   
                return false;
            }
            if(MobileNumber.length<10 || MobileNumber.length>10)
            {
                alert('Min. Length of Mobile Number is 10 and Max. Length 10\n Current Length='+MobileNumberLen);
                document.getElementById("<%=txtMobile.ClientID %>").focus();
                return false;
            }
          
           
             //For Phone Country Code2
            if(document.getElementById("<%=txtPhCountry.ClientID %>").value!="")
            {
                var PhoneCountryCode=document.getElementById("<%=txtPhCountry.ClientID %>").value;
                var PhoneCountryCodeLen=document.getElementById("<%=txtPhCountry.ClientID %>").value.length;            
                if(PhoneCountryCode.length<2 || PhoneCountryCode.length>2)
                {
                    alert('Min. Length of Country Code is 2 and Max. Length 2\n Current Length='+PhoneCountryCodeLen);
                    document.getElementById("<%=txtPhCountry.ClientID %>").focus();
                    return false;
                }
                var ExpPhoneCountryCode=/^[0-9]+$/;
                if(!PhoneCountryCode.match(ExpPhoneCountryCode))
                {
                    alert('Country Code Allows Numerics Only');
                    document.getElementById("<%=txtPhCountry.ClientID%>").focus();                                   
                    return false;
                }
            }
            //For Phone STD Code2
            if(document.getElementById("<%=txtPhSTD.ClientID %>").value!="")
            {
                var PhoneSTDCode=document.getElementById("<%=txtPhSTD.ClientID %>").value;
                var PhoneSTDCodeLen=document.getElementById("<%=txtPhSTD.ClientID %>").value.length;            
                if(PhoneSTDCode.length<3 || PhoneSTDCode.length>6)
                {
                    alert('Min. Length of STD Code is 3 and Max. Length 6\n Current Length='+PhoneSTDCodeLen);
                    document.getElementById("<%=txtPhSTD.ClientID %>").focus();
                    return false;
                }
                var ExpPhoneSTDCode=/^[0-9]+$/;
                if(!PhoneSTDCode.match(ExpPhoneSTDCode))
                {
                    alert('STD Code Allows Numerics Only');
                    document.getElementById("<%=txtPhSTD.ClientID%>").focus();                                   
                    return false;
                }
            }
            //For Phone Number2
            if(document.getElementById("<%=txtPhone.ClientID %>").value!="")
            {
                var Phone=document.getElementById("<%=txtPhone.ClientID %>").value;
                var PhoneLen=document.getElementById("<%=txtPhone.ClientID %>").value.length;            
                if(Phone.length<6 || Phone.length>10)
                {
                    alert('Min. Length of Phone is 6 and Max. Length 10\n Current Length='+PhoneLen);
                    document.getElementById("<%=txtPhone.ClientID %>").focus();
                    return false;
                }
                var ExpPhone=/^[0-9]+$/;
                if(!Phone.match(ExpPhone))
                {
                    alert('Phone Number Allows Numerics Only');
                    document.getElementById("<%=txtPhone.ClientID%>").focus();                                   
                    return false;
                }
            }
            
          
            //For Auto Generated Code
            var Code=document.getElementById("<%=TextBoxHip.ClientID %>").value;
            if(Code=="")
            {
                alert('Enter Security Code');
                document.getElementById("<%=TextBoxHip.ClientID %>").focus();
                return false;
            }
             //For Terms & Conditions
             if(document.getElementById("<%=chkTerms.ClientID%>").checked==false)
            {
                alert('You must Accept Terms and Conditions');
                document.getElementById("<%=chkTerms.ClientID%>").focus();
                return false;
            } 
                           
           
             
            }
    </script>

    <table cellpadding="0" cellspacing="0" width="200px" align="center" bgcolor="E6E6E6" >
        <tr>
            <td align="center">
                <asp:Wizard ID="Wizard1" runat="server" CancelButtonText="" CancelButtonType="Link"
                    FinishCompleteButtonText="" FinishCompleteButtonType="Link" FinishPreviousButtonText=""
                    FinishPreviousButtonType="Link" StartNextButtonText="" StartNextButtonType="Link"
                    StepNextButtonText="" StepNextButtonType="Link" StepPreviousButtonText="" StepPreviousButtonType="Link"
                    DisplaySideBar="False" align="center" Width="200px" ActiveStepIndex="0">
                    <WizardSteps>
                        <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1" AllowReturn="False"
                            StepType="Start">
                            <table cellpadding="0" cellspacing="0" align="center">
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" align="center" width="450px" >
                                <tr>
                                    <td align="left" colspan="2">
                                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="style1">
                                        <font color="red">* Indicates mandatory</font>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table id="tblAccountDetails" runat="server" cellpadding="0" cellspacing="5" width="100%">
                                            <tr id="Tr1" runat="server">
                                                <td id="Td1" colspan="2" style="height: 25px;" runat="server" class="style1">
                                                    <%-- <b><span class="heading" style="color: mediumvioletred">User Registration Form</span></b>--%>
                                                    <span style="font-size: 12pt"><span style="color: maroon"><b><span style="color: #177994;">
                                                        User Registration Form</span></b> </span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                            <td class="style3">
                                            &nbsp;
                                            </td>
                                            </tr>
                                            <tr id="Tr2" runat="server">
                                                <td id="Td2" align="left" runat="server" class="style3">
                                                    <span class="boldtxt">User Name:</span>
                                                </td>
                                                <td id="Td3" align="left" runat="server">
                                                    <asp:TextBox ID="txtUserName" runat="server" MaxLength="20" Wrap="False"></asp:TextBox>
                                                    <asp:LinkButton ID="lnkCheckAvailability" runat="server" OnClientClick="return UserNameAvail();"
                                                        OnClick="lnkCheckAvailability_Click1">Check Availability</asp:LinkButton>
                                                    <br />
                                                    <asp:Label ID="lblAvailability" runat="server" Font-Size="7pt" ForeColor="OliveDrab"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr id="Tr3" runat="server">
                                                <td id="Td4" align="left" runat="server" class="style3">
                                                    <span class="boldtxt">Password:</span>
                                                </td>
                                                <td id="Td5" align="left" runat="server">
                                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="20" Wrap="False"></asp:TextBox>
                                                    <asp:Label ID="lblPwd" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr id="Tr4" runat="server">
                                                <td id="Td6" align="left" runat="server" class="style3">
                                                    <span class="boldtxt">Confirm Password:</span>
                                                </td>
                                                <td id="Td7" align="left" runat="server">
                                                    <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password" MaxLength="20"
                                                        Wrap="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="0" align="left" class="style4" rowspan="0">
                                        <%--<u><b><span class="heading">Contact Details</span></b></u>--%>
                                         <span style="font-size: 12pt"><span style="color: maroon; text-align: center;"><b><span style="color: #177994;">
                                                        Contact Details</span></b> </span></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style3">
                                        <span class="boldtxt">Email:</span>
                                    </td>
                                    <td align="left" class="style2">
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtEmail" MaxLength="30" Wrap="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style3">
                                        <span class="boldtxt">Country:</span>
                                    </td>
                                    <td align="left" class="style2">
                                        <asp:DropDownList ID="ddlCountry" runat="server" AppendDataBoundItems="True" Width="152px"
                                            onchange="return Country();">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="1">Australia</asp:ListItem>
                                            <asp:ListItem Value="2">Bahrain</asp:ListItem>
                                            <asp:ListItem Value="3">Bangladesh</asp:ListItem>
                                            <asp:ListItem Value="4">Belgium</asp:ListItem>
                                            <asp:ListItem Value="5">Canada</asp:ListItem>
                                            <asp:ListItem Value="6">Doha</asp:ListItem>
                                            <asp:ListItem Value="7">Dubai</asp:ListItem>
                                            <asp:ListItem Value="8">France</asp:ListItem>
                                            <asp:ListItem Value="9">Germany</asp:ListItem>
                                            <asp:ListItem Value="10">Hong Kong</asp:ListItem>
                                            <asp:ListItem Value="11">INDIA</asp:ListItem>
                                            <asp:ListItem Value="12">Indonesia</asp:ListItem>
                                            <asp:ListItem Value="13">Ireland</asp:ListItem>
                                            <asp:ListItem Value="14">Italy</asp:ListItem>
                                            <asp:ListItem Value="15">Japan</asp:ListItem>
                                            <asp:ListItem Value="16">Kenya</asp:ListItem>
                                            <asp:ListItem Value="17">Kuwait</asp:ListItem>
                                            <asp:ListItem Value="18">Lebanon</asp:ListItem>
                                            <asp:ListItem Value="19">Libya</asp:ListItem>
                                            <asp:ListItem Value="20">Malaysia</asp:ListItem>
                                            <asp:ListItem Value="21">Maldives</asp:ListItem>
                                            <asp:ListItem Value="22">Mauritius</asp:ListItem>
                                            <asp:ListItem Value="23">Mexico</asp:ListItem>
                                            <asp:ListItem Value="24">Nepal</asp:ListItem>
                                            <asp:ListItem Value="25">Netherlands</asp:ListItem>
                                            <asp:ListItem Value="26">New Zealand</asp:ListItem>
                                            <asp:ListItem Value="27">Norway</asp:ListItem>
                                            <asp:ListItem Value="28">Oman</asp:ListItem>
                                            <asp:ListItem Value="29">Pakistan</asp:ListItem>
                                            <asp:ListItem Value="30">Qatar</asp:ListItem>
                                            <asp:ListItem Value="31">Quilon</asp:ListItem>
                                            <asp:ListItem Value="32">Russia</asp:ListItem>
                                            <asp:ListItem Value="33">Saudi Arabia</asp:ListItem>
                                            <asp:ListItem Value="34">Singapore</asp:ListItem>
                                            <asp:ListItem Value="35">South Africa</asp:ListItem>
                                            <asp:ListItem Value="36">South Korea</asp:ListItem>
                                            <asp:ListItem Value="37">Spain</asp:ListItem>
                                            <asp:ListItem Value="38">Sri Lanka</asp:ListItem>
                                            <asp:ListItem Value="39">Sweden</asp:ListItem>
                                            <asp:ListItem Value="40">Switzerland</asp:ListItem>
                                            <asp:ListItem Value="41">Thailand</asp:ListItem>
                                            <asp:ListItem Value="42">UAE</asp:ListItem>
                                            <asp:ListItem Value="43">UK</asp:ListItem>
                                            <asp:ListItem Value="44">US</asp:ListItem>
                                            <asp:ListItem Value="45">Yemen</asp:ListItem>
                                            <asp:ListItem Value="46">Zimbabwe</asp:ListItem>
                                            <asp:ListItem Value="9999">Other</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style3">
                                        <span class="boldtxt">City:</span>
                                    </td>
                                    <td align="left" class="style2">
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtCity" MaxLength="30" Wrap="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style3">
                                        <span class="boldtxt">Address:</span>
                                    </td>
                                    <td align="left" class="style2">
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtAddress" MaxLength="30" Wrap="False"
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style3">
                                        <span class="boldtxt">Phone:</span>
                                    </td>
                                    <td align="left" class="style2">
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtPhCountry" Width="30px" MaxLength="3"
                                            Wrap="False"></asp:TextBox>
                                        <b>-</b>
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtPhSTD" Width="50px" MaxLength="6"
                                            Wrap="False"></asp:TextBox>
                                        <b>-</b>
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtPhone" Width="100px" MaxLength="10"
                                            Wrap="False"></asp:TextBox>
                                        <br />
                                        Country Code - STD Code - Phone Number
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style3">
                                        <span class="boldtxt">Mobile:</span>
                                    </td>
                                    <td align="left" class="style2">
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtMobileCountry" Width="30px"
                                            MaxLength="3" Wrap="False" Text="91" />
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtMobile" MaxLength="10" Wrap="False" />
                                        <br />
                                        Country Code - Mobile Number
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                    </td>
                                    <td class="style1">
                                        <img src="HipHandler.ashx" alt="HIP" /><br />
                                        <span>Enter the Code Shown Above</span><br />
                                        <asp:TextBox ID="TextBoxHip" Width="60px" runat="server" CssClass="textbox" /><br />
                                        <i>(Letters are Case Sensitive)</i>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                    </td>
                                    <td class="style1">
                                        <asp:CheckBox ID="chkTerms" runat="server" /><a href="#" class="bluelinks" onclick="javascript:window.open('Terms.aspx','Terms','toolbars=no,scrollbars=yes,height=300,width=800,top=20,left=20')">Terms
                                            And Conditions</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        &nbsp;</td>
                                    <td class="style1">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        &nbsp;</td>
                                    <td align="center">
                                        <asp:Button ID="btnSave0" runat="server" CssClass="button" 
                                            OnClick="btnSave_Click" OnClientClick="return Validation();" 
                                            Text="Save And Proceed" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </asp:WizardStep>
                        <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                            <table cellspacing="6" cellpadding="0" align="center" border="0" width="100%">
                                <tr>
                                    <td align="center" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="center">
                                        <br />
                                        <table class="border" align="center" cellspacing="0" cellpadding="2" width="90%"
                                            border="0">
                                            <tr>
                                                <td class="sheader" width="100%">
                                                    <b></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <br />
                                                    <table cellpadding="3" cellspacing="0" border="0" class="border1" width="95%" align="center">
                                                        <tr id="trMsgForNewProfile" runat="server">
                                                            <td id="Td36" align="center" valign="top" runat="server">
                                                                <br />
                                                                Your Details are Submitted successfully<br />
                                                                <br />
                                                                Thank you for Joining with us!<br />
                                                                <br />
                                                                Yo must confirm your registartion by clicking the link in the Email we have sent
                                                                you<br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <asp:Button Text="Finish" runat="server" CssClass="button" ID="btnFinish" OnClick="btnFinish_Click1">
                                                                </asp:Button>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:WizardStep>
                    </WizardSteps>
                </asp:Wizard>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
        .style2
        {
            width: 329px;
        }
        .style3
        {
            width: 32%;
        }
        .style4
        {
            height: 25px;
            width: 32%;
        }
        .style5
        {
            width: 20%;
        }
    </style>
</asp:Content>

