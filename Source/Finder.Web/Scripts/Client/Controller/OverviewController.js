var app = angular.module('FinderApp'); // -> _Layout.cshtml <html ng-app="TemplateApp">

app.controller("OverviewController", OverviewController);

OverviewController.$inject = ["$scope", "$http", "UrlService"];

function OverviewController($scope, $http, UrlService) {

    $scope.movies = [];

    $scope.getMovie = function ()
    {
        $scope.showAlert = true;
        $scope.showError = false;
        $http(
            {
                method: 'GET',
                url: UrlService.forApi('Overview')
            }).then(
            function success(response) {
                if (response.data) {
                    for (var i = 0; i < response.data.length; ++i) {
                        var movie = response.data[i];
                        console.log(movie);

                        $scope.movies.push(
                            {
                                titleName: movie.titleName,
                                releaseDate: movie.releaseDate,
                                description: movie.description
                            });
                    }
                }
            },
            function error(response) {
                $scope.showError = true;
                $scope.showAlert = false;
            });
        $scope.showAlert = false;
    };

    $scope.getMovie();
};