# extract mp3 from mp4 

import moviepy
import moviepy.editor # installing required module

# load video
video = moviepy.editor.VideoFileClip(r"C:\Users\MY\Desktop\github_repos\sample.3gp") 

# exract audio .... simple isn't it ?
audio = video.audio

# write audio in new file 
audio.write_audiofile(r"C:\Users\MY\Desktop\github_repos\sample.mp3")
