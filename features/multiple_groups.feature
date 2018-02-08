Feature: Multiple Groups
  By activating the extension multiple times, you can define multiple distinct groups
  with different configurations.
  
  Scenario: Creating multiple groups
    Given a fixture app "dummy-app"
    And 3 source files in "/group_one"
    And 2 source files in "/group_two"
    And 2 source files in "/"
    And a file named "./config.rb" with:
      """
      activate :grouper,
        scope: "group_one/",
        name: "first_group"

      activate :grouper,
        scope: "group_two/",
        name: "second_group"
      """
    And a file named "./source/index.html.erb" with:
      """
      ---
      ---
      <div class="source-files-count">
        <%= sitemap.resources.count %>
      </div>
      <div class="group-1-count"><%= group(:first_group).all.count %></div>
      <div class="group-2-count"><%= group(:second_group).all.count %></div>
      """
    And the Server is running
    And I go to "/index.html"
      
    Then the element at CSS ".source-files-count" should contain "8"
    And the element at CSS ".group-1-count" should contain "3"
    And the element at CSS ".group-2-count" should contain "2"