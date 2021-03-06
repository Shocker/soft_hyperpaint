{
  $Project$
  $Workfile$
  $Revision$
  $DateUTC$
  $Id$

  This file is part of the Indy (Internet Direct) project, and is offered
  under the dual-licensing agreement described on the Indy website.
  (http://www.indyproject.org/)

  Copyright:
   (c) 1993-2005, Chad Z. Hower and the Indy Pit Crew. All rights reserved.
}
{
  $Log$
}
{
  Rev 1.54    2/9/2005 8:45:38 PM  JPMugaas
  Should work.

  Rev 1.53    2/8/05 6:37:38 PM  RLebeau
  Added default value to ASize parameter of ReadStringFromStream()

  Rev 1.52    2/8/05 5:57:10 PM  RLebeau
  added AppendString(), CopyTIdLongWord(), and CopyTIdString() functions

  Rev 1.51    1/31/05 6:01:40 PM  RLebeau
  Renamed GetCurrentThreadHandle() to CurrentThreadId() and changed the return
  type from THandle to to TIdPID.

  Reworked conditionals for SetThreadName() and updated the implementation to
  support naming threads under DotNet.

  Rev 1.50    1/27/05 3:40:04 PM  RLebeau
  Updated BytesToShort() to actually use the AIndex parameter that was added
  earlier.

  Rev 1.49    1/24/2005 7:35:36 PM  JPMugaas
  Foxed ma,e om CopyTIdIPV6Address/

  Rev 1.48    1/17/2005 7:26:44 PM  JPMugaas
  Made an IPv6 address byte copy function.

  Rev 1.47    1/15/2005 6:01:38 PM  JPMugaas
  Removed some new procedures for extracting  int values from a TIdBytes and
  made some other procedures have an optional index paramter.

  Rev 1.46    1/13/05 11:11:20 AM  RLebeau
  Changed BytesToRaw() to pass TIdBytes by 'const' rather than by 'var'

  Rev 1.45    1/8/2005 3:56:58 PM  JPMugaas
  Added routiens for copying integer values to and from TIdBytes.  These are
  useful for some protocols.

  Rev 1.44    24/11/2004 16:26:24  ANeillans
  GetTickCount corrected, as per Paul Cooper's post in
  atozedsoftware.indy.general.

  Rev 1.43    11/13/04 10:47:28 PM  RLebeau
  Fixed compiler errors

  Rev 1.42    11/12/04 1:02:42 PM  RLebeau
  Added RawToBytesF() and BytesToRaw() functions

  Added asserts to BytesTo...() functions

  Rev 1.41    10/26/2004 8:20:02 PM  JPMugaas
  Fixed some oversights with conversion.  OOPS!!!

  Rev 1.40    10/26/2004 8:00:54 PM  JPMugaas
  Now uses TIdStrings for DotNET portability.

  Rev 1.39    2004.10.26 7:35:16 PM  czhower
  Moved IndyCat to CType in IdBaseComponent

  Rev 1.38    24/10/2004 21:29:52  ANeillans
  Corrected error in GetTickCount,
  was Result := Trunc(nTime / (Freq * 1000))
  should be Result := Trunc((nTime / Freq) * 1000)

  Rev 1.37    20/10/2004 01:08:20  CCostelloe
  Bug fix

  Rev 1.36    28.09.2004 20:36:58  Andreas Hausladen
  Works now with Delphi 5

    Rev 1.35    9/23/2004 11:36:04 PM  DSiders
  Modified Ticks function (Win32) to correct RangeOverflow error.  (Reported by
  Mike Potter)

  Rev 1.34    24.09.2004 02:16:04  Andreas Hausladen
  Added ReadTIdBytesFromStream and ReadCharFromStream function to supress .NET
  warnings.

  Rev 1.33    9/5/2004 2:55:00 AM  JPMugaas
  function BytesToWord(const AValue: TIdBytes): Word; was not listed in the
  interface.

  Rev 1.32    04.09.2004 17:12:56  Andreas Hausladen
  New PosIdx function (without pointers)

  Rev 1.31    27.08.2004 22:02:20  Andreas Hausladen
  Speed optimization ("const" for string parameters)
  rewritten PosIdx function with AStartPos = 0 handling
  new ToArrayF() functions (faster in native code because the TIdBytes array
  must have the required len before the ToArrayF function is called)

  Rev 1.30    24.08.2004 19:48:28  Andreas Hausladen
  Some optimizations
  Removed IFDEF for IdDelete and IdInsert

  Rev 1.29    8/17/2004 2:54:08 PM  JPMugaas
  Fix compiler warning about widening operends.  Int64 can sometimes incur a
  performance penalty.

  Rev 1.28    8/15/04 5:57:06 PM  RLebeau
  Tweaks to PosIdx()

  Rev 1.27    7/23/04 10:13:16 PM  RLebeau
  Updated ReadStringFromStream() to resize the result using the actual number
  of bytes read from the stream

    Rev 1.26    7/18/2004 2:45:38 PM  DSiders
  Added localization comments.

  Rev 1.25    7/9/04 4:25:20 PM  RLebeau
  Renamed ToBytes(raw) to RawToBytes() to fix an ambiquity error with
  ToBytes(TIdBytes)

  Rev 1.24    7/9/04 4:07:06 PM  RLebeau
  Compiler fix for TIdBaseStream.Write()

  Rev 1.23    09/07/2004 22:17:52  ANeillans
  Fixed IdGlobal.pas(761) Error: ';', ')' or '=' expected but ':=' found

  Rev 1.22    7/8/04 11:56:10 PM  RLebeau
  Added additional parameters to BytesToString()

  Bug fix for ReadStringFromStream()

  Updated TIdBaseStream.Write() to use ToBytes()

  Rev 1.21    7/8/04 4:22:36 PM  RLebeau
  Added ToBytes() overload for raw pointers under non-DotNet platfoms.

  Rev 1.20    2004.07.03 19:39:38  czhower
  UTF8

  Rev 1.19    6/15/2004 7:18:06 PM  JPMugaas
  IdInsert for stuff needing to call the Insert procedure.

  Rev 1.18    2004.06.13 8:06:46 PM  czhower
  .NET update

    Rev 1.17    6/11/2004 8:28:30 AM  DSiders
  Added "Do not Localize" comments.

  Rev 1.16    2004.06.08 7:11:14 PM  czhower
  Typo fix.

  Rev 1.15    2004.06.08 6:34:48 PM  czhower
  .NET bug with Ticks workaround.

  Rev 1.14    07/06/2004 21:30:32  CCostelloe
  Kylix 3 changes

  Rev 1.13    5/3/04 12:17:44 PM  RLebeau
  Updated ToBytes(string) and BytesToString() under DotNet to use
  System.Text.Encoding.ASCII instead of AnsiEncoding

  Rev 1.12    4/24/04 12:41:36 PM  RLebeau
  Conversion support to/from TIdBytes for Char values

  Rev 1.11    4/18/04 2:45:14 PM  RLebeau
  Conversion support to/from TIdBytes for Int64 values

  Rev 1.10    2004.04.08 4:50:06 PM  czhower
  Comments

  Rev 1.9    2004.04.08 1:45:42 AM  czhower
  tiny string optimization

  Rev 1.8    4/7/2004 3:20:50 PM  JPMugaas
  PosIdx was not working in DotNET.  In DotNET, it was returning a Pos value
  without adding the startvalue -1.  It was throwing off the FTP list parsers.

  Two uneeded IFDEF's were removed.

  Rev 1.7    2004.03.13 5:51:28 PM  czhower
  Fixed stack overflow in Sleep for .net

  Rev 1.6    3/6/2004 5:16:02 PM  JPMugaas
  Bug 67 fixes.  Do not write to const values.

  Rev 1.5    3/6/2004 4:54:12 PM  JPMugaas
  Write to const bug fix.

  Rev 1.4    2/17/2004 12:02:44 AM  JPMugaas
  A few routines that might be needed later for RFC 3490 support.

  Rev 1.3    2/16/2004 1:56:04 PM  JPMugaas
  Moved some routines here to lay the groundwork for RFC 3490 support.  Started
  work on RFC 3490 support.

  Rev 1.2    2/11/2004 5:12:30 AM  JPMugaas
  Moved IPv6 address definition here.

  I also made a function for converting a TIdBytes to an IPv6 address.

  Rev 1.1    2004.02.03 3:15:52 PM  czhower
  Updates to move to System.

  Rev 1.0    2004.02.03 2:28:30 PM  czhower
  Move

  Rev 1.91    2/1/2004 11:16:04 PM  BGooijen
  ToBytes

  Rev 1.90    2/1/2004 1:28:46 AM  JPMugaas
  Disabled IdPort functionality in DotNET.  It can't work there in it's current
  form and trying to get it to work will introduce more problems than it
  solves.  It was only used by the bindings editor and we did something
  different in DotNET so IdPorts wouldn't used there.

  Rev 1.89    2004.01.31 1:51:10 AM  czhower
  IndyCast for VB.

  Rev 1.88    30/1/2004 4:47:46 PM  SGrobety
  Added "WriteMemoryStreamToStream" to take care of Win32/dotnet difference in
  the TMemoryStream.Memory type and the Write buffer parameter

  Rev 1.87    1/30/2004 11:59:24 AM  BGooijen
  Added WriteTIdBytesToStream, because we can convert almost everything to
  TIdBytes, and TIdBytes couldn't be written to streams easily

  Rev 1.86    2004.01.27 11:44:36 PM  czhower
  .Net Updates

  Rev 1.85    2004.01.27 8:15:54 PM  czhower
  Fixed compile error + .net helper.

  Rev 1.84    27/1/2004 1:55:10 PM  SGrobety
  TIdStringStream introduced to fix a bug in DOTNET TStringStream
  implementation.

  Rev 1.83    2004.01.27 1:42:00 AM  czhower
  Added parameter check

  Rev 1.82    25/01/2004 21:55:40  CCostelloe
  Added portable IdFromBeginning/FromCurrent/FromEnd, to be used instead of
  soFromBeginning/soBeginning, etc.

  Rev 1.81    24/01/2004 20:18:46  CCostelloe
  Added IndyCompareStr (to be used in place of AnsiCompareStr for .NET
  compatibility)

  Rev 1.80    2004.01.23 9:56:30 PM  czhower
  CharIsInSet now checks length and returns false if no character.

  Rev 1.79    2004.01.23 9:49:40 PM  czhower
  CharInSet no longer accepts -1, was unneeded and redundant.

  Rev 1.78    1/22/2004 5:47:46 PM  SPerry
  fixed CharIsInSet

  Rev 1.77    2004.01.22 5:33:46 PM  czhower
  TIdCriticalSection

  Rev 1.76    2004.01.22 3:23:18 PM  czhower
  IsCharInSet

  Rev 1.75    2004.01.22 2:00:14 PM  czhower
  iif change

  Rev 1.74    14/01/2004 00:17:34  CCostelloe
  Added IndyLowerCase/IndyUpperCase to replace AnsiLowerCase/AnsiUpperCase for
  .NET code

  Rev 1.73    1/11/2004 9:50:54 PM  BGooijen
  Added ToBytes function for Socks

  Rev 1.72    2003.12.31 7:32:40 PM  czhower
  InMainThread now for .net too.

  Rev 1.71    2003.12.29 6:48:38 PM  czhower
  TextIsSame

  Rev 1.70    2003.12.28 1:11:04 PM  czhower
  Conditional typo fixed.

  Rev 1.69    2003.12.28 1:05:48 PM  czhower
  .Net changes.

  Rev 1.68    5/12/2003 9:11:00 AM  GGrieve
  Add WriteStringToStream

  Rev 1.67    5/12/2003 12:32:48 AM  GGrieve
  fix DotNet warnings

  Rev 1.66    22/11/2003 12:03:02 AM  GGrieve
  fix IdMultiPathFormData.pas implementation

  Rev 1.65    11/15/2003 1:15:36 PM  VVassiliev
  Move AppendByte from IdDNSCommon to IdCoreGlobal

  Rev 1.64    10/28/2003 8:43:48 PM  BGooijen
  compiles, and removed call to setstring

  Rev 1.63    2003.10.24 10:44:50 AM  czhower
  IdStream implementation, bug fixes.

  Rev 1.62    10/18/2003 4:53:18 PM  BGooijen
  Added ToHex

  Rev 1.61    2003.10.17 6:17:24 PM  czhower
  Some parts moved to stream

    Rev 1.60    10/15/2003 8:28:16 PM  DSiders
  Added localization comments.

  Rev 1.59    2003.10.14 9:27:12 PM  czhower
  Fixed compile erorr with missing )

  Rev 1.58    10/14/2003 3:31:04 PM  SPerry
  Modified ByteToHex() and IPv4ToHex

  Rev 1.57    10/13/2003 5:06:46 PM  BGooijen
  Removed local constant IdOctalDigits in favor of the unit constant. - attempt
  2

    Rev 1.56    10/13/2003 10:07:12 AM  DSiders
  Reverted prior change; local constant for IdOctalDigits is restored.

    Rev 1.55    10/12/2003 11:55:42 AM  DSiders
  Removed local constant IdOctalDigits in favor of the unit constant.

  Rev 1.54    2003.10.11 5:47:22 PM  czhower
  -VCL fixes for servers
  -Chain suport for servers (Super core)
  -Scheduler upgrades
  -Full yarn support

  Rev 1.53    10/8/2003 10:14:34 PM  GGrieve
  add WriteStringToStream

  Rev 1.52    10/8/2003 9:55:30 PM  GGrieve
  Add IdDelete

  Rev 1.51    10/7/2003 11:33:30 PM  GGrieve
  Fix ReadStringFromStream

  Rev 1.50    10/7/2003 10:07:30 PM  GGrieve
  Get IdHTTP compiling for DotNet

  Rev 1.49    6/10/2003 5:48:48 PM  SGrobety
  DotNet updates

  Rev 1.48    10/5/2003 12:26:46 PM  BGooijen
  changed parameter names at some places

  Rev 1.47    10/4/2003 7:08:26 PM  BGooijen
  added some conversion routines type->TIdBytes->type, and fixed existing ones

  Rev 1.46    10/4/2003 3:53:40 PM  BGooijen
  added some ToBytes functions

  Rev 1.45    04/10/2003 13:38:28  HHariri
  Write(Integer) support

  Rev 1.44    10/3/2003 10:44:54 PM  BGooijen
  Added WriteBytesToStream

  Rev 1.43    2003.10.02 8:29:14 PM  czhower
  Changed names of byte conversion routines to be more readily understood and
  not to conflict with already in use ones.

  Rev 1.42    10/2/2003 5:15:16 PM  BGooijen
  Added Grahame's functions

  Rev 1.41    10/1/2003 8:02:20 PM  BGooijen
  Removed some ifdefs and improved code

  Rev 1.40    2003.10.01 9:10:58 PM  czhower
  .Net

  Rev 1.39    2003.10.01 2:46:36 PM  czhower
  .Net

  Rev 1.38    2003.10.01 2:30:36 PM  czhower
  .Net

  Rev 1.37    2003.10.01 12:30:02 PM  czhower
  .Net

  Rev 1.35    2003.10.01 1:12:32 AM  czhower
  .Net

  Rev 1.34    2003.09.30 7:37:14 PM  czhower
  Typo fix.

  Rev 1.33    30/9/2003 3:58:08 PM  SGrobety
  More .net updates

  Rev 1.31    2003.09.30 3:19:30 PM  czhower
  Updates for .net

  Rev 1.30    2003.09.30 1:22:54 PM  czhower
  Stack split for DotNet

  Rev 1.29    2003.09.30 12:09:36 PM  czhower
  DotNet changes.

  Rev 1.28    2003.09.30 10:36:02 AM  czhower
  Moved stack creation to IdStack
  Added DotNet stack.

  Rev 1.27    9/29/2003 03:03:28 PM  JPMugaas
  Changed CIL to DOTNET.

  Rev 1.26    9/28/2003 04:22:00 PM  JPMugaas
  IFDEF'ed out MemoryPos in NET because that will not work there.

  Rev 1.25    9/26/03 11:20:50 AM  RLebeau
  Updated defines used with SetThreadName() to allow it to work under BCB6.

  Rev 1.24    9/24/2003 11:42:42 PM  JPMugaas
  Minor changes to help compile under NET

  Rev 1.23    2003.09.20 10:25:42 AM  czhower
  Added comment and chaned for D6 compat.

  Rev 1.22    9/18/2003 07:43:12 PM  JPMugaas
  Moved GetThreadHandle to IdGlobals so the ThreadComponent can be in this
  package.

  Rev 1.21    9/8/2003 11:44:38 AM  JPMugaas
  Fix for problem that was introduced in an optimization.

  Rev 1.20    2003.08.19 1:54:34 PM  czhower
  Removed warning

  Rev 1.19    11/8/2003 6:25:44 PM  SGrobety
  IPv4ToDWord: Added overflow checking disabling ($Q+) and changed "* 256"  by
  "SHL 8".

  Rev 1.18    2003.07.08 2:41:42 PM  czhower
  This time I saved the file before checking in.

  Rev 1.16    7/1/2003 03:39:38 PM  JPMugaas
  Started numeric IP function API calls for more efficiency.

  Rev 1.15    2003.07.01 3:49:56 PM  czhower
  Added SetThreadName

    Rev 1.14    7/1/2003 12:03:56 AM  BGooijen
  Added functions to switch between IPv6 addresses in string and in
  TIdIPv6Address form

  Rev 1.13    6/30/2003 06:33:58 AM  JPMugaas
  Fix for range check error.

  Rev 1.12    6/27/2003 04:43:30 PM  JPMugaas
  Made IPv4ToDWord overload that returns a flag for an error message.
  Moved MakeCanonicalIPv4Address code into IPv4ToDWord because most of that
  simply reduces IPv4 addresses into a DWord.  That also should make the
  function more useful in reducing various alternative forms of IPv4 addresses
  down to DWords.

  Rev 1.11    6/27/2003 01:19:38 PM  JPMugaas
  Added MakeCanonicalIPv4Address for converting various IPv4 address forms
  (mentioned at http://www.pc-help.org/obscure.htm) into a standard dotted IP
  address.  Hopefully, we should soon support octal and hexidecimal addresses.

  Rev 1.9    6/27/2003 04:36:08 AM  JPMugaas
  Function for converting DWord to IP adcdress.

  Rev 1.8    6/26/2003 07:54:38 PM  JPMugaas
  Routines for converting standard dotted IPv4 addresses into dword,
  hexidecimal, and octal forms.

    Rev 1.7    5/11/2003 11:57:06 AM  BGooijen
  Added RaiseLastOSError

  Rev 1.6    4/28/2003 03:19:00 PM  JPMugaas
  Made a function for obtaining the services file FQN.  That's in case
  something else besides IdPorts needs it.

  Rev 1.5    2003.04.16 10:06:42 PM  czhower
  Moved DebugOutput to IdCoreGlobal

  Rev 1.4    12/29/2002 2:15:30 PM  JPMugaas
  GetCurrentThreadHandle function created as per Bas's instructions.  Moved
  THandle to IdCoreGlobal for this function.

  Rev 1.3    12-15-2002 17:02:58  BGooijen
  Added comments to TIdExtList

  Rev 1.2    12-15-2002 16:45:42  BGooijen
  Added TIdList

  Rev 1.1    29/11/2002 10:08:50 AM  SGrobety    Version: 1.1
  Changed GetTickCount to use high-performance timer if available under windows

  Rev 1.0    21/11/2002 12:36:18 PM  SGrobety    Version: Indy 10

  Rev 1.0    11/13/2002 08:41:24 AM  JPMugaas
}

unit IdGlobal;

interface

{$I IdCompilerDefines.inc}

uses
  SysUtils,
  {$IFDEF DOTNET}
  System.Collections.Specialized,
  System.net,
  System.net.Sockets,
  System.Diagnostics,
  System.Threading,
  System.IO,
  System.Text,
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  Windows,
  {$ENDIF}
  Classes,
  SyncObjs,
  {$IFDEF UNIX}
    {$IFDEF KYLIX}
    Libc,
    {$ELSE}
      DynLibs, // better add DynLibs only for fpc 
      {$IFDEF KYLIXCOMPAT}
      Libc,
      {$ENDIF}
      {$IFDEF UseBaseUnix}
      BaseUnix, Unix, Sockets, UnixType,
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  IdException;

const
  {This is the only unit with references to OS specific units and IFDEFs. NO OTHER units
  are permitted to do so except .pas files which are counterparts to dfm/xfm files, and only for
  support of that.}

  //We make the version things an Inc so that they can be managed independantly
  //by the package builder.
  {$I IdVers.inc}

  {$IFNDEF DOTNET}
    {$IFNDEF VCL11ORABOVE}
  HoursPerDay   = 24;
  MinsPerHour   = 60;
  SecsPerMin    = 60;
  MSecsPerSec   = 1000;
  MinsPerDay    = HoursPerDay * MinsPerHour;
  SecsPerDay    = MinsPerDay * SecsPerMin;
  MSecsPerDay   = SecsPerDay * MSecsPerSec;
  {$ENDIF}
  {$ENDIF}

  {$IFDEF DOTNET}
  // Timeout.Infinite is -1 which violates Cardinal which VCL uses for parameter
  // so we are just setting it to this as a hard coded constant until
  // the synchro classes and other are all ported directly to portable classes
  // (SyncObjs is platform specific)
  //Infinite = Timeout.Infinite;
  INFINITE = LongWord($FFFFFFFF);     { Infinite timeout }
  {$ENDIF}

  {$IFDEF KYLIX}
  NilHandle = 0;
  {$ENDIF}

  LF = #10;
  CR = #13;
  EOL = CR + LF;
  //
  CHAR0 = #0;
  BACKSPACE = #8;

  TAB = #9;
  CHAR32 = #32;

  //Timeout values
  IdTimeoutDefault = -1;
  IdTimeoutInfinite = -2;
  //Fetch Defaults
  IdFetchDelimDefault = ' ';    {Do not Localize}
  IdFetchDeleteDefault = True;
  IdFetchCaseSensitiveDefault = True;

  WhiteSpace = [0..12, 14..32]; {do not localize}

  IdHexDigits: array [0..15] of AnsiChar = ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'); {do not localize}
  IdOctalDigits: array [0..7] of AnsiChar = ('0','1','2','3','4','5','6','7'); {do not localize}
  HEXPREFIX = '0x';  {Do not translate}

type
  //thread and PID stuff
  {$IFDEF DOTNET}
  TIdPID = LongWord;
  TIdThreadId = LongWord;
  TIdThreadHandle = System.Threading.Thread;
    {$IFDEF DOTNETDISTRO}
  TIdThreadPriority = System.Threading.ThreadPriority;
    {$ELSE}
  TIdThreadPriority = TThreadPriority;
    {$ENDIF}
  {$ENDIF}
  {$IFDEF UNIX}
    {$IFDEF KYLIXCOMPAT}
  TIdPID = LongInt;
  TIdThreadId = LongInt;
      {$IFDEF FPC}
  TIdThreadHandle = TThreadID;
      {$ELSE}
  TIdThreadHandle = Cardinal;
      {$ENDIF}
      {$IFDEF INTTHREADPRIORITY}
  TIdThreadPriority = -20..19;
      {$ELSE}
  TIdThreadPriority = TThreadPriority;
      {$ENDIF}
    {$ENDIF}
    {$IFDEF USEBASEUNIX}
  TIdPID = TPid;
  TIdThreadId = TThreadId;
  TIdThreadHandle = TIdThreadId;
  TIdThreadPriority = TThreadPriority;
    {$ENDIF}
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  TIdPID = LongWord;
  TIdThreadId = LongWord;
  TIdThreadHandle = THandle;
  TIdThreadPriority = TThreadPriority;
  {$ENDIF}

  {$IFDEF INTTHREADPRIORITY}
const  
  // approximate values, its finer grained on Linux
  tpIdle = 19;
  tpLowest = 12;
  tpLower = 6;
  tpNormal = 0;
  tpHigher = -7;
  tpHighest = -13;
  tpTimeCritical = -20;
  {$ENDIF}
  {CH tpIdLowest = tpLowest; }
  {CH tpIdBelowNormal = tpLower; }
  {CH tpIdNormal = tpNormal; }
  {CH tpIdAboveNormal = tpHigher; }
  {CH tpIdHighest = tpHighest; }
  //end thread stuff

const
  //leave this as zero.  It's significant in many socket calls that specify ports
  DEF_PORT_ANY = 0;

type
  {$IFNDEF DOTNET}
    {$IFNDEF FPC}
      //needed so that in FreePascal, we can use pointers of different sizes
      {$IFDEF WIN32}
   PtrInt  = LongInt;
   PtrUInt = LongWord;
      {$ENDIF}
      {$IFDEF WIN64}
   PtrInt  = Int64;
   PtrUInt = Int64;
      {$ENDIF}
//NOTE:  The code below asumes a 32bit Linux architecture (such as target i386-linux)
      {$IFDEF KYLIX}
   PtrInt  = LongInt;
   PtrUInt = LongWord;
      {$ENDIF}
     {$ENDIF}
  {$ENDIF}

  TIdEncoding = (enDefault, en7Bit, enUTF8, en8Bit);

  TIdAppendFileStream = class(TFileStream)
  public
    constructor Create(const AFile : String);
  end;

  TIdReadFileExclusiveStream = class(TFileStream)
  public
    constructor Create(const AFile : String);
  end;

  TIdReadFileNonExclusiveStream = class(TFileStream)
  public
    constructor Create(const AFile : String);
  end;

  TIdFileCreateStream = class(TFileStream)
  public
    constructor Create(const AFile : String);
  end;

  {$IFDEF DOTNET}
    {$IFNDEF DOTNET2}
  // dotNET implementation
  TWaitResult = (wrSignaled, wrTimeout, wrAbandoned, wrError);

  TEvent = class(TObject)
  protected
    FEvent: WaitHandle;
  public
    constructor Create(EventAttributes: IntPtr; ManualReset,
      InitialState: Boolean; const Name: string = ''); overload;
    constructor Create; overload;
    destructor Destroy; override;
    procedure SetEvent;
    procedure ResetEvent;
    function WaitFor(Timeout: LongWord): TWaitResult; virtual;
  end;

  TCriticalSection = class(TObject)
  public
    procedure Acquire; virtual;
    procedure Release; virtual;
    function TryEnter: Boolean;
    procedure Enter;
    procedure Leave;
  end;
    {$ENDIF}
  {$ELSE}
    {$IFNDEF NOREDECLARE}
 // TCriticalSection = SyncObjs.TCriticalSection;
    {$ENDIF}
  {$ENDIF}

  TIdLocalEvent = class(TEvent)
  public
    constructor Create(const AInitialState: Boolean = False;
     const AManualReset: Boolean = False); reintroduce;
    function WaitForEver: TWaitResult; overload;
  end;

  // This is here to reduce all the warnings about imports. We may also ifdef
  // it to provide a non warning implementatino on this unit too later.
  TIdCriticalSection = class(TCriticalSection)
  end;

  {$IFDEF DOTNET}
  Short = System.Int16;
  {$ENDIF}
  {$IFDEF UNIX}
  Short = Smallint;  //Only needed for ToBytes(Short) and BytesToShort
  {$ENDIF}
  {$IFNDEF DOTNET}
    {$IFNDEF NOREDECLARE}
  PShort = ^Short;
    {$ENDIF}
  {$ENDIF}

  {$IFDEF VCL4ORABOVE}
    {$IFNDEF VCL6ORABOVE} // Delphi 6 has PCardinal
  PCardinal = ^Cardinal;
    {$ENDIF}
  {$ENDIF}

  //This usually is a property editor exception
  EIdCorruptServicesFile = class(EIdException);
  EIdEndOfStream = class(EIdException);
  EIdInvalidIPv6Address = class(EIdException);

  //This is called whenever there is a failure to retreive the time zone information
  EIdFailedToRetreiveTimeZoneInfo = class(EIdException);

  TIdBytes = array of Byte;
  TIdPort = Word;
  //We don't have a native type that can hold an IPv6 address.
  TIdIPv6Address = array [0..7] of word;

  // C++ does not allow an array to be returned by a function,
  // so wrapping the array in a struct as a workaround...
  (*$HPPEMIT 'namespace Idglobal'*)
  (*$HPPEMIT '{'*)
  (*$HPPEMIT '    struct TIdIPv6Address'*)
  (*$HPPEMIT '    {'*)
  (*$HPPEMIT '        Word data[8];'*)
  (*$HPPEMIT '        Word& operator[](int index) { return data[index]; }'*)
  (*$HPPEMIT '        const Word& operator[](int index) const { return data[index]; }'*)
  (*$HPPEMIT '        operator const Word*() const { return data; }'*)
  (*$HPPEMIT '        operator Word*() { return data; }'*)
  (*$HPPEMIT '    };'*)
  (*$HPPEMIT '}'*)
  {$NODEFINE TIdIPv6Address}

  {This way instead of a boolean for future expansion of other actions}
  TIdMaxLineAction = (maException, maSplit);
  TIdOSType = (otUnknown, otUnix, otWindows, otDotNet);
  //This is for IPv6 support when merged into the core
  TIdIPVersion = (Id_IPv4, Id_IPv6);

  {$IFNDEF NOREDECLARE}
    {$IFDEF LINUX}
      {$IFNDEF VCL6ORABOVE}
  THandle = LongWord; //D6.System
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  {$IFDEF DOTNET}
  THandle = Integer;
  {$ELSE}
    {$IFDEF WIN32_OR_WIN64_OR_WINCE}
//  THandle = Windows.THandle;
     {$ENDIF}
  {$ENDIF}

  TPosProc = function(const substr, str: {$IFDEF DOTNET}WideString{$ELSE}String{$ENDIF}): LongInt;
  TIdReuseSocket = (rsOSDependent, rsTrue, rsFalse);

  {$IFNDEF VCL6ORABOVE}
  TIdExtList = class(TList) // We use this hack-class, because TList has no .assign on Delphi 5.
  public                      // Do NOT add DataMembers to this class !!!
    procedure Assign(AList: TList);
  end;
  {$ELSE}
  TIdExtList = class(TList);
  {$ENDIF}

  {$IFNDEF SIZE64STREAM}
  type
    TSeekOrigin = (soBeginning, soCurrent, soEnd);
  {$ENDIF}

  // TIdBaseStream is defined here to allow TIdMultiPartFormData to be defined
  // without any $IFDEFs in the unit IdMultiPartFormData - in accordance with Indy Coding rules
  TIdBaseStream = class(TStream)
  protected
    function IdRead(var VBuffer: TIdBytes; AOffset, ACount: Longint): Longint; virtual; abstract;
    function IdWrite(const ABuffer: TIdBytes; AOffset, ACount: Longint): Longint; virtual; abstract;
    function IdSeek(const AOffset: Int64; AOrigin: TSeekOrigin): Int64; virtual; abstract;
    procedure IdSetSize(ASize: Int64); virtual; abstract;
    {$IFDEF DOTNET}
    procedure SetSize(ASize: Int64); override;
    {$ELSE}
      {$IFDEF SIZE64STREAM}
    procedure SetSize(const NewSize: Int64); override;
      {$ELSE}
    procedure SetSize(ASize: Integer); override;
      {$ENDIF}
    {$ENDIF}
  public
    {$IFDEF DOTNET}
    function Read(var VBuffer: array of Byte; AOffset, ACount: Longint): Longint; override;
    function Write(const ABuffer: array of Byte; AOffset, ACount: Longint): Longint; override;
    function Seek(const AOffset: Int64; AOrigin: TSeekOrigin): Int64; override;
    {$ELSE}
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
      {$IFDEF SIZE64STREAM}
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
      {$ELSE}
    function Seek(Offset: Longint; Origin: Word): Longint; override;
      {$ENDIF}
    {$ENDIF}
  end;

const
  {$IFDEF UNIX}
  GOSType = otUnix;
  GPathDelim = '/'; {do not localize}
  INFINITE = LongWord($FFFFFFFF);     { Infinite timeout }
  {$ENDIF}

  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  GOSType = otWindows;
  GPathDelim = '\'; {do not localize}
  Infinite = Windows.INFINITE; { redeclare here for use elsewhere without using Windows.pas }  // cls modified 1/23/2002
  {$ENDIF}

  {$IFDEF DOTNET}
  GOSType = otDotNet;
  GPathDelim = '\'; {do not localize}
//  Infinite = ?; { redeclare here for use elsewhere without using Windows.pas }  // cls modified 1/23/2002
  {$ENDIF}

  // S.G. 4/9/2002: IP version general switch for defaults
  {$IFDEF IdIPv6}
  ID_DEFAULT_IP_VERSION = Id_IPv6;
  {$ELSE}
  ID_DEFAULT_IP_VERSION = Id_IPv4;
  {$ENDIF}

  {$IFNDEF VCL6ORABOVE}
  //Only D6 & Kylix have this constant
  sLineBreak = EOL;
  {$ENDIF}

//The power constants are for processing IP addresses
//They are powers of 255.
const
  POWER_1 = $000000FF;
  POWER_2 = $0000FFFF;
  POWER_3 = $00FFFFFF;
  POWER_4 = $FFFFFFFF;

// utility functions to calculate the usable length of a given buffer.
// If ALength is <0 then the actual Buffer length is returned,
// otherwise the minimum of the two lengths is returned instead.
function IndyLength(const ABuffer: String; const ALength: Integer = -1; const AIndex: Integer = 1): Integer; overload;
function IndyLength(const ABuffer: TIdBytes; const ALength: Integer = -1; const AIndex: Integer = 0): Integer; overload;
function IndyLength(const ABuffer: TStream; const ALength: Int64 = -1): Int64; overload;

function IndyFormat(const AFormat: string; const Args: array of const): string;
function IndyIncludeTrailingPathDelimiter(const S: string): string;
function IndyExcludeTrailingPathDelimiter(const S: string): string;

procedure IndyRaiseLastError;
//You could possibly use the standard StrInt and StrIntDef but these
//also remove spaces from the string using the trim functions.
function IndyStrToInt(const S: string): Integer; overload;
function IndyStrToInt(const S: string; ADefault: Integer): Integer; overload;

function IndyFileAge(const AFileName: string): TDateTime;
function IndyDirectoryExists(const ADirectory: string): Boolean;

//You could possibly use the standard StrToInt and StrToInt64Def
//functions but these also remove spaces using the trim function
function IndyStrToInt64(const S: string; const ADefault: Int64): Int64; overload;
function IndyStrToInt64(const S: string): Int64;  overload;

function AddMSecToTime(const ADateTime: TDateTime; const AMSec: Integer): TDateTime;

// To and From Bytes conversion routines
function ToBytes(const AValue: string; const AEncoding: TIdEncoding = en7Bit): TIdBytes; overload;
function ToBytes(const AValue: string; const ALength: Integer; const AIndex: Integer = 1;
  const AEncoding: TIdEncoding = en7Bit): TIdBytes; overload;
function ToBytes(const AValue: Char; const AEncoding: TIdEncoding = en7Bit): TIdBytes; overload;
function ToBytes(const AValue: LongInt): TIdBytes; overload;
function ToBytes(const AValue: Short): TIdBytes; overload;
function ToBytes(const AValue: Word): TIdBytes; overload;
function ToBytes(const AValue: Byte): TIdBytes; overload;
function ToBytes(const AValue: LongWord): TIdBytes; overload;
function ToBytes(const AValue: Int64): TIdBytes; overload;
function ToBytes(const AValue: TIdBytes; const ASize: Integer; const AIndex: Integer = 0): TIdBytes; overload;
{$IFNDEF DOTNET}
// RLebeau - not using the same "ToBytes" naming convention for RawToBytes()
// in order to prevent ambiquious errors with ToBytes(TIdBytes) above
function RawToBytes(const AValue; const ASize: Integer): TIdBytes;
{$ENDIF}

// The following functions are faster but except that Bytes[] must have enough
// space for at least SizeOf(AValue) bytes.
procedure ToBytesF(var Bytes: TIdBytes; const AValue: Char; const AEncoding: TIdEncoding = en7Bit); overload;
procedure ToBytesF(var Bytes: TIdBytes; const AValue: LongInt); overload;
procedure ToBytesF(var Bytes: TIdBytes; const AValue: Short); overload;
procedure ToBytesF(var Bytes: TIdBytes; const AValue: Word); overload;
procedure ToBytesF(var Bytes: TIdBytes; const AValue: Byte); overload;
procedure ToBytesF(var Bytes: TIdBytes; const AValue: LongWord); overload;
procedure ToBytesF(var Bytes: TIdBytes; const AValue: Int64); overload;
procedure ToBytesF(var Bytes: TIdBytes; const AValue: TIdBytes; const ASize: Integer; const AIndex: Integer = 0); overload;
{$IFNDEF DOTNET}
// RLebeau - not using the same "ToBytesF" naming convention for RawToBytesF()
// in order to prevent ambiquious errors with ToBytesF(TIdBytes) above
procedure RawToBytesF(var Bytes: TIdBytes; const AValue; const ASize: Integer);
{$ENDIF}

function ToHex(const AValue: TIdBytes; const ACount: Integer = -1; const AIndex: Integer = 0): AnsiString; overload;
function ToHex(const AValue: array of LongWord): AnsiString; overload; // for IdHash
function BytesToString(const AValue: TIdBytes; const AEncoding: TIdEncoding = en7Bit): string; overload;
function BytesToString(const AValue: TIdBytes; const AStartIndex: Integer; const ALength: Integer = -1; const AEncoding: TIdEncoding = en7Bit): string; overload;
function BytesToChar(const AValue: TIdBytes; const AIndex: Integer = 0; const AEncoding: TIdEncoding = en7Bit): Char; overload;
function BytesToChar(const AValue: TIdBytes; var VChar: Char; const AIndex: Integer = 0; const AEncoding: TIdEncoding = en7Bit): Integer; overload;
function BytesToShort(const AValue: TIdBytes; const AIndex: Integer = 0): Short;
function BytesToWord(const AValue: TIdBytes; const AIndex : Integer = 0): Word;
function BytesToLongWord(const AValue: TIdBytes; const AIndex : Integer = 0): LongWord;
function BytesToLongInt(const AValue: TIdBytes; const AIndex: Integer = 0): LongInt;
function BytesToInt64(const AValue: TIdBytes; const AIndex: Integer = 0): Int64;
function BytesToIPv4Str(const AValue: TIdBytes; const AIndex: Integer = 0): String;
procedure BytesToIPv6(const AValue: TIdBytes; var VAddress: TIdIPv6Address; const AIndex: Integer = 0);
{$IFNDEF DOTNET}
procedure BytesToRaw(const AValue: TIdBytes; var VBuffer; const ASize: Integer);
{$ENDIF}

// TIdBytes utilities
procedure AppendBytes(var VBytes: TIdBytes; const AToAdd: TIdBytes; const AIndex: Integer = 0);
procedure AppendByte(var VBytes: TIdBytes; const AByte: Byte);
procedure AppendString(var VBytes: TIdBytes; const AStr: String; ALength: Integer = -1);
procedure ExpandBytes(var VBytes: TIdBytes; const AIndex: Integer; const ACount: Integer; const AFillByte: Byte = 0);
procedure InsertBytes(var VBytes: TIdBytes; const ADestIndex: Integer; const ASource: TIdBytes; const ASourceIndex: Integer = 0);
procedure InsertByte(var VBytes: TIdBytes; const AByte: Byte; const AIndex: Integer);
procedure RemoveBytes(var VBytes: TIdBytes; const ACount: Integer; const AIndex: Integer = 0);

// Common Streaming routines
function ReadLnFromStream(AStream: TStream; var VLine: String; AMaxLineLength: Integer = -1;
  const AEncoding: TIdEncoding = en7Bit): Boolean; overload;
function ReadLnFromStream(AStream: TStream; AMaxLineLength: Integer = -1;
  AExceptionIfEOF: Boolean = False; const AEncoding: TIdEncoding = en7Bit): string; overload;
function ReadStringFromStream(AStream: TStream; ASize: Integer = -1; const AEncoding: TIdEncoding = en7Bit): string;
procedure WriteStringToStream(AStream: TStream; const AStr: string; const AEncoding: TIdEncoding); overload;
procedure WriteStringToStream(AStream: TStream; const AStr: string; const ALength: Integer = -1;
  const AIndex: Integer = 1; const AEncoding: TIdEncoding = en7Bit); overload;
function ReadCharFromStream(AStream: TStream; var VChar: Char; const AEncoding: TIdEncoding = en7Bit): Integer;
{$IFDEF FPC}
function ReadTIdBytesFromStream(const AStream: TStream; var ABytes: TIdBytes; const Count: Int64): Int64;
{$ELSE}
function ReadTIdBytesFromStream(const AStream: TStream; var ABytes: TIdBytes; const Count: Integer): Integer;
{$ENDIF}
procedure WriteTIdBytesToStream(const AStream: TStream; const ABytes: TIdBytes;
  const ASize: Integer = -1; const AIndex: Integer = 0);

function ByteToHex(const AByte: Byte): string;
function ByteToOctal(const AByte: Byte): string;

function LongWordToHex(const ALongWord : LongWord) : String;

procedure CopyTIdBytes(const ASource: TIdBytes; const ASourceIndex: Integer;
  var VDest: TIdBytes; const ADestIndex: Integer; const ALength: Integer);

procedure CopyTIdByteArray(const ASource: array of Byte; const ASourceIndex: Integer;
  var VDest: array of Byte; const ADestIndex: Integer; const ALength: Integer);

procedure CopyTIdChar(const ASource: Char; var VDest: TIdBytes; const ADestIndex: Integer;
  const AEncoding: TIdEncoding = en7Bit);
procedure CopyTIdShort(const ASource: Short; var VDest: TIdBytes; const ADestIndex: Integer);
procedure CopyTIdWord(const ASource: Word; var VDest: TIdBytes; const ADestIndex: Integer);
procedure CopyTIdLongInt(const ASource: LongInt; var VDest: TIdBytes; const ADestIndex: Integer);
procedure CopyTIdLongWord(const ASource: LongWord; var VDest: TIdBytes; const ADestIndex: Integer);
procedure CopyTIdInt64(const ASource: Int64; var VDest: TIdBytes; const ADestIndex: Integer);
procedure CopyTIdIPV6Address(const ASource: TIdIPv6Address; var VDest: TIdBytes; const ADestIndex: Integer);
procedure CopyTIdString(const ASource: String; var VDest: TIdBytes; const ADestIndex: Integer; const ALength: Integer = -1); overload;
procedure CopyTIdString(const ASource: String; const ASourceIndex: Integer; var VDest: TIdBytes; const ADestIndex: Integer; const ALength: Integer = -1); overload;

// Need to change prob not to use this set
function CharPosInSet(const AString: string; const ACharPos: Integer; const ASet: String): Integer;
function CharIsInSet(const AString: string; const ACharPos: Integer; const ASet: String): Boolean;
function CharIsInEOL(const AString: string; const ACharPos: Integer): Boolean;
function CharEquals(const AString: string; const ACharPos: Integer; const AValue: Char): Boolean;

function ByteIndex(const AByte: Byte; const ABytes: TIdBytes; const AStartIndex: Integer = 0): Integer;
function ByteIdxInSet(const ABytes: TIdBytes; const AIndex: Integer; const ASet: TIdBytes): Integer;
function ByteIsInSet(const ABytes: TIdBytes; const AIndex: Integer; const ASet: TIdBytes): Boolean;
function ByteIsInEOL(const ABytes: TIdBytes; const AIndex: Integer): Boolean;

function CompareDate(const D1, D2: TDateTime): Integer;
function CurrentProcessId: TIdPID;
function DateTimeGMTToHttpStr(const GMTValue: TDateTime) : String;
function DateTimeGMTToCookieStr(const GMTValue: TDateTime) : String;
function DateTimeToInternetStr(const Value: TDateTime; const AIsGMT : Boolean = False) : String;
function DateTimeToGmtOffSetStr(ADateTime: TDateTime; SubGMT: Boolean): string;
procedure DebugOutput(const AText: string);
function Fetch(var AInput: string; const ADelim: string = IdFetchDelimDefault;
  const ADelete: Boolean = IdFetchDeleteDefault;
  const ACaseSensitive: Boolean = IdFetchCaseSensitiveDefault): string;
function FetchCaseInsensitive(var AInput: string; const ADelim: string = IdFetchDelimDefault;
  const ADelete: Boolean = IdFetchDeleteDefault): string;

// TODO: add an index parameter
procedure FillBytes(var VBytes : TIdBytes; const ACount : Integer; const AValue : Byte);

function CurrentThreadId: TIdThreadID;
function GetThreadHandle(AThread: TThread): TIdThreadHandle;
//GetTickDiff required because GetTickCount will wrap
function GetTickDiff(const AOldTickCount, ANewTickCount: LongWord): LongWord; //IdICMP uses it
procedure IdDelete(var s: string; AOffset, ACount: Integer);
procedure IdInsert(const Source: string; var S: string; Index: Integer);
{$IFNDEF DOTNET}
function IdPorts: TList;
{$ENDIF}
function iif(ATest: Boolean; const ATrue: Integer; const AFalse: Integer): Integer; overload;
function iif(ATest: Boolean; const ATrue: string; const AFalse: string = ''): string; overload; { do not localize }
function iif(ATest: Boolean; const ATrue: Boolean; const AFalse: Boolean): Boolean; overload;
function InMainThread: Boolean;
function IPv6AddressToStr(const AValue: TIdIPv6Address): string;

//Note that there is NO need for Big Endian byte order functions because
//that's done through HostToNetwork byte order functions.
function HostToLittleEndian(const AValue : Word) : Word; overload;
function HostToLittleEndian(const AValue : LongWord): LongWord; overload;
function HostToLittleEndian(const AValue : Integer): Integer; overload;

function LittleEndianToHost(const AValue : Word) : Word; overload;
function LittleEndianToHost(const AValue : LongWord): LongWord; overload;
function LittleEndianToHost(const AValue : Integer): Integer; overload;

procedure WriteMemoryStreamToStream(Src: TMemoryStream; Dest: TStream; Count: int64);
{$IFNDEF DOTNETEXCLUDE}
function IsCurrentThread(AThread: TThread): boolean;
{$ENDIF}
function IPv4ToDWord(const AIPAddress: string): LongWord; overload;
function IPv4ToDWord(const AIPAddress: string; var VErr: Boolean): LongWord; overload;
function IPv4ToHex(const AIPAddress: string; const ASDotted: Boolean = False): string;
function IPv4ToOctal(const AIPAddress: string): string;
procedure IPv6ToIdIPv6Address(const AIPAddress: String; var VAddress: TIdIPv6Address); overload;
procedure IPv6ToIdIPv6Address(const AIPAddress: String; var VAddress: TIdIPv6Address; var VErr : Boolean); overload;
function IsAlpha(const AChar: Char): Boolean; overload;
function IsAlpha(const AString: String): Boolean; overload;
function IsAlphaNumeric(const AChar: Char): Boolean; overload;
function IsAlphaNumeric(const AString: String): Boolean; overload;
function IsASCII(const AByte: Byte): Boolean; overload;
function IsASCII(const ABytes: TIdBytes): Boolean; overload;
function IsASCIILDH(const AByte: Byte): Boolean; overload;
function IsASCIILDH(const ABytes: TIdBytes): Boolean; overload;
function IsHexidecimal(const AChar: Char): Boolean; overload;
function IsHexidecimal(const AString: string): Boolean; overload;
function IsNumeric(const AChar: Char): Boolean; overload;
function IsNumeric(const AString: string): Boolean; overload;
function IsNumeric(const AString: string; const ALength: Integer; const AIndex: Integer = 1): Boolean; overload;
function IsOctal(const AChar: Char): Boolean; overload;
function IsOctal(const AString: string): Boolean; overload;
{$IFNDEF DOTNET}
function InterlockedExchangeTHandle(var VTarget : THandle; const AValue : PtrUInt) : THandle;
{$ENDIF}
function MakeCanonicalIPv4Address(const AAddr: string): string;
function MakeCanonicalIPv6Address(const AAddr: string): string;
function MakeDWordIntoIPv4Address(const ADWord: LongWord): string;
function IndyMin(const AValueOne, AValueTwo: Int64): Int64; overload;
function IndyMin(const AValueOne, AValueTwo: LongInt): LongInt; overload;
function IndyMin(const AValueOne, AValueTwo: Word): Word; overload;
function IndyMax(const AValueOne, AValueTwo: Int64): Int64; overload;
function IndyMax(const AValueOne, AValueTwo: LongInt): LongInt; overload;
function IndyMax(const AValueOne, AValueTwo: Word): Word; overload;
function IPv4MakeLongWordInRange(const AInt: Int64; const A256Power: Integer): LongWord;
{$IFDEF REGISTER_EXPECTED_MEMORY_LEAK}
function IndyRegisterExpectedMemoryLeak(AAddress: Pointer): Boolean;
{$ENDIF}
{$IFDEF UNIX}
function HackLoad(const ALibName : String; const ALibVersions : array of String) : HMODULE;
{$ENDIF}
{$IFNDEF DOTNET}
function MemoryPos(const ASubStr: string; MemBuff: PChar; MemorySize: Integer): Integer;
{$ENDIF}
function OffsetFromUTC: TDateTime;

function PosIdx(const ASubStr, AStr: AnsiString; AStartPos: LongWord = 0): LongWord; //For "ignoreCase" use AnsiUpperCase
function PosInSmallIntArray(const ASearchInt: SmallInt; const AArray: array of SmallInt): Integer;
function PosInStrArray(const SearchStr: string; const Contents: array of string; const CaseSensitive: Boolean = True): Integer;
{$IFNDEF DOTNET}
function ServicesFilePath: string;
{$ENDIF}
procedure IndySetThreadPriority(AThread: TThread; const APriority: TIdThreadPriority; const APolicy: Integer = -MaxInt);
procedure SetThreadName(const AName: string);
procedure IndySleep(ATime: LongWord);
//in Integer(Strings.Objects[i]) - column position in AData
procedure SplitColumnsNoTrim(const AData: string; AStrings: TStrings; const ADelim: string = ' ');    {Do not Localize}
procedure SplitColumns(const AData: string; AStrings: TStrings; const ADelim: string = ' ');    {Do not Localize}
function StartsWithACE(const ABytes: TIdBytes): Boolean;
function StringsReplace(const S: String; const OldPattern, NewPattern: array of string): string;
function ReplaceOnlyFirst(const S, OldPattern, NewPattern: string): string;
function TextIsSame(const A1, A2: string): Boolean;
function TextStartsWith(const S, SubS: string): Boolean;
function TextEndsWith(const S, SubS: string): Boolean;
function IndyUpperCase(const A1: string): string;
function IndyLowerCase(const A1: string): string;
function IndyCompareStr(const A1: string; const A2: string): Integer;
function Ticks: LongWord;
procedure ToDo;
function TwoByteToWord(AByte1, AByte2: Byte): Word;

var
  IndyPos: TPosProc = nil;

type
  {
  RLebeau 8/3/2007: This is probably not the best way to handle UTF-8,
  I'm sure.  But this does allow us to support on-the-fly decoding of
  streams and byte buffers equally.  The reason this class is declared
  publically here and not made exclusively private to IdGlobal is
  because it is currently being used by TIdIOHandler.ReadChar() in order
  to read a single UTF-8 character that may span multiple bytes. There
  is no way for it to know ahead of time how many bytes will need to be
  read from the connection, so ReadChar() does on-the-fly decoding.  The
  other IOHandler operations on strings know the string length ahead of
  time, or have delimiters they can look for, so this is not a problem
  for them.
  }
  TIdUTF8Decoder = class(TObject)
  public
    function ProcessByte(const AByte: Byte; var VChar: WideChar): Boolean; virtual; abstract;
  end;

{$IFDEF DOTNET}
function GetEncoder(AEncoding: TIdEncoding): Encoding;
{$ENDIF}
function GetUTF8Decoder: TIdUTF8Decoder;

{$IFDEF UNIX}
const
  {$IFDEF DARWIN}
  LIBEXT = '.dylib'; {do not localize}
  {$ELSE}
  LIBEXT = '.so'; {do not localize}
  {$ENDIF}
{$ENDIF}

implementation

uses
  {$IFDEF REGISTER_EXPECTED_MEMORY_LEAK}
    {$IFDEF USEFASTMM4}FastMM4,{$ENDIF}
  {$ENDIF}
  {$IFDEF USELIBC}Libc,{$ENDIF}
  {$IFDEF VCL6ORABOVE}DateUtils,{$ENDIF}
  IdResourceStrings,
  IdStream;

{$IFNDEF DOTNET}
var
  GIdPorts: TList = nil;
{$ENDIF}

{$IFDEF UNIX}
function HackLoad(const ALibName : String; const ALibVersions : array of String) : HMODULE;
var
  i : Integer;
begin
  Result := NilHandle;
  for i := Low(ALibVersions) to High(ALibVersions) do
  begin
    {$IFDEF DARWIN}
    Result := LoadLibrary(ALibName+ALibVersions[i]+LIBEXT);
    {$ELSE}
      {$IFDEF KYLIXCOMPAT}
    // Workaround that is required under Linux (changed RTLD_GLOBAL with RTLD_LAZY Note: also work with LoadLibrary())
    Result := HMODULE(dlopen(PChar(ALibName+LIBEXT+ALibVersions[i]), RTLD_LAZY));
      {$ELSE}
    Result := LoadLibrary(ALibName+LIBEXT+ALibVersions[i]);
      {$ENDIF}
    {$ENDIF}
    if Result <> NilHandle then begin
      break;
    end;
  end;
end;
{$ENDIF}

procedure IndyRaiseLastError;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFNDEF VCL6ORABOVE}
  RaiseLastWin32Error;
  {$ELSE}
  RaiseLastOSError;
  {$ENDIF}
end;

{$IFNDEF DOTNET}
function InterlockedExchangeTHandle(var VTarget : THandle; const AValue : PtrUInt) : THandle;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF THANDLE32}
  Result := InterlockedExchange(LongInt(VTarget), AValue);
  {$ENDIF}
  {$IFDEF THANDLE64}
  Result := InterlockedExchange64(Int64(VTarget), AValue);
  {$ENDIF}
end;
{$ENDIF}

{Little Endian Byte order functions from:

From: http://community.borland.com/article/0,1410,16854,00.html


Big-endian and little-endian formated integers - by Borland Developer Support Staff

Note that I will NOT do big Endian functions because the stacks can handle that
with HostToNetwork and NetworkToHost functions.

You should use these functions for writing data that sent and received in Little
Endian Form.  Do NOT assume endianness of what's written.  It can work in unpredictable
ways on other architectures.
}
function HostToLittleEndian(const AValue : Word) : Word;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  //I think that is Little Endian but I'm not completely sure
  Result := AValue;
  {$ELSE}
    {$IFDEF ENDIAN_LITTLE}
    Result := AValue;
    {$ENDIF}
    {$IFDEF ENDIAN_BIG}
    Result := swap(AValue);
    {$ENDIF}
  {$ENDIF}
end;

function HostToLittleEndian(const AValue : LongWord) : LongWord;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  //I think that is Little Endian but I'm not completely sure
  Result := AValue;
  {$ELSE}
    {$IFDEF ENDIAN_LITTLE}
    Result := AValue;
    {$ENDIF}
    {$IFDEF ENDIAN_BIG}
    Result := swap(AValue shr 16) or (Longint(swap(AValue and $FFFF)) shl 16);
    {$ENDIF}
  {$ENDIF}
end;

function HostToLittleEndian(const AValue : Integer) : Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  //I think that is Little Endian but I'm not completely sure
  Result := AValue;
  {$ELSE}
    {$IFDEF ENDIAN_LITTLE}
    Result := AValue;
    {$ENDIF}
    {$IFDEF ENDIAN_BIG}
    Result := swap(AValue);
    {$ENDIF}
  {$ENDIF}
end;

function LittleEndianToHost(const AValue : Word) : Word;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  //I think that is Little Endian but I'm not completely sure
  Result := AValue;
  {$ELSE}
    {$IFDEF ENDIAN_LITTLE}
    Result := AValue;
    {$ENDIF}
    {$IFDEF ENDIAN_BIG}
    Result := swap(AValue);
    {$ENDIF}
  {$ENDIF}
end;

function LittleEndianToHost(const AValue : Longword): Longword;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  //I think that is Little ENdian but I'm not completely sure
  Result := AValue;
  {$ELSE}
    {$IFDEF ENDIAN_LITTLE}
    Result := AValue;
    {$ENDIF}
    {$IFDEF ENDIAN_BIG}
    Result := swap(AValue shr 16) or
           (Longint(swap(AValue and $FFFF)) shl 16);
    {$ENDIF}
  {$ENDIF}
end;

function LittleEndianToHost(const AValue : Integer): Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  //I think that is Little ENdian but I'm not completely sure
  Result := AValue;
  {$ELSE}
    {$IFDEF ENDIAN_LITTLE}
    Result := AValue;
    {$ENDIF}
    {$IFDEF ENDIAN_BIG}
    Result := Swap(AValue);
    {$ENDIF}
  {$ENDIF}
end;

{$IFDEF DOTNET}
function GetEncoder(AEncoding: TIdEncoding): Encoding;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  case AEncoding of
    en7Bit: Result := System.Text.Encoding.ASCII;
    enUTF8: Result := System.Text.Encoding.UTF8;
    en8Bit: Result := System.Text.Encoding.GetEncoding(1252); // Windows-1252
    else    Result := nil;
  end;
end;
{$ENDIF}

{      RFC 2279 table for reference
UCS-4   range   (hex.)  UTF-8 octet sequence (binary)
 0000 0000-0000  007F   0xxxxxxx
 0000 0080-0000  07FF   110xxxxx 10xxxxxx

 0000 0800-0000  FFFF   1110xxxx 10xxxxxx 10xxxxxx
 0001 0000-001F  FFFF   11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
 0020 0000-03FF  FFFF   111110xx 10xxxxxx 10xxxxxx 10xxxxxx
 0400 0000-7FFF  FFFF   1111110x 10xxxxxx ... 10xxxxxx
}

{$IFDEF DOTNET}
type
  TIdUTF8DecoderNET = class(TIdUTF8Decoder)
  private
    fValue: array[0..1] of Char;
    fDecoder: System.Text.Decoder;
  public
    constructor Create;
    function ProcessByte(const AByte: Byte; var VChar: WideChar): Boolean; override;
  end;

constructor TIdUTF8DecoderNET.Create;
begin
  inherited Create;
  fValue[0] := #0;
  fValue[1] := #0;
  fDecoder := System.Text.Encoding.UTF8.GetDecoder;
end;

function TIdUTF8DecoderNET.ProcessByte(const AByte: Byte; var VChar: WideChar): Boolean;
var
  LByte: array[0..1] of Byte;
begin
  Result := False;
  LByte[0] := AByte;
  LByte[1] := 0;
  if fDecoder.GetChars(LByte, 0, 1, fValue, 0) = 1 then
  begin
    VChar := fValue[0];
    Result := True;
    {$IFNDEF DOTNET1_1}
    //This is not supported in Microsoft.NET 1.1 framework
    fDecoder.Reset;
    {$ENDIF}
  end;
end;

{$ELSE}
type
  TIdUTF8DecodeStep = (utf8Step1, utf8Step2, utf8Step3);

  TIdUTF8DecoderIndy = class(TIdUTF8Decoder)
  private
    fValue: LongWord;
    fStep: TIdUTF8DecodeStep;
  public
    constructor Create;
    function ProcessByte(const AByte: Byte; var VChar: WideChar): Boolean; override;
  end;

constructor TIdUTF8DecoderIndy.Create;
begin
  inherited Create;
  fValue := 0;
  fStep := utf8Step1;
end;

function TIdUTF8DecoderIndy.ProcessByte(const AByte: Byte; var VChar: WideChar): Boolean;
begin
  Result := False;

  case fStep of
    utf8Step1:
    begin
      fValue := LongWord(AByte);
      if (fValue and $80) <> 0 then
      begin
        fValue := fValue and $3F;
        if (fValue and $20) <> 0 then begin
          fStep := utf8Step2;
        end else begin
          fStep := utf8Step3;
        end;
        Exit;
      end;
    end;

    utf8Step2:
    begin
      if (AByte and $C0) <> $80 then begin
        raise EIdException.Create('Byte is invalid for this UTF-8 sequence'); {do not localize}
      end;
      fValue := ((fValue and $0F) shl 6) or LongWord(AByte and $3F);
      fStep := utf8Step3;
      Exit;
    end;

    utf8Step3:
    begin
      if (AByte and $C0) <> $80 then begin
        raise EIdException.Create('Byte is invalid for this UTF-8 sequence'); {do not localize}
      end;
      fValue := (fValue shl 6) or LongWord(AByte and $3F);
    end;
  end;

  fStep := utf8Step1;
  VChar := WideChar(fValue);
  Result := True;
end;
{$ENDIF}

function GetUTF8Decoder: TIdUTF8Decoder;
begin
  {$IFDEF DOTNET}
  Result := TIdUTF8DecoderNET.Create;
  {$ELSE}
  Result := TIdUTF8DecoderIndy.Create;
  {$ENDIF}
end;

// TODO: support MBCS->Wide conversion
function EncodeCharToUTF8(const AChar: Char; var VDest: TIdBytes; const AIndex: Integer): Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  {$IFDEF DOTNET}
  LChars : array[0..1] of Char;
  {$ELSE}
  LWC: LongWord;
  {$ENDIF}
begin
  {$IFDEF DOTNET}
  LChars[0] := AChar;
  LChars[1] := #0;
  Result := GetEncoder(enUTF8).GetBytes(LChars, 0, 1, VDest, 0);
  {$ELSE}
  LWC := LongWord(AChar);
  if LWC <= $7F then
  begin
    VDest[AIndex] := Byte(LWC);
    Result := 1;
  end
  else if LWC <= $7FF then
  begin
    VDest[AIndex] := Byte($C0 or (LWC shr 6));
    VDest[AIndex+1] := Byte($80 or (LWC and $3F));
    Result := 2;
  end else // (LWC >= $8000)
  begin
    VDest[AIndex] := Byte($E0 or (LWC shr 12));
    VDest[AIndex+1] := Byte($80 or ((LWC shr 6) and $3F));
    VDest[AIndex+2] := Byte($80 or (LWC and $3F));
    Result := 3;
  end;
  {$ENDIF}
end;

{ RLebeau - .NET does not have a function to calculate how many bytes a UTF-8
  character in a byte array occupies (or I haven't found one) so here is our own. }
  
// TODO: support MBCS->Wide conversion

function CalcBytesOfUTF8Char(const ABytes: TIdBytes; const AIndex: Integer): Integer;
var
  I, LLength: Integer;
  LCh: WideChar;
begin
  Result := 0;
  LLength := IndyLength(ABytes, -1, AIndex);
  if LLength > 0 then
  begin
    with GetUTF8Decoder do
    try
      for I := 0 to LLength-1 do
      begin
        Inc(Result);
        if ProcessByte(ABytes[AIndex+I], LCh) then begin
          Break;
        end;
      end;
    finally
      Free;
    end;
  end;
end;

{ RLebeau: Under .NET 1.x, System.Text.Encoding.GetByteCount() does not have
  an overload that accepts index/length parameters for string values. Under
  .NET 2.0, it has an overload that accepts a Char* and a length, but it is
  not CLS compliant.  Would like to be able to calculate this without having
  to make a copy of the desired string block in memory. }

// TODO: support MBCS->Wide conversion
function CalcBytesForUTF8Char(const AChar: Char): Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LWC: LongWord;
begin
  {$IFDEF DOTNET2_OR_ABOVE}
  { RLebeau: maybe use the System.Text.UTF8Encoding.GetEncoder()
    method to get an Encoder object that can be called in a loop
    to calculate the necessary byte count? }
  {$ENDIF}
  LWC := LongWord(AChar);
  if LWC <= $7F then begin
    Result := 1;
  end
  else if LWC <= $7FF then begin
    Result := 2;
  end else
  begin // (LWC >= $8000)
    Result := 3;
  end;
end;

// TODO: support MBCS->Wide conversion
function CalcBytesForUTF8String(const AStr: String; const AIndex, ALength: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;

  {$IFDEF DOTNET2_OR_ABOVE}
  { RLebeau: maybe use the System.Text.UTF8Encoding.GetEncoder()
    method to get an Encoder object that can be called in a loop
    to calculate the necessary byte count? }
  {$ENDIF}

  for I := AIndex to ALength do begin
    Inc(Result, CalcBytesForUTF8Char(AStr[I]));
  end;
end;

{$IFNDEF DOTNET}
function UTF8BytesToString(const ABytes: TIdBytes; const AIndex, ALength: Integer): String;
  {$IFDEF USEINLINE}inline;{$ENDIF}
var
  I, LLength: Integer;
  LCh: WideChar;
  LResult: WideString;
begin
  // RLebeau: AIndex and ALength have already been validated/calculated
  // by BytesToString() so use them as-is here...

  Result := '';

  SetLength(LResult, ALength);
  LLength := 0;

  with GetUTF8Decoder do
  try
    for I := 0 to ALength-1 do
    begin
      if ProcessByte(ABytes[AIndex+I], LCh) then
      begin
        LResult[LLength+1] := LCh;
        Inc(LLength);
      end;
    end;
  finally
    Free;
  end;

  if LLength > 0 then
  begin
    if LLength < ALength then begin
      SetLength(LResult, LLength);
    end;
    Result := LResult;
  end;
end;
{$ENDIF}

function UTF8BytesToChar(const ABytes: TIdBytes; const AIndex, ALength: Integer): Char;
var
  {$IFDEF DOTNET}
  LChars: array[0..1] of Char;
  {$ELSE}
  I: Integer;
  LCh: WideChar;
  Temp: String; // RLebeau: using a string to support Wide->Ansi conversion
  {$ENDIF}
begin
  // RLebeau: AIndex and ALength have already been validated/calculated
  // by BytesToChar() so use them as-is here...

  {$IFDEF DOTNET}
  if GetEncoder(enUTF8).GetChars(ABytes, AIndex, ALength, LChars, 0) > 0 then
  begin
    Result := LChars[0];
    Exit;
  end;
  {$ELSE}
  with GetUTF8Decoder do
  try
    for I := 0 to ALength-1 do
    begin
      if ProcessByte(ABytes[AIndex+I], LCh) then
      begin
        Temp := LCh;
        Result := Temp[1];
        Exit;
      end;
    end;
  finally
    Free;
  end;
  {$ENDIF}
  raise EIdException.Create('Not enough bytes to decode UTF-8 character'); {do not localize}
end;

// TODO: support MBCS->Wide conversion
function StringToUTF8Bytes(const AStr: String; const AIndex, ALength: Integer): TIdBytes;
{$IFDEF DOTNET}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
var
  LLength: Integer;
  {$IFNDEF DOTNET}
  I: Integer;
  {$ENDIF}
begin
  // RLebeau: AIndex and ALength have already been validated/calculated
  // by StringToBytes() so use them as-is here...

  LLength := CalcBytesForUTF8String(AStr, AIndex, ALength);
  SetLength(Result, LLength);
  {$IFDEF DOTNET}
  GetEncoder(enUTF8).GetBytes(AStr, AIndex, ALength, Result, 0);
  {$ELSE}
  LLength := 0;
  for I := AIndex to ALength do begin
    LLength := LLength + EncodeCharToUTF8(AStr[I], Result, LLength);
  end;
  {$ENDIF}
end;

// TODO: support MBCS->Wide conversion
function CharToUTF8Bytes(const AChar: Char): TIdBytes;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LLength: Integer;
begin
  LLength := CalcBytesForUTF8Char(AChar);
  SetLength(Result, LLength);
  EncodeCharToUTF8(AChar, Result, 0);
end;

// TODO: add an AIndex parameter
procedure FillBytes(var VBytes : TIdBytes; const ACount : Integer; const AValue : Byte);
{$IFDEF DOTNET}
var
  I: Integer;
{$ELSE}
{$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
begin
  {$IFDEF DOTNET}
  //System.&Array.Clear(VBytes, 0, ACount);
  // RLebeau: use the AValue byte instead
  for I := 0 to ACount-1 do begin
    VBytes[I] := AValue;
  end;
  {$ELSE}
  FillChar(VBytes[0], ACount, AValue);
  {$ENDIF}
end;

constructor TIdFileCreateStream.Create(const AFile : String);
begin
  inherited Create(AFile, fmCreate);
end;

constructor TIdAppendFileStream.Create(const AFile : String);
var
  LFlags: Word;
begin
  if FileExists(AFile) then begin
    LFlags := fmOpenReadWrite or fmShareDenyWrite;
  end else begin
    LFlags := fmCreate;
  end;
  inherited Create(AFile, LFlags);
  if LFlags <> fmCreate then begin
    Position := Size;
  end;
end;

constructor TIdReadFileNonExclusiveStream.Create(const AFile : String);
begin
  inherited Create(AFile, fmOpenRead or fmShareDenyNone);
end;

constructor TIdReadFileExclusiveStream.Create(const AFile : String);
begin
  inherited Create(AFile, fmOpenRead or fmShareDenyWrite);
end;

function IsASCIILDH(const AByte: Byte): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := True;
  //Verify the absence of non-LDH ASCII code points; that is, the
  //absence of 0..2C, 2E..2F, 3A..40, 5B..60, and 7B..7F.
  //Permissable chars are in this set
  //['-','0'..'9','A'..'Z','a'..'z']
  if AByte <= $2C then begin
    Result := False;
  end
  else if (AByte >= $2E) and (AByte <= $2F) then begin
    Result := False;
  end
  else if (AByte >= $3A) and (AByte <= $40) then begin
    Result := False;
  end
  else if (AByte >= $5B) and (AByte <= $60) then begin
    Result := False;
  end
  else if (AByte >= $7B) and (AByte <= $7F) then begin
    Result := False;
  end;
end;

function IsASCIILDH(const ABytes: TIdBytes): Boolean;
var
  i: Integer;
begin
  for i := 0 to Length(ABytes)-1 do begin
    if not IsASCIILDH(ABytes[i]) then
    begin
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

function IsASCII(const AByte: Byte): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := AByte <= $7F;
end;

function IsASCII(const ABytes: TIdBytes): Boolean;
var
  i: Integer;
begin
  for i := 0 to Length(ABytes) -1 do begin
    if not IsASCII(ABytes[i]) then begin
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

function StartsWithACE(const ABytes: TIdBytes): Boolean;
const
  DASH = Ord('-');
var
  LS: string;
begin
  Result := False;
  if Length(ABytes) > 4 then
  begin
    if (ABytes[2] = DASH) and (ABytes[3] = DASH) then
    begin
      SetLength(LS, 2);
      LS[1] := Char(ABytes[2]);
      LS[2] := Char(ABytes[3]);
      if PosInStrArray(LS, ['bl','bq','dq','lq','mq','ra','wq','zq'], False) > -1 then begin {do not localize}
        Result := True;
      end;
    end;
  end;
end;

function PosInSmallIntArray(const ASearchInt: SmallInt; const AArray: array of SmallInt): Integer;
begin
  for Result := Low(AArray) to High(AArray) do begin
    if ASearchInt = AArray[Result] then begin
      Exit;
    end;
  end;
  Result := -1;
end;

{This searches an array of string for an occurance of SearchStr}
function PosInStrArray(const SearchStr: string; const Contents: array of string; const CaseSensitive: Boolean = True): Integer;
begin
  for Result := Low(Contents) to High(Contents) do begin
    if CaseSensitive then begin
      if SearchStr = Contents[Result] then begin
        Exit;
      end;
    end else begin
      if TextIsSame(SearchStr, Contents[Result]) then begin
        Exit;
      end;
    end;
  end;
  Result := -1;
end;

//IPv4 address conversion
function ByteToHex(const AByte: Byte): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := IdHexDigits[ (AByte and $F0) shr 4] + IdHexDigits[AByte and $F];
end;

function LongWordToHex(const ALongWord : LongWord) : String;
 {$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := ByteToHex((ALongWord and $FF000000) shr 24);
  Result := Result + ByteToHex((ALongWord and $00FF0000) shr 16);
  Result := Result + ByteToHex((ALongWord and $0000FF00) shr 8);
  Result := Result + ByteToHex(ALongWord and $000000FF);
end;

function ToHex(const AValue: TIdBytes; const ACount: Integer = -1;
  const AIndex: Integer = 0): AnsiString;
 {$IFDEF USEINLINE}inline;{$ENDIF}
var
  I, LCount: Integer;
begin
  LCount := IndyLength(AValue, ACount, AIndex);
  if LCount > 0 then begin
    SetLength(Result, LCount*2);
    for I := 0 to LCount-1 do begin
      Result[I*2+1] := IdHexDigits[(AValue[AIndex+I] and $F0) shr 4];
      Result[I*2+2] := IdHexDigits[AValue[AIndex+I] and $F];
    end;
  end else begin
    Result := '';
  end;
end;

function ToHex(const AValue: array of LongWord): AnsiString;
var
{$IFNDEF DOTNET}
  P: PChar;
{$ENDIF}
  i: Integer;
begin
{$IFNDEF DOTNET}
  P := PChar(@AValue);
  SetString(Result, nil, Length(AValue)*4*2);//40
  for i := 0 to Length(AValue)*4-1 do begin
    Result[i*2+1] := IdHexDigits[(Ord(P[i]) and $F0) shr 4];
    Result[i*2+2] := IdHexDigits[Ord(P[i]) and $F];
  end;//for
{$ELSE}
  Result := '';
  for i := 0 to Length(AValue)-1 do begin
    Result := Result + ToHex(ToBytes(AValue[i]));
  end;//for
{$ENDIF}
end;

function IPv4ToHex(const AIPAddress: string; const ASDotted: Boolean): string;
var
  i: Integer;
  LBuf, LTmp: string;
begin
  LBuf := Trim(AIPAddress);
  Result := HEXPREFIX;
  for i := 0 to 3 do begin
    LTmp := ByteToHex(IndyStrToInt(Fetch(LBuf, '.', True)));
    if ASDotted then begin
      Result := Result + '.' + HEXPREFIX + LTmp;
    end else begin
      Result := Result + LTmp;
    end;
  end;
end;

{$IFNDEF DOTNET}
function OctalToInt64(const AValue: string): Int64;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(AValue) do begin
    Result := (Result shl 3) +  IndyStrToInt(AValue[i], 0);
  end;
end;
{$ENDIF}

function ByteToOctal(const AByte: Byte): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := IdOctalDigits[(AByte shr 6) and $7] +
            IdOctalDigits[(AByte shr 3) and $7] +
            IdOctalDigits[AByte and $7];

  if Result[1] <> '0' then begin
    Result := '0' + Result;
  end;
end;

function IPv4ToOctal(const AIPAddress: string): string;
var
  i: Integer;
  LBuf: string;
begin
  LBuf := Trim(AIPAddress);
  Result := ByteToOctal(IndyStrToInt(Fetch(LBuf, '.', True), 0));
  for i := 0 to 2 do begin
    Result := Result + '.' + ByteToOctal(IndyStrToInt(Fetch(LBuf, '.', True), 0));
  end;
end;

procedure CopyTIdBytes(const ASource: TIdBytes; const ASourceIndex: Integer;
  var VDest: TIdBytes; const ADestIndex: Integer; const ALength: Integer);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  System.array.Copy(ASource, ASourceIndex, VDest, ADestIndex, ALength);
  {$ELSE}
  //if these asserts fail, then it indicates an attempted buffer overrun.
  Assert(ASourceIndex >= 0);
  Assert((ASourceIndex+ALength) <= Length(ASource));
  Move(ASource[ASourceIndex], VDest[ADestIndex], ALength);
  {$ENDIF}
end;

procedure CopyTIdChar(const ASource: Char; var VDest: TIdBytes; const ADestIndex: Integer;
  const AEncoding: TIdEncoding = en7Bit);
begin
  if AEncoding = enUTF8 then begin
    EncodeCharToUTF8(ASource, VDest, ADestIndex);
  end else
  begin
    VDest[ADestIndex] := Byte(ASource);
  end;
end;

procedure CopyTIdShort(const ASource: Short; var VDest: TIdBytes; const ADestIndex: Integer);
{$IFDEF DOTNET}
var
  LShort : TIdBytes;
{$ELSE}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
begin
  {$IFDEF DOTNET}
  LShort := System.BitConverter.GetBytes(ASource);
  System.array.Copy(LShort, 0, VDest, ADestIndex, SizeOf(Short));
  {$ELSE}
  PSmallInt(@VDest[ADestIndex])^ := ASource;
  {$ENDIF}
end;

procedure CopyTIdWord(const ASource: Word; var VDest: TIdBytes; const ADestIndex: Integer);
{$IFDEF DOTNET}
var
  LWord : TIdBytes;
{$ELSE}
 {$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
begin
  {$IFDEF DOTNET}
  LWord := System.BitConverter.GetBytes(ASource);
  System.array.Copy(LWord, 0, VDest, ADestIndex, SizeOf(Word));
  {$ELSE}
  PWord(@VDest[ADestIndex])^ := ASource;
  {$ENDIF}
end;

procedure CopyTIdLongWord(const ASource: LongWord; var VDest: TIdBytes; const ADestIndex: Integer);
{$IFDEF DOTNET}
var
  LWord : TIdBytes;
{$ELSE}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
begin
  {$IFDEF DOTNET}
  LWord := System.BitConverter.GetBytes(ASource);
  System.array.Copy(LWord, 0, VDest, ADestIndex, SizeOf(LongWord));
  {$ELSE}
  PLongWord(@VDest[ADestIndex])^ := ASource;
  {$ENDIF}
end;

procedure CopyTIdLongInt(const ASource: LongInt; var VDest: TIdBytes; const ADestIndex: Integer);
{$IFDEF DOTNET}
var
  LInt : TIdBytes;
{$ELSE}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
begin
  {$IFDEF DOTNET}
  LInt := System.BitConverter.GetBytes(ASource);
  System.array.Copy(LInt, 0, VDest, ADestIndex, SizeOf(LongInt));
  {$ELSE}
  PLongInt(@VDest[ADestIndex])^ := ASource;
  {$ENDIF}
end;

procedure CopyTIdInt64(const ASource: Int64; var VDest: TIdBytes; const ADestIndex: Integer);
{$IFDEF DOTNET}
var
  LWord : TIdBytes;
{$ELSE}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
begin
  {$IFDEF DOTNET}
  LWord := System.BitConverter.GetBytes(ASource);
  System.array.Copy(LWord, 0, VDest, ADestIndex, SizeOf(Int64));
  {$ELSE}
  PInt64(@VDest[ADestIndex])^ := ASource;
  {$ENDIF}
end;

procedure CopyTIdIPV6Address(const ASource: TIdIPv6Address; var VDest: TIdBytes; const ADestIndex: Integer);
{$IFDEF DOTNET}
var
  i : Integer;
{$ELSE}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
begin
  {$IFDEF DOTNET}
  for i := 0 to 7 do begin
    CopyTIdWord(ASource[i], VDest, ADestIndex + (i * 2));
  end;
  {$ELSE}
  Move(ASource, VDest[ADestIndex], 16);
  {$ENDIF}
end;

procedure CopyTIdByteArray(const ASource: array of Byte; const ASourceIndex: Integer;
  var VDest: array of Byte; const ADestIndex: Integer; const ALength: Integer);
begin
  {$IFDEF DOTNET}
  System.array.Copy(ASource, ASourceIndex, VDest, ADestIndex, ALength);
  {$ELSE}
  Move(ASource[ASourceIndex], VDest[ADestIndex], ALength);
  {$ENDIF}
end;

procedure CopyTIdString(const ASource: String; var VDest: TIdBytes;
  const ADestIndex: Integer; const ALength: Integer = -1); overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  CopyTIdString(ASource, 1, VDest, ADestIndex, ALength);
end;

procedure CopyTIdString(const ASource: String; const ASourceIndex: Integer;
  var VDest: TIdBytes; const ADestIndex: Integer; const ALength: Integer = -1); overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
  var
  LLength: Integer;
begin
  LLength := IndyLength(ASource, ALength, ASourceIndex);
  if LLength > 0 then
  begin
    // TODO: support UTF-8
    {$IFDEF DOTNET}
    GetEncoder(en7Bit).GetBytes(ASource, ASourceIndex-1, LLength, VDest, ADestIndex);
    {$ELSE}
    Move(ASource[ASourceIndex], VDest[ADestIndex], LLength);
    {$ENDIF}
  end;
end;

procedure DebugOutput(const AText: string);
{$IFDEF WINCE}
var
  wsAText: WideString;
{$ELSE}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
begin
  {$IFDEF KYLIX}
  __write(stderr, AText, Length(AText));
  __write(stderr, EOL, Length(EOL));
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
    {$IFDEF WINCE}
  wsAText := AText;
  OutputDebugString(PWideChar(wsAText));
    {$ELSE}
  OutputDebugString(PChar(AText));
    {$ENDIF}
  {$ENDIF}
  {$IFDEF DOTNET}
  System.Diagnostics.Debug.WriteLine(AText);
  {$ENDIF}
end;

function CurrentThreadId: TIdThreadID;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
{$IFDEF DOTNET}
  {$IFDEF DOTNET2_OR_ABOVE}
  {
  [Warning] IdGlobal.pas(1416): W1000 Symbol 'GetCurrentThreadId'
  is deprecated: 'AppDomain.GetCurrentThreadId has been deprecated because
  it does not provide a stable Id when managed threads are running on fibers
  (aka lightweight threads). To get a stable identifier for a managed thread,
  use the ManagedThreadId property on Thread.
  http://go.microsoft.com/fwlink/?linkid=14202'
  }
  Result := System.Threading.Thread.CurrentThread.ManagedThreadId;
   // Thread.ManagedThreadId;
  {$ENDIF}
  {$IFDEF DOTNET1_1}
  // SG: I'm not sure if this return the handle of the dotnet thread or the handle of the application domain itself (or even if there is a difference)
  Result := AppDomain.GetCurrentThreadId;
  // RLebeau
  // TODO: find if there is something like the following instead:
  // System.Diagnostics.Thread.GetCurrentThread.ID
  // System.Threading.Thread.CurrentThread.ID
  {$ENDIF}
{$ELSE}
  // TODO: is GetCurrentThreadId() available on Linux?
  Result := GetCurrentThreadID;
{$ENDIF}
end;

function CurrentProcessId: TIdPID;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF KYLIXCOMPAT}
  Result := getpid;
  {$ENDIF}
  {$IFDEF USEBASEUNIX}
  Result := fpgetpid;
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  Result := GetCurrentProcessID;
  {$ENDIF}
  {$IFDEF DOTNET}
  Result := System.Diagnostics.Process.GetCurrentProcess.ID;
  {$ENDIF}
end;

function Fetch(var AInput: string; const ADelim: string = IdFetchDelimDefault;
  const ADelete: Boolean = IdFetchDeleteDefault;
  const ACaseSensitive: Boolean = IdFetchCaseSensitiveDefault): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LPos: Integer;
begin
  if ACaseSensitive then begin
    if ADelim = #0 then begin
      // AnsiPos does not work with #0
      LPos := Pos(ADelim, AInput);
    end else begin
      LPos := IndyPos(ADelim, AInput);
    end;
    if LPos = 0 then begin
      Result := AInput;
      if ADelete then begin
        AInput := '';    {Do not Localize}
      end;
    end
    else begin
      Result := Copy(AInput, 1, LPos - 1);
      if ADelete then begin
        //slower Delete(AInput, 1, LPos + Length(ADelim) - 1); because the
        //remaining part is larger than the deleted
        AInput := Copy(AInput, LPos + Length(ADelim), MaxInt);
      end;
    end;
  end else begin
    Result := FetchCaseInsensitive(AInput, ADelim, ADelete);
  end;
end;

function FetchCaseInsensitive(var AInput: string; const ADelim: string;
  const ADelete: Boolean): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LPos: Integer;
begin
  if ADelim = #0 then begin
    // AnsiPos does not work with #0
    LPos := Pos(ADelim, AInput);
  end else begin
    //? may be AnsiUpperCase?
    LPos := IndyPos(UpperCase(ADelim), UpperCase(AInput));
  end;
  if LPos = 0 then begin
    Result := AInput;
    if ADelete then begin
      AInput := '';    {Do not Localize}
    end;
  end else begin
    Result := Copy(AInput, 1, LPos - 1);
    if ADelete then begin
      //faster than Delete(AInput, 1, LPos + Length(ADelim) - 1); because the
      //remaining part is larger than the deleted
      AInput := Copy(AInput, LPos + Length(ADelim), MaxInt);
    end;
  end;
end;

function GetThreadHandle(AThread: TThread): TIdThreadHandle;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF UNIX}
  Result := AThread.ThreadID; // RLebeau: is it right to return an ID where a thread object handle is expected instead?
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  Result := AThread.Handle;
  {$ENDIF}
  {$IFDEF DOTNET}
  Result := AThread.Handle;
  {$ENDIF}
end;

function Ticks: LongWord;
{$IFDEF DOTNET}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
{$IFDEF UNIX}
var
  tv: timeval;
{$ENDIF}
{$IFDEF WIN32_OR_WIN64_OR_WINCE}
var
  nTime, freq: {$IFDEF WINCE}LARGE_INTEGER{$ELSE}Int64{$ENDIF};
{$ENDIF}
begin
  {$IFDEF UNIX}
    {$IFDEF USEBASEUNIX}
  fpgettimeofday(@tv,nil);
    {$ENDIF}
    {$IFDEF KYLIXCOMPAT}
  gettimeofday(tv, nil);
    {$ENDIF}
    {$RANGECHECKS OFF}
  Result := Int64(tv.tv_sec) * 1000 + tv.tv_usec div 1000;
    {
    I've implemented this correctly for now. I'll argue for using
    an int64 internally, since apparently quite some functionality
    (throttle, etc etc) depends on it, and this value may wrap
    at any point in time.
    For Windows: Uptime > 72 hours isn't really that rare any more,
    For Linux: no control over when this wraps.

    IdEcho has code to circumvent the wrap, but its not very good
    to have code for that at all spots where it might be relevant.
    }
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
    // S.G. 27/11/2002: Changed to use high-performance counters as per suggested
    // S.G. 27/11/2002: by David B. Ferguson (david.mcs@ns.sympatico.ca)
    {$IFDEF WINCE}
  if Windows.QueryPerformanceFrequency(@freq) then begin
    if Windows.QueryPerformanceCounter(@nTime) then begin
      Result := Trunc((nTime.QuadPart / Freq.QuadPart) * 1000) and High(LongWord);
      Exit;
    end;
  end;
    {$ELSE}
  if Windows.QueryPerformanceFrequency(freq) then begin
    if Windows.QueryPerformanceCounter(nTime) then begin
      Result := Trunc((nTime / Freq) * 1000) and High(LongWord);
      Exit;
    end;
  end;
    {$ENDIF}
  Result := Windows.GetTickCount;
  {$ENDIF}
  {$IFDEF DOTNET}
  // Must cast to a cardinal
  //
  // http://lists.ximian.com/archives/public/mono-bugs/2003-November/009293.html
  // Other references in Google.
  // Bug in .NET. It acts like Win32, not as per .NET docs but goes negative after 25 days.
  //
  // There may be a problem in the future if .NET changes this to work as docced with 25 days.
  // Will need to check our routines then and somehow counteract / detect this.
  // One possibility is that we could just wrap it ourselves in this routine.
  Result := LongWord(Environment.TickCount);
  {$ENDIF}
end;

function GetTickDiff(const AOldTickCount, ANewTickCount: LongWord): LongWord;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {This is just in case the TickCount rolled back to zero}
  if ANewTickCount >= AOldTickCount then begin
    Result := ANewTickCount - AOldTickCount;
  end else begin
    Result := High(LongWord) - AOldTickCount + ANewTickCount;
  end;
end;

{$IFNDEF DOTNET}
function ServicesFilePath: string;
var
  sLocation: string;
begin
  {$IFDEF LINUX}
  sLocation := '/etc/';  // assume Berkeley standard placement   {do not localize}
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  SetLength(sLocation, MAX_PATH);
  SetLength(sLocation, GetWindowsDirectory(PChar(sLocation), MAX_PATH));
  sLocation := IndyIncludeTrailingPathDelimiter(sLocation);
  if Win32Platform = VER_PLATFORM_WIN32_NT then begin
    sLocation := sLocation + 'system32\drivers\etc\'; {do not localize}
  end;
  {$ENDIF}
  Result := sLocation + 'services'; {do not localize}
end;
{$ENDIF}


{$IFNDEF DOTNET}
// IdPorts returns a list of defined ports in /etc/services
function IdPorts: TList;
var
  s: string;
  {$IFDEF ByteCompareSets}
  idx, i, iPrev, iPosSlash: Byte;
  {$ELSE}
  idx, i, iPrev, iPosSlash: Integer;
  {$ENDIF}
  sl: TStringList;
begin
  if GIdPorts = nil then
  begin
    GIdPorts := TList.Create;
    sl := TStringList.Create;
    try
      sl.LoadFromFile(ServicesFilePath);  {do not localize}
      iPrev := 0;
      for idx := 0 to sl.Count - 1 do
      begin
        s := sl[idx];
        iPosSlash := IndyPos('/', s);   {do not localize}
        if (iPosSlash > 0) and (not (IndyPos('#', s) in [1..iPosSlash])) then {do not localize}
        begin // presumably found a port number that isn't commented    {Do not Localize}
          i := iPosSlash;
          repeat
            Dec(i);
            if i = 0 then begin
              raise EIdCorruptServicesFile.CreateFmt(RSCorruptServicesFile, [ServicesFilePath]); {do not localize}
            end;
          //TODO: Make Whitespace a function to elim warning
          until Ord(s[i]) in WhiteSpace;
          i := IndyStrToInt(Copy(s, i+1, iPosSlash-i-1));
          if i <> iPrev then begin
            GIdPorts.Add(TObject(i));
          end;
          iPrev := i;
        end;
      end;
    finally
      sl.Free;
    end;
  end;
  Result := GIdPorts;
end;
{$ENDIF}

function iif(ATest: Boolean; const ATrue: Integer; const AFalse: Integer): Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if ATest then begin
    Result := ATrue;
  end else begin
    Result := AFalse;
  end;
end;

function iif(ATest: Boolean; const ATrue: string; const AFalse: string): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if ATest then begin
    Result := ATrue;
  end else begin
    Result := AFalse;
  end;
end;

function iif(ATest: Boolean; const ATrue: Boolean; const AFalse: Boolean): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if ATest then begin
    Result := ATrue;
  end else begin
    Result := AFalse;
  end;
end;

function InMainThread: Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  Result := System.Threading.Thread.CurrentThread = MainThread;
  {$ELSE}
  Result := GetCurrentThreadID = MainThreadID;
  {$ENDIF}
end;

procedure WriteMemoryStreamToStream(Src: TMemoryStream; Dest: TStream; Count: Int64);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  Dest.Write(Src.Memory, Count);
  {$ELSE}
  Dest.Write(Src.Memory^, Count);
  {$ENDIF}
end;

{$IFNDEF DotNetExclude}
function IsCurrentThread(AThread: TThread): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := AThread.ThreadID = GetCurrentThreadID;
end;
{$ENDIF}

//convert a dword into an IPv4 address in dotted form
function MakeDWordIntoIPv4Address(const ADWord: LongWord): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := IntToStr((ADWord shr 24) and $FF) + '.';
  Result := Result + IntToStr((ADWord shr 16) and $FF) + '.';
  Result := Result + IntToStr((ADWord shr 8) and $FF) + '.';
  Result := Result + IntToStr(ADWord and $FF);
end;

function IsAlpha(const AChar: Char): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  // Do not use IsCharAlpha or IsCharAlphaNumeric - they are Win32 routines
  Result := ((AChar >= 'a') and (AChar <= 'z')) or ((AChar >= 'A') and (AChar <= 'Z')); {Do not Localize}
end;

function IsAlpha(const AString: String): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  i: Integer;
begin
  Result := False;
  if AString <> '' then begin
    for i := 1 to Length(AString) do begin
      if not IsAlpha(AString[i]) then begin
        Exit;
      end;
    end;
    Result := True;
  end;
end;

function IsAlphaNumeric(const AChar: Char): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  // Do not use IsCharAlpha or IsCharAlphaNumeric - they are Win32 routines
  Result := IsAlpha(AChar) or IsNumeric(AChar);
end;

function IsAlphaNumeric(const AString: String): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  i: Integer;
begin
  Result := False;
  if AString <> '' then begin
    for i := 1 to Length(AString) do begin
      if not IsAlphaNumeric(AString[i]) then begin
        Exit;
      end;
    end;
    Result := True;
  end;
end;

function IsOctal(const AChar: Char): Boolean; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := (AChar >= '0') and (AChar <= '7') {Do not Localize}
end;

function IsOctal(const AString: string): Boolean; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  i: Integer;
begin
  Result := False;
  if AString <> '' then begin
    for i := 1 to Length(AString) do begin
      if not IsOctal(AString[i]) then begin
        Exit;
      end;
    end;
    Result := True;
  end;
end;

function IsHexidecimal(const AChar: Char): Boolean; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := ((AChar >= '0') and (AChar <= '9')) {Do not Localize}
   or ((AChar >= 'A') and (AChar <= 'F')) {Do not Localize}
   or ((AChar >= 'a') and (AChar <= 'f')); {Do not Localize}
end;

function IsHexidecimal(const AString: string): Boolean; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  i: Integer;
begin
  Result := False;
  if AString <> '' then begin
    for i := 1 to Length(AString) do begin
      if not IsHexidecimal(AString[i]) then begin
        Exit;
      end;
    end;
    Result := True;
  end;
end;

{$HINTS OFF}
function IsNumeric(const AString: string): Boolean;
var
  LCode: Integer;
  LVoid: Int64;
begin
  Val(AString, LVoid, LCode);
  Result := LCode = 0;
end;
{$HINTS ON}

function IsNumeric(const AString: string; const ALength: Integer; const AIndex: Integer = 1): Boolean;
var
  I: Integer;
  LLen: Integer;
begin
  Result := False;
  LLen := IndyLength(AString, ALength, AIndex);
  if LLen > 0 then begin
    for I := 0 to LLen-1 do begin
      if not IsNumeric(AString[AIndex+i]) then begin
        Exit;
      end;
    end;
    Result := True;
  end;
end;

function IsNumeric(const AChar: Char): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  // Do not use IsCharAlpha or IsCharAlphaNumeric - they are Win32 routines
  Result := (AChar >= '0') and (AChar <= '9'); {Do not Localize}
end;

{
This is an adaptation of the StrToInt64 routine in SysUtils.
We had to adapt it to work with Int64 because the one with Integers
can not deal with anything greater than MaxInt and IP addresses are
always $0-$FFFFFFFF (unsigned)
}
{$IFNDEF VCL11ORABOVE}
function StrToInt64Def(const S: string; Default: Integer): Int64;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  E: Integer;
begin
  Val(S, Result, E);
  if E <> 0 then begin
    Result := Default;
  end;
end;
{$ENDIF}

function IPv4MakeLongWordInRange(const AInt: Int64; const A256Power: Integer): LongWord;
{$IFDEF USEINLINE}inline;{$ENDIF}
//Note that this function is only for stripping off some extra bits
//from an address that might appear in some spam E-Mails.
begin
  case A256Power of
    4: Result := (AInt and POWER_4);
    3: Result := (AInt and POWER_3);
    2: Result := (AInt and POWER_2);
  else
  {$IFDEF FPC}
    Result := Lo(AInt and POWER_1);
  {$ELSE}
    Result := AInt and POWER_1;
  {$ENDIF}
  end;
end;

function IPv4ToDWord(const AIPAddress: string): LongWord; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LErr: Boolean;
begin
  Result := IPv4ToDWord(AIPAddress, LErr);
end;

function IPv4ToDWord(const AIPAddress: string; var VErr: Boolean): LongWord; overload;
var
{$IFDEF DOTNET}
  AIPaddr: IPAddress;
{$ELSE}
  LBuf, LBuf2: string;
  L256Power: Integer;
  LParts: Integer; //how many parts should we process at a time
{$ENDIF}
begin
  VErr := True;
  Result := 0;
{$IFDEF DOTNET}
  AIPaddr := System.Net.IPAddress.Parse(AIPAddress);
  try
    try
      if AIPaddr.AddressFamily = Addressfamily.InterNetwork then begin
        {$IFDEF DOTNET2_OR_ABOVE}
        //This looks funny but it's just to circvument a warning about
        //a depreciated property in AIPaddr.  We can safely assume
        //this is an IPv4 address.
        Result := BytesToLongWord( AIPAddr.GetAddressBytes,0);
        {$ENDIF}
        {$IFDEF DOTNET1_1}
        Result := AIPaddr.Address;
        {$ENDIF}
        VErr := False;
      end;
    except
      VErr := True;
    end;
  finally
    FreeAndNil(AIPaddr);
  end;
{$ELSE}
  // S.G. 11/8/2003: Added overflow checking disabling and change multiplys by SHLs.
  // Locally disable overflow checking so we can safely use SHL and SHR
  {$IFOPT Q+} // detect previous setting
  {$DEFINE _QPlusWasEnabled}
  {$Q-}
  {$ENDIF}
  L256Power := 4;
  LBuf2 := AIPAddress;
  repeat
    LBuf := Fetch(LBuf2, '.');
    if LBuf = '' then begin
      Break;
    end;
    //We do things this way because we have to treat
    //IP address parts differently than a whole number
    //and sometimes, there can be missing periods.
    if (LBuf2 = '') and (L256Power > 1) then begin
      LParts := L256Power;
      Result := Result shl (L256Power SHL 3);
    end else begin
      LParts := 1;
      Result := Result shl 8;
    end;
    if TextStartsWith(LBuf, HEXPREFIX) then begin
      //this is a hexideciaml number
      if not IsHexidecimal(Copy(LBuf, 3, MaxInt)) then begin
        Exit;
      end;
      Result := Result + IPv4MakeLongWordInRange(StrToInt64Def(LBuf, 0), LParts);
    end else begin
      if not IsNumeric(LBuf) then begin
        //There was an error meaning an invalid IP address
        Exit;
      end;
      if TextStartsWith(LBuf, '0') and IsOctal(LBuf) then begin {do not localize}
        //this is octal
        Result := Result + IPv4MakeLongWordInRange(OctalToInt64(LBuf), LParts);
      end else begin
        //this must be a decimal
        Result :=  Result + IPv4MakeLongWordInRange(StrToInt64Def(LBuf, 0), LParts);
      end;
    end;
    Dec(L256Power);
  until False;
  VErr := False;
  // Restore overflow checking
  {$IFDEF _QPlusWasEnabled} // detect previous setting
  {$UNDEF _QPlusWasEnabled}
  {$Q-}
  {$ENDIF}
{$ENDIF}
end;

function IPv6AddressToStr(const AValue: TIdIPv6Address): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  i: Integer;
begin
  Result := '';
  for i := 0 to 7 do begin
    Result := Result + ':' + IntToHex(AValue[i], 4);
  end;
end;

function MakeCanonicalIPv4Address(const AAddr: string): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LErr: Boolean;
  LIP: LongWord;
begin
  LIP := IPv4ToDWord(AAddr, LErr);
  if LErr then begin
    Result := '';
  end else begin
    Result := MakeDWordIntoIPv4Address(LIP);
  end;
end;

function MakeCanonicalIPv6Address(const AAddr: string): string;
// return an empty string if the address is invalid,
// for easy checking if its an address or not.
var
  p, i: Integer;
  {$IFDEF BYTECOMPARESETS}
  dots, colons: Byte;
  {$ELSE}
  dots, colons: Integer;
  {$ENDIF}
  colonpos: array[1..8] of Integer;
  dotpos: array[1..3] of Integer;
  LAddr: string;
  num: Integer;
  haddoublecolon: boolean;
  fillzeros: Integer;
begin
  Result := ''; // error
  LAddr := AAddr;
  if Length(LAddr) = 0 then begin
    Exit;
  end;
  if TextStartsWith(LAddr, ':') then begin
    LAddr := '0' + LAddr;
  end;
  if TextEndsWith(LAddr, ':') then begin
    LAddr := LAddr + '0';
  end;
  dots := 0;
  colons := 0;
  for p := 1 to Length(LAddr) do begin
    case LAddr[p] of
      '.': begin
              Inc(dots);
              if dots < 4 then begin
                dotpos[dots] := p;
              end else begin
                Exit; // error in address
              end;
            end;
      ':': begin
              Inc(colons);
              if colons < 8 then begin
                colonpos[colons] := p;
              end else begin
                Exit; // error in address
              end;
            end;
      'a'..'f',
      'A'..'F': if dots>0 then Exit;
        // allow only decimal stuff within dotted portion, ignore otherwise
      '0'..'9': ; // do nothing
    else
      Exit; // error in address
    end; // case
  end; // for
  if not (dots in [0,3]) then begin
    Exit; // you have to write 0 or 3 dots...
  end;
  if dots = 3 then begin
    if not (colons in [2..6]) then begin
      Exit; // must not have 7 colons if we have dots
    end;
    if colonpos[colons] > dotpos[1] then begin
      Exit; // x:x:x.x:x:x is not valid
    end;
  end else begin
    if not (colons in [2..7]) then begin
      Exit; // must at least have two colons
    end;
  end;

  // now start :-)
  num := IndyStrToInt('$'+Copy(LAddr, 1, colonpos[1]-1), -1);
  if (num < 0) or (num > 65535) then begin
    Exit; // huh? odd number...
  end;
  Result := IntToHex(num, 1) + ':';

  haddoublecolon := False;
  for p := 2 to colons do begin
    if colonpos[p - 1] = colonpos[p]-1 then begin
      if haddoublecolon then begin
        Result := '';
        Exit; // only a single double-dot allowed!
      end;
      haddoublecolon := True;
      fillzeros := 8 - colons;
      if dots > 0 then begin
        Dec(fillzeros, 2);
      end;
      for i := 1 to fillzeros do begin
        Result := Result + '0:'; {do not localize}
      end;
    end else begin
      num := IndyStrToInt('$' + Copy(LAddr, colonpos[p - 1] + 1, colonpos[p] - colonpos[p - 1] - 1), -1);
      if (num < 0) or (num > 65535) then begin
        Result := '';
        Exit; // huh? odd number...
      end;
      Result := Result + IntToHex(num,1) + ':';
    end;
  end; // end of colon separated part

  if dots = 0 then begin
    num := IndyStrToInt('$' + Copy(LAddr, colonpos[colons] + 1, MaxInt), -1);
    if (num < 0) or (num > 65535) then begin
      Result := '';
      Exit; // huh? odd number...
    end;
    Result := Result + IntToHex(num,1) + ':';
  end;

  if dots > 0 then begin
    num := IndyStrToInt(Copy(LAddr, colonpos[colons] + 1, dotpos[1] - colonpos[colons] -1),-1);
    if (num < 0) or (num > 255) then begin
      Result := '';
      Exit;
    end;
    Result := Result + IntToHex(num, 2);
    num := IndyStrToInt(Copy(LAddr, dotpos[1]+1, dotpos[2]-dotpos[1]-1),-1);
    if (num < 0) or (num > 255) then begin
      Result := '';
      Exit;
    end;
    Result := Result + IntToHex(num, 2) + ':';

    num := IndyStrToInt(Copy(LAddr, dotpos[2] + 1, dotpos[3] - dotpos[2] -1),-1);
    if (num < 0) or (num > 255) then begin
      Result := '';
      Exit;
    end;
    Result := Result + IntToHex(num, 2);
    num := IndyStrToInt(Copy(LAddr, dotpos[3] + 1, 3), -1);
    if (num < 0) or (num > 255) then begin
      Result := '';
      Exit;
    end;
    Result := Result + IntToHex(num, 2) + ':';
  end;
  SetLength(Result, Length(Result) - 1);
end;

procedure IPv6ToIdIPv6Address(const AIPAddress: String; var VAddress: TIdIPv6Address);
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LErr: Boolean;
begin
  IPv6ToIdIPv6Address(AIPAddress, VAddress, LErr);
  if LErr then begin
    raise EIdInvalidIPv6Address.CreateFmt(RSInvalidIPv6Address, [AIPAddress]);
  end;
end;

procedure IPv6ToIdIPv6Address(const AIPAddress: String; var VAddress: TIdIPv6Address; var VErr: Boolean);
var
  LAddress: string;
  I: Integer;
begin
  LAddress := MakeCanonicalIPv6Address(AIPAddress);
  VErr := (LAddress = '');
  if VErr then begin
    Exit;
  end;
  for I := 0 to 7 do begin
    VAddress[I] := IndyStrToInt('$' + Fetch(LAddress,':'), 0);
  end;
end;

function IndyMax(const AValueOne, AValueTwo: Int64): Int64;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if AValueOne < AValueTwo then begin
    Result := AValueTwo;
  end else begin
    Result := AValueOne;
  end;
end;

function IndyMax(const AValueOne, AValueTwo: LongInt): LongInt;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if AValueOne < AValueTwo then begin
    Result := AValueTwo;
  end else begin
    Result := AValueOne;
  end;
end;

function IndyMax(const AValueOne, AValueTwo: Word): Word;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if AValueOne < AValueTwo then begin
    Result := AValueTwo;
  end else begin
    Result := AValueOne;
  end;
end;

{$IFNDEF DOTNET}
function MemoryPos(const ASubStr: string; MemBuff: PChar; MemorySize: Integer): Integer;
var
  LSearchLength: Integer;
  LS1: Integer;
  LChar: Char;
  LPS,LPM: PChar;
begin
  LSearchLength := Length(ASubStr);
  if (LSearchLength = 0) or (LSearchLength > MemorySize) then begin
    Result := 0;
    Exit;
  end;

  LChar := PChar(Pointer(ASubStr))^; //first char
  LPS := PChar(Pointer(ASubStr))+1;//tail string
  LPM := MemBuff;
  LS1 := LSearchLength-1;
  LSearchLength := MemorySize-LS1;//MemorySize-LS+1
  if LS1 = 0 then begin //optimization for freq used LF
    while LSearchLength>0 do begin
      if LPM^ = LChar then begin
        Result := LPM-MemBuff + 1;
        Exit;
      end;
      Inc(LPM);
      Dec(LSearchLength);
    end;//while
  end else begin
    while LSearchLength > 0 do begin
      if LPM^ = LChar then begin
        Inc(LPM);
        if CompareMem(LPM, LPS, LS1) then begin
          Result := LPM - MemBuff;
          Exit;
        end;
      end
      else begin
        Inc(LPM);
      end;
      Dec(LSearchLength);
    end;//while
  end;//if OneChar
  Result := 0;
End;
{$ENDIF}

function IndyMin(const AValueOne, AValueTwo: LongInt): LongInt;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if AValueOne > AValueTwo then begin
    Result := AValueTwo;
  end else begin
    Result := AValueOne;
  end;
end;

function IndyMin(const AValueOne, AValueTwo: Int64): Int64;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if AValueOne > AValueTwo then begin
    Result := AValueTwo;
  end else begin
    Result := AValueOne;
  end;
end;

function IndyMin(const AValueOne, AValueTwo: Word): Word;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if AValueOne > AValueTwo then begin
    Result := AValueTwo;
  end else begin
    Result := AValueOne;
  end;
end;

function PosIdx(const ASubStr, AStr: AnsiString; AStartPos: LongWord): LongWord;
{$IFDEF DOTNET}
  {$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if AStartPos = 0 then begin
    AStartPos := 1;
  end;
  Result := Pos(ASubStr, Copy(AStr, AStartPos, MaxInt));
  if Result <> 0 then begin
    Inc(Result, AStartPos - 1);
  end;
{$ELSE}
  // use best register allocation on Win32
  function FindStr(ALStartPos, EndPos: LongWord; StartChar: AnsiChar; const ALStr: AnsiString): LongWord;
  begin
    for Result := ALStartPos to EndPos do
      if ALStr[Result] = StartChar then
        Exit;
    Result := 0;
  end;

  // use best register allocation on Win32
  function FindNextStr(ALStartPos, EndPos: LongWord; const ALStr, ALSubStr: AnsiString): LongWord;
  begin
    for Result := ALStartPos + 1 to EndPos do
      if ALStr[Result] <> ALSubStr[Result - ALStartPos + 1] then
        Exit;
    Result := 0;
  end;

var
  StartChar: AnsiChar;
  LenSubStr, LenStr: LongWord;
  EndPos: LongWord;
begin
  if AStartPos = 0 then
    AStartPos := 1;
  Result := 0;
  LenSubStr := Length(ASubStr);
  LenStr := Length(AStr);
  if (LenSubStr = 0) or (AStr = '') or (LenSubStr > LenStr - (AStartPos - 1)) then begin
    Exit;
  end;
  StartChar := ASubStr[1];
  EndPos := LenStr - LenSubStr + 1;
  if LenSubStr = 1 then begin
    Result := FindStr(AStartPos, EndPos, StartChar, AStr)
  end else
  begin
    repeat
      Result := FindStr(AStartPos, EndPos, StartChar, AStr);
      if Result = 0 then begin
        Break;
      end;
      AStartPos := Result;
      Result := FindNextStr(Result, AStartPos + LenSubStr - 1, AStr, ASubStr);
      if Result = 0 then
      begin
        Result := AStartPos;
        Exit;
      end;
      Inc(AStartPos);
    until False;
  end;
{$ENDIF}
end;

function SBPos(const Substr, S: string): LongInt;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  // Necessary because of "Compiler magic"
  Result := Pos(Substr, S);
end;

{$IFNDEF DOTNET}
//Don't rename this back to AnsiPos because that conceals a symbol in Windows
function InternalAnsiPos(const Substr, S: string): LongInt;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := SysUtils.AnsiPos(Substr, S);
end;
{$ENDIF}

procedure IndySetThreadPriority(AThread: TThread; const APriority: TIdThreadPriority; const APolicy: Integer = -MaxInt);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF UNIX}
    {$IFDEF KYLIXCOMPAT}
      {$IFDEF INTTHREADPRIORITY}
        // Linux only allows root to adjust thread priorities, so we just ignore this call in Linux?
        // actually, why not allow it if root
        // and also allow setting *down* threadpriority (anyone can do that)
        // note that priority is called "niceness" and positive is lower priority
   if (getpriority(PRIO_PROCESS, 0) < APriority) or (geteuid = 0) then begin
     setpriority(PRIO_PROCESS, 0, APriority);
   end;
      {$ELSE}
   AThread.Priority := APriority;
      {$ENDIF}
    {$ENDIF}
    {$IFDEF USEBASEUNIX}
      // Linux only allows root to adjust thread priorities, so we just ingnore this call in Linux?
      // actually, why not allow it if root
      // and also allow setting *down* threadpriority (anyone can do that)
      // note that priority is called "niceness" and positive is lower priority
  if (fpgetpriority(PRIO_PROCESS, 0) < cint(APriority)) or (fpgeteuid = 0) then begin
    fpsetpriority(PRIO_PROCESS, 0, cint(APriority));
  end;
    {$ENDIF}
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  AThread.Priority := APriority;
  {$ENDIF}
  {$IFDEF DOTNET}
  AThread.Priority := APriority;
  {$ENDIF}
end;

procedure IndySleep(ATime: LongWord);
{$IFNDEF UNIX}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ELSE}
var
  LTime: TTimeVal;
{$ENDIF}
begin
  {$IFDEF UNIX}
    // *nix: Is there are reason for not using nanosleep?

    // what if the user just calls sleep? without doing anything...
    // cannot use GStack.WSSelectRead(nil, ATime)
    // since no readsocketlist exists to get the fdset
  LTime.tv_sec := ATime div 1000;
  LTime.tv_usec := (ATime mod 1000) * 1000;
    {$IFDEF KYLIXCOMPAT}
  Libc.Select(0, nil, nil, nil, @LTime);
    {$ENDIF}
    {$IFDEF USEBASEUNIX}
  fpSelect(0, nil, nil, nil, @LTime);
    {$ENDIF}
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  Windows.Sleep(ATime);
  {$ENDIF}
  {$IFDEF DOTNET}
  Thread.Sleep(ATime);
  {$ENDIF}
end;

procedure SplitColumnsNoTrim(const AData: string; AStrings: TStrings; const ADelim: string);
var
  i: Integer;
  LDelim: Integer; //delim len
  LLeft: string;
  {$IFDEF DOTNET}
  LLastPos: Integer;
  {$ELSE}
  LLastPos: PtrInt;
  //note that we use PtrInt instead of Integer because in FPC,
  //you can't assume a pointer will be exactly 4 bytes.  It could be 8 or possibly
  //2 bytes.  Remember that that supports operating systems with versions for different
  //architectures
  {$ENDIF}
begin
  Assert(Assigned(AStrings));
  AStrings.Clear;
  LDelim := Length(ADelim);
  LLastPos := 1;

  i := Pos(ADelim, AData);
  while I > 0 do begin
    LLeft := Copy(AData, LLastPos, I - LLastPos); //'abc d' len:=i(=4)-1    {Do not Localize}
    if LLeft <> '' then begin    {Do not Localize}
      {$IFDEF DOTNET}
      AStrings.AddObject(LLeft, TObject(LLastPos));
      {$ELSE}
      AStrings.AddObject(LLeft, TObject(PtrInt(LLastPos)));
      {$ENDIF}
    end;
    LLastPos := I + LDelim; //first char after Delim
    i := PosIdx(ADelim, AData, LLastPos);
  end;
  if LLastPos <= Length(AData) then begin
    {$IFDEF DOTNET}
    AStrings.AddObject(Copy(AData, LLastPos, MaxInt), TObject(LLastPos));
    {$ELSE}
    AStrings.AddObject(Copy(AData, LLastPos, MaxInt), TObject(PtrInt(LLastPos)));
    {$ENDIF}
  end;
end;

procedure SetThreadName(const AName: string);
{$IFDEF WIN32_OR_WIN64_OR_WINCE}
  {$IFDEF ALLOW_NAMED_THREADS}
type
  TThreadNameInfo = record
    RecType: LongWord;  // Must be 0x1000
    Name: PChar;        // Pointer to name (in user address space)
    ThreadID: LongWord; // Thread ID (-1 indicates caller thread)
    Flags: LongWord;    // Reserved for future use. Must be zero
  end;
var
  LThreadNameInfo: TThreadNameInfo;
  {$ENDIF}
{$ENDIF}
begin
{$IFDEF ALLOW_NAMED_THREADS}
  {$IFDEF DOTNET}
  // cannot rename a previously-named thread
  if System.Threading.Thread.CurrentThread.Name = nil then begin
    System.Threading.Thread.CurrentThread.Name := AName;
  end;
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64}
  with LThreadNameInfo do begin
    RecType := $1000;
    Name := PChar(AName);
    ThreadID := $FFFFFFFF;
    Flags := 0;
  end;
  try
    // This is a wierdo Windows way to pass the info in
    RaiseException($406D1388, 0, SizeOf(LThreadNameInfo) div SizeOf(LongWord),
      PDWord(@LThreadNameInfo));
  except
  end;
  {$ENDIF}
  // Do nothing. No support in this compiler for it.
{$ENDIF}
end;

procedure SplitColumns(const AData: string; AStrings: TStrings; const ADelim: string);
var
  i: Integer;
  LData: string;
  LDelim: Integer; //delim len
  LLeft: string;
  LLastPos: Integer;
  LLeadingSpaceCnt: Integer;
Begin
  Assert(Assigned(AStrings));
  AStrings.Clear;
  LDelim := Length(ADelim);
  LLastPos := 1;
  LData := Trim(AData);

  if LData = '' then begin //if WhiteStr
    Exit;
  end;

  LLeadingSpaceCnt := 0;
  while AData[LLeadingSpaceCnt + 1] <= #32 do begin
    Inc(LLeadingSpaceCnt);
  end;

  i := Pos(ADelim, LData);
  while I > 0 do begin
    LLeft := Copy(LData, LLastPos, I - LLastPos); //'abc d' len:=i(=4)-1    {Do not Localize}
    if LLeft > '' then begin    {Do not Localize}
      AStrings.AddObject(Trim(LLeft), TObject(LLastPos + LLeadingSpaceCnt));
    end;
    LLastPos := I + LDelim; //first char after Delim
    i := PosIdx (ADelim, LData, LLastPos);
  end;//while found
  if LLastPos <= Length(LData) then begin
    AStrings.AddObject(Trim(Copy(LData, LLastPos, MaxInt)), TObject(LLastPos + LLeadingSpaceCnt));
  end;
end;

{$IFDEF DOTNET}
  {$IFNDEF DOTNET2}

{ TEvent }

constructor TEvent.Create(EventAttributes: IntPtr; ManualReset, InitialState: Boolean; const Name: string);
begin
  inherited Create;
  // Name not used
  if ManualReset then begin
    FEvent := ManualResetEvent.Create(InitialState);
  end else begin
    FEvent := AutoResetEvent.Create(InitialState);
  end;
end;

constructor TEvent.Create;
begin
  Create(nil, True, False, '');    {Do not Localize}
end;

destructor TEvent.Destroy;
begin
  if Assigned(FEvent) then begin
    FEvent.Close;
  end;
  FreeAndNil(FEvent);
  inherited Destroy;
end;

procedure TEvent.SetEvent;
begin
  if FEvent is ManualResetEvent then begin
    ManualResetEvent(FEvent).&Set;
  end else begin
    AutoResetEvent(FEvent).&Set;
  end;
end;

procedure TEvent.ResetEvent;
begin
  if FEvent is ManualResetEvent then begin
    ManualResetEvent(FEvent).Reset;
  end else begin
    AutoResetEvent(FEvent).Reset;
  end;
end;

function TEvent.WaitFor(Timeout: LongWord): TWaitResult;
var
  Passed: Boolean;
begin
  try
    if Timeout = INFINITE then begin
      Passed := FEvent.WaitOne;
    end else begin
      Passed := FEvent.WaitOne(Timeout, True);
    end;
    if Passed then begin
      Result := wrSignaled;
    end else begin
      Result := wrTimeout;
    end;
  except
    Result := wrError;
  end;
end;

{ TCriticalSection }

procedure TCriticalSection.Acquire;
begin
  Enter;
end;

procedure TCriticalSection.Release;
begin
  Leave;
end;

function TCriticalSection.TryEnter: Boolean;
begin
  Result := System.Threading.Monitor.TryEnter(Self);
end;

procedure TCriticalSection.Enter;
begin
  System.Threading.Monitor.Enter(Self);
end;

procedure TCriticalSection.Leave;
begin
  System.Threading.Monitor.Exit(Self);
end;
   {$ENDIF}
{$ENDIF}

{ TIdLocalEvent }

constructor TIdLocalEvent.Create(const AInitialState: Boolean = False; const AManualReset: Boolean = False);
begin
  inherited Create(nil, AManualReset, AInitialState, '');    {Do not Localize}
end;

function TIdLocalEvent.WaitForEver: TWaitResult;
begin
  Result := WaitFor(Infinite);
end;

{ TIdList }

{$IFNDEF VCL6ORABOVE}
procedure TIdExtList.Assign(AList: TList);
var
  I: Integer;
begin
  Clear;
  Capacity := AList.Capacity;
  for I := 0 to AList.Count - 1 do
    Add(AList.Items[I]);
end;
{$ENDIF}

procedure ToDo;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  EIdException.Toss('To do item undone.'); {do not localize}
end;

// RLebeau: the following three functions are utility functions
// that determine the usable amount of data in various buffer types.
// There are many operations in Indy that allow the user to specify
// data sizes, or to have Indy calculate it.  So these functions
// help reduce code duplication.

function IndyLength(const ABuffer: String; const ALength: Integer = -1; const AIndex: Integer = 1): Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LAvailable: Integer;
begin
  Assert(AIndex >= 1);
  LAvailable := IndyMax(Length(ABuffer)-AIndex+1, 0);
  if ALength < 0 then begin
    Result := LAvailable;
  end else begin
    Result := IndyMin(LAvailable, ALength);
  end;
end;

function IndyLength(const ABuffer: TIdBytes; const ALength: Integer = -1; const AIndex: Integer = 0): Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LAvailable: Integer;
begin
  Assert(AIndex >= 0);
  LAvailable := IndyMax(Length(ABuffer)-AIndex, 0);
  if ALength < 0 then begin
    Result := LAvailable;
  end else begin
    Result := IndyMin(LAvailable, ALength);
  end;
end;

function IndyLength(const ABuffer: TStream; const ALength: Int64 = -1): Int64; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LAvailable: Int64;
begin
  LAvailable := IndyMax(ABuffer.Size - ABuffer.Position, 0);
  if ALength < 0 then begin
    Result := LAvailable;
  end else begin
    Result := IndyMin(LAvailable, ALength);
  end;
end;

const
  wdays: array[1..7] of string = ('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'); {do not localize}
  monthnames: array[1..12] of string = ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', {do not localize}
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'); {do not localize}

{$IFDEF TFormatSettings}
//Delphi5 does not have TFormatSettings
//this should be changed to a singleton?
function GetEnglishSetting: TFormatSettings;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result.CurrencyFormat := $00; // 0 = '$1'
  Result.NegCurrFormat := $00; //0 = '($1)'
  Result.CurrencyString := '$';
  Result.CurrencyDecimals := 2;

  Result.ThousandSeparator := ',';
  Result.DecimalSeparator := '.';

  Result.DateSeparator := '/';
  Result.ShortDateFormat := 'M/d/yyyy';
  Result.LongDateFormat := 'dddd, MMMM dd, yyyy';

  Result.TimeSeparator := ':';
  Result.TimeAMString := 'AM';
  Result.TimePMString := 'PM';
  Result.LongTimeFormat := 'h:mm:ss AMPM';
  Result.ShortTimeFormat := 'h:mm AMPM';

  Result.ShortMonthNames[1] := monthnames[1]; //'Jan';
  Result.ShortMonthNames[2] := monthnames[2]; //'Feb';
  Result.ShortMonthNames[3] := monthnames[3]; //'Mar';
  Result.ShortMonthNames[4] := monthnames[4]; //'Apr';
  Result.ShortMonthNames[5] := monthnames[5]; //'May';
  Result.ShortMonthNames[6] := monthnames[6]; //'Jun';
  Result.ShortMonthNames[7] := monthnames[7]; //'Jul';
  Result.ShortMonthNames[8] := monthnames[8]; //'Aug';
  Result.ShortMonthNames[9] := monthnames[9]; //'Sep';
  Result.ShortMonthNames[10] := monthnames[10];// 'Oct';
  Result.ShortMonthNames[11] := monthnames[11]; //'Nov';
  Result.ShortMonthNames[12] := monthnames[12]; //'Dec';

  Result.LongMonthNames[1] := 'January';
  Result.LongMonthNames[2] := 'February';
  Result.LongMonthNames[3] := 'March';
  Result.LongMonthNames[4] := 'April';
  Result.LongMonthNames[5] := 'May';
  Result.LongMonthNames[6] := 'June';
  Result.LongMonthNames[7] := 'July';
  Result.LongMonthNames[8] := 'August';
  Result.LongMonthNames[9] := 'September';
  Result.LongMonthNames[10] := 'October';
  Result.LongMonthNames[11] := 'November';
  Result.LongMonthNames[12] := 'December';

  Result.ShortDayNames[1] := wdays[1]; //'Sun';
  Result.ShortDayNames[2] := wdays[2]; //'Mon';
  Result.ShortDayNames[3] := wdays[3]; //'Tue';
  Result.ShortDayNames[4] := wdays[4]; //'Wed';
  Result.ShortDayNames[5] := wdays[5]; //'Thu';
  Result.ShortDayNames[6] := wdays[6]; //'Fri';
  Result.ShortDayNames[7] := wdays[7]; //'Sat';

  Result.LongDayNames[1] := 'Sunday';
  Result.LongDayNames[2] := 'Monday';
  Result.LongDayNames[3] := 'Tuesday';
  Result.LongDayNames[4] := 'Wednesday';
  Result.LongDayNames[5] := 'Thursday';
  Result.LongDayNames[6] := 'Friday';
  Result.LongDayNames[7] := 'Saturday';

  Result.ListSeparator := ',';
end;
{$ENDIF}

function IndyFormat(const AFormat: string; const Args: array of const): string;
begin
  {$IFDEF TFormatSettings}
  Result := SysUtils.Format(AFormat, Args, GetEnglishSetting);
  {$ELSE}
  //Is there a way to get delphi5 to use locale in format? something like:
  //  SetThreadLocale(TheNewLocaleId);
  //  GetFormatSettings;
  //  Application.UpdateFormatSettings := False; //needed?
  //  format()
  //  set locale back to prior
  Result := SysUtils.Format(AFormat, Args);
  {$ENDIF}
end;

function DateTimeGMTToHttpStr(const GMTValue: TDateTime) : String;
// should adhere to RFC 2616
var
  wDay,
  wMonth,
  wYear: Word;
begin
  DecodeDate(GMTValue, wYear, wMonth, wDay);
  Result := IndyFormat('%s, %.2d %s %.4d %s %s',    {do not localize}
                   [wdays[DayOfWeek(GMTValue)], wDay, monthnames[wMonth],
                    wYear, FormatDateTime('HH":"nn":"ss',GMTValue), 'GMT']);  {do not localize}
end;

function DateTimeGMTToCookieStr(const GMTValue: TDateTime) : String;
// Wdy, DD-Mon-YY HH:MM:SS GMT
var
  wDay,
  wMonth,
  wYear: Word;
begin
  DecodeDate(GMTValue, wYear, wMonth, wDay);
  Result := IndyFormat('%s, %.2d-%s-%.2d %s %s',    {do not localize}
                   [wdays[DayOfWeek(GMTValue)], wDay, monthnames[wMonth],
                    wYear, FormatDateTime('HH":"nn":"ss',GMTValue), 'GMT']);  {do not localize}
end;

{This should never be localized}
function DateTimeToInternetStr(const Value: TDateTime; const AIsGMT : Boolean = False) : String;
var
  wDay,
  wMonth,
  wYear: Word;
begin
  DecodeDate(Value, wYear, wMonth, wDay);
  Result := IndyFormat('%s, %d %s %d %s %s',    {do not localize}
                   [wdays[DayOfWeek(Value)], wDay, monthnames[wMonth],
                    wYear, FormatDateTime('HH":"nn":"ss', Value), {do not localize}
                    DateTimeToGmtOffSetStr(OffsetFromUTC, AIsGMT)]);
end;

function DateTimeToGmtOffSetStr(ADateTime: TDateTime; SubGMT: Boolean): string;
var
  AHour, AMin, ASec, AMSec: Word;
begin
  if (ADateTime = 0.0) and SubGMT then
  begin
    Result := 'GMT'; {do not localize}
    Exit;
  end;
  DecodeTime(ADateTime, AHour, AMin, ASec, AMSec);
  Result := IndyFormat(' %0.2d%0.2d', [AHour, AMin]); {do not localize}
  if ADateTime < 0.0 then begin
    Result[1] := '-'; {do not localize}
  end else begin
    Result[1] := '+';  {do not localize}
  end;
end;

function OffsetFromUTC: TDateTime;
{$IFDEF DOTNET}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
{$IFDEF WIN32_OR_WIN64_OR_WINCE}
var
  iBias: Integer;
  tmez: TTimeZoneInformation;
{$ENDIF}
begin
  {$IFDEF DOTNET}
  Result := System.Timezone.CurrentTimezone.GetUTCOffset(DateTime.FromOADate(Now)).TotalDays;
  {$ENDIF}
  {$IFDEF WIN32_OR_WIN64_OR_WINCE}
  {$IFDEF WIN32_OR_WIN64}
  case GetTimeZoneInformation(tmez) of
  {$ELSE}
   case GetTimeZoneInformation(@tmez) of
  {$ENDIF}
    TIME_ZONE_ID_INVALID:
    begin
      raise EIdFailedToRetreiveTimeZoneInfo.Create(RSFailedTimeZoneInfo);
    end;
    TIME_ZONE_ID_UNKNOWN  :
       iBias := tmez.Bias;
    TIME_ZONE_ID_DAYLIGHT :
      iBias := tmez.Bias + tmez.DaylightBias;
    TIME_ZONE_ID_STANDARD :
      iBias := tmez.Bias + tmez.StandardBias;
    else
    begin
      raise EIdFailedToRetreiveTimeZoneInfo.Create(RSFailedTimeZoneInfo);
    end;
  end;
  {We use ABS because EncodeTime will only accept positive values}
  Result := EncodeTime(Abs(iBias) div 60, Abs(iBias) mod 60, 0, 0);
  {The GetTimeZone function returns values oriented towards converting
   a GMT time into a local time.  We wish to do the opposite by returning
   the difference between the local time and GMT.  So I just make a positive
   value negative and leave a negative value as positive}
  if iBias > 0 then begin
    Result := 0 - Result;
  end;
  {$ENDIF}
end;

function IndyIncludeTrailingPathDelimiter(const S: string): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF VCL6ORABOVE}
  Result := IncludeTrailingPathDelimiter(S);
  {$ELSE}
  Result := IncludeTrailingBackslash(S);
  {$ENDIF}
end;

function IndyExcludeTrailingPathDelimiter(const S: string): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF VCL6ORABOVE}
  Result := SysUtils.ExcludeTrailingPathDelimiter(S);
  {$ELSE}
  Result := SysUtils.ExcludeTrailingBackslash(S);
  {$ENDIF}
end;

function StringsReplace(const S: String; const OldPattern, NewPattern: array of string): string;
var
  i : Integer;
begin
  Result := s;
  for i := Low(OldPattern) to High(OldPattern) do begin
    Result := StringReplace(Result, OldPattern[i], NewPattern[i], [rfReplaceAll]);
  end;
end;

function ReplaceOnlyFirst(const S, OldPattern, NewPattern: string): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := SysUtils.StringReplace(s, OldPattern, NewPattern, []);
end;

function IndyStrToInt(const S: string): Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := StrToInt(Trim(S));
end;

function IndyStrToInt(const S: string; ADefault: Integer): Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := StrToIntDef(Trim(S), ADefault);
end;

function CompareDate(const D1, D2: TDateTime): Integer;
var
  LTM1, LTM2 : TTimeStamp;
begin
  LTM1 := DateTimeToTimeStamp(D1);
  LTM2 := DateTimeToTimeStamp(D2);
  if LTM1.Date = LTM2.Date then begin
    if LTM1.Time < LTM2.Time then begin
      Result := -1;
    end
    else if LTM1.Time > LTM2.Time then begin
      Result := 1;
    end
    else begin
      Result := 0;
    end;
  end
  else if LTM1.Date > LTM2.Date then begin
    Result := 1;
  end
  else begin
    Result := -1;
  end;
end;

function AddMSecToTime(const ADateTime: TDateTime; const AMSec: Integer): TDateTime;
{$IFDEF VCL6ORABOVE}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ELSE}
var
  LTM : TTimeStamp;
{$ENDIF}
begin
  {$IFDEF VCL6ORABOVE}
  Result := DateUtils.IncMilliSecond(ADateTime, AMSec);
  {$ELSE}
  LTM := DateTimeToTimeStamp(ADateTime);
  LTM.Time := LTM.Time + AMSec;
  Result := TimeStampToDateTime(LTM);
  {$ENDIF}
end;

function IndyFileAge(const AFileName: string): TDateTime;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF VCL10ORABOVE}
  //single-parameter fileage is deprecated in d2006 and above
  if not FileAge(AFileName, Result) then begin
    Result := 0;
  end;
  {$ELSE}
  Result := FileDateToDateTime(SysUtils.FileAge(AFileName));
  {$ENDIF}
end;

function IndyDirectoryExists(const ADirectory: string): Boolean;
{$IFNDEF VCL6ORABOVE}
var
  Code: Integer;
{$ELSE}
  {$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
begin
  {$IFDEF VCL6ORABOVE}
  Result := SysUtils.DirectoryExists(ADirectory);
  {$ELSE}
  // RLebeau 2/16/2006: Removed dependency on the FileCtrl unit
  Code := GetFileAttributes(PChar(ADirectory));
  Result := (Code <> -1) and ((Code and FILE_ATTRIBUTE_DIRECTORY) <> 0);
  {$ENDIF}
end;

function IndyStrToInt64(const S: string; const ADefault: Int64): Int64;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := SysUtils.StrToInt64Def(Trim(S), ADefault);
end;

function IndyStrToInt64(const S: string): Int64;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := SysUtils.StrToInt64(Trim(S));
end;

function ToBytes(const AValue: string; const AEncoding: TIdEncoding = en7Bit): TIdBytes; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := ToBytes(AValue, -1, 1, AEncoding);
end;

function ToBytes(const AValue: string; const ALength: Integer; const AIndex: Integer = 1;
  const AEncoding: TIdEncoding = en7Bit): TIdBytes; overload;
var
  LLength: Integer;
begin
  EIdException.IfTrue(AEncoding = enDefault, 'No encoding specified.'); {do not localize}
  LLength := IndyLength(AValue, ALength, AIndex);
  if LLength > 0 then
  begin
    if AEncoding = enUTF8 then begin
      Result := StringToUTF8Bytes(AValue, AIndex, LLength);
    end else
    begin
      // For VCL we just do a byte to byte copy with no translation. VCL uses ANSI or MBCS.
      // With MBCS we still map 1:1
      SetLength(Result, LLength);
      CopyTIdString(AValue, AIndex, Result, 0, LLength);
    end;
  end else begin
    SetLength(Result, 0);
  end;
end;

function ToBytes(const AValue: Char; const AEncoding: TIdEncoding = en7Bit): TIdBytes; overload;
begin
  EIdException.IfTrue(AEncoding = enDefault, 'No encoding specified.'); {do not localize}
  if AEncoding = enUTF8 then begin
    Result := CharToUTF8Bytes(AValue);
  end else
  begin
    // For VCL we just do a byte to byte copy with no translation. VCL uses ANSI or MBCS.
    // With MBCS we still map 1:1
    SetLength(Result, SizeOf(Byte));
    Result[0] := Byte(AValue);
  end;
end;

function ToBytes(const AValue: Int64): TIdBytes; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  Result := System.BitConverter.GetBytes(AValue);
  {$ELSE}
  SetLength(Result, SizeOf(Int64));
  PInt64(@Result[0])^ := AValue;
  {$ENDIF}
end;

function ToBytes(const AValue: LongInt): TIdBytes; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  Result := System.BitConverter.GetBytes(AValue);
  {$ELSE}
  SetLength(Result, SizeOf(LongInt));
  PLongInt(@Result[0])^ := AValue;
  {$ENDIF}
end;

function ToBytes(const AValue: LongWord): TIdBytes; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  Result := System.BitConverter.GetBytes(AValue);
  {$ELSE}
  SetLength(Result, SizeOf(LongWord));
  PLongWord(@Result[0])^ := AValue;
  {$ENDIF}
end;

function ToBytes(const AValue: Short): TIdBytes; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  Result := System.BitConverter.GetBytes(AValue);
  {$ELSE}
  SetLength(Result, SizeOf(SmallInt));
  PSmallInt(@Result[0])^ := AValue;
  {$ENDIF}
end;

function ToBytes(const AValue: Word): TIdBytes; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  Result := System.BitConverter.GetBytes(AValue);
  {$ELSE}
  SetLength(Result, SizeOf(Word));
  PWord(@Result[0])^ := AValue;
  {$ENDIF}
end;

function ToBytes(const AValue: Byte): TIdBytes; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  SetLength(Result, SizeOf(Byte));
  Result[0] := AValue;
end;

function ToBytes(const AValue: TIdBytes; const ASize: Integer; const AIndex: Integer = 0): TIdBytes; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LSize: Integer;
begin
  LSize := IndyLength(AValue, ASize, AIndex);
  SetLength(Result, LSize);
  if LSize > 0 then begin
    CopyTIdBytes(AValue, AIndex, Result, 0, LSize);
  end;
end;

{$IFNDEF DOTNET}
function RawToBytes(const AValue; const ASize: Integer): TIdBytes;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  SetLength(Result, ASize);
  Move(AValue, Result[0], ASize);
end;
{$ENDIF}

procedure ToBytesF(var Bytes: TIdBytes; const AValue: Char; const AEncoding: TIdEncoding = en7Bit);
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LLength: Integer;
begin
  if AEncoding = enUTF8 then begin
    LLength := CalcBytesForUTF8Char(AValue);
  end else begin
    LLength := SizeOf(Byte);
  end;
  Assert(Length(Bytes) >= LLength);
  CopyTIdChar(AValue, Bytes, 0, AEncoding);
end;

procedure ToBytesF(var Bytes: TIdBytes; const AValue: LongInt);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(Bytes) >= SizeOf(AValue));
  CopyTIdLongInt(AValue, Bytes, 0);
end;

procedure ToBytesF(var Bytes: TIdBytes; const AValue: Short);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(Bytes) >= SizeOf(AValue));
  CopyTIdShort(AValue, Bytes, 0);
end;

procedure ToBytesF(var Bytes: TIdBytes; const AValue: Word);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(Bytes) >= SizeOf(AValue));
  CopyTIdWord(AValue, Bytes, 0);
end;

procedure ToBytesF(var Bytes: TIdBytes; const AValue: Byte);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(Bytes) >= SizeOf(AValue));
  Bytes[0] := AValue;
end;

procedure ToBytesF(var Bytes: TIdBytes; const AValue: LongWord);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(Bytes) >= SizeOf(AValue));
  CopyTIdLongWord(AValue, Bytes, 0);
end;

procedure ToBytesF(var Bytes: TIdBytes; const AValue: Int64);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(Bytes) >= SizeOf(AValue));
  CopyTIdInt64(AValue, Bytes, 0);
end;

procedure ToBytesF(var Bytes: TIdBytes; const AValue: TIdBytes; const ASize: Integer; const AIndex: Integer = 0);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(Bytes) >= ASize);
  CopyTIdBytes(AValue, AIndex, Bytes, 0, ASize);
end;

{$IFNDEF DOTNET}
procedure RawToBytesF(var Bytes: TIdBytes; const AValue; const ASize: Integer);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(Bytes) >= ASize);
  Move(AValue, Bytes[0], ASize);
end;
{$ENDIF}

function BytesToChar(const AValue: TIdBytes; const AIndex: Integer = 0;
  const AEncoding: TIdEncoding = en7Bit): Char; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  BytesToChar(AValue, Result, AIndex, AEncoding);
end;

function BytesToChar(const AValue: TIdBytes; var VChar: Char; const AIndex: Integer = 0;
  const AEncoding: TIdEncoding = en7Bit): Integer; overload;
var
  LLength: Integer;
begin
  EIdException.IfTrue(AEncoding = enDefault, 'No encoding specified.'); {do not localize}
  if AEncoding = enUTF8 then
  begin
    LLength := CalcBytesOfUTF8Char(AValue, AIndex);
    Assert(LLength > 0);
    VChar := UTF8BytesToChar(AValue, AIndex, LLength);
  end else
  begin
    // For VCL we just do a byte to byte copy with no translation. VCL uses ANSI or MBCS.
    // With MBCS we still map 1:1
    LLength := IndyMin(IndyLength(AValue, -1, AIndex), 1);
    Assert(LLength > 0);
    VChar := Char(AValue[AIndex]);
  end;
  Result := LLength;
end;

function BytesToLongInt(const AValue: TIdBytes; const AIndex: Integer = 0): LongInt;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(AValue) >= (AIndex+SizeOf(LongInt)));
  {$IFDEF DOTNET}
  Result := System.BitConverter.ToInt32(AValue, AIndex);
  {$ELSE}
  Result := PLongInt(@AValue[AIndex])^;
  {$ENDIF}
end;

function BytesToInt64(const AValue: TIdBytes; const AIndex: Integer = 0): Int64;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(AValue) >= (AIndex+SizeOf(Int64)));
  {$IFDEF DOTNET}
  Result := System.BitConverter.ToInt64(AValue, AIndex);
  {$ELSE}
  Result := PInt64(@AValue[AIndex])^;
  {$ENDIF}
end;

function BytesToWord(const AValue: TIdBytes; const AIndex: Integer = 0): Word;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(AValue) >= (AIndex+SizeOf(Word)));
  {$IFDEF DOTNET}
  Result := System.BitConverter.ToUInt16(AValue, AIndex);
  {$ELSE}
  Result := PWord(@AValue[AIndex])^;
  {$ENDIF}
end;

function BytesToShort(const AValue: TIdBytes; const AIndex: Integer = 0): Short;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(AValue) >= (AIndex+SizeOf(Short)));
  {$IFDEF DOTNET}
  Result := System.BitConverter.ToInt16(AValue, AIndex);
  {$ELSE}
  Result := PSmallInt(@AValue[AIndex])^;
  {$ENDIF}
end;

function BytesToIPv4Str(const AValue: TIdBytes; const AIndex: Integer = 0): String;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(AValue) >= (AIndex+4));
  Result := IntToStr(Ord(AValue[AIndex])) + '.' +
           IntToStr(Ord(AValue[AIndex+1])) + '.' +
           IntToStr(Ord(AValue[AIndex+2])) + '.' +
           IntToStr(Ord(AValue[AIndex+3]));
end;

procedure BytesToIPv6(const AValue: TIdBytes; var VAddress: TIdIPv6Address; const AIndex: Integer = 0);
{$IFDEF DOTNET}
var
  I: Integer;
{$ELSE}
{$IFDEF USEINLINE}inline;{$ENDIF}
{$ENDIF}
begin
  Assert(Length(AValue) >= (AIndex+16));
  {$IFDEF DOTNET}
  for i := 0 to 7 do begin
    VAddress[i] := TwoByteToWord(AValue[(i*2)+AIndex], AValue[(i*2)+1+AIndex]);
  end;
  {$ELSE}
  Move(AValue[AIndex], VAddress[0], 16);
  {$ENDIF}
end;

function BytesToLongWord(const AValue: TIdBytes; const AIndex: Integer = 0): LongWord;
 {$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(AValue) >= (AIndex+SizeOf(LongWord)));
  {$IFDEF DotNet}
  Result := System.BitConverter.ToUInt32(AValue, AIndex);
  {$ELSE}
  Result := PLongWord(@AValue[AIndex])^;
  {$ENDIF}
end;

function BytesToString(const AValue: TIdBytes; const AEncoding: TIdEncoding = en7Bit): string; overload;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := BytesToString(AValue, 0, -1, AEncoding);
end;

function BytesToString(const AValue: TIdBytes; const AStartIndex: Integer;
  const ALength: Integer = -1; const AEncoding: TIdEncoding = en7Bit): string; overload;
var
  {$IFDEF DOTNET}
  I: Integer;
  {$ENDIF}
  LLength: Integer;
begin
  EIdException.IfTrue(AEncoding = enDefault, 'No encoding specified.'); {do not localize}
  LLength := IndyLength(AValue, ALength, AStartIndex);
  if LLength > 0 then
  begin
    {$IFDEF DOTNET}
    Result := GetEncoder(AEncoding).GetString(AValue, AStartIndex, LLength);
    {$ELSE}
    if AEncoding = enUTF8 then begin
      Result := UTF8BytesToString(AValue, AStartIndex, LLength);
    end else
    begin
      // For VCL we just do a byte to byte copy with no translation. VCL uses ANSI or MBCS.
      // With MBCS we still map 1:1
      SetLength(Result, LLength);
      Move(AValue[AStartIndex], Result[1], LLength);
    end;
    {$ENDIF}
  end else begin
    Result := '';
  end;
end;

{$IFNDEF DOTNET}
procedure BytesToRaw(const AValue: TIdBytes; var VBuffer; const ASize: Integer);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Assert(Length(AValue) >= ASize);
  Move(AValue[0], VBuffer, ASize);
end;
{$ENDIF}

function TwoByteToWord(AByte1, AByte2: Byte): Word;
//Since Replys are returned as Strings, we need a routine to convert two
// characters which are a 2 byte U Int into a two byte unsigned Integer
var
  LWord: TIdBytes;
begin
  SetLength(LWord, 2);
  LWord[0] := AByte1;
  LWord[1] := AByte2;
  Result := BytesToWord(LWord);
//  Result := Word((AByte1 shl 8) and $FF00) or Word(AByte2 and $00FF);
end;

function ReadStringFromStream(AStream: TStream; ASize: Integer = -1;
  const AEncoding: TIdEncoding = en7Bit): string;
var
  LBytes: TIdBytes;
begin
  ASize := TIdStreamHelper.ReadBytes(AStream, LBytes, ASize);
  Result := BytesToString(LBytes, 0, ASize, AEncoding);
end;

{$IFDEF FPC}
function ReadTIdBytesFromStream(const AStream: TStream; var ABytes: TIdBytes; const Count: Int64): Int64;
{$ELSE}
function ReadTIdBytesFromStream(const AStream: TStream; var ABytes: TIdBytes; const Count: Integer): Integer;
{$ENDIF}
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := TIdStreamHelper.ReadBytes(AStream, ABytes, Count);
end;

function ReadCharFromStream(AStream: TStream; var VChar: Char;
  const AEncoding: TIdEncoding = en7Bit): Integer;
var
  StartPos: Int64;
  NumRead: Integer;
  Lb: Byte;
  LCh: WideChar;
  Temp: String;

  function ReadByte: Byte;
  begin
    if AStream.Read(Result{$IFNDEF DOTNET}, 1{$ENDIF}) <> 1 then begin
      raise EIdException.Create('Unable to read byte for UTF-8 character'); {do not localize}
    end;
  end;

begin
  Result := 0;

  EIdException.IfTrue(AEncoding = enDefault, 'No encoding specified.'); {do not localize}
  StartPos := AStream.Position;

  // don't raise an exception here, backwards compatibility for now
  if AStream.Read(Lb{$IFNDEF DOTNET}, 1{$ENDIF}) <> 1 then begin
    Exit;
  end;
  NumRead := 1;

  if AEncoding = enUTF8 then
  begin
    try
      with GetUTF8Decoder do
      try
        while not ProcessByte(Lb, LCh) do
	begin
          Lb := ReadByte;
          Inc(NumRead);
        end;
      finally
        Free;
      end;
      Temp := LCh;
      VChar := Temp[1];
    except
      AStream.Position := StartPos;
      raise;
    end;
  end else
  begin
    // For VCL we just do a byte to byte copy with no translation. VCL uses ANSI or MBCS.
    // With MBCS we still map 1:1
    VChar := Char(Lb);
  end;
  
  Result := NumRead;
end;

procedure WriteTIdBytesToStream(const AStream: TStream; const ABytes: TIdBytes;
  const ASize: Integer = -1; const AIndex: Integer = 0);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  TIdStreamHelper.Write(AStream, ABytes, ASize, AIndex);
end;

procedure WriteStringToStream(AStream: TStream; const AStr: string;
  const AEncoding: TIdEncoding);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  WriteStringToStream(AStream, AStr, -1, 1, AEncoding);
end;

procedure WriteStringToStream(AStream: TStream; const AStr: string;
  const ALength: Integer = -1; const AIndex: Integer = 1;
  const AEncoding: TIdEncoding = en7Bit);
{$IFDEF USEINLINE}inline;{$ENDIF}
var
  LLength: Integer;
  LStr: TIdBytes;
begin
  LStr := nil;
  LLength := IndyLength(AStr, ALength, AIndex);
  if LLength > 0 then
  begin
    LStr := ToBytes(AStr, LLength, AIndex, AEncoding);
    TIdStreamHelper.Write(AStream, LStr);
  end;
end;

{$IFDEF DOTNET}
function TIdBaseStream.Read(var VBuffer: array of Byte; AOffset, ACount: Longint): Longint;
var
  LBytes: TIdBytes;
begin
  // this is a silly work around really, but array of Byte and TIdByte aren't
  // interchangable in a var parameter, though really they *should be*
  SetLength(LBytes, ACount - AOffset);
  Result := IdRead(LBytes, 0, ACount - AOffset);
  CopyTIdByteArray(LBytes, 0, VBuffer, AOffset, Result);
end;

function TIdBaseStream.Write(const ABuffer: array of Byte; AOffset, ACount: Longint): Longint;
begin
  Result := IdWrite(ABuffer, AOffset, ACount);
end;

function TIdBaseStream.Seek(const AOffset: Int64; AOrigin: TSeekOrigin): Int64;
begin
  Result := IdSeek(AOffset, AOrigin);
end;

procedure TIdBaseStream.SetSize(ASize: Int64);
begin
  IdSetSize(ASize);
end;

{$ELSE}

  {$IFDEF SIZE64STREAM}
procedure TIdBaseStream.SetSize(const NewSize: Int64);
begin
   IdSetSize(NewSize);
end;
  {$ELSE}
procedure TIdBaseStream.SetSize(ASize: Integer);
begin
  IdSetSize(ASize);
end;
 {$ENDIF}

function TIdBaseStream.Read(var Buffer; Count: Longint): Longint;
var
  LBytes: TIdBytes;
begin
  SetLength(LBytes, Count);
  Result := IdRead(LBytes, 0, Count);
  if Result > 0 then begin
    Move(LBytes[0], Buffer, Result);
  end;
end;

function TIdBaseStream.Write(const Buffer; Count: Longint): Longint;
begin
  if Count > 0 then begin
    Result := IdWrite(RawToBytes(Buffer, Count), 0, Count);
  end else begin
    Result := 0;
  end;
end;

  {$IFDEF SIZE64STREAM}
function TIdBaseStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result := IdSeek(Offset, Origin);
end;
  {$ELSE}
function TIdBaseStream.Seek(Offset: Longint; Origin: Word): Longint;
var
  LSeek : TSeekOrigin;
begin
  case Origin of
    soFromBeginning : LSeek := soBeginning;
    soFromCurrent : LSeek := soCurrent;
    soFromEnd : LSeek := soEnd;
  else
    Result := 0;
    Exit;
  end;
  Result := IdSeek(Offset, LSeek) and $FFFFFFFF;
end;
  {$ENDIF}

{$ENDIF}

procedure AppendBytes(var VBytes: TIdBytes; const AToAdd: TIdBytes; const AIndex: Integer = 0);
var
  LOldLen, LAddLen: Integer;
begin
  LAddLen := IndyLength(AToAdd, -1, AIndex);
  if LAddLen > 0 then begin
    LOldLen := Length(VBytes);
    SetLength(VBytes, LOldLen + LAddLen);
    CopyTIdBytes(AToAdd, AIndex, VBytes, LOldLen, LAddLen);
  end;
end;

procedure AppendByte(var VBytes: TIdBytes; const AByte: Byte);
var
  LOldLen: Integer;
begin
  LOldLen := Length(VBytes);
  SetLength(VBytes, LOldLen + 1);
  VBytes[LOldLen] := AByte;
end;

procedure AppendString(var VBytes: TIdBytes; const AStr: String; ALength: Integer = -1);
var
  LOldLen: Integer;
begin
  if ALength < 0 then begin
    ALength := Length(AStr);
  end;
  LOldLen := Length(VBytes);
  SetLength(VBytes, LOldLen + ALength);
  CopyTIdString(AStr, VBytes, LOldLen, ALength);
end;

procedure ExpandBytes(var VBytes: TIdBytes; const AIndex: Integer; const ACount: Integer; const AFillByte: Byte = 0);
var
  I: Integer;
begin
  if ACount > 0 then begin
    // if AIndex is at the end of the buffer then the operation is appending bytes
    if AIndex <> Length(VBytes) then begin
      //if these asserts fail, then it indicates an attempted buffer overrun.
      Assert(AIndex >= 0);
      Assert(AIndex < Length(VBytes));
    end;
    SetLength(VBytes, Length(VBytes) + ACount);
    // move any existing bytes at the index to the end of the buffer
    for I := Length(VBytes)-1 downto AIndex+ACount do begin
      VBytes[I] := VBytes[I-ACount];
    end;
    // fill in the new space with the fill byte
    for I := AIndex to AIndex+ACount-1 do begin
      VBytes[I] := AFillByte;
    end;
  end;
end;

procedure InsertBytes(var VBytes: TIdBytes; const ADestIndex: Integer;
  const ASource: TIdBytes; const ASourceIndex: Integer = 0);
var
  LAddLen: Integer;
begin
  LAddLen := IndyLength(ASource, -1, ASourceIndex);
  if LAddLen > 0 then begin
    ExpandBytes(VBytes, ADestIndex, LAddLen);
    CopyTIdBytes(ASource, ASourceIndex, VBytes, ADestIndex, LAddLen);
  end;
end;

procedure InsertByte(var VBytes: TIdBytes; const AByte: Byte; const AIndex: Integer);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  ExpandBytes(VBytes, AIndex, 1);
  VBytes[AIndex] := AByte;
end;

procedure RemoveBytes(var VBytes: TIdBytes; const ACount: Integer; const AIndex: Integer = 0);
var
  I: Integer;
  LActual: Integer;
begin
  Assert(AIndex >= 0);
  LActual := IndyMin(Length(VBytes)-AIndex, ACount);
  if LActual > 0 then begin
    if (AIndex + LActual) < Length(VBytes) then begin
      // RLebeau: TODO - use Move() here instead?
      for I := AIndex to Length(VBytes)-LActual-1 do begin
        VBytes[I] := VBytes[I+LActual];
      end;
    end;
    SetLength(VBytes, Length(VBytes)-LActual);
  end;
end;

procedure IdDelete(var s: string; AOffset, ACount: Integer);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Delete(s, AOffset, ACount);
end;

procedure IdInsert(const Source: string; var S: string; Index: Integer);
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Insert(Source, S, Index);
end;

function TextIsSame(const A1, A2: string): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  Result := System.String.Compare(A1, A2, True) = 0;
  {$ELSE}
  Result := AnsiCompareText(A1, A2) = 0;
  {$ENDIF}
end;

function TextStartsWith(const S, SubS: string): Boolean;
var
  LLen: Integer;
begin
  LLen := Length(SubS);
  Result := LLen <= Length(S);
  if Result then
  begin
    {$IFDEF DOTNET}
    Result := System.String.Compare(S, 0, SubS, 0, LLen, True) = 0;
    {$ELSE}
    {$IFDEF WIN32_OR_WIN64_OR_WINCE}
    Result := CompareString(LOCALE_USER_DEFAULT, NORM_IGNORECASE,
      {$IFDEF WINCE}PWideChar{$ELSE} PChar{$ENDIF}(S), LLen,
      {$IFDEF WINCE}PWideChar {$ELSE}PChar{$ENDIF}(SubS), LLen) = 2;
    {$ELSE}
    Result := AnsiCompareText(Copy(S, 1, LLen), SubS) = 0;
    {$ENDIF}
    {$ENDIF}
  end;
end;

function TextEndsWith(const S, SubS: string): Boolean;
var
  LLen: Integer;
  {$IFDEF WIN32_OR_WIN64}
  P: PChar;
  {$ENDIF}
  {$IFDEF WINCE}
  P: PWideChar;
  {$ENDIF}
begin
  LLen := Length(SubS);
  Result := LLen <= Length(S);
  if Result then
  begin
    {$IFDEF DOTNET}
    Result := System.String.Compare(S, Length(S)-LLen, SubS, 0, LLen, True) = 0;
    {$ELSE}
    {$IFDEF WIN32_OR_WIN64_OR_WINCE}
    P := {$IFDEF WINCE}PWideChar{$ELSE}PChar{$ENDIF}(S);
    Inc(P, Length(S)-LLen);
    Result := CompareString(LOCALE_USER_DEFAULT, NORM_IGNORECASE, P, LLen, {$IFDEF WINCE}PWideChar{$ELSE}PChar{$ENDIF}(SubS), LLen) = 2;
    {$ELSE}
    Result := AnsiCompareText(Copy(S, Length(S)-LLen+1, LLen), SubS) = 0;
    {$ENDIF}
    {$ENDIF}
  end;
end;

function IndyLowerCase(const A1: string): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  Result := A1.ToLower;
  {$ELSE}
  Result := AnsiLowerCase(A1);
  {$ENDIF}
end;

function IndyUpperCase(const A1: string): string;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  Result := A1.ToUpper;
  {$ELSE}
  Result := AnsiUpperCase(A1);
  {$ENDIF}
end;

function IndyCompareStr(const A1, A2: string): Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF DOTNET}
  Result := CompareStr(A1, A2);
  {$ELSE}
  Result := AnsiCompareStr(A1, A2);
  {$ENDIF}
end;

function CharPosInSet(const AString: string; const ACharPos: Integer; const ASet: String): Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  EIdException.IfTrue(ACharPos < 1, 'Invalid ACharPos');{ do not localize }
  if ACharPos <= Length(AString) then begin
    Result := IndyPos(AString[ACharPos], ASet);
  end else begin
    Result := 0;
  end;
end;

function CharIsInSet(const AString: string; const ACharPos: Integer; const ASet:  String): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := CharPosInSet(AString, ACharPos, ASet) > 0;
end;

function CharIsInEOL(const AString: string; const ACharPos: Integer): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := CharIsInSet(AString, ACharPos, EOL);
end;

function CharEquals(const AString: string; const ACharPos: Integer; const AValue: Char): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  EIdException.IfTrue(ACharPos < 1, 'Invalid ACharPos');{ do not localize }
  Result := ACharPos <= Length(AString);
  if Result then begin
    Result := AString[ACharPos] = AValue;
  end;
end;

function ByteIndex(const AByte: Byte; const ABytes: TIdBytes; const AStartIndex: Integer = 0): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := AStartIndex to Length(ABytes)-1 do begin
    if ABytes[I] = AByte then begin
      Result := I;
      Exit;
    end;
  end;
end;

function ByteIdxInSet(const ABytes: TIdBytes; const AIndex: Integer; const ASet: TIdBytes): Integer;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  EIdException.IfTrue(AIndex < 0, 'Invalid AIndex'); {do not localize}
  if AIndex < Length(ABytes) then begin
    Result := ByteIndex(ABytes[AIndex], ASet);
  end else begin
    Result := -1;
  end;
end;

function ByteIsInSet(const ABytes: TIdBytes; const AIndex: Integer; const ASet: TIdBytes): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result := ByteIdxInSet(ABytes, AIndex, ASet) > -1;
end;

function ByteIsInEOL(const ABytes: TIdBytes; const AIndex: Integer): Boolean;
var
  LSet: TIdBytes;
begin
  SetLength(LSet, 2);
  LSet[0] := 13;
  LSet[1] := 10;
  Result := ByteIsInSet(ABytes, AIndex, LSet);
end;

function ReadLnFromStream(AStream: TStream; AMaxLineLength: Integer = -1;
  AExceptionIfEOF: Boolean = False; const AEncoding: TIdEncoding = en7Bit): String;
begin
  if not ReadLnFromStream(AStream, Result, AMaxLineLength, AEncoding) then begin
    EIdEndOfStream.IfTrue(AExceptionIfEOF, IndyFormat(RSEndOfStream, ['', AStream.Position]));
  end;
end;

//TODO: Continue to optimize this function. Its performance severely impacts the coders
function ReadLnFromStream(AStream: TStream; var VLine: String; AMaxLineLength: Integer = -1;
  const AEncoding: TIdEncoding = en7Bit): Boolean;
const
  LBUFMAXSIZE = 2048;
var
  LStringLen, LResultLen: LongInt;
  LBuf: TIdBytes;
  LLine: TIdBytes;
  // LBuf: packed array [0..LBUFMAXSIZE] of Char;
  {$IFDEF FPC}
  LBufSize, LStrmPos, LStrmSize: Int64; //LBytesToRead = stream size - Position
  {$ELSE}
  LBufSize, LStrmPos, LStrmSize: Integer; //LBytesToRead = stream size - Position
  {$ENDIF}
  LCrEncountered: Boolean;

  {$IFDEF FPC}
  function FindEOL(const ABuf: TIdBytes; var VLineBufSize: Int64; var VCrEncountered: Boolean): Int64;
  {$ELSE}
  function FindEOL(const ABuf: TIdBytes; var VLineBufSize: Integer; var VCrEncountered: Boolean): Integer;
  {$ENDIF}
  var
    i: Integer;
  begin
    Result := VLineBufSize; //EOL not found => use all
    i := 0;
    while i < VLineBufSize do begin
      case ABuf[i] of
        Ord(LF): begin
            Result := i; {string size}
            VCrEncountered := True;
            VLineBufSize := i+1;
            Break;
          end;
        Ord(CR): begin
            Result := i; {string size}
            VCrEncountered := True;
            Inc(i); //crLF?
            if (i < VLineBufSize) and (ABuf[i] = Ord(LF)) then begin
              VLineBufSize := i+1;
            end else begin
              VLineBufSize := i;
            end;
            Break;
          end;
      end;
      Inc(i);
    end;
  end;

begin
  Assert(AStream<>nil);
  VLine := '';
  SetLength(LLine, 0);

  if AMaxLineLength < 0 then begin
    AMaxLineLength := MaxInt;
  end;

  { we store the stream size for the whole routine to prevent
  so do not incur a performance penalty with TStream.Size.  It has
  to use something such as Seek each time the size is obtained}
  {4 seek vs 3 seek}
  LStrmPos := AStream.Position;
  LStrmSize := AStream.Size;

  if LStrmPos >= LStrmSize then begin
    Result := False;
    Exit;
  end;
  
  SetLength(LBuf, LBUFMAXSIZE);
  LCrEncountered := False;

  repeat
    LBufSize := IndyMin(LStrmSize - LStrmPos, LBUFMAXSIZE);
    LBufSize := ReadTIdBytesFromStream(AStream, LBuf, LBufSize);
    LStringLen := FindEOL(LBuf, LBufSize, LCrEncountered);
    Inc(LStrmPos, LBufSize);

    LResultLen := Length(VLine);
    if (LResultLen + LStringLen) > AMaxLineLength then begin
      LStringLen := AMaxLineLength - LResultLen;
      LCrEncountered := True;
      Dec(LStrmPos, LBufSize);
      Inc(LStrmPos, LStringLen);
    end;
    if LStringLen > 0 then begin
      LBufSize := Length(LLine);
      SetLength(LLine, LBufSize+LStringLen);
      CopyTIdBytes(LBuf, 0, LLine, LBufSize, LStringLen);
    end;
  until (LStrmPos >= LStrmSize) or LCrEncountered;

  AStream.Position := LStrmPos;
  VLine := BytesToString(LLine, 0, -1, AEncoding);
  Result := True;
end;

{$IFDEF REGISTER_EXPECTED_MEMORY_LEAK}
function IndyRegisterExpectedMemoryLeak(AAddress: Pointer): Boolean;
{$IFDEF USEINLINE}inline;{$ENDIF}
begin
  {$IFDEF VCL10ORABOVE}
  Result := System.RegisterExpectedMemoryLeak(AAddress);
  {$ELSE}
    {$IFDEF USEFASTMM4}
  Result := FastMM4.RegisterExpectedMemoryLeak(AAddress);
    {$ELSE}
  Result := False;
    {$ENDIF}
  {$ENDIF}
end;
{$ENDIF}

initialization
  // AnsiPos does not handle strings with #0 and is also very slow compared to Pos
  {$IFDEF DOTNET}
  IndyPos := SBPos;
  {$ELSE}
  if LeadBytes = [] then begin
    IndyPos := SBPos;
  end else begin
    IndyPos := InternalAnsiPos;
  end;
  {$ENDIF}

finalization
  {$IFNDEF DOTNET}
  FreeAndNil(GIdPorts);
  {$ENDIF}

end.

