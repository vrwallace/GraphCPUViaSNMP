unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAIntervalSources, TAGraph, TASeries, Forms,
  Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,snmpsend;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    snmp: TEdit;
    uctpser: TLineSeries;
    sctpser: TLineSeries;
    ictpser: TLineSeries;
    totalser: TLineSeries;
    sctp: TEdit;
    ictp: TEdit;
    Timer1: TTimer;
    host: TEdit;
    uctp: TEdit;
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
var
  SNMPResult: boolean;
   snmpval,ipaddrval:string;
   result:string;

begin

    snmpval:=snmp.text;
    ipaddrval:=host.text;
  SNMPResult := SNMPGet('1.3.6.1.4.1.2021.11.9.0', SNMPval, ipaddrval, Result);
    if (SNMPResult = True) then
      begin
      uctp.Text := Result;
      uctpser.AddXy(uctpser.Count+1,strtoint(result));
      end;
	   SNMPResult := SNMPGet('1.3.6.1.4.1.2021.11.10.0', SNMPval, ipaddrval, Result);
    if (SNMPResult = True) then

       begin
      sctp.Text := Result;
      sctpser.AddXy(uctpser.Count+1,strtoint(result));
      end;

	   SNMPResult := SNMPGet('1.3.6.1.4.1.2021.11.11.0', SNMPval, ipaddrval, Result);
    if (SNMPResult = True) then

       begin
      ictp.Text := Result;
      ictpser.AddXy(uctpser.Count+1,strtoint(result));
      end;



end;

end.

