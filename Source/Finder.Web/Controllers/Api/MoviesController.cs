using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Finder.Core.Models;

namespace Finder.Web.Controllers.Api
{
    using Models;

    public class MoviesController : ApiController
    {
        //In this method the connection to DB will be initialized and the movie date will be fetched and returned to the Frontend
        public HttpResponseMessage Get(string genre)
        {
            //var genre = "action";
            var returnMovie = new MovieApiModel();

            if (genre == "action")
            {
                returnMovie.titleName = "Test Action";
                returnMovie.releaseDate = DateTime.Now;
                returnMovie.description = "Test Action";

            }
            if (genre == "horror")
            {
                returnMovie.titleName = "Test horror";
                returnMovie.releaseDate = DateTime.Now;
                returnMovie.description = "Test horror";

            }
            if (genre == "documentation")
            {
                returnMovie.titleName = "Test documentation";
                returnMovie.releaseDate = DateTime.Now;
                returnMovie.description = "Test documentation";

            }
            if (genre == "scifi")
            {
                returnMovie.titleName = "Test scifi";
                returnMovie.releaseDate = DateTime.Now;
                returnMovie.description = "Test scifi";
            }
            if (genre == "humor")
            {
                returnMovie.titleName = "Test humor";
                returnMovie.releaseDate = DateTime.Now;
                returnMovie.description = "Test humor";
            }

            return this.Request.CreateResponse(HttpStatusCode.OK, returnMovie);
        }
    }
}
