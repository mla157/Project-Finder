using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Finder.Web.Controllers.Api
{
    public class FinderController : ApiController
    {
        public string Get()
            => "Test Movie!";
    }
}
