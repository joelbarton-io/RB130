- [rubygems](./toolbox_notes.md)
- [rvm_rbenv](./toolbox_notes.md)
- [bundler](./toolbox_notes.md)
- [rake](./toolbox_notes.md)

## goal: *"formulate a mental model of how the pieces fit together"*
# rubygems
- packages of code (gems)

- https://rubygems.org/ ; gem install GEMNAME
- where gem creates the local library depends on several factors, including whether you are using a system Ruby that needs root access, a user maintainable Ruby, the specific Ruby version number, and whether you use a Ruby version manager, e.g., rbenv or RVM
- issues? -> gem env`
# rvm_rbenv
- different ruby version managers
- retrieves from remote lib -> downloads to local lib
- rbenv (more conservative approach); rvm (more dramatic actions)
# bundler
- a ruby gem; unique to each version of ruby
- manages dependancies (various versions of ruby or gems, etc.); tries to ensure the proper versions are used
- relies on a file: Gemfile ; instruction file for Bundler
- binstubs; bundler exec (prefered)
- bundler exec: ensures that executable programs installed by Gems don't interfere with your app's requirements
- When you update your Gemfile, you should rerun bundle install to force an update to Gemfile.lock.
- allows us to describe exactly which Ruby version and gem version an app uses; lets us install multiple versions
- It's easy to see the names Gemfile and Gemfile.lock and think that these files must be part of Rubygems. Bundler uses both files; it depends on Gemfile to provide information on the Gems your project uses, and it creates Gemfile.lock based on that. If you ever create your own Rubygem, you will probably use Bundler, but you don't have to. Hence, you don't need Gemfile or Gemfile.lock to create a Rubygem.
# rake
- another gem; automates common tasks
- not 'required'; but there's little point in not using it; there's always going to be tasks needing automation
- you should use bundle exec rake whenever you use Rake with a project that uses Bundler.
