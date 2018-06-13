using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Finder.Web.Controllers.Api
{
    using Core.Models;

    public class PlaylistsController : ApiController
    {
        private readonly DatabaseConnection dbConnection = new DatabaseConnection();

        public bool AddMovieToPlaylist(int userId, int movieId)
        {
            // Check if movie is already in playlist
            var queryData = this.dbConnection.GetData($"SELECT * FROM Playlist_has_movie WHERE Playlist_User_idUser = '" + userId + "' AND Movie_idMovie = '" + movieId + "'");
            if (queryData.Any())
            {
                // Add to list
                this.dbConnection.QueryInsert($"INSERT INTO Playlist_has_movie (`Movie_idMovie`, `Playlist_User_idUser`) VALUES (\'{movieId}\', \'{userId}\')");
                return true;
            }
            else
            {
                // Movie already in playlist
                return false;
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
