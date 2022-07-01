extends AudioStreamPlayer


#change bpm here and on the Game.gd script to reflect BPM of song. Also you can double the bpm for access to more notes
#differences between rhythm scenes include bpm, note mapping, song playing, background, and character sprite

var song_bpm = [90, 350, 220, 320, 00, 120, 360, 00]

#Janitor, cosplay(brodie)175, himbo, mother, oliver(wesley), woman, skater180, ominous
#var bpm_buffer = song_bpm[RhythmGlobal.sceneInt]
var bpm = song_bpm[RhythmGlobal.sceneInt]
export var measures := 4

# Tracking the beat and song position
var song_position = 0.0
var song_position_in_beats = 1
var sec_per_beat = 60.0 / bpm
var last_reported_beat = 0
var beats_before_start = 0
var measure = 1

# Determining how close to the beat an event is
var closest = 0
var time_off_beat = 0.0

signal beat(position)
signal measure(position)

#var file = File.new()
#var fileStream = AudioStreamSample.new()

var audioStream: AudioStream

func _ready():
	match RhythmGlobal.sceneInt:
		0:
			audioStream = preload('res://src/Audio/Janitor.wav')
		1:
			audioStream = preload('res://src/Audio/Cosplayer-3.wav')
		2:
			audioStream = preload('res://src/Audio/KPop-1.wav')
		3:
			audioStream = preload('res://src/Audio/Mother-3.wav')
		4:
			audioStream = preload('res://src/Audio/Cosplayer.wav')
		5:
			audioStream = preload('res://src/Audio/Cosplayer.wav')
		6:
			audioStream = preload('res://src/Audio/Skater.wav')
		7:
			audioStream = preload('res://src/Audio/Ominous.wav')
	self.set_stream(audioStream)
#	var file = File.new()
#	var fileStream = AudioStreamSample.new()
#	if file.file_exists(song_file[2]):
#		file.open(song_file[RhythmGlobal.sceneInt], file.READ)
#		var buffer = file.get_buffer(file.get_len())
#		var newStream = AudioStreamSample.new()
#		newStream.data = buffer
#		stream = newStream
	sec_per_beat = 60.0 / bpm


func _physics_process(_delta):
	if playing:
		song_position = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_position -= AudioServer.get_output_latency()
		song_position_in_beats = int(floor(song_position / sec_per_beat)) + beats_before_start
		_report_beat()


func _report_beat():
	if last_reported_beat < song_position_in_beats:
		if measure > measures:
			measure = 1
		emit_signal("beat", song_position_in_beats)
		emit_signal("measure", measure)
		last_reported_beat = song_position_in_beats
		measure += 1


func play_with_beat_offset(num):
	beats_before_start = num
	$StartTimer.wait_time = sec_per_beat
	$StartTimer.start()


func closest_beat(nth):
	closest = int(round((song_position / sec_per_beat) / nth) * nth) 
	time_off_beat = abs(closest * sec_per_beat - song_position)
	return Vector2(closest, time_off_beat)


func play_from_beat(beat, offset):
	play()
	seek(beat * sec_per_beat)
	beats_before_start = offset
	measure = beat % measures


func _on_StartTimer_timeout():
	song_position_in_beats += 1
	if song_position_in_beats < beats_before_start - 1:
		$StartTimer.start()
	elif song_position_in_beats == beats_before_start - 1:
		$StartTimer.wait_time = $StartTimer.wait_time - (AudioServer.get_time_to_next_mix() +
														AudioServer.get_output_latency())
		$StartTimer.start()
	else:
		play()
		$StartTimer.stop()
	_report_beat()
