<%@ Page language="c#" MasterPageFile="Default.master" EnableEventValidation="false" Inherits="RO.Web.GenScreens" CodeFile="GenScreens.aspx.cs" Title="Generate Screens" %><%@ Register TagPrefix="Module" TagName="GenScreens" Src="modules/GenScreensModule.ascx" %>
<asp:Content ContentPlaceHolderID="MHR" Runat="Server"><Module:GenScreens id="ModuleGenScreens" runat="server" /></asp:Content>