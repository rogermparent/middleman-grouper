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

Then("the element at CSS {string} should contain {string}") do |selector, content|
  expect(find(:css, selector)).to have_content(content)
end

Then("I print the page body") do
  puts page.body
end

Then("going to {string} should raise an exception") do |url|
  expect{ visit(URI.encode(url).to_s) }.to raise_exception RuntimeError
end

Then("running the server should raise an exception") do
  expect{step "the Server is running"}.to raise_exception RuntimeError
end
