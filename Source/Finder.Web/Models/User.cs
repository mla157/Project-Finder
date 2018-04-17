using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Finder.Web.Models
{
    //Claass for User creation
    public class User
    {
        private string FirstName { get; set; }
        private string LastName { get; set; }
        private string MailAdress { get; set; }
        private string Password { get; set; }
        private DateTime BirthDate { get; set; }

        //Constructor with initial upload to DB
        public User(string firstName, string lastName, string mailAdress, string password, DateTime birthDate)
        {
            this.FirstName = firstName;
            this.LastName = lastName;
            this.MailAdress = mailAdress;
            this.Password = password;
            this.BirthDate = birthDate;

            this.Push();
        }

        //Push User to DB
        private void Push()
        {
            Console.WriteLine(this.LastName+", "+ this.FirstName);
        }
    }
}