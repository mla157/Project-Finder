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

            //SELECT * from Movies
            //WHERE GENRE IS LIKE 'genre'

            if (genre == "action")
            {
                returnMovie.titleName = "Avengers: Infinity War";
                returnMovie.releaseDate = "26.04.2018";
                returnMovie.description = "Avengers: Infinity War: Im ultimativen Marvel-Superhelden-Spektakel treten die Avengers, Doctor Strange und die Guardians of the Galaxy gemeinsam gegen den Über-Bösewicht Thanos an.";

            }
            if (genre == "horror")
            {
                returnMovie.titleName = "Es";
                returnMovie.releaseDate = "28.09.2017";
                returnMovie.description = "Nachdem in dem Städtchen Derry/Maine Kinder verschwunden sind, müssen sich einige Jugendliche ihren schlimmsten Ängsten stellen, als sie es mit einem Horrorclown namens Pennywise zu tun bekommen - schon seit Jahrhunderten treibt dieser brutale Mörder sein Unwesen.";

            }
            if (genre == "documentation")
            {
                returnMovie.titleName = "Eine unbequeme Wahrheit";
                returnMovie.releaseDate = "12. Oktober 2006";
                returnMovie.description = "Eine unbequeme Wahrheit ist ein Dokumentarfilm von Davis Guggenheim mit dem ehemaligen US-Vizepräsidenten und Präsidentschaftskandidaten Al Gore über die globale Erwärmung";

            }
            if (genre == "scifi")
            {
                returnMovie.titleName = "Interstellar";
                returnMovie.releaseDate = "06.11.2014";
                returnMovie.description = "Basierend auf einer Idee des Physikers Kip S. Thorne soll sich die Handlung um eine Reise einiger Forscher durch ein \"Wurmloch\" in eine andere Dimension drehen. Der angesehene Wissenschaftler vertritt die Theorie, dass solche Wurmlöcher nicht nur tatsächlich existieren, sondern auch, dass diese als Zugang zu einer anderen Dimension oder einer Zeitreise dienen könnten.";
            }
            if (genre == "humor")
            {
                returnMovie.titleName = "Lustiger Film 123";
                returnMovie.releaseDate = "1337";
                returnMovie.description = "Test humor";
            }

            return this.Request.CreateResponse(HttpStatusCode.OK, returnMovie);
        }
    }
}
