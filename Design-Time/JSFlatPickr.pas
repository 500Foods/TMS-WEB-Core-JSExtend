unit JSFlatPickr;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, WEBLib.Controls, DesignIntf;

type
  TJSFPmode = (mdSingle, mdMultiple, mdRange);
  TJSFPposition = (poAuto, poAbove, poBelow, poAutoLeft, poAutoCenter, poAutoRight, poAboveLeft, poAboveCenter, poAboveRight, poBelowLeft, poBelowCenter, poBelowRight);
  TJSFPmonthselectortype = (msDropDown, msStatic);
  TJSFPdefaultdate = (ddNow, ddToday, ddCustom);
  TJSFPOnChange = procedure(selectedDates: array of Integer;  dateStr: String; tzo: Integer) of object;
  JSValue = Variant;

  [ComponentPlatforms(TMSWebPlatform)]
  TJSFlatPickr = class(TWebCustomControl)
  private
    { Private declarations }
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
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure FlatPickrChanged(selectedDates: Array of Integer; dateStr: String; instance: JSValue; tzo: integer);
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

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('JSExtend', [TJSFlatPickr]);
  RegisterPropertiesInCategory('FlatPickr', TJSFlatPickr, ['AltInput','AllowInput','AllowinvalidPreload','Animate','ClickOpens','DisableMobile','EnableSeconds','EnableTime','CalendarInline','NoCalendar','ShortHandCurrentMonth','CalendarStatic','Time_24hr','WeekNumbers','Wrap']);
  RegisterPropertiesInCategory('FlatPickr', TJSFlatPickr, ['DefaultHour','DefaultMinute','HourIncrement','MinuteIncrement','ShowMonths']);
  RegisterPropertiesInCategory('FlatPickr', TJSFlatPickr, ['AltFormat','AltInputClass','AriaDateFormat','Conjunction','DateFormat','NextArrow','PrevArrow','AppendTo','PositionElement']);
  RegisterPropertiesInCategory('FlatPickr', TJSFlatPickr, ['Mode','Position','MonthSelectorType','MinDate','MaxDate','DefaultDate','DefaultDateStart','DefaultDateEnd','DisabledStart','DisabledEnd','EnabledStart','EnabledEnd']);
end;

constructor TJSFlatPickr.Create(AOwner: TComponent);
begin
  inherited;
  Width := 200;
  Height := 30;

  // Boolean Defaults
  Animate := True;
  ClickOpens := True;
  // Integer Defautlts
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

procedure TJSFlatPickr.FlatPickrChanged(selectedDates: Array of integer; dateStr: String; instance: JSValue; tzo: integer);
begin
 //
end;

end.
