var root = $('#rootPath').val();
var rootViewTemplates = $('#rootPath').val();

if (root == '/') {
    root = '';
    rootViewTemplates = '..';
}

var app = angular.module('FinderApp', ['ngRoute']);

function config($routeProvider) {
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
        })
        .when(
        '/About',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/About.html'
        }
        )
        .when(
        '/User',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/User.html'
        }
        )
        .when(
        '/Overview',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/Overview.html',
            controller: 'MoviesController'
        }
        )
        .when(
        '/Login',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/Login.html'
        }
        )
        .when(
        '/Register',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/Register.html'
        }
        )
        .otherwise(
        {
            redirectTo: '/'
        });
}

app.config(["$routeProvider", config]);