using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Finder.Web.Controllers.Api
{
    using System.Web.Management;
    using Core.Models;
    using Models;
    using Newtonsoft.Json;

    public class AuthenticationController : ApiController
    {
        private readonly DatabaseConnection databaseConnection = new DatabaseConnection();

        //Check if the password is right
        public HttpResponseMessage Patch(UserApiModel user)
        {

            var queryData = this.databaseConnection.GetData($"SELECT passwort FROM user WHERE benutzername = '" + user.userName + "'");



            if (queryData.Count != 0)
            {
                if (queryData[0].GetValue(0).ToString() == user.password)
                {
                    return this.Request.CreateResponse(HttpStatusCode.OK);
                }
            }



            return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
        }
        //Gets the whole user with <username> as parameter
        public HttpResponseMessage Get(string username)
        {
            var queryData = this.databaseConnection.GetData($"SELECT benutzername, vorname, nachname FROM user WHERE benutzername = '" + username + "'");

            var returnUser = new UserApiModel()
            {
                userName = queryData[0].GetValue(0).ToString(),
                firstName = queryData[0].GetValue(1).ToString(),
                lastName = queryData[0].GetValue(2).ToString()
            };

            return this.Request.CreateResponse(HttpStatusCode.OK, returnUser);
        }

        //Checks if a user with that username exists and if not it writes the new user to the DB and creates a new playlist
        public HttpResponseMessage Post(UserApiModel user)
        {
            var queryData = this.databaseConnection.GetData($"SELECT * FROM user WHERE benutzername = '" + user.userName + "'");
            this.databaseConnection.CloseConnection();

            if (queryData.Count > 0)
            {
                return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
            }

            try
            {
                this.databaseConnection.QueryInsert($"INSERT INTO user (`benutzername`, `vorname`, `nachname`, `passwort`) VALUES (\'{user.userName}\', \'{user.firstName}\' , \'{user.lastName}\', \'{user.password}\')");

                var queryUserId = this.databaseConnection.GetData($"SELECT iduser FROM user WHERE benutzername = '" + user.userName + "'");

                var userId = queryUserId[0].GetValue(0);

                this.databaseConnection.QueryInsert($"INSERT INTO playlist (`User_idUser`) VALUES (\'{userId}\')");
            }
            catch (Exception e)
            {
                return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
            }

            return this.Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
