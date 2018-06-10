using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Finder.Web.Controllers.Api
{
    public class AuthenticationController : ApiController
    {
        public HttpResponseMessage Get(string genre)
        {
            return this.Request.CreateResponse(HttpStatusCode.OK);
        }

        public HttpResponseMessage Post(string genre)
        {
            return this.Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
