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
        public Movie Get()
        {
            var testMovie = new Movie();
            testMovie.titleName = "Sharknado 3";
            testMovie.description = "Beste wo gibt!";
            testMovie.releaseDate = "21.02.2017";

            return testMovie;
        }
    }
}
