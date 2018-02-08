Given("{int} source files in {string}") do |num, dir|
  num.times do |i|
    filename = File.join("./source/",dir,"/example-#{i}.html.md")
    step %Q{a file named "#{filename}" with:},
         <<-EOF
---
title: "Example file #{i}"
---
# This is example file number #{i}
EOF
  end
end

Then("group called without a name should have {int} items") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("there should be {int} total site resources") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the Group {string} should have {int} items") do |string, int|
  pending # Write code here that turns the phrase above into concrete actions
end
Then("the element at CSS {string} should contain {string}") do |selector, content|
  expect(find(:css, selector)).to have_content(content)
end
Given("I print debug info") do
end
