<%@ Control Language="c#" AutoEventWireup="false" Codebehind="NewRecord.ascx.cs" Inherits="SplendidCRM.Administration.DynamicLayout.DetailViews.NewRecord" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<script runat="server">
/**********************************************************************************************************************
 * The contents of this file are subject to the SugarCRM Public License Version 1.1.3 ("License"); You may not use this
 * file except in compliance with the License. You may obtain a copy of the License at http://www.sugarcrm.com/SPL
 * Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either
 * express or implied.  See the License for the specific language governing rights and limitations under the License.
 *
 * All copies of the Covered Code must include on each user interface screen:
 *    (i) the "Powered by SugarCRM" logo and
 *    (ii) the SugarCRM copyright notice
 *    (iii) the SplendidCRM copyright notice
 * in the same form as they appear in the distribution.  See full license for requirements.
 *
 * The Original Code is: SplendidCRM Open Source
 * The Initial Developer of the Original Code is SplendidCRM Software, Inc.
 * Portions created by SplendidCRM Software are Copyright (C) 2005-2007 SplendidCRM Software, Inc. All Rights Reserved.
 * Contributor(s): ______________________________________.
 *********************************************************************************************************************/
</script>
<div id="divNewRecord">
	<%@ Register TagPrefix="SplendidCRM" Tagname="HeaderLeft" Src="~/_controls/HeaderLeft.ascx" %>
	<SplendidCRM:HeaderLeft ID="ctlHeaderLeft" Title="DynamicLayout.LBL_NEW_FORM_TITLE" Runat="Server" />

	<asp:Panel Width="100%" CssClass="leftColumnModuleS3" runat="server">
		<asp:HiddenField ID="txtFIELD_ID" runat="server" />
		<asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_FIELD_TYPE") %>' runat="server" /><asp:Label ID="txtFIELD_INDEX" runat="server" /><br />
		<asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_FIELD_TYPE") %>' runat="server" />&nbsp;<asp:Label CssClass="required" Text='<%# L10n.Term(".LBL_REQUIRED_SYMBOL") %>' Runat="server" /><br />
		<asp:DropDownList ID="lstFIELD_TYPE" OnSelectedIndexChanged="lstFIELD_TYPE_Changed" AutoPostBack="true" Runat="server">
			<asp:ListItem Value="String"   >String</asp:ListItem>
			<asp:ListItem Value="TextBox"  >TextBox</asp:ListItem>
			<asp:ListItem Value="HyperLink">HyperLink</asp:ListItem>
			<asp:ListItem Value="CheckBox" >CheckBox</asp:ListItem>
			<asp:ListItem Value="Button"   >Button</asp:ListItem>
			<asp:ListItem Value="Image"    >Image</asp:ListItem>
			<asp:ListItem Value="Blank"    >Blank</asp:ListItem>
			<asp:ListItem Value="Line"     >Line</asp:ListItem>
		</asp:DropDownList><br />
		<span id="spnDATA" runat="server">
			<asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_DATA_LABEL" ) %>' runat="server" />(<asp:CheckBox ID="chkFREE_FORM_LABEL" OnCheckedChanged="chkFREE_FORM_LABEL_CheckedChanged" CssClass="checkbox" AutoPostBack="True" Runat="server" /> <asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_FREE_FORM_DATA" ) %>' runat="server" />)<br />
			<asp:TextBox ID="txtDATA_LABEL"  size="35" Visible="False" Runat="server" /><asp:DropDownList ID="lstDATA_LABEL" DataTextField="DISPLAY_NAME" DataValueField="NAME" Runat="server" /><br />
			<asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_DATA_FIELD" ) %>' runat="server" />(<asp:CheckBox ID="chkFREE_FORM_DATA" OnCheckedChanged="chkFREE_FORM_DATA_CheckedChanged" CssClass="checkbox" AutoPostBack="True" Runat="server" /> <asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_FREE_FORM_DATA" ) %>' runat="server" />)<br />
			<asp:TextBox ID="txtDATA_FIELD"  size="35" Visible="False" Runat="server" /><asp:DropDownList ID="lstDATA_FIELD" DataTextField="ColumnName" DataValueField="ColumnName" Runat="server" /><br />
		</span>
		<span id="spnDATA_FORMAT" runat="server">
			<asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_DATA_FORMAT") %>' runat="server" /><br /><asp:TextBox ID="txtDATA_FORMAT" size="35" Runat="server" /><br />
		</span>
		<span id="spnURL" runat="server">
			<asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_URL_FIELD"  ) %>' runat="server" /><br /><asp:TextBox ID="txtURL_FIELD"   size="35" Runat="server" /><br />
			<asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_URL_FORMAT" ) %>' runat="server" /><br /><asp:TextBox ID="txtURL_FORMAT"  size="35" Runat="server" /><br />
			<asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_URL_TARGET" ) %>' runat="server" /><br /><asp:TextBox ID="txtURL_TARGET"  size="35" Runat="server" /><br />
		</span>
		<span id="spnLIST_NAME" runat="server">
			<asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_LIST_NAME"  ) %>' runat="server" /><br /><asp:DropDownList ID="lstLIST_NAME" DataTextField="LIST_NAME" DataValueField="LIST_NAME" Runat="server" /><br />
		</span>
			<asp:Label Text='<%# L10n.Term("DynamicLayout.LBL_COLSPAN"    ) %>' runat="server" /><br /><asp:TextBox ID="txtCOLSPAN"     size="35" Runat="server" /><br />
		
		<asp:Button ID="btnSave"   CommandName="NewRecord.Save"   OnCommand="Page_Command" CssClass="button" Text='<%# "  " + L10n.Term(".LBL_SAVE_BUTTON_LABEL"  ) + "  " %>' ToolTip='<%# L10n.Term(".LBL_SAVE_BUTTON_TITLE"  ) %>' AccessKey='<%# L10n.AccessKey(".LBL_SAVE_BUTTON_KEY"  ) %>' Runat="server" />
		<asp:Button ID="btnCancel" CommandName="NewRecord.Cancel" OnCommand="Page_Command" CssClass="button" Text='<%# "  " + L10n.Term(".LBL_CANCEL_BUTTON_LABEL") + "  " %>' ToolTip='<%# L10n.Term(".LBL_CANCEL_BUTTON_TITLE") %>' AccessKey='<%# L10n.AccessKey(".LBL_CANCEL_BUTTON_KEY") %>' Runat="server" /><br />
		<asp:RequiredFieldValidator ID="reqNAME" ControlToValidate="txtDATA_FIELD" ErrorMessage="(required)" CssClass="required" Enabled="false" EnableClientScript="false" EnableViewState="false" Runat="server" />
		<asp:Label ID="lblError" ForeColor="Red" EnableViewState="false" Runat="server" />
	</asp:Panel>
</div>
