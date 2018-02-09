namespace Finder.Web.Controllers.Api
{
    using System.Web.Http;

    public class ExamplesController : ApiController
    {
        public string Get()
            => "Hello Example!";
    }
}