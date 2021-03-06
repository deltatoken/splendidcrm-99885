<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Chooser.ascx.cs" Inherits="SplendidCRM._controls.Chooser" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Import Namespace="SplendidCRM" %>
<%
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
 * The Original Code is: SugarCRM Open Source
 * The Initial Developer of the Original Code is SugarCRM, Inc.
 * Portions created by SugarCRM are Copyright (C) 2004-2005 SugarCRM, Inc. All Rights Reserved.
 * Portions created by SplendidCRM Software are Copyright (C) 2005 SplendidCRM Software, Inc. All Rights Reserved.
 * Contributor(s): ______________________________________.
 *********************************************************************************************************************/
%>
<script type="text/javascript">
function XmlEscape(s)
{
	s = s.replace('&', '&amp;');
	s = s.replace('<', '&lt;');
	s = s.replace('>', '&gt;');
	return s;
}

function CopyToHidden(sListID, sHiddenID)
{
	var lst = document.getElementById(sListID  );
	var txt = document.getElementById(sHiddenID);
	txt.value = '<xml>';
	for ( i=0; i < lst.options.length ; i++ )
	{
		txt.value += '<list><text>' + XmlEscape(lst.options[i].text) + '</text><value>' + XmlEscape(lst.options[i].value) + '</value></list>';
	}
	txt.value += '</xml>';
}

function MoveLeftToRight(sLeftID, sRightID, bReverse)
{
	var lstLeft  = document.getElementById(sLeftID );
	var lstRight = document.getElementById(sRightID);
	for ( i=0; i < lstLeft.options.length ; i++ )
	{
		if ( lstLeft.options[i].selected == true )
		{
			var oOption = document.createElement("OPTION");
			oOption.text  = lstLeft.options[i].text;
			oOption.value = lstLeft.options[i].value;
			lstRight.options.add(oOption);
		}
	}
	for ( i=lstLeft.options.length-1; i >= 0  ; i-- )
	{
		if ( lstLeft.options[i].selected == true )
			lstLeft.options.remove(i);
	}
	// 08/05/2005 Paul. Don't use the sLeftID & sRightID values as they can be reversed. 
	CopyToHidden('<%= lstLeft.ClientID  %>', '<%= txtLeft.ClientID  %>');
	CopyToHidden('<%= lstRight.ClientID %>', '<%= txtRight.ClientID %>');
}


function MoveUp(sID)
{
	var lst  = document.getElementById(sID);
	var sel = new Array();

	for ( i = 0; i < lst.options.length ; i++ )
	{
		if ( lst.options[i].selected == true )
			sel[sel.length] = i;
	}
	for (i in sel)
	{
		if ( sel[i] != 0 && !lst.options[sel[i]-1].selected )
		{
			var tmp = new Array(lst.options[sel[i]-1].text, lst.options[sel[i]-1].value);
			lst.options[sel[i]-1].text     = lst.options[sel[i]].text ;
			lst.options[sel[i]-1].value    = lst.options[sel[i]].value;
			lst.options[sel[i]  ].text     = tmp[0];
			lst.options[sel[i]  ].value    = tmp[1];
			lst.options[sel[i]-1].selected = true ;
			lst.options[sel[i]  ].selected = false;
		}
	}
	// 07/09/2006 Paul.  Update the hidden value as that is the real result that we process. 
	CopyToHidden('<%= lstLeft.ClientID  %>', '<%= txtLeft.ClientID  %>');
}


function MoveDown(sID)
{
	var lst  = document.getElementById(sID);
	var sel = new Array();
	for ( i = lst.options.length-1 ; i > -1 ; i-- )
	{
		if ( lst.options[i].selected == true )
			sel[sel.length] = i;
	}
	for (i in sel)
	{
		if ( sel[i] != lst.options.length-1 && !lst.options[sel[i]+1].selected )
		{
			var tmp = new Array(lst.options[sel[i]+1].text, lst.options[sel[i]+1].value);
			lst.options[sel[i]+1].text     = lst.options[sel[i]].text ;
			lst.options[sel[i]+1].value    = lst.options[sel[i]].value;
			lst.options[sel[i]  ].text     = tmp[0];
			lst.options[sel[i]  ].value    = tmp[1];
			lst.options[sel[i]+1].selected = true ;
			lst.options[sel[i]  ].selected = false;
		}
	}
	// 07/09/2006 Paul.  Update the hidden value as that is the real result that we process. 
	CopyToHidden('<%= lstLeft.ClientID  %>', '<%= txtLeft.ClientID  %>');
}
</script>

<input ID="txtLeft"  type="hidden" Runat="server" />
<input ID="txtRight" type="hidden" Runat="server" />
<table cellpadding="0" cellspacing="0">
	<tr>
		<td class="dataLabel">
			<h4 class="dataLabel"><%= L10n.Term(sChooserTitle) %></h4>
		</td>
	</tr>
	<tr>
		<td>
			<table border="0" cellspacing=0 cellpadding="0">
				<tr>
					<td ID="tdSpacerUpDown" Runat="server">&nbsp;</td>
					<td class="dataLabel" nowrap><b><%= L10n.Term(sLeftTitle) %></b></td>
					<td ID="tdSpacerLeftRight" Runat="server">&nbsp;</td>
					<td class="dataLabel" nowrap><b><%= L10n.Term(sRightTitle) %></b></td>
				</tr>
				<tr>
					<td ID="tdMoveUpDown" valign="top" style="padding-right: 2px; padding-left: 2px;" Runat="server">
						<a id="ctlChooser_MoveUp" onclick="javascript:MoveUp('<%= lstLeft.ClientID %>');"  >
							<asp:Image ImageUrl='<%# Session["themeURL"] + "images/uparrow_big.gif" %>' AlternateText='<%# L10n.Term(".LNK_SORT") %>' style="margin-bottom: 1px;" BorderWidth="0" Width="16" Height="16" Runat="server" />
						</a><br>
						<a id="ctlChooser_MoveDown" onclick="javascript:MoveDown('<%= lstLeft.ClientID %>');">
							<asp:Image ImageUrl='<%# Session["themeURL"] + "images/downarrow_big.gif" %>' AlternateText='<%# L10n.Term(".LNK_SORT") %>' style="margin-top: 1px;" BorderWidth="0" Width="16" Height="16" Runat="server" />
						</a>
					</td>
					<td>
						<asp:ListBox ID="lstLeft" Rows="10" SelectionMode="Multiple" Runat="server" />
					</td>
					<td ID="tdMoveLeftRight" valign="top" style="padding-right: 2px; padding-left: 2px;" Runat="server">
						<a id="ctlChooser_MoveLeft" onclick="javascript:MoveLeftToRight('<%= lstRight.ClientID %>','<%= lstLeft.ClientID %>', 1);">
							<asp:Image ImageUrl='<%# Session["themeURL"] + "images/leftarrow_big.gif" %>' AlternateText='<%# L10n.Term(".LNK_SORT") %>' style="margin-right: 1px;" BorderWidth="0" Width="16" Height="16" Runat="server" />
						</a>
						<a id="ctlChooser_MoveRight" onclick="javascript:MoveLeftToRight('<%= lstLeft.ClientID %>','<%= lstRight.ClientID %>', 0);">
							<asp:Image ImageUrl='<%# Session["themeURL"] + "images/rightarrow_big.gif" %>' AlternateText='<%# L10n.Term(".LNK_SORT") %>' style="margin-left: 1px;" BorderWidth="0" Width="16" Height="16" Runat="server" />
						</a>
					</td>
					<td>
						<asp:ListBox ID="lstRight" Rows="10" SelectionMode="Multiple" Runat="server" />
					</td>
					<td valign="top" style="padding-right: 2px; padding-left: 2px;">
					</td>
				</tr>
			</table>
			<br>
		</td>
	</tr>
</table>
<script type="text/javascript">
CopyToHidden('<%= lstLeft.ClientID  %>', '<%= txtLeft.ClientID  %>');
CopyToHidden('<%= lstRight.ClientID %>', '<%= txtRight.ClientID %>');
</script>
