# For-GitHub-Pages

Install all [prerequisites.](<https://jekyllrb.com/docs/installation/>)

Install the jekyll and bundler [gems](https://jekyllrb.com/docs/ruby-101/#gems)

```sh
gem install jekyll bundler
```

Create a new Jekyll site at `./myblog`

```sh
jekyll new myblog
```

Change into your new directory

```sh
cd myblog
```

Build the site and make it available on a local server

```sh
bundle exec jekyll serve --livereload
```

Browse to [http://localhost:4000](http://localhost:4000)
