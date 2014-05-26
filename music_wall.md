## Goal 

Create a Sinatra Application that allows anyone to add music (songs) to a public wall to share with the world. This app will be so open and chaotic that visitors don't even need to register a user account in order to post songs.

## About the App

### The Model

The track model can include the following fields/attributes:

* Song Title (required)
* Author (required)
* URL (optional)
* Timestamps (`created_at` and `updated_at`, as you should have with all tables)

### The Actions

Any visitor will be able to create and view the list of music (songs). Similar to the previous app, don't worry about implementing the ability to update or delete songs. Once they're up, they're up. Crazy, I know!

### Getting Started

Use the [Sinatra Skeleton Code](https://github.com/lighthouse-labs/sinatra-skeleton) to get started, much like you did for your [First Sinatra App Tutorial](https://gist.github.com/kvirani/a82c32b3f01fc0840e20).

### Estimated Time

This app should take you between 3 to 4 hours to build.

## Tips

* This application is *very* similar to the one built earlier via the tutorial. Feel free to use its [Commits](https://github.com/lighthouse-labs/sinatra-message-wall/commits/master) and Tutorial as a reference.
* Write incremental code, much like you (hopefully) have been previously. When development web apps, much like how you were doing with your ruby apps, write a little bit of code that should yield some result and then ensure that it does yield that result (eg: refresh the page to see the change).
* Be sure to initialize a git repo for it commit to it regularly. Push to it a new Github repo regularly as well. You can just one the one master branch for now.
