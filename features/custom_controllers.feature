Feature: Custom Controllers
  Any class that inherits from the base controller
  can be used as the return value for its (:group) function.
  Different groups can have different controllers.

  Scenario: Dog Controller
    Given a fixture app "dummy-app"
    And a file named "./config.rb" with:
      """
      class DogController < ::MiddlemanGrouper::GroupController
        def bark
          return "bark bark"
        end
      end
      
      activate :grouper,
        scope: "group_one/",
        name: "first_group",
        controller: DogController

      activate :grouper,
        scope: "group_two/",
        name: "second_group"
      """
    And a file named "./source/index.html.erb" with:
      """
      <div class="group-1-class"><%= group(:first_group).class %></div>
      <div class="group-2-class"><%= group(:second_group).class %></div>
      <div class="group-1-barks"><%= group(:first_group).respond_to? :bark %></div>
      <div class="group-2-barks"><%= group(:second_group).respond_to? :bark %></div>
      """
    And the Server is running
    And I go to "/index.html"

    Then I print the page body
      
    Then the element at CSS ".group-1-class" should contain "DogController"
    And the element at CSS ".group-2-class" should contain "GroupController"
    And the element at CSS ".group-1-barks" should contain "true"
    And the element at CSS ".group-2-barks" should contain "false"

  Scenario: Failing on a non-inheriting controller
    Given a fixture app "dummy-app"
    And a file named "./config.rb" with:
      """
      class DogController
        def bark
          return "bark bark"
        end
      end
      
      activate :grouper,
        scope: "group_one/",
        name: "first_group",
        controller: DogController
      """
    And a file named "./source/index.html.erb" with:
      """
      <div class="group-class"><%= group(:first_group).class %></div>
      """

    Then running the server should raise an exception