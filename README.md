# Lyricit

Add lyrics to your itunes songs through command line.

## Installation

    $ gem install lyricit

## Usage

To update the lyrics for current song.

    $ lyricit -c

To update the lyrics for a particular song
   
    $ lyricit -s somebody

Above command will give you the list of songs matching the `somebody`

```
1 results found
|-----------------------------------------|
|Id     | Name                            |

|-----------------------------------------|
|179    | Somebody That I Used To Know    |
|-----------------------------------------|
Enter the Id for which you want the lyrics: 

```

Enter the Id for the song you want to update. `179` in above example.

Now the lyrics will be displayed on the terminal.

```

"'Gotye:"'
Now and then I think of when we were together
Like when you said you felt so happy you could die
Told myself that you were right for me
But felt so lonely in your company
But that was love and it's an ache I still remember
...

Update on iTunes? [Y/n]:

```

Answer Y to the above question, if lyrics are what you expect.

## TODO

1. Add support for more APIs to fetch the song lyrics if first API fails.
2. Add search by artist name. Provide more options.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
