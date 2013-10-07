Part 1

Create classes to model popular music:

An artist has a name.
An artist has many songs.
A song has lyrics, a duration and genre.
An album has many songs (from one or more artists).
Ensure you can "walk the graph" (in pry) to find the artist for given a song, or albums a song by a particular artist appears on.
Part 2

Create a tedious menu driven text entry system to allow a user to add songs and artists to the system
A user should be able to include songs for an album. Allow compilation albums by various artists.
Part 3 - Research

Find a way to save and retrieve ("persist") this data using the Ruby's File API
Understand how and why File inherits from IO
http://www.ruby-doc.org/core-2.0.0/File.html#method-c-open
http://www.ruby-doc.org/core-2.0.0/IO.html#method-i-write
http://www.ruby-doc.org/core-2.0.0/IO.html#method-i-each_line