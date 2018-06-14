using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Finder.Web.Controllers.Api
{
    using System.Collections;
    using System.Web.WebPages;
    using Core.Models;
    using Extensions;
    using Models;

    public class PlaylistsController : ApiController
    {
        private readonly DatabaseConnection dbConnection = new DatabaseConnection();

        public HttpResponseMessage Patch(PlaylistApiModel playlistApi)
        {
            try
            {
                var userId = Extensions.QueryUserId(playlistApi.username);

                this.AddMovieToPlaylist(userId, playlistApi.movieId);

                //If the queryResult is positive it return HTTPStatusCode.Ok else 500
                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception e)
            {
                return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
            }

            return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
        }


        public void AddMovieToPlaylist(int userId, int movieId)
        {
            // Check if movie is already in playlist
            var queryData = this.dbConnection.GetData($"SELECT * FROM Playlist_has_movie WHERE Playlist_User_idUser = '" + userId + "' AND Movie_idMovie = '" + movieId + "'");
            if (queryData.Count == 0)
            {
                // Add to list
                this.dbConnection.QueryInsert(
                    $"INSERT INTO Playlist_has_movie (`Movie_idMovie`, `Playlist_User_idUser`) VALUES (\'{movieId}\', \'{userId}\')");
            }
            else
            {
                throw new Exception();
            }
        }

        public HttpResponseMessage Post(PlaylistApiModel playlistApi)
        {
            try
            {
                var userId = Extensions.QueryUserId(playlistApi.username);

                var movieId = Extensions.QueryMovieId(playlistApi.movieTitle);

                this.RemoveMovieFromPlaylist(userId, movieId);

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception e)
            {
                return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
            }
        }

        /// <summary>
        /// Removes movie from the playlist of the user
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="movieId"></param>
        public void RemoveMovieFromPlaylist(int userId, int movieId)
        {
            this.dbConnection.QueryDelete($"DELETE FROM Playlist_has_movie WHERE Playlist_User_idUser = '" + userId + "' AND Movie_idMovie = '" + movieId + "'");

        }

        public IEnumerable Get(string username)
        {

            var userId = Extensions.QueryUserId(username);

            var resultData = this.ShowMoviePlaylist(userId);

            var movieData = new List<object[]>();
            var counter = 0;


            foreach (var result in resultData)
            {
                movieData.AddRange(
                    this.dbConnection.GetData(
                        $"SELECT * FROM MOVIE WHERE idMovie = '" + resultData[counter].GetValue(0) + "'"));
                counter++;
            }

            counter = 0;

            foreach (var movie in movieData)
            {
                yield return new MovieApiModel()
                {
                    titleName = movieData[counter].GetValue(1).ToString(),
                    releaseDate = movieData[counter].GetValue(2).ToString(),
                    description = movieData[counter].GetValue(4).ToString(),
                    imageUrl = movieData[counter].GetValue(6).ToString()
                };

                counter++;
            }
        }

        /// <summary>
        /// Returns list of every Movie in the user's playlist
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        public List<object[]> ShowMoviePlaylist(int userID)
        {
            var queryData = this.dbConnection.GetData($"SELECT Movie_idMovie FROM Playlist_has_movie WHERE Playlist_User_idUser = '" + userID + "'");
            return queryData;
        }
    }
}
