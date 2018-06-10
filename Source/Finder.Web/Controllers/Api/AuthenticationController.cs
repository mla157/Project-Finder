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

    public class AuthenticationController : ApiController
    {
        public HttpResponseMessage Get(string username, string password)
        {
            return this.Request.CreateResponse(HttpStatusCode.OK);
        }

        public HttpResponseMessage Post(UserApiModel user)
        {
            //INSECURE!
            var databaseConnection = new DatabaseConnection();
            var seconddatabaseConnection = new DatabaseConnection();

            var queryUser = databaseConnection.GetData($"SELECT * FROM user WHERE benutzername = '" + user.userName +"'");

            if (queryUser.Count > 0)
            {
                return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
            }

            try
            {
                seconddatabaseConnection.QueryInsert($"INSERT INTO user (`benutzername`, `vorname`, `nachname`, `passwort`) VALUES (\'{user.userName}\', \'{user.firstName}\' , \'{user.lastName}\', \'{user.password}\')");
            }
            catch (Exception e)
            {
                return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
            }

            return this.Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
