Feature: Groups
  The bread and butter of the application, Groups take a string or regex to select
  a group of files in the source folder to work with. This can allow for easy
  access, sorting, and even more complex logic.

  Scenario: Creating a single group
    Given a fixture app "dummy-app"
    And 3 source files in "/grouped"
    And 2 source files in "/"
    And a file named "./config.rb" with:
      """
      activate :grouper,
        scope: "grouped/"
      """
    And a file named "./source/index.html.erb" with:
      """
      <% group.all.each do |resource| %>
        <div><%= resource.normalized_path %></div>
      <% end %>
      <div class="source-files-count">
        <%= sitemap.resources.count %>
      </div>
      <div class="group-count"><%= group.all.count %></div>
      """
    And the Server is running
    And I go to "/index.html"
      
    Then the element at CSS ".source-files-count" should contain "6"
    And the element at CSS ".group-count" should contain "3"

