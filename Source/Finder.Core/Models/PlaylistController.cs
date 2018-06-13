using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Finder.Core.Models
{
    class PlaylistController
    {
        DatabaseConnection dbconnection = new DatabaseConnection();

        /// <summary>
        /// Construktor
        /// </summary>
        public PlaylistController()
        {

        }
       /// <summary>
       /// Method to add movies to the playlist of the user.
       /// Checks if the movie is already in the playlist.
       /// </summary>
       /// <param name="userid">User ID of the users playlist</param>
       /// <returns></returns>
        public bool AddMovieToPlaylist(int userID, int movieID)
        {
            // Check if movie is already in playlist
            var queryData = dbconnection.GetData($"SELECT * FROM Playlist_has_movie WHERE Playlist_User_idUser = '" + userID + "' AND Movie_idMovie = '" + movieID +"'");
            if(queryData.Count > 0)
            {
                // Add to list
                dbconnection.QueryInsert($"INSERT INTO Playlist_has_movie (`Movie_idMovie`, `Playlist_User_idUser`) VALUES (\'{movieID}\', \'{userID}\')");
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
        /// <param name="userID"></param>
        /// <param name="movieID"></param>
        public void RemoveMovieFromPlaylist(int userID, int movieID)
        {
            dbconnection.QueryDelete($"DELETE FROM Playlist_has_movie WHERE Playlist_User_idUser = '" + userID + "' AND Movie_idMovie = '" + movieID + "'");

        }
        /// <summary>
        /// Returns list of every Movie in the user's playlist
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        public List<object[]> ShowMoviePlaylist(int userID)
        {
            List<object[]> queryData = new List<object[]>();
            queryData = dbconnection.GetData($"SELECT * FROM Playlist_has_movie WHERE Playlist_User_idUser = '" + userID+"'");
            return queryData;
        }


    }
}
