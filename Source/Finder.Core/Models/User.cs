using System;
using System.Security.Cryptography;


namespace Finder.Core.Models
{
    //Claass for User creation
    public class User
    {
        private String Firstname { get; set; }
        private String Lastname { get; set; }
        private String Email { get; set; }
        private String Password { get; set; }
        private DateTime Birthdate { get; set; }

        //Constructor with initial upload to DB
        public User(String fN, String lN, String email, String Password, DateTime birth)
        {
            this.Firstname = fN;
            this.Lastname = lN;
            this.Email = email;

            /////////////////////////////CRYPTO PASSWORD///////////////////////////////////
            //STEP 1 Create the salt value with a cryptographic PRNG:
            byte[] salt;
            new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
            // STEP 2 Create the Rfc2898DeriveBytes and get the hash value:
            var pbkdf2 = new Rfc2898DeriveBytes(Password, salt, 10000);
            byte[] hash = pbkdf2.GetBytes(20);
            //STEP 3 Combine the salt and password bytes for later use:
            byte[] hashBytes = new byte[36];
            Array.Copy(salt, 0, hashBytes, 0, 16);
            Array.Copy(hash, 0, hashBytes, 16, 20);
            //STEP 4 Turn the combined salt+hash into a string for storage
            string savedPasswordHash = Convert.ToBase64String(hashBytes);
            ///////////////////////////////////////////////////////////////////////////////


            /*
             * STEP 5 Verify the user-entered password against a stored password

            // Fetch the stored value 
            string savedPasswordHash = DBContext.GetUser(u => u.UserName == user).Password;

            // Extract the bytes 
            byte[] hashBytes = Convert.FromBase64String(savedPasswordHash);

            // Get the salt 
            byte[] salt = new byte[16];
            Array.Copy(hashBytes, 0, salt, 0, 16);

            // Compute the hash on the password the user entered 
            var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000);
            byte[] hash = pbkdf2.GetBytes(20);

            //Compare the results 
            for (int i = 0; i < 20; i++)
                if (hashBytes[i + 16] != hash[i])
                    throw new UnauthorizedAccessException();
            */

            this.Password = savedPasswordHash;
            this.Birthdate = birth;

            this.Push();
        }

        //Push User to DB
        private void Push()
        {
            String query = $@"INSERT INTO table_name (column1, column2, column3, ...) VALUES({this.Firstname}, {this.Lastname}, {this.Email}, {this.Password}, {this.Birthdate});";
            Console.WriteLine(query);
        }

    }
}