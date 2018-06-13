using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Finder.Web.Controllers.Api
{
    using System.Web.WebPages;
    using Core.Models;
    using Models;
    using Extensions;

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
        }

        public HttpResponseMessage Delete(PlaylistApiModel playlistApi)
        {
            try
            {
                var userId = Extensions.QueryUserId(playlistApi.username);

                this.RemoveMovieFromPlaylist(userId, playlistApi.movieId);

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

        public HttpResponseMessage Get(string username)
        {
            try
            {
                var userId = Extensions.QueryUserId(username);

                var returnData = this.ShowMoviePlaylist(userId);
                return this.Request.CreateResponse(HttpStatusCode.OK, returnData);
            }
            catch (Exception e)
            {
                return this.Request.CreateResponse(HttpStatusCode.InternalServerError);
            }
        }

        /// <summary>
        /// Returns list of every Movie in the user's playlist
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        public List<object[]> ShowMoviePlaylist(int userID)
        {
            var queryData = this.dbConnection.GetData($"SELECT * FROM Playlist_has_movie WHERE Playlist_User_idUser = '" + userID + "'");
            return queryData;
        }
    }
}
