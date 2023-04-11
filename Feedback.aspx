<%@ Page Language="vb" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Feedback.aspx.vb" Inherits="Admin_Feedback" Title="Feeddback Creation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
      function Validation()
      {
           //alert('hi');
            //For User Name
            var Name=document.getElementById("<%=txtName.ClientID %>").value;
            var NameLen=document.getElementById("<%=txtName.ClientID %>").value.length;
            if(Name=="")
            {
                alert('Enter Name');
                document.getElementById("<%=txtName.ClientID %>").focus();
                return false;
            }
            if(Name.length<4 || Name.length>20)
            {
                alert('Min. Length of Name is 4 and Max. Length 20\n Current Length='+NameLen);
                document.getElementById("<%=txtName.ClientID %>").focus();
                return false;
            }
            var ExpName=/^[A-Za-z0-9 ]+$/;
            if(!Name.match(ExpName))
            {
                alert('Name Contains Invalid Characters');
                document.getElementById("<%=txtName.ClientID%>").focus();                                    
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
            if(Email.length>30)
            {
                alert('Max. Length of Email is 30\n Current Length='+EmailLen);
                document.getElementById("<%=txtEmail.ClientID %>").focus();
                return false;
            }  
            if(!Email.match(EmailExp))
            {
                alert('Invalid EmailId');
                document.getElementById("<%=txtEmail.ClientID%>").focus();                                   
                return false;
            }
            //For Number
        var MobileCountryCode=document.getElementById("<%=txtMobileCountry.ClientID %>").value;
        var MobileNumber=document.getElementById("<%=txtMobile.ClientID %>").value;
        var PhoneCountryCode=document.getElementById("<%=txtPhCountry1.ClientID %>").value;
        var PhoneSTDCode=document.getElementById("<%=txtPhSTD1.ClientID %>").value;
        var Phone=document.getElementById("<%=txtPhone1.ClientID %>").value;
        if(MobileCountryCode=="" && MobileNumber=="" && PhoneCountryCode=="" && PhoneSTDCode=="" && Phone=="" )
        {
         alert('Please enter atleast one contact number');
         document.getElementById("<%=txtMobileCountry.ClientID %>").focus();
         return false;
         }
             else
             {
                 if(PhoneCountryCode=="" && PhoneSTDCode=="" && Phone=="" )
                 {
                     if(MobileCountryCode=="" && MobileNumber=="" )
                     {
                         alert('Please enter atleast one contact number');
                         document.getElementById("<%=txtMobileCountry.ClientID %>").focus();
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
                alert('Min. Length of Country Code is 1 and Max. Length 3\n [Current Length]='+MobileCountryCodeLen);
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
                alert('Min. Length of Mobile Number is 10 and Max. Length 10\n [Current Length]='+MobileNumberLen);
                document.getElementById("<%=txtMobile.ClientID %>").focus();
                return false;
            }
          
         }
          if(MobileCountryCode=="" && MobileNumber=="" )
                 {
                          if(PhoneCountryCode=="" && PhoneSTDCode=="" && Phone=="" )
                         {
                                 alert('Please enter atleast one contact number');
                                 return false;
                         }
                 
          
             //For Phone Country Code1
            var PhoneCountryCode=document.getElementById("<%=txtPhCountry1.ClientID %>").value;
            var PhoneCountryCodeLen=document.getElementById("<%=txtPhCountry1.ClientID %>").value.length;
            if(PhoneCountryCode=="")
            {
                alert('Enter Phone Country Code');
                document.getElementById("<%=txtPhCountry1.ClientID %>").focus();
                return false;
            }
            if(PhoneCountryCode.length<1 || PhoneCountryCode.length>3)
            {
                alert('Min. Length of Phone Country Code is 1 and Max. Length 3\n [Current Length]='+PhoneCountryCodeLen);
                document.getElementById("<%=txtPhCountry1.ClientID %>").focus();
                return false;
            }
            var ExpPhoneCountryCode=/^[0-9]+$/;
            if(!PhoneCountryCode.match(ExpPhoneCountryCode))
            {
                alert('Phone Country Code Allows Numerics Only');
                document.getElementById("<%=txtPhCountry1.ClientID%>").focus();                                   
                return false;
            }
           
            //For Phone STD Code
             var PhoneSTDCode=document.getElementById("<%=txtPhSTD1.ClientID %>").value;
            var PhoneSTDCodeLen=document.getElementById("<%=txtPhSTD1.ClientID %>").value.length;
            if(PhoneSTDCode=="")
            {
                alert('Enter Phone STD Code');
                document.getElementById("<%=txtPhSTD1.ClientID %>").focus();
                return false;
            }
            if(PhoneSTDCode.length<3 || PhoneSTDCode.length>5)
            {
                alert('Min. Length of Phone STD Code is 3 and Max. Length 5\n [Current Length]='+PhoneCountryCodeLen);
                document.getElementById("<%=txtPhSTD1.ClientID %>").focus();
                return false;
            }
            var ExpPhoneSTDCode=/^[0-9]+$/;
            if(!PhoneSTDCode.match(ExpPhoneSTDCode))
            {
                alert('Phone STD Code Allows Numerics Only');
                document.getElementById("<%=txtPhSTD1.ClientID%>").focus();                                   
                return false;
            }
            //For Phone Number1
           
                var Phone=document.getElementById("<%=txtPhone1.ClientID %>").value;
                var PhoneLen=document.getElementById("<%=txtPhone1.ClientID %>").value.length; 
                if(Phone=="")
            {
                alert('Enter Phone Number');
                document.getElementById("<%=txtPhone1.ClientID %>").focus();
                return false;
            }           
                if(Phone.length<6 || Phone.length>10)
                {
                    alert('Min. Length of Phone is 6 and Max. Length 10\n [Current Length]='+PhoneLen);
                    document.getElementById("<%=txtPhone1.ClientID %>").focus();
                    return false;
                }
                var ExpPhone=/^[0-9]+$/;
                if(!Phone.match(ExpPhone))
                {
                    alert('Phone Number Allows Numerics Only');
                    document.getElementById("<%=txtPhone1.ClientID%>").focus();                                   
                    return false;
                }
            }
            }
            
            
             //For Comments/Suggetions
            var Details=document.getElementById("<%=txtComments.ClientID %>").value;
            var DetailsLen=document.getElementById("<%=txtComments.ClientID %>").value.length;
            if(Details=="")
            {
                alert('Enter Comments/Suggetions');
                document.getElementById("<%=txtComments.ClientID %>").focus();
                return false;
            }
            if(Details.length<15 || Details.length>50)
            {
                alert('Min. Length of Comments is 15 and Max. Length 50\n Current Length='+DetailsLen);
                document.getElementById("<%=txtComments.ClientID %>").focus();
                return false;
            }
            var ExpDetails=/^[A-Za-z0-9 ]+.$/;
            if(!Details.match(ExpDetails))
            {
                alert('Comments Contains Invalid Characters');
                document.getElementById("<%=txtComments.ClientID%>").focus();                                    
                return false;
            }
             //For Rating
            if(document.getElementById("<%=ddlRating.ClientID%>").selectedIndex==0)
            {
                alert('Give Rating');
                document.getElementById("<%=ddlRating.ClientID%>").focus();
                return false;
            }  
           
          
            
          }
    </script>

    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="left">
                <asp:Wizard ID="Wizard1" runat="server" CancelButtonText="" CancelButtonType="Link"
                    FinishCompleteButtonText="" FinishCompleteButtonType="Link" FinishPreviousButtonText=""
                    FinishPreviousButtonType="Link" StartNextButtonText="" StartNextButtonType="Link"
                    StepNextButtonText="" StepNextButtonType="Link" StepPreviousButtonText="" StepPreviousButtonType="Link"
                    DisplaySideBar="False" align="center" Width="450px" hight="600" ActiveStepIndex="0">
                    <WizardSteps>
                        <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1" AllowReturn="False"
                            StepType="Start">
                            <table cellpadding="0" cellspacing="5" align="center" class="border" bgcolor="E6E6E6">
                                <tr>
                                    <td colspan="2">
                                        <span style="font-size: 16pt"><span style="color: maroon">
                                        <span style="color: #177994; font-family: 'Trebuchet MS';">Report a Problem</span> </span></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <b><span style="color: #cc0000">* Compulsory Fields</span></b>&nbsp;</td>
                                    <td align="right">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2" class="style1">
                                        Our Help section will provide answers to Frequently Asked Questions (FAQs). If you
                                        wish to know more about our services or if you need our help in any matter, please
                                        fill in the form below and we will revert to the specified email address in 48 hours.
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style1">
                                        <b>Your Name :</b>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="textbox" 
                                            style="font-family: 'Trebuchet MS'"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style1">
                                        <b>Email Address :</b>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" 
                                            style="font-family: 'Trebuchet MS'"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style1">
                                        <b>Contact Numbers :</b>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Label1" runat="server" 
                                            Text="Out of two phone numbers, one is compulsory. " CssClass="style1"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style1">
                                        Mobile:
                                    </td>
                                    <td align="left">
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtMobileCountry" Width="30px"
                                            MaxLength="3" Wrap="False" style="font-family: 'Trebuchet MS'"></asp:TextBox>
                                        <span class="style1"><b>-</b></span>
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtMobile" MaxLength="10" 
                                            Wrap="False" style="font-family: 'Trebuchet MS'" />
                                        <br class="style1" />
                                        <span class="style1">Country Code - Mobile Number </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style1">
                                       Phone:
                                    </td>
                                    <td align="left">
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtPhCountry1" Width="30px" 
                                            MaxLength="2" style="font-family: 'Trebuchet MS'"></asp:TextBox>
                                        <span class="style1"><b>-</b></span>
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtPhSTD1" Width="50px" MaxLength="6"
                                            Wrap="False" style="font-family: 'Trebuchet MS'"></asp:TextBox>
                                        <span class="style1"><b>-</b></span>
                                        <asp:TextBox runat="server" CssClass="textbox" ID="txtPhone1" Width="100px" 
                                            MaxLength="15" style="font-family: 'Trebuchet MS'"></asp:TextBox>
                                        <br class="style1" />
                                        <span class="style1">Country Code - STD Code - Phone Number </span>
                                    </td>
                                </tr>
                            
                                    <tr>
                                    <td align="right" class="style1">
                                        <b>Comments/Suggetions :</b>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txtComments" runat="server" CssClass="textbox" Height="107px" TextMode="MultiLine"
                                            Width="201px" style="font-family: 'Trebuchet MS'"></asp:TextBox>
                                    </td>
                                </tr>
                                  <tr>
                                    <td align="right" class="style1">
                                        <b>Rating Of This Site :</b>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlRating" runat="server" CssClass="style1">
                                            <asp:ListItem>Give Rating</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                              
                              
                                <tr>
                                    <td align="center" colspan="2">
                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                    </td>
                                    <td align="center">
                                        <asp:Button ID="Button1" runat="server" Text="SUBMIT" OnClick="Button1_Click" CssClass="button"
                                            OnClientClick="return Validation(this);" 
                                            style="font-family: 'Trebuchet MS'" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="#CC0000" 
                                            CssClass="style1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:WizardStep>
                        <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                            <table class="border1" cellspacing="0" cellpadding="0" align="center" border="0"
                                width="100%">
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
                                                        <tr>
                                                            <td colspan="2" align="center">
                                                                "Thank you for submitting your query. Our team will get back to you within 48 hours
                                                                . For any further clarifications you can also reach our representative at 09350191986
                                                                between 09:00am and 08:00pm, seven days a week. ".
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" colspan="2">
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
            <td colspan="2">
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            font-family: "Trebuchet MS";
        }
    </style>
</asp:Content>

