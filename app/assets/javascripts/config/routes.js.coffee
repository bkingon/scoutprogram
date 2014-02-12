# Configure 'app' routing. The $stateProvider and $urlRouterProvider
# will be automatically injected into the configurator.
app.config ($stateProvider, $urlRouterProvider) ->

  # Make sure that any other request beside one that is already defined
  # in stateProvider will be redirected to root.
  $urlRouterProvider
    .otherwise("/")

  # Define 'app' states
  $stateProvider
    .state "default",
      abstract: true
      views:
        "":
          controller: "ApplicationController"
          templateUrl: "/assets/layouts/default.html.erb"

  # Programs
  .state "programs",
    parent: "default"
    url: "/programs"
    views:
      "":
        controller: "ProgramsController"
        templateUrl: "/assets/programs/index.html.erb"

  .state "new",
    parent: "programs"
    url: "/new"
    views:
      "@default":
        controller: "ProgramsController"
        templateUrl: "/assets/programs/new.html.erb"

  .state "edit",
    parent: "programs"
    url: "/:id/edit"
    views:
      "@default":
        controller: "ProgramsController"
        templateUrl: "/assets/programs/edit.html.erb"
