pundit-demo
===========

This is a small demo on how to use Pundit with a role system. On this example we're rolling roles of our own but we could use Rolify or any other role system.

Setting up
----------

`bundle install && rake db:create db:migrate db:seed`

Managing permissions
--------------------
Permissions are managed by Pundit policies, those live under app/policies. Every different section should have a policy, if it doesn't the controller will not work since it inhertis from AuthenticatedController which checks that every controller actions is authorized agains pundit. 

Besides that every pundit policy defines a default scope, this scope is needed to filter out the results that the controller will get to only match the permissions that the user has (i.e a parent can only see it's childs record). The policy's scope method checks for the user role and calls the adequate role method to get the base data, i.e `teacher.alumni`.

Managing the menu
-----------------
The user menu is defined by the `app_sections` method on the `application_helper`. We have a list of all the sections (Defined by the class to lookup the policy, a name and it's route), for every user we filter that list with only the members that we have a policy for it's index view.

Gotchas
-------
I've setup a very basic role system, we've got a user model and several other models that represents a role (Student, Parent, Teacher, DistrictSuperintendent), a user can have many of those roles, however since the relationship for any of those roles is defined by a `has_many` it is possible for a user to have several roles of a same kind, which is not quite correct, to fix that we should change the relationship to be a `has_one` and live on the User model. However those classes can (and perhaps might) be changed for something more suitable on the specific problem.

