FWgist
================

[FWgist] Like Github's Gist service, but for use behind a Firewall.
Every Gist is a *Git repository* thus **versioned** and **cloneable**. Heavily inspired by gist.github.com

![FWgist](public/fwgist.png)

Features
---------------

as of `v0.1`:

- Create, Edit, Delete Gists
- Revision browsing
- Cloneable (served by git-daemon)
- public by default
- Raw view
- syntax highlight with pygments (filename based detection)



TODO
---------------

- Fork
- Markup(markdown) rendering
- Search
- Binary support
- Inline image
- Accounts
- Private gists
- Commenting
- "Code Review"


Installation
---------------

[FWgist] is based on Ruby on Rails, Sqlite, Libgit2 and Pygments(requires Python installed).


1. `git clone https://github.com/gmarik/FWgist` 
2. `cd FWgist && bundle install`
3. `rake db:create db:migrate`
4. `rails server`


Making repos cloneable
--------------


run

    git-daemon --user=nobody --export-all --base-path=/path/to/FWgist/repos_production



Testing
---------------

1. `cd FWgist`
2. `rake db:test:clone_structure`
3. `rspec spec`


License
---------------

Please see LICENSE for licensing details.


Original Author
---------------
Maryan Hratson aka [@gmarik](http://github.com/gmarik)
- contact: [@gmarik](http://twitter.com/gmarik)

[FWgist]:http://github.com/gmarik/FWgist

