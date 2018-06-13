using System;


//Attention: This class is only for POC!
namespace Finder.Core.Models
{
    public class Movie
    {
        //movie properties
        public string TitleName { get; set; }

        public string Description { get; set; }

        public DateTime ReleaseDate { get; set; }


        //constructor for movie with initial upload to DB by calling Push-method
        public Movie(string TitleName, string Description, DateTime ReleaseDate)
        {
            this.Description = Description;
            this.ReleaseDate = ReleaseDate;
            this.TitleName = TitleName;

            this.Push();
        }

        //pushing the movie to the DB
        private void Push()
        {
            var query = $@"INSERT INTO table_name (column1, column2, column3, ...) VALUES({this.Description},{this.ReleaseDate},{this.TitleName});";
            DatabaseConnection q = new DatabaseConnection();
            q.QueryInsert(query);
        }
    }
}
