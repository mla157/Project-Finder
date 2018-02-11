using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Finder.Core.Models;

namespace Finder.Web.Controllers.Api
{
    public class MoviesController : ApiController
    {
        //In this method the connection to DB will be initialized and the movie date will be fetched and returned to the Frontend
        public HttpResponseMessage Get()
        {
            var testMovie = new Movie
                            {
                                titleName = "Sharknado 3",
                                description = "Beste wo gibt!",
                                releaseDate = "21.02.2017"
                            };

            return this.Request.CreateResponse(HttpStatusCode.OK, testMovie);
        }
    }
}
