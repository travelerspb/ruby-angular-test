var app = angular.module("test", []);

app.controller("TreeCtrl", function($scope, $http) {
  $http.get("/data").success(function(data) {
    $scope.data = data;
  });
});
