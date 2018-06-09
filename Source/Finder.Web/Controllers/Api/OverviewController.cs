using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Finder.Web.Controllers.Api
{
    using System.Collections;
    using Core.Models;
    using Models;

    public class OverviewController : ApiController
    {
        public IEnumerable Get()
        {
            var returnMovie = new MovieApiModel();

            var databaseConnection = new DatabaseConnection();

            var resultData = databaseConnection.GetData($"SELECT * FROM movie");

            int counter = 0;

            foreach (var movie in resultData)
            {
                yield return new MovieApiModel()
                {
                    titleName = resultData[counter].GetValue(1).ToString(),
                    releaseDate = resultData[counter].GetValue(2).ToString(),
                    description = resultData[counter].GetValue(4).ToString()
                };

                counter++;
            }
        }
    }
}