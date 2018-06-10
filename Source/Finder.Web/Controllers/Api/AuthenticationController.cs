using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Finder.Web.Controllers.Api
{
    using Models;

    public class AuthenticationController : ApiController
    {
        public HttpResponseMessage Get(string username, string password)
        {
            return this.Request.CreateResponse(HttpStatusCode.OK);
        }

        public HttpResponseMessage Post(UserApiModel user)
        {
            return this.Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
