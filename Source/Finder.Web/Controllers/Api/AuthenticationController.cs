using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Finder.Web.Controllers.Api
{
    using Core.Models;
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

            var queryUser = databaseConnection.GetData($"SELECT * FROM user WHERE benutzername = '" + user.userName +"'");
            databaseConnection.CloseConnection();

            if (queryUser.Count > 0)
            {
                return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
            }

            try
            {
                databaseConnection.QueryInsert($"INSERT INTO user (`benutzername`, `vorname`, `nachname`, `passwort`) VALUES (\'{user.userName}\', \'{user.firstName}\' , \'{user.lastName}\', \'{user.password}\')");
            }
            catch (Exception e)
            {
                return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
            }

            return this.Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
