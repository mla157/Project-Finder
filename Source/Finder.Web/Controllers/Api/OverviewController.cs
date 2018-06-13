using System.Web.Http;

namespace Finder.Web.Controllers.Api
{
    using System.Collections;
    using Core.Models;
    using Models;

    public class OverviewController : ApiController
    {
        //Gets alle Movie from the movie table and return a IEnurable to the frontend
        public IEnumerable Get()
        {
            var returnMovie = new MovieApiModel();

            var databaseConnection = new DatabaseConnection();

            var resultData = databaseConnection.GetData($"SELECT * FROM movie");

            var counter = 0;

            foreach (var movie in resultData)
            {
                yield return new MovieApiModel()
                {
                    titleName = resultData[counter].GetValue(1).ToString(),
                    releaseDate = resultData[counter].GetValue(2).ToString(),
                    description = resultData[counter].GetValue(4).ToString(),
                    imageUrl = resultData[counter].GetValue(6).ToString()
                };

                counter++;
            }
        }
    }
}