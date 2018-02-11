var app = angular.module('FinderApp'); // -> _Layout.cshtml <html ng-app="TemplateApp">

app.controller("MovieController", MovieController);

MovieController.$inject = ["$scope", "$http", "UrlService"];

function MovieController($scope, $http, UrlService)
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