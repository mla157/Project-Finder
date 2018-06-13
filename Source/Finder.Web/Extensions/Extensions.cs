using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Finder.Core;

namespace Finder.Web.Extensions
{
    using System.Runtime.InteropServices;
    using Core.Models;

    public static class Extensions
    {
        public static int QueryUserId(string username)
        {
            var databaseConnection = new DatabaseConnection();
            var queryData = databaseConnection.GetData($"SELECT iduser FROM user WHERE benutzername = '" + username + "'");

            return (int) queryData[0].GetValue(0);
        }
    }
}