namespace Finder.Web
{
    using System.Web.Optimization;

    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                "~/Scripts/Framework/jquery-{version}.js"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                "~/Scripts/Framework/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                "~/Scripts/Framework/bootstrap.js",
                "~/Scripts/Framework/respond.js"));

            bundles.Add(new ScriptBundle("~/bundles/angular").Include(
                "~/Scripts/Framework/angular.js",
                "~/Scripts/Framework/angular-route.js"));

            bundles.Add(
                new ScriptBundle("~/bundles/client").Include(
                    "~/Scripts/Client/Configuration/app.js",
                    "~/Scripts/Client/Services/UrlService.js",
                    "~/Scripts/Client/Controller/MoviesController.js",
                    "~/Scripts/Client/Controller/HomeController.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/bootstrap.css",
                "~/Content/site.css"));
        }
    }
}
