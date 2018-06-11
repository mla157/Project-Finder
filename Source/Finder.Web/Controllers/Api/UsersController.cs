using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Finder.Web.Controllers.Api
{
    using Core.Models;
    using Microsoft.Ajax.Utilities;
    using Models;

    public class UsersController : ApiController
    {
        public HttpResponseMessage Get(string username)
        {
            var databaseConnection = new DatabaseConnection();
            var queryData = databaseConnection.GetData($"SELECT preference FROM user WHERE benutzername = '" + username + "'");

            if (queryData[0].GetValue(0).ToString() != "")

            {
                return this.Request.CreateResponse(HttpStatusCode.OK);
            }

            return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
        }
    }
}
