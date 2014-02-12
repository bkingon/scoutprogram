@app.controller "ProgramsController", ["$scope", "$resource", ($scope, $resource) ->
  $scope.popup = ->
    $scope.activities.push($scope.newEntry)
    $scope.newEntry = {}
  $scope.newEntry = {
    name: "Test"
  }
  Activity = $resource("/activities/:id", {id: "@id"}, {update: {method: "PUT"}})
  $scope.activities = Activity.query()
  console.log $scope.activities.count
  console.log $scope.activities

  $scope.program_activities = [

  ]

  $scope.add_to_program = ->
    console.log(this)
    $scope.program_activities.push(this.activity)

  $scope.remove_from_program_activities = ->
    index = $scope.program_activities.indexOf(this.activity)
    $scope.program_activities.splice(index, 1)

  $scope.toggle_activity_show = ($event) ->
    $($event.target).find('div').slideToggle("fast")
]
