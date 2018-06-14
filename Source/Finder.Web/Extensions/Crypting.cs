namespace Finder.Web.Extensions
{
    using System;
    using System.Security.Cryptography;
    using Core.Models;

    public static class Crypting
    {
        public static string EncryptPassword(string password)
        {
            /////////////////////////////CRYPTO PASSWORD///////////////////////////////////
            //STEP 1 Create the salt value with a cryptographic PRNG:
            byte[] salt;
            new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
            // STEP 2 Create the Rfc2898DeriveBytes and get the hash value:
            var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000);
            var hash = pbkdf2.GetBytes(20);
            //STEP 3 Combine the salt and password bytes for later use:
            var hashBytes = new byte[36];
            Array.Copy(salt, 0, hashBytes, 0, 16);
            Array.Copy(hash, 0, hashBytes, 16, 20);
            //STEP 4 Turn the combined salt+hash into a string for storage
            var savedPasswordHash = Convert.ToBase64String(hashBytes);
            ///////////////////////////////////////////////////////////////////////////////

            return savedPasswordHash;

        }

        //Verify the user - entered password against a stored password
        public static bool VerifyPassword(string passwordEntered, string username)
        {

            // Fetch the stored PASSWORD-value
            //string savedPasswordHash = DBContext.GetUser(u => u.UserName == user).Password;
            var databaseConnection = new DatabaseConnection();
            var queryData = databaseConnection.GetData($"SELECT passwort FROM user WHERE benutzername = '" + username + "'");
            var savedPasswordHash = queryData[0].GetValue(0).ToString();

            // Extract the bytes
            var hashBytes = Convert.FromBase64String(savedPasswordHash);

            // Get the salt
            var salt = new byte[16];
            Array.Copy(hashBytes, 0, salt, 0, 16);

            // Compute the hash on the password the user entered
            var pbkdf2 = new Rfc2898DeriveBytes(passwordEntered, salt, 10000);
            var hash = pbkdf2.GetBytes(20);

            //Compare the results
            for (var i = 0; i < 20; i++)
            {
                if (hashBytes[i + 16] != hash[i])
                {
                    throw new UnauthorizedAccessException();
                }
            }

            return true;

        }
    }
}