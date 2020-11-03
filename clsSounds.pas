unit clsSounds;



interface
  uses System.sysutils,mmsystem;

  type
  TJABSounds = class
  private

  protected

  public
    constructor Create;
    function MIDIEncodeMessage(Msg, Param1, Param2: byte): integer;
    procedure NoteOn(NewNote, NewIntensity: byte);
    procedure NoteOff(NewNote, NewIntensity: byte);
    procedure SetInstrument(NewInstrument: byte);
    procedure InitMIDI;
    procedure killmidi;

  end;

 var
   mo: HMIDIOUT;
  arrInstruments:array[0..127] of string;
  const
  MIDI_NOTE_ON = $90;
  MIDI_NOTE_OFF = $80;
  MIDI_CHANGE_INSTRUMENT = $C0;

implementation

{ TJABSounds }
{
General MIDI Instrument List


Piano

1.Acoustic Piano
2.BrtAcou Piano
3.ElecGrand Piano
4.Honky Tonk Piano
5.Elec.Piano 1
6.Elec.Piano 2
7.Harsichord
8.Clavichord

Chromatic Percussion
9.Celesta
10.Glockenspiel
11.Music Box
12.Vibraphone
13.Marimba
14.Xylophone
15.Tubular Bells
16.Dulcimer

Organ
17.Drawbar Organ
18.Perc. Organ
19.Rock Organ
20.Church Organ
21.Reed Organ
22.Accordian
23.Harmonica
24.Tango Accordian


Guitar

25.Acoustic Guitar
26.SteelAcous. Guitar
27.El.Jazz Guitar
28.Electric Guitar
29.El. Muted Guitar
30.Overdriven Guitar
31.Distortion Guitar
32.Guitar Harmonic

Bass

33.Acoustic Bass
34.El.Bass Finger
35.El.Bass Pick
36.Fretless Bass
37.Slap Bass 1
38.Slap Bass 2
39.Synth Bass 1
40.Synth Bass 2

Strings

41.Violin
42. Viola
43.Cello
44.Contra Bass
45.Tremelo Strings
46.Pizz. Strings
47.Orch. Strings
48.Timpani

Ensemble

49.String Ens.1
50.String Ens.2
51.Synth.Strings 1
52.Synth.Strings 2
53.Choir Aahs
54. Voice Oohs
55. Synth Voice
56.Orchestra Hit

Brass

57.Trumpet
58.Trombone
59.Tuba
60.Muted Trumpet
61.French Horn
62.Brass Section
63.Synth Brass 1
64.Synth Brass 2

Reed

65.Soprano Sax
66.Alto Sax
67.Tenor Sax
68.Baritone Sax
69. Oboe
70.English Horn
71.Bassoon
72.Clarinet

Pipe

73.Piccolo
74.Flute
75.Recorder
76.Pan Flute
77.Blown Bottle
78.Shakuhachi
79.Whistle
80.Ocarina

Synth Lead

81.Lead1 Square
82.Lead2 Sawtooth
83.Lead3 Calliope
84.Lead4 Chiff
85.Lead5 Charang
86.Lead6 Voice
87.Lead7 Fifths
88.Lead8 Bass Ld

Synth Pad

89.Pad1 New Age
90.Pad2 Warm
91.Pad3 Polysynth
92.Pad4 Choir
93.Pad5 Bowed
94.Pad6 Metallic
95.Pad7 Halo
96.Pad8 Sweep

Synth F/X

97.FX1 Rain
98.FX2 Soundtrack
99.FX3 Crystal
100.FX4 Atmosphere
101.FX5 Brightness
102.FX6 Goblins
103.FX7 Echoes
104.FX8 Sci-Fi

Ethnic

105.Sitar
106.Banjo
107.Shamisen
108.Koto
109.Kalimba
110. Bagpipe
111. Fiddle
112. Shanai

Percussive

113.TinkerBell
114.Agogo
115.SteelDrums
116.Woodblock
117.TaikoDrum
118.Melodic Tom
119.SynthDrum
120.Reverse Cymbal

Sound F/X

121.Guitar Fret Noise
122. Breath Noise
123.Seashore
124.BirdTweet
125.Telephone
126.Helicopter
127.Applause
128.Gunshot
}
constructor TJABSounds.Create;
begin
  InitMIDI;
end;

procedure TJABSounds.InitMIDI;
begin
  midiOutOpen(@mo, 0, 0, 0, CALLBACK_NULL);
  midiOutShortMsg(mo, MIDIEncodeMessage(MIDI_CHANGE_INSTRUMENT, 0, 0));

end;

procedure TJABSounds.killmidi;
begin
  midiOutClose(0);
end;

function TJABSounds.MIDIEncodeMessage(Msg, Param1, Param2: byte): integer;
begin
    result := Msg + (Param1 shl 8) + (Param2 shl 16);
end;

procedure TJABSounds.NoteOff(NewNote, NewIntensity: byte);
begin
    midiOutShortMsg(mo, MIDIEncodeMessage(MIDI_NOTE_OFF, NewNote, NewIntensity));
end;

procedure TJABSounds.NoteOn(NewNote, NewIntensity: byte);
begin
  midiOutShortMsg(mo, MIDIEncodeMessage(MIDI_NOTE_ON, NewNote, NewIntensity));
end;

procedure TJABSounds.SetInstrument(NewInstrument: byte);
begin
   midiOutShortMsg(mo, MIDIEncodeMessage(MIDI_CHANGE_INSTRUMENT, NewInstrument, 0));
end;

end.
