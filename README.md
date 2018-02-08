# Grouper

## Intro

Grouper is a plugin that aims to do what it says on the tin: group things.

Specifically, it groups Middleman's [Sitemap Resources](http://www.rubydoc.info/github/middleman/middleman/Middleman/Sitemap/Resource) by the directory they reside in. This allows for source files to double as data files in a more convenient manner than raw Middleman allows.

For a quick example, folder full of project pages in source/projects can be grouped like this.

```ruby
activate :grouper,
         name: :projects,
         scope: "project/"
```

Now your project pages can be accessed in your templates with `group(:projects).all`! It's that simple- only if you want it to be, of course.

## The Group Controller
This is the class you get back from `group(:group_name)`, it's pretty simple at this point.

You've got two methods on this thing, not counting initialization.

 - `.all`: returns an array of Sitemap Resources
 - `.find(filename)`: Takes a filename **relative to the scope directory** and returns the Sitemap Resource representing that file. Returns nil if it wasn't there.

If you want to loop through all the resources, use `.all.each`

## Misc

### Features

Done, but need documentation

- Multiple Groups
- Custom Group Controllers

Planned

- Optional external ordering
