var app = angular.module('FinderApp'); // -> _Layout.cshtml <html ng-app="TemplateApp">

app.controller("MoviesController", MoviesController);

MoviesController.$inject = ["$scope", "$http", "UrlService"];

function MoviesController($scope, $http, UrlService)
{
    $scope.movie = {
        titleName: null,
        description: null,
        releaseDate: null
    };

    $scope.getMovie = function()
    {
        $http.get(UrlService.forApi('Movies')).then(function(response)
        {
            $scope.movie = response.data;
        });
    };

    $scope.getMovie();
}