unit JSFlatPickr;

interface

uses
  Classes, WEBLib.Controls, Web, SysUtils, DateUtils;

type
  TJSFPmode = (mdSingle, mdMultiple, mdRange);
  TJSFPposition = (poAuto, poAbove, poBelow, poAutoLeft, poAutoCenter, poAutoRight, poAboveLeft, poAboveCenter, poAboveRight, poBelowLeft, poBelowCenter, poBelowRight);
  TJSFPmonthselectortype = (msDropDown, msStatic);
  TJSFPdefaultdate = (ddNow, ddToday, ddCustom);
  TJSFPOnChange = procedure(selectedDates: array of Integer;  dateStr: String; tzo: Integer) of object;

  TJSFlatPickr = class(TWebCustomControl)
  private
    { Private declarations }
    FInitialized: Boolean;
    // Boolean Properties
    FAltInput: Boolean;
    FAllowInput: Boolean;
    FAllowInvalidPreload: Boolean;
    FAnimate: Boolean;
    FClickOpens: Boolean;
    FDisableMobile: Boolean;
    FEnableSeconds: Boolean;
    FEnableTime: Boolean;
    FCalendarInline: Boolean;
    FNoCalendar: Boolean;
    FShortHandCurrentMonth: Boolean;
    FCalendarStatic: Boolean;
    FTime_24hr: Boolean;
    FWeekNumbers: Boolean;
    FWrap: Boolean;
    // Integer Properties
    FDefaultHour: Integer;
    FDefaultMinute: Integer;
    FHourIncrement: Integer;
    FMinuteIncrement: Integer;
    FShowMonths: Integer;
    // String Properties
    FAltFormat: String;
    FAltInputClass: String;
    FAriaDateFormat: String;
    FConjunction: String;
    FDateFormat: String;
    FNextArrow: String;
    FPrevArrow: String;
    FAppendTo: String;
    FPositionElement: String;
    FMode: TJSFPmode;
    FPosition: TJSFPposition;
    FMonthSelectorType: TJSFPmonthselectortype;
    // Date Properties
    FMinDate: TDate;
    FMaxDate: TDate;
    FDefaultDate: TJSFPdefaultDate;
    FDefaultDateStart: TDate;
    FDefaultDateEnd: TDate;
    FDisabledStart: TDate;
    FDisabledEnd: TDate;
    FEnabledStart: TDate;
    FEnabledEnd: TDate;
    // Events
    FJSFPOnChange: TJSFPOnChange;
  protected
    { Protected declarations }
    function CreateElement: TJSElement; override;
    procedure Loaded; override;
    procedure FlatPickrChanged(fp:TJSFlatPickr; selectedDates: Array of Integer; dateStr: String; instance: JSValue; tzo: integer);
  public
    { Public declarations }
  published
    { Published declarations }
    // Boolean Properties
    property AltInput: Boolean read FAltInput write FAltInput default False;
    property AllowInput: Boolean read FAllowInput write FAllowInput default False;
    property AllowInvalidPreload: Boolean read FAllowInvalidPreload write FAllowInvalidPreload default False;
    property Animate: Boolean read FAnimate write FAnimate default True;
    property ClickOpens: Boolean read FClickOpens write FClickOpens default True;
    property DisableMobile: Boolean read FDisableMobile write FDisableMobile default False;
    property EnableSeconds: Boolean read FEnableSeconds write FEnableSeconds default False;
    property EnableTime: Boolean read FEnableTime write FEnableTime default False;
    property CalendarInline: Boolean read FCalendarInline write FCalendarInline default False;
    property NoCalendar: Boolean read FNoCalendar write FNoCalendar default False;
    property ShortHandCurrentMonth: Boolean read FShortHandCurrentMonth write FShortHandCurrentMonth default False;
    property CalendarStatic: Boolean read FCalendarStatic write FCalendarStatic default False;
    property Time_24hr: Boolean read FTime_24hr write FTime_24hr default False;
    property WeekNumbers: Boolean read FWeekNumbers write FWeekNumbers default False;
    property Wrap: Boolean read FWrap write FWrap default False;
    // Integer Properties
    property DefaultHour: Integer read FDefaultHour write FDefaultHour default 12;
    property DefaultMinute: Integer read FDefaultMinute write FDefaultMinute default 0;
    property HourIncrement: Integer read FHourIncrement write FHourIncrement default 1;
    property MinuteIncrement: Integer read FMinuteIncrement write FMinuteIncrement default 5;
    property ShowMonths: Integer read FShowMonths write FShowMonths default 0;
    // String Properties
    property AltFormat: String read FAltFormat write FAltFormat;
    property AltInputClass: String read FAltInputClass write FAltInputClass;
    property AriaDateFormat: String read FAriaDateFormat write FAriaDateFormat;
    property Conjunction: String read FConjunction write FConjunction;
    property DateFormat: String read FDateFormat write FDateFormat;
    property NextArrow: String read FNextarrow write FNextArrow;
    property PrevArrow: String read FPrevArrow write FPrevArrow;
    property AppendTo: String read FAppendTo write FAppendTo;
    property PositionElement: String read FPositionElement write FPositionElement;
    property Mode: TJSFPMode read FMode write FMode default mdSingle;
    property Position :TJSFPPosition read FPosition write FPosition default poAuto;
    property MonthSelectorType: TJSFPmonthselectortype read FMonthSelectorType write FMonthSelectorType default msDropDown;
    // Date Properties
    property MinDate: TDate read FMinDate write FMinDate;
    property MaxDate: TDate read FMaxDate write FMaxDate;
    property DefaultDate: TJSFPdefaultDate read FDefaultDate write FDefaultDate default ddNow;
    property DefaultDateStart: TDate read FDefaultDateStart write FDefaultDateStart;
    property DefaultDateEnd: TDate read FDefaultDateEnd write FDefaultDateEnd;
    property DisabledStart: TDate read FDisabledStart write FDisabledStart;
    property DisabledEnd: TDate read FDisabledEnd write FDisabledEnd;
    property EnabledStart: TDate read FEnabledStart write FEnabledStart;
    property EnabledEnd: TDate read FEnabledEnd write FEnabledEnd;
    // Functions
    property OnChange: TJSFPOnChange read FJSFPOnChange write FJSFPOnChange;
  end;

implementation

function TJSFlatPickr.CreateElement: TJSElement;
begin
  Result := document.createElement('DIV');

  // Boolean Defaults
  FClickOpens := True;
  FAnimate := True;
  // Integer defautls
  FDefaultHour := 12;
  FDefaultMinute := 0;
  FHourIncrement := 1;
  FMinuteIncrement := 5;
  FShowMonths := 1;
  // String Defaults
  FAltFormat := 'F j, Y';
  FAriaDateFormat := 'F j, Y';
  FDateFormat := 'Y-m-d';
  FNextArrow := '>';
  FPrevArrow := '<';
  FMode := mdSingle;
  FPosition := poAuto;
  FMonthSelectorType := msDropDown;
  // Date Defaults
  FDefaultDate := ddNow;

end;

procedure TJSFlatPickr.Loaded;
var
  elDIV: TJSElement;
  elINPUT: TJSElement;

  jsmode: String;
  jsposition: String;
  jsmonthselectortype: String;

  minYear, minMonth, minDay :Word;
  maxYear, maxMonth, maxDay :Word;
  ddStartYear, ddStartMonth, ddStartDay, ddStartHour, ddStartMin, ddStartSec, ddStartMSec: Word;
  ddEndYear, ddEndMonth, ddEndDay, ddEndHour, ddEndMin, ddEndSec, ddEndMSec: Word;

  jsdefaultdate: String;

  jsenabled: String;
  enStartYear, enStartMonth, enStartDay: Word;
  enEndYear, enEndMonth, enEndDay: Word;

  jsdisabled: String;
  disStartYear, disStartMonth, disStartDay: Word;
  disEndYear, disEndMonth, disEndDay: Word;

begin
  inherited Loaded;

  if not(FInitialized) then
  begin
    FInitialized := True;

    // Creating this structure:
    // <DIV>
    //   <INPUT>
    // </DIV>

    elDIV := document.getElementById(ElementID);
    elINPUT := document.createElement('INPUT');
    elDIV.appendChild(elINPUT);

    // Convert Mode enumerated type to string
    if      FMode = mdSingle   then jsmode := 'single'
    else if FMode = mdMultiple then jsmode := 'multiple'
    else if FMODe = mdRange    then jsmode := 'range';

    // Convert Position enumerated type to string
    if      FPosition = poAuto         then jsposition := 'auto'
    else if FPosition = poAbove        then jsposition := 'above'
    else if FPosition = poBelow        then jsposition := 'below'
    else if FPosition = poAutoLeft     then jsposition := 'auto left'
    else if FPosition = poAutoCenter   then jsposition := 'auto center'
    else if FPosition = poAutoRight    then jsposition := 'auto right'
    else if FPosition = poAboveLeft    then jsposition := 'above left'
    else if FPosition = poAboveCenter  then jsposition := 'above center'
    else if FPosition = poAboveRight   then jsposition := 'above right'
    else if FPosition = poBelowLeft    then jsposition := 'below left'
    else if FPosition = poBelowCenter  then jsposition := 'below center'
    else if FPosition = poBelowRight   then jsposition := 'below right';

    // Convert MonthSelectorType enumerated type to string
    if      FMonthSelectortype = msDropDown then jsmonthselectortype := 'dropdown'
    else if FMonthSelectorType = msStatic   then jsmonthselectortype := 'static';

    // Convert MinDate, MaxDate, DefaultStart/End into something JS can use
    DecodeDate(FMinDate, minYear, minMonth, minDay);
    DecodeDate(FMaxDate, maxYear, maxMonth, maxDay);
    DecodeDate(FDefaultDateStart, ddStartYear, ddStartMonth, ddStartDay);
    DecodeTime(FdefaultDateSTart,ddStartHour, ddStartMin, ddStartSec, ddStartMSec);
    DecodeDate(FDefaultDateEnd, ddEndYear, ddEndMonth, ddEndDay);
    DecodeTime(FdefaultDateEnd,ddEndHour, ddEndMin, DDEndSec, ddEndMsec);

    // Deal with Disabled dates
    if (FDisabledStart <> FDisabledEnd) then
    begin
      jsdisabled := 'yes';
      DecodeDate(FDisabledStart, disStartYear, disStartMonth, disStartDay);
      DecodeDate(FDisabledEnd, disEndYEar, disEndMonth, disEndDay);
    end
    else
    begin
      jsdisabled := 'no';
    end;

    // Deal with Enaabled dates
    if (FEnabledStart <> FEnabledEnd) then
    begin
      jsenabled := 'yes';
      DecodeDate(FEnabledStart, enStartYear, enStartMonth, enStartDay);
      DecodeDate(FEnabledEnd, enEndYEar, enEndMonth, enEndDay);
    end
    else
    begin
      jsenabled := 'no';
    end;

    // Convert defaultDate enumerated type to string
    if      FDefaultDate = ddNow    then jsdefaultdate := 'now'
    else if FDefaultDate = ddToday  then jsdefaultdate := 'today'
    else if FDefaultDate = ddCustom then jsdefaultDate := 'custom';


    // Attaching FlatPickr to the INPUT element
    // Setting Object Properties as assigned in the IDE
    asm
      var fpAppendTo = document.getElementById(this.FAppendTo);
      var fpPositionElement = document.getElementById(this.FPositionElement);
      var mindate = new Date(minYear, minMonth-1, minDay, 0, 0, 0, 0);
      var maxdate = new Date(maxYear, maxMonth-1, maxDay, 0, 0, 0, 0);
      var defaultDateStart = new Date(ddStartYear, ddStartMonth-1, ddStartDay, ddStartHour, ddStartMin, ddStartSec, ddStartMSec);
      var defaultDateEnd = new Date(ddEndYear, ddEndMonth-1, ddEndDay, ddEndHour, ddEndMin, ddEndSec, ddEndMSec);
      var defaultnow = new Date;
      var disStart = new Date(disStartYear, disStartMonth-1, disStartDay, 0, 0, 0, 0);
      var disEnd = new Date(disEndYear, disEndMonth-1, disEndDay, 0, 0, 0, 0);
      var enStart = new Date(enStartYear, enStartMonth-1, enStartDay, 0, 0, 0, 0);
      var enEnd = new Date(enEndYear, enEndMonth-1, enEndDay, 0, 0, 0, 0);
      var onchanged = this.FlatPickrChanged;
      var fp = this;

      flatpickr(elINPUT, {
        // Boolean Properties
        altInput: this.FAltInput,
        allowInput: this.FAllowInput,
        allowInvalidPreload: this.FAllowInvalidPreload,
        animate: this.FAnimate,
        clickOpens: this.FClickOpens,
        disableMobile: this.FDisableMobile,
        enableSeconds: this.FEnableSeconds,
        enableTime: this.FEnableTime,
        inline: this.FCalendarInline,
        noCalendar: this.FNoCalendar,
        shorthandCurrentMonth: this.FShortHandCurrentMonth,
        static: this.FCalendarStatic,
        time_24hr: this.FTime_24hr,
        weekNumbers: this.FWeekNumbers,
        wrap: this.FWrap,

        // Integer Properties
        defaultHour: this.FDefaultHour,
        defaultMinute: this.FDefaultMinute,
        hourIncrement: this.FHourIncrement,
        minuteIncrement: this.FMinuteIncrement,
        showMonths: this.FShowMonths,

        // String Properties
        altFormat: this.FAltFormat,
        altInputClass: this.FAltInputClass,
        ariaDateFormat: this.FAriaDateFormat,
        conjunction: this.FConjunction,
        dateFormat: this.FDateFormat,
        nextArrow: this.FNextArrow,
        prevArrow: this.FPrevArrow,
        ...(!(fpAppendTo === null) && {appendTo: fpAppendTo}),
        ...(!(fpPositionElement === null) && {positionElement: fpPositionElement}),
        mode: jsmode,
        position: jsposition,
        monthSelectorType: jsmonthselectortype,

        // Date Properties
        minDate: mindate,
        maxDate: maxdate,
        ...((jsdefaultdate == 'now') && {defaultDate: defaultnow}),
        ...((jsdefaultdate == 'today') && {defaultDate: defaultnow}),
        ...((jsdefaultdate == 'custom') && {defaultDate: [defaultDateStart, defaultDateEnd]}),
        ...((jsdisabled == 'yes') && {disable: [{from: disStart, to: disEnd}]}),
        ...((jsenabled == 'yes') && {enable: [{from: enStart, to: enEnd}]}),

        // Functions:
        onChange: function(selectedDates, dateStr, instance) {
          var d = new Date;
          onchanged(fp, selectedDates, dateStr, instance, d.getTimezoneOffset());
        }
      })

    end;

  end;
end;

procedure TJSFlatPickr.FlatPickrChanged(fp:TJSFlatPickr; selectedDates: Array of Integer; dateStr: String; instance: JSValue; tzo: integer);
//var
//  i: Integer;
begin
//  console.log('selectedDates: '+IntToStr(Length(selectedDates)));
//  i := 0;
//  while i < Length(selectedDates) do
//  begin
//    console.log(intToStr(i)+': '+FormatDateTime('yyyy-mm-dd hh:nn:ss', IncMinute(UnixToDateTime(Trunc(selectedDates[i]/1000)),-tzo)));
//    i := i + 1;
//  end;
//  console.log('dateStr: '+DateStr);
  if fp.fCalendarInline then console.log('yes');


  if Assigned(fp.FJSFPOnChange) then fp.FJSFPOnChange(selectedDates, datestr, tzo);

end;

end.
