unit frmChangeInstrument_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,clsSounds, Vcl.StdCtrls,threading;

type
  TfrmChangeInstrument = class(TForm)
    cbbInstruments: TComboBox;
    btnChangeInstruMent: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnChangeInstruMentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sounds:TJABSounds;
  end;

var
  frmChangeInstrument: TfrmChangeInstrument;

implementation

{$R *.dfm}

procedure TfrmChangeInstrument.btnChangeInstruMentClick(Sender: TObject);
begin
  sounds.SetInstrument(cbbInstruments.ItemIndex);
end;

procedure TfrmChangeInstrument.FormCreate(Sender: TObject);
begin
//sounds.arrinstruments:='Acoustic Piano','BrtAcou Piano','ElecGrand Piano','Honky Tonk Piano','Elec.Piano 1','Elec.Piano 2','Harsichord','Clavichord','Celesta','Glockenspiel','Music Box','Vibraphone','Marimba','Xylophone','Tubular Bells','Dulcimer','Drawbar Organ','Perc. Organ','Rock Organ','Church Organ','Reed Organ','Accordian','Harmonica','Tango Accordian','Acoustic Guitar','SteelAcous. Guitar','El.Jazz Guitar','Electric Guitar','El. Muted Guitar','Overdriven Guitar','Distortion Guitar','Guitar Harmonic','Acoustic Bass','El.Bass Finger','El.Bass Pick','Fretless Bass','Slap Bass 1','Slap Bass 2','Synth Bass 1','Synth Bass 2','Violin',' Viola','Cello','Contra Bass','Tremelo Strings','Pizz. Strings','Orch. Strings','Timpani','String Ens.1','String Ens.2','Synth.Strings 1','Synth.Strings 2','Choir Aahs',' Voice Oohs',' Synth Voice','Orchestra Hit','Trumpet','Trombone','Tuba','Muted Trumpet','French Horn','Brass Section','Synth Brass 1','Synth Brass 2','Soprano Sax','Alto Sax','Tenor Sax','Baritone Sax',' Oboe','English Horn','Bassoon','Clarinet','Piccolo','Flute','Recorder','Pan Flute','Blown Bottle','Shakuhachi','Whistle','Ocarina','Lead1 Square','Lead2 Sawtooth','Lead3 Calliope','Lead4 Chiff','Lead5 Charang','Lead6 Voice','Lead7 Fifths','Lead8 Bass Ld','Pad1 New Age','Pad2 Warm','Pad3 Polysynth','Pad4 Choir','Pad5 Bowed','Pad6 Metallic','Pad7 Halo','Pad8 Sweep','FX1 Rain','FX2 Soundtrack','FX3 Crystal','FX4 Atmosphere','FX5 Brightness','FX6 Goblins','FX7 Echoes','FX8 Sci-Fi','Sitar','Banjo','Shamisen','Koto','Kalimba',' Bagpipe',' Fiddle',' Shanai','TinkerBell','Agogo','SteelDrums','Woodblock','TaikoDrum','Melodic Tom','SynthDrum','Reverse Cymbal','Guitar Fret Noise',' Breath Noise','Seashore','BirdTweet','Telephone','Helicopter','Applause','Gunshot';
//    TParallel.&For(
//    0,127,procedure(i:integer)
//    begin
//      cbbInstruments.Items.Add(sounds.arrInstruments[i]);
//    end
//    );
  cbbInstruments.ItemIndex:=0;
end;

end.
