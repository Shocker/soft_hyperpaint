unit Effects;

interface
  uses Windows, Graphics,
       main;

  procedure effect_main(effect: string; data: dword=0);
  procedure dwordToRgb(col: dword; var rgb: _rgb);

type
 _pRGB=packed record
   r,g,b: byte;
 end;

var pRGB, pRGB2:^_pRGB;

implementation

uses Math, SysUtils;

procedure dwordToRgb(col: dword; var rgb: _rgb);
begin
  rgb.r:=pByte(pointer(dword(@col)))^;
  rgb.g:=pByte(pointer(dword(@col)+1))^;
  rgb.b:=pByte(pointer(dword(@col)+2))^;
end;

procedure effect_main(effect: string; data: dword=0);
  var i, j, w, h, med,k, l: integer;
      r,g,b:dword;
      bit, bit2: TBitmap;
      oldP:pointer;
  label backToMain,_exit, swap,grayscale,blur,invert,bright,dark,solarize,test,blacknwhite,whitenblack,colorize,
        rotate_180, remove_col;
begin
  saved:=false;
  bit:=Form1.Image1.Picture.bitmap;
  w:=bit.Width;
  h:=bit.Height;

  bit2:=TBitmap.Create;
  bit2.PixelFormat:=pf24bit;
  bit2.Width:=w;
  bit2.Height:=h;

  for j:=0 to h-1 do
    begin
      //Form1.Image1.Repaint;
      pRGB:=bit.ScanLine[j];
      for i:=0 to w-1 do
        begin
          if effect='swap' then goto swap
          else if effect='grayscale' then goto grayscale
          else if effect='blur' then goto blur
          else if effect='invert' then goto invert
          else if effect='bright' then goto bright
          else if effect='dark' then goto dark
          else if effect='solarize' then goto solarize
          else if effect='blacknwhite' then goto blacknwhite
          else if effect='whitenblack' then goto whitenblack
          else if effect='colorize' then goto colorize
          else if effect='remove_col' then goto remove_col
          else if (effect='rotate_180') or (effect='rotate_merge_overlap') then goto rotate_180;

          backToMain:
          inc(pRGB);
        end;
    end;

    goto _exit;

    swap:
      med:=pRGB.r;
      pRGB.r:=pRGB.g;
      pRGB.g:=pRGB.b;
      pRGB.b:=med;
      goto backToMain;

    grayscale:
      med:=(pRGB.r+pRGB.g+pRGB.b) div 3;
      pRGB.r:=med;
      pRGB.g:=med;
      pRGB.b:=med;
      goto backToMain;

    blur:
      r:=pRGB.r*7;
      g:=pRGB.g*7;
      b:=pRGB.b*7;
      oldP:=pRGB;
      for k:=-1 to 1 do
       if (j+k<h) and (j+k>=0) then
        begin
          pRGB:=bit.ScanLine[j+k];
          inc(pRGB,i);
          for l:=-1 to 1 do
           if (i+l<w) and (i+l>=0) then
            begin
              inc(pRGB, l);
              r:=r+pRGB.r;
              g:=g+pRGB.g;
              b:=b+pRGB.b;
            end;
        end;
      pRGB:=oldP;
      pRGB.r:=r div 16;
      pRGB.g:=g div 16;
      pRGB.b:=b div 16;
      goto backToMain;

    bright:
      if pRGB.r<=$DD then pRGB.r:=pRGB.r+$22;
      if pRGB.g<=$DD then pRGB.g:=pRGB.g+$22;
      if pRGB.b<=$DD then pRGB.b:=pRGB.b+$22;
      goto backToMain;

    dark:
      if pRGB.r>=$22 then pRGB.r:=pRGB.r-$22;
      if pRGB.g>=$22 then pRGB.g:=pRGB.g-$22;
      if pRGB.b>=$22 then pRGB.b:=pRGB.b-$22;
      goto backToMain;

    solarize:
      if pRGB.r>=$7F then pRGB.r:=pRGB.r*2;
      if pRGB.g>=$7F then pRGB.g:=pRGB.g*2;
      if pRGB.b>=$7F then pRGB.b:=pRGB.b*2;
      goto backToMain;

    blacknwhite:
      if (pRGB.r>$7F) and (pRGB.g>$7F) and (pRGB.b>$7F) then
        begin
          pRGB.r:=255;
          pRGB.g:=255;
          pRGB.b:=255;
        end
      else
        begin
          pRGB.r:=0;
          pRGB.g:=0;
          pRGB.b:=0;
        end;
      goto backToMain;

    whitenblack:
      if (pRGB.r<$7F) and (pRGB.g<$7F) and (pRGB.b<$7F) then
        begin
          pRGB.r:=255;
          pRGB.g:=255;
          pRGB.b:=255;
        end
      else
        begin
          pRGB.r:=0;
          pRGB.g:=0;
          pRGB.b:=0;
        end;
      goto backToMain;

    colorize:
      if pRGB.r>=$7F then pRGB.r:=255 else pRGB.r:=0;
      if pRGB.g>=$7F then pRGB.g:=255 else pRGB.g:=0;
      if pRGB.b>=$7F then pRGB.b:=255 else pRGB.b:=0;
      goto backToMain;

    remove_col:
      med:=(dword(pRGB.r) shl 16) + (dword(pRGB.g) shl 8) + dword(pRGB.b);
      med:=med and data;
      pRGB.r:=med shr 16;
      pRGB.g:=(med and $0000FF00) shr 8;
      pRGB.b:=(med and $000000FF);
      goto backToMain;

    rotate_180:
      oldP:=pRGB;
      pRGB:=bit.ScanLine[h-j-1];
      inc(pRGB, i);

      pRGB2:=bit2.ScanLine[j];
      inc(pRGB2, i);
      pRGB2.r:=pRGB.r;
      pRGB2.g:=pRGB.g;
      pRGB2.b:=pRGB.b;

      pRGB:=oldP;
      //bit2.Canvas.Pixels[w-i-1, h-j-1]:=bit.Canvas.Pixels[i, j];
      goto backToMain;

    invert:
      pRGB.r:=pRGB.r xor $FF;
      pRGB.g:=pRGB.g xor $FF;
      pRGB.b:=pRGB.b xor $FF;
      goto backToMain;

    _exit:
    if (effect='rotate_180') or (effect='rotate_merge_overlap') then
      begin
        if effect='rotate_merge_overlap' then
          BitBlt(bit.Canvas.Handle, 0,0, w, h, bit2.Canvas.Handle, 0, 0, SRCAND)
        else BitBlt(bit.Canvas.Handle, 0,0, w, h, bit2.Canvas.Handle, 0, 0, SRCCOPY);
      end;
  Form1.Image1.Repaint;
  bit.Canvas.Refresh;

  bit2.Free;
end;

end.
