import speech_recognition as sr

audio = "./23_Corpus/Conferencia-matutina_2024-02-12.mp3"

re = sr.Recognizer()

with sr.AudioFile(audio) as source:
    info_audio = re.record(source)
    text = re.recognize_
    print(text)


