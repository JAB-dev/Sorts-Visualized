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
  end;

 var
   mo: HMIDIOUT;
  const
  MIDI_NOTE_ON = $90;
  MIDI_NOTE_OFF = $80;
  MIDI_CHANGE_INSTRUMENT = $C0;

implementation

{ TJABSounds }

constructor TJABSounds.Create;
begin
  InitMIDI;
end;

procedure TJABSounds.InitMIDI;
begin
  midiOutOpen(@mo, 0, 0, 0, CALLBACK_NULL);
  midiOutShortMsg(mo, MIDIEncodeMessage(MIDI_CHANGE_INSTRUMENT, 0, 0));
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
