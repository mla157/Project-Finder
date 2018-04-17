var app = angular.module('FinderApp');

app.controller("HomeController", HomeController);

HomeController.$inject = ["$scope", "$http", "UrlService"];

function HomeController($scope, $http, UrlService)
{
    var userData;

    $.getJSON('https://json.geoiplookup.io/api?callback=?', function (data) {
        userData = JSON.stringify(data, null, 2);
    });
}