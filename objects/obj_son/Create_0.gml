main_sound_effects = audio_emitter_create()
normal_sound_effects = audio_emitter_create()
music_e = audio_emitter_create()

function play_sound(_snd,_var) constructor{
	audio_emitter_pitch(main_sound_effects,(random_range(-_var,_var)+1))
	audio_play_sound_on(main_sound_effects,_snd,false,1)
}

function play_sound_normal(_snd){
	audio_play_sound_on(normal_sound_effects,_snd,false,1)
}


audio_play_sound_on(music_e,snd_music,true,0)
play_sound(snd_click,0.1)
