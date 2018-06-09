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

            var databaseConnection = new DatabaseConnection();

            var genreValue = this.GetGenreValue(genre);

            var resultData = databaseConnection.GetData($"SELECT * FROM movie WHERE GENRE =\'{genreValue}\'");

            if (resultData.Count > 0)
            {
                int indexStart = 0;
                int indexEnd;

                indexEnd = resultData.Count();

                var getRandom = new Random();
                var movieDataset = getRandom.Next(indexStart, indexEnd);


                returnMovie.titleName = resultData[movieDataset].GetValue(1).ToString();
                returnMovie.releaseDate = resultData[movieDataset].GetValue(2).ToString();
                returnMovie.description = resultData[movieDataset].GetValue(4).ToString();
            }

            return this.Request.CreateResponse(HttpStatusCode.OK, returnMovie);
        }

        //TODO Read Columns from DB
        private int GetGenreValue(string genre)
        {
            var genreValue = 0;

            switch (genre)
            {
                case "action":
                    genreValue = 1;
                    break;
                case "horror":
                    genreValue = 2;
                    break;
                case "documentation":
                    genreValue = 3;
                    break;
                case "scifi":
                    genreValue = 4;
                    break;
                case "humor":
                    genreValue = 5;
                    break;
            }

            return genreValue;
        }
    }
}
