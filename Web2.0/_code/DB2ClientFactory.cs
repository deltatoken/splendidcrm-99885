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
 * Portions created by SplendidCRM Software are Copyright (C) 2005 SplendidCRM Software, Inc. All Rights Reserved.
 * Contributor(s): ______________________________________.
 *********************************************************************************************************************/
using System;
using System.Data;
using System.Data.Common;
//using IBM.Data.DB2;

namespace SplendidCRM
{
	/// <summary>
	/// Summary description for DB2ClientFactory.
	/// </summary>
	public class DB2ClientFactory : DbProviderFactory
	{
		public DB2ClientFactory(string sConnectionString)
			: base( sConnectionString
			      , "IBM.Data.DB2"
			      , "IBM.Data.DB2.DB2Connection" 
			      , "IBM.Data.DB2.DB2Command"    
			      , "IBM.Data.DB2.DB2DataAdapter"
			      , "IBM.Data.DB2.DB2Parameter"  
			      , "IBM.Data.DB2.DB2CommandBuilder"
			      )
		{
		}
	}
}
