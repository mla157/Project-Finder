var root = $('#rootPath').val();
var rootViewTemplates = $('#rootPath').val();

if (root == '/') {
    root = '';
    rootViewTemplates = '..';
}

var app = angular.module('TemplateApp'); // -> _Layout.cshtml <html ng-app="TemplateApp">

app.factory('UrlService', function ()
{
    var urlServiceInstance = {};

    urlServiceInstance.forRoot = function (url)
    {
        return root + '/' + url;
    };

    urlServiceInstance.forApi = function (url) {
        return root + '/api/' + url;
    };

    urlServiceInstance.forTemplates = function (url) {
        return rootViewTemplates + '/Frontend/Templates/' + url;
    };
    
    return urlServiceInstance;
});