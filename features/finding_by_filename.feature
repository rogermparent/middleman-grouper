Feature: Finding by Filename
  Users should be able to find items in a group by their filename
  relative to the group's base path.

  Scenario: Creating a single group
    Given a fixture app "dummy-app"
    And 3 source files in "/grouped"
    And a file named "source/grouped/findme.html.erb" with:
      """
      ---
      title: Find me
      ---
      I'm just waiting to be found
      """
    And a file named "./config.rb" with:
      """
      activate :grouper,
        scope: "grouped/"
      """
    And a file named "./source/index.html.erb" with:
      """
      <div class="findme-text">
        <%= group.find("findme.html").data.title %>
      </div>
      """
    And the Server is running
    And I go to "/index.html"
      
    Then the element at CSS ".findme-text" should contain "Find me"
