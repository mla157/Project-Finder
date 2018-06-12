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
            controller: 'HomeController'
        })
        .when(
        '/About',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/About.html'
        }
        )
        .when(
        '/Tinder',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/Tinder.html',
            controller: 'TinderController'
        }
        )
        .when(
        '/User',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/User.html',
            controller: 'UsersController'
        }
        )
        .when(
        '/Login',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/Login.html',
            controller: 'AuthenticationController'
        }
    )
        .when(
            '/Logout',
            {
                templateUrl: rootViewTemplates + '/Frontend/Templates/Logout.html',
                controller: 'AuthenticationController'
            }
        )
        .when(
        '/Register',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/Register.html',
            controller: 'AuthenticationController'
        }
        )
        .when(
        '/Finder',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/Finder.html',
            controller: 'MoviesController'
        }
        )
        .when(
        '/Overview',
        {
            templateUrl: rootViewTemplates + '/Frontend/Templates/Overview.html',
            controller: 'OverviewController'
        }
        )
        .otherwise(
        {
            redirectTo: '/'
        });
}

app.config(["$routeProvider", config]);