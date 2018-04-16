using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Finder.Web.Models
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
        public User(String fN,String lN, String email,String Password, DateTime birth)
        {
            this.Firstname=fN;
            this.Lastname=lN;
            this.Email=email;
            this.Password=Password;
            this.Birthdate=birth;

            this.Push();
        }

        //Push User to DB
        private void Push()
        {
            Console.WriteLine(this.Lastname+", "+ this.Firstname);
        }
        
    }
}