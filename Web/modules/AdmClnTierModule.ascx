<%@ Control Language="c#" Inherits="RO.Web.AdmClnTierModule" CodeFile="AdmClnTierModule.ascx.cs" CodeFileBaseClass="RO.Web.ModuleBase" %>
<%@ Register TagPrefix="ajwced" Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" %>
<%@ Register TagPrefix="rcasp" NameSpace="RoboCoder.WebControls" Assembly="WebControls, Culture=neutral" %>
<%@ Register TagPrefix="Module" TagName="Help" Src="HelpModule.ascx" %>
<script type="text/javascript" lang="javascript">
	initPageLoad=true;
	ServerDateFormat = { shortFormat: "<%= System.Threading.Thread.CurrentThread.CurrentCulture.DateTimeFormat.ShortDatePattern %>" , longFormat: "<%= System.Threading.Thread.CurrentThread.CurrentCulture.DateTimeFormat.LongDatePattern %>"};
	if(IsMobile()){ var $body = jQuery('body');
	    $(document).live('mousedown', '.ui-button, input[type="text"], select, textarea', function(e) { var target = $( e.target );
	        if (target.is( '.ui-button, input[type="text"], select, textarea')) { $body.addClass('mobilekeyPop'); }
	        if((target.is( '.ui-button, select, textarea')||(e.target.tagName == 'INPUT' && e.target.type == 'text')) && !e.target.alreadyClicked){ target.on('focus', function(e) { $body.addClass('mobilekeyPop'); }); e.target.alreadyClicked = true; }
	    }).on('blur', 'input[type="text"], select, textarea', function(e) { $body.removeClass('mobilekeyPop'); });
	}
	window.matchMedia = window.matchMedia || function(x) { return {"matches":0}; };
      $(document).ready(function () { var old = null; try {old = Page_ClientValidate;} catch(e){}; Page_ClientValidate = function (g) {if (old && typeof(old) == 'function') {$.watermark.hideAll();Page_BlockSubmit = false && !old(g);} else return true; if (Page_BlockSubmit) { ValidateThisModule(<%= this.ClientID %>); $('#<%=cValidSummary.ClientID%>:visible').hide();} ; if (Page_BlockSubmit && $('#<%=bPgDirty.ClientID%>').val() == 'Y') {$('#<%=bConfirm.ClientID%>').val('Y');}; return !Page_BlockSubmit;}});
	Sys.Application.add_load(function () { $('input[type=hidden]').each(function (i, e) { try { e.defaultValue = e.value; } catch (er) { } }); WatermarkInput(<%= this.ClientID %>,'<%= PanelUpd.ClientID %>');});
	Sys.Application.add_load(function () { var hlp={}; $('a.GrdHead').each(function(i,e){var ids = ($(this).attr('id')||'').split('_'); hlp[ids[ids.length-1].replace(/hl$/,'l')] = $(this).attr('title');});$('span.GrdTxtLb,a.GrdTxtLn,a.GrdBoxLn').each(function (i, e) {try { var style = ($(this).attr('style')||'').replace(/height/i, 'max-height'); var ids = ($(this).attr('id')||'').split('_'); $(this).attr('title', hlp[ids[ids.length-1]]).attr('style', style); } catch (e) { } }); });
	Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequestHandler)
	Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequestHandler)
	Sys.WebForms.PageRequestManager.getInstance().add_endRequest(ChkExpNow)
	Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(ChkPgDirty)
	Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(initializeRequestHandler)
	function NoConfirm() {document.getElementById('<%=bConfirm.ClientID%>').value = 'N';}
	function ChkPgDirty()
	{
		var x = document.getElementById('<%=bPgDirty.ClientID%>');
		var y = document.getElementById('<%=cPgDirty.ClientID%>');
		if (y != null) {if (x != null && x.value == 'Y') {y.style.visibility = '';} else {y.style.visibility = 'hidden';}}
	}
	function initializeRequestHandler(sender, args) {if (!fConfirm2('<%=bPgDirty.ClientID%>','<%=bConfirm.ClientID%>','<%=aNam.ClientID%>','<%=aVal.ClientID%>')) {args.set_cancel(true);} else try {$.watermark.hideAll();} catch (e) { }}
	function beginRequestHandler(sender, e) { e.get_postBackElement().disabled=true; ShowProgress(); document.body.style.cursor='wait'; }
	function endRequestHandler() { initPageLoad=true; HideProgress(); document.body.style.cursor='auto'; var v = $('#<%=cValidSummary.ClientID%>:visible'); if (v.length > 0 && typeof(Page_Validators) != 'undefined' && $(Page_Validators).length > 0) {ValidateThisModule(<%= this.ClientID %>);v.hide();}; }
	window.onbeforeunload = UnloadConfirm;
	function UnloadConfirm()
	{
		var xx = fConfirm('<%=bPgDirty.ClientID%>','<%=bConfirm.ClientID%>','<%=aNam.ClientID%>','<%=aVal.ClientID%>');
		window.saveerr = window.onerror; window.onerror = function() {return true;}
		setTimeout(function() {window.onerror = window.saveerr}, 10); return xx;
	}
    function ChkExpNow() {if (document.getElementById('<%=bExpNow.ClientID%>').value == 'Y') {window.location = 'Exp.aspx';}}
    Sys.Application.add_load(function () {
        jqTab();
        ApplyJQueryWidget('<%=aNam.ClientID%>', '<%=aVal.ClientID%>');
    });
    function openButtonSec() {
        if ($('.moreButtonSec').hasClass('hideMoreButtonSec')) { $('.moreButtonSec').removeClass('hideMoreButtonSec');} else { $('.moreButtonSec').addClass('hideMoreButtonSec');};
    }
    $(document).ready(function() {if ( $('.moreButtonSec > div').children().length > 0 ) {$('.MoreBtnCnt').removeClass('hideMoreButtonSec');} else {$('.MoreBtnCnt').addClass('hideMoreButtonSec');}});
    $(document).mouseup(function (e) {
        var container = $('.moreButtonSec');
        if ($(window).width() <= 1024) {
            if (!container.is(e.target) && container.has(e.target).length === 0 && !container.hasClass('hideMoreButtonSec')) { openButtonSec(); }
        }
    });
</script>
<asp:PlaceHolder ID="FstPHolder" runat="server" Visible="false" />
<asp:UpdatePanel ID="PanelTop" UpdateMode="Conditional" runat="server"><ContentTemplate>
<asp:ValidationSummary id="cValidSummary" CssClass="ValidSumm" EnableViewState="false" runat="server" />
<div id="AjaxSpinner" class="AjaxSpinner" style="display:none;">
	<div style="padding:10px;">
		<img alt="" src="images/indicator.gif" />&nbsp;<asp:Label ID="AjaxSpinnerLabel" Text="This may take a moment..." runat="server" />
	</div>
</div>
<div class="r-table BannerGrp">
<div class="r-tr">
    <div class="r-td rc-1-5">
        <div class="BannerNam"><asp:label id="cTitleLabel" CssClass="screen-title" runat="server" /><input type="image" name="cDefaultFocus" id="cClientFocusButton" src="images/Help_x.jpg" onclick="return false;" style="visibility:hidden;" /></div>
    </div>
    <div class="r-td rc-6-12">
        <div class="BannerBtn">
        <asp:Panel id="cButPanel" runat="server">
            <div class="BtnTbl">
            <div><asp:Button id="cEditButton" onclick="cEditButton_Click" runat="server" CausesValidation="true" Visible="false" /></div>
            <div><asp:Button id="cSaveCloseButton" onclick="cSaveCloseButton_Click" runat="server" CausesValidation="true" Visible="false" /></div>
            <div><asp:Button id="cSaveButton" onclick="cSaveButton_Click" runat="server" Visible="<%# CanAct('S') && cSaveButton.Visible %>" /></div>
            <div><asp:Button id="cNewSaveButton" onclick="cNewSaveButton_Click" runat="server" Visible="<%# CanAct('S') && cNewSaveButton.Visible %>" /></div>
            <div><asp:Button id="cCopySaveButton" onclick="cCopySaveButton_Click" runat="server" Visible="<%# CanAct('S') && cCopySaveButton.Visible %>" /></div>
            <div><asp:Button id="cNewButton" onclick="cNewButton_Click" runat="server" CausesValidation="true" Visible="<%# CanAct('N') && cNewButton.Visible %>" /></div>
            <div><asp:image id="cPgDirty" Style="visibility:hidden;" ImageUrl="~/images/Xclaim.png" runat="server" /></div>
            <div class="moreButtonSec hideMoreButtonSec">
                <div><asp:Button id="cAuditButton" runat="server" CausesValidation="true" /></div>
                <div><asp:Button id="cDeleteButton" onclick="cDeleteButton_Click" runat="server" CausesValidation="true" Visible="<%# CanAct('D') && cDeleteButton.Visible %>" /></div>
                <div><asp:Button id="cUndoAllButton" onclick="cUndoAllButton_Click" runat="server"  CausesValidation="true" Visible="<%# CanAct('S') && cUndoAllButton.Visible %>" /></div>
                <div><asp:Button id="cCopyButton" onclick="cCopyButton_Click" runat="server" CausesValidation="true" Visible="<%# CanAct('N') && cCopyButton.Visible %>" /></div>
                <div><asp:Button id="cClearButton" onclick="cClearButton_Click" runat="server" CausesValidation="true" /></div>
                <div><asp:Button id="cExpRtfButton" onclick="cExpRtfButton_Click" runat="server" CausesValidation="true" /></div>
                <div><asp:Button id="cExpTxtButton" onclick="cExpTxtButton_Click" runat="server" CausesValidation="true" /></div>
                <div><asp:Button id="cPreviewButton" onclick="cPreviewButton_Click" runat="server" CausesValidation="true" Visible="false" /></div>
            </div>
            <div class="HelpMsgCnt"><Module:Help id="cHelpMsg" runat="server" /></div>
            <div class="MoreBtnCnt"><asp:Button ID="cMoreButton" OnClientClick="openButtonSec(); return false;" runat="server" /></div>
            <div style="clear:both;"></div>
        </div>
        </asp:Panel>
        </div>
    </div>
</div>
</div>
</ContentTemplate></asp:UpdatePanel>
<asp:UpdatePanel ID="PanelUpd" runat="server"><Triggers></Triggers><ContentTemplate>
<asp:PlaceHolder ID="MidPHolder" runat="server" Visible="false" />
<asp:Panel id="cCriPanel" runat="server" wrap="false">
<fieldset class="criteria-grp"><legend>CRITERIA<span><asp:Button id="cClearCriButton" onclick="cClearCriButton_Click" runat="server" CausesValidation="true" /></span></legend>
<div class="r-table">
<div class="r-tr">
    <div class="r-td rc-1-8">
        <div class="screen-criteria">
            <asp:PlaceHolder id="cCriteria" EnableViewState="true" runat="server" />
        </div>
    </div>
    <div class="r-td rc-9-12">
        <div class="screen-filter">
            <asp:Panel id="cFilter" runat="server" visible="false">
            <div class="r-table">
                <div class="r-tr">
                    <div class="r-td r-labelR"><asp:Label id="cFilterLabel" CssClass="inp-lbl" runat="server" /></div>&nbsp;
                    <div class="r-td r-content"><asp:DropDownList id="cFilterId" CssClass="inp-ddl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cFilterId_SelectedIndexChanged" DataValueField="ScreenFilterId" DataTextField="FilterName" /></div>
                </div>
            </div>
            </asp:Panel>
        </div>
    </div>
</div>
</div>
</fieldset>
</asp:Panel>
<div class="r-table">
<div class="r-tr">
    <div class="r-td rc-1-12">
        <div><asp:label id="cGlobalFilter" cssclass="FiltText" runat="server" visible="false" /></div>
    </div>
</div>
</div>
<div class="r-table search-grp">
<div class="r-tr">
    <div class="r-td rc-1-8">
        <div id="cScreenSearch" class="screen-search" runat="server">
            <div class="r-table">
                <div class="r-tr">
                    <div class="r-td r-labelR r-labelM"><span class='autoCmptPref'>Search:</span></div>
                    <div class="r-td r-content"><rcasp:ComboBox autocomplete="off" id="cAdmClnTier105List" CssClass="inp-ddl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cAdmClnTier105List_SelectedIndexChanged" OnTextChanged="cAdmClnTier105List_TextChanged" OnDDFindClick="cAdmClnTier105List_DDFindClick" Mode="A" OnPostBack="cbPostBack" DataValueField="ClientTierId194" DataTextField="ClientTierId194Text" /></div>
                </div>
            </div>
        </div>
    </div>
    <div class="r-td rc-8-8">
        <asp:Label ID="searchCounter" CssClass="itemTotal" style='display:none' runat="server"></asp:Label>
    </div>
    <div class="r-td rc-9-12">
        <div id="cSystem" class="screen-system" runat="server" visible="false">
            <div class="r-table">
                <div class="r-tr">
                    <div class="r-td r-labelR"><asp:Label id="cSystemLabel" CssClass="inp-lbl" runat="server" /></div>&nbsp;
                    <div class="r-td r-content r-sysid"><asp:DropDownList id="cSystemId" CssClass="inp-ddl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cSystemId_SelectedIndexChanged" DataValueField="SystemId" DataTextField="SystemName" /></div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<asp:Panel id="cTabFolder" runat="server">
    <div class="r-table rg-1-12"><div class="r-tr">
    <div class="r-td rc-1-6"><div class="screen-tabfolder" runat="server"><div class="r-table">
    	<div class="r-tr">
    		<div id="cClientTierId194P1" class="r-td r-labelR" runat="server"><asp:Label id="cClientTierId194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cClientTierId194P2" class="r-td r-content" runat="server"><asp:TextBox id="cClientTierId194" CssClass="inp-num" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cClientTierName194P1" class="r-td r-labelR" runat="server"><asp:Label id="cClientTierName194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cClientTierName194P2" class="r-td r-content" runat="server"><asp:TextBox id="cClientTierName194" CssClass="inp-txt" MaxLength="50" runat="server" /><asp:RequiredFieldValidator id="cRFVClientTierName194" ControlToValidate="cClientTierName194" display="none" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cEntityId194P1" class="r-td r-labelR" runat="server"><asp:Label id="cEntityId194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cEntityId194P2" class="r-td r-content" runat="server"><asp:DropDownList id="cEntityId194" CssClass="inp-ddl" DataValueField="EntityId194" DataTextField="EntityId194Text" runat="server" /><asp:RequiredFieldValidator id="cRFVEntityId194" ControlToValidate="cEntityId194" display="none" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cLanguageCd194P1" class="r-td r-labelR" runat="server"><asp:Label id="cLanguageCd194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cLanguageCd194P2" class="r-td r-content" runat="server"><asp:DropDownList id="cLanguageCd194" CssClass="inp-ddl" DataValueField="LanguageCd194" DataTextField="LanguageCd194Text" runat="server" /><asp:RequiredFieldValidator id="cRFVLanguageCd194" ControlToValidate="cLanguageCd194" display="none" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cFrameworkCd194P1" class="r-td r-labelR" runat="server"><asp:Label id="cFrameworkCd194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cFrameworkCd194P2" class="r-td r-content" runat="server"><asp:DropDownList id="cFrameworkCd194" CssClass="inp-ddl" DataValueField="FrameworkCd194" DataTextField="FrameworkCd194Text" runat="server" /><asp:RequiredFieldValidator id="cRFVFrameworkCd194" ControlToValidate="cFrameworkCd194" display="none" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cDevProgramPath194P1" class="r-td r-labelR" runat="server"><asp:Label id="cDevProgramPath194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cDevProgramPath194P2" class="r-td r-content" runat="server"><asp:TextBox id="cDevProgramPath194" CssClass="inp-txt" MaxLength="100" runat="server" /><asp:RequiredFieldValidator id="cRFVDevProgramPath194" ControlToValidate="cDevProgramPath194" display="none" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cWsProgramPath194P1" class="r-td r-labelR" runat="server"><asp:Label id="cWsProgramPath194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cWsProgramPath194P2" class="r-td r-content" runat="server"><asp:TextBox id="cWsProgramPath194" CssClass="inp-txt" MaxLength="100" runat="server" /><asp:RequiredFieldValidator id="cRFVWsProgramPath194" ControlToValidate="cWsProgramPath194" display="none" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cXlsProgramPath194P1" class="r-td r-labelR" runat="server"><asp:Label id="cXlsProgramPath194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cXlsProgramPath194P2" class="r-td r-content" runat="server"><asp:TextBox id="cXlsProgramPath194" CssClass="inp-txt" MaxLength="100" runat="server" /><asp:RequiredFieldValidator id="cRFVXlsProgramPath194" ControlToValidate="cXlsProgramPath194" display="none" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cDevCompilePath194P1" class="r-td r-labelR" runat="server"><asp:Label id="cDevCompilePath194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cDevCompilePath194P2" class="r-td r-content" runat="server"><asp:TextBox id="cDevCompilePath194" CssClass="inp-txt" MaxLength="100" runat="server" /><asp:RequiredFieldValidator id="cRFVDevCompilePath194" ControlToValidate="cDevCompilePath194" display="none" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cWsCompilePath194P1" class="r-td r-labelR" runat="server"><asp:Label id="cWsCompilePath194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cWsCompilePath194P2" class="r-td r-content" runat="server"><asp:TextBox id="cWsCompilePath194" CssClass="inp-txt" MaxLength="100" runat="server" /><asp:RequiredFieldValidator id="cRFVWsCompilePath194" ControlToValidate="cWsCompilePath194" display="none" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cXlsCompilePath194P1" class="r-td r-labelR" runat="server"><asp:Label id="cXlsCompilePath194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cXlsCompilePath194P2" class="r-td r-content" runat="server"><asp:TextBox id="cXlsCompilePath194" CssClass="inp-txt" MaxLength="100" runat="server" /><asp:RequiredFieldValidator id="cRFVXlsCompilePath194" ControlToValidate="cXlsCompilePath194" display="none" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cCombineAsm194P1" class="r-td r-labelR" runat="server"><asp:Label id="cCombineAsm194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cCombineAsm194P2" class="r-td r-content" runat="server"><asp:CheckBox id="cCombineAsm194" CssClass="inp-chk" runat="server" /></div>
    	</div>
    	<div class="r-tr">
    		<div id="cIsDefault194P1" class="r-td r-labelR" runat="server"><asp:Label id="cIsDefault194Label" CssClass="inp-lbl" runat="server" /></div>
    		<div id="cIsDefault194P2" class="r-td r-content" runat="server"><asp:CheckBox id="cIsDefault194" CssClass="inp-chk" runat="server" /></div>
    	</div>
    </div></div></div>
    </div></div>
</asp:Panel>
<asp:label id="cFootLabel" CssClass="FootText" runat="server" />
<input id="bUseCri" type="hidden" runat="server" />
<input id="bPgDirty" type="hidden" text="N" runat="server" />
<input id="bConfirm" type="hidden" runat="server" />
<input id="aNam" type="hidden" runat="server" />
<input id="aVal" type="hidden" runat="server" />
<input id="bErrNow" type="hidden" runat="server" />
<input id="bInfoNow" type="hidden" runat="server" />
<input id="bExpNow" type="hidden" runat="server" />
<input id="CtrlToFocus" type="hidden" runat="server" />
<asp:TextBox ID="bViewState" runat="server" Visible="false" />
<asp:Label ID="cMsgContent" runat="server" style="display:none;" EnableViewState="false"/>
</ContentTemplate></asp:UpdatePanel>
<asp:PlaceHolder ID="LstPHolder" runat="server" Visible="false" />
