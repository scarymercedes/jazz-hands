# jazz-hands
Bash script to convert a folder full of mp3s to 44.1khz wav files with the bpm in the filename

I made this because I downloaded a bunch of public domain jazz recordings from archive.org, and I wanted to quickly convert them to a format and sample rate that an Ardour project I had would be happy with. I also needed to be able to sort them by BPM to make it easier to drop them into some pre-existing tracks I had and speed them up/slow them down later.

This would come in handy for any project that involves downloading a lot of recordings from archive.org and trying to make industrial music out of them. I expect this repo to be a household name within the year.

**Prerequisites:**
- Bash
- Lame (for MP3 decoding)
- Soundstretch (for getting the BPM)

**Instructions:**
- Clone the repo
- Put your MP3s in the "in" folder
- Run batch-decode.sh
- Retrieve your files from the "out" folder

**Future Enhancements:***
- Parameterize source directory, target directory
- Parameterize desired sample rate and format
- Make a Dockerfile and docker-compose template so I can run this quickly on a machine that doesn't have LAME, Soundstretch, or Bash pre-installed
