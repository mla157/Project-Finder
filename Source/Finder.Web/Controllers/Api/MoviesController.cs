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
            var returnMovie = new MovieApiModel();

            if (genre == "action")
            {
                returnMovie.movieTitle = "Test Action";
                returnMovie.MovieDateTime = DateTime.MaxValue;
                returnMovie.movieGenre = "Test Action";

            }
            if (genre == "horror")
            {
                returnMovie.movieTitle = "Test Horror";
                returnMovie.MovieDateTime = DateTime.MaxValue;
                returnMovie.movieGenre = "Horror";

            }
            if (genre == "documentation")
            {
                returnMovie.movieTitle = "Test documentation";
                returnMovie.MovieDateTime = DateTime.MaxValue;
                returnMovie.movieGenre = "documentation";

            }
            if (genre == "scifi")
            {
                returnMovie.movieTitle = "Test scifi";
                returnMovie.MovieDateTime = DateTime.MaxValue;
                returnMovie.movieGenre = "scifi";
            }
            if (genre == "humor")
            {
                returnMovie.movieTitle = "Test humor";
                returnMovie.MovieDateTime  = DateTime.MaxValue;
                returnMovie.movieGenre = "humor";
            }

            return this.Request.CreateResponse(HttpStatusCode.OK, returnMovie);
        }
    }
}
