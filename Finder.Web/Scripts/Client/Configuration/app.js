var root = $('#rootPath').val();
var rootViewTemplates = $('#rootPath').val();

if (root == '/')
{
    root = '';
    rootViewTemplates = '..';
}

var app = angular.module('FinderApp', ['ngRoute']);

function config($routeProvider)
{
    $routeProvider
        .when(
            '/',
            {
                redirectTo: '/Home'
            })
        .when(
            '/Home',
            {
                templateUrl: rootViewTemplates + '/Frontend/Templates/Home.html',
                controller: 'ExampleController'
            })
        .when(
        '/About',
            {
                templateUrl: rootViewTemplates + '/Frontend/Templates/About.html'
            }
        )
        .otherwise(
            {
                redirectTo: '/'
            });
}

app.config(["$routeProvider", config]);