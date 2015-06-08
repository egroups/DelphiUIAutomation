{***************************************************************************}
{                                                                           }
{           DelphiUIAutomation                                              }
{                                                                           }
{           Copyright 2015 JHC Systems Limited                              }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}
unit DelphiUIAutomation.StringGridItem;

interface

uses
  UIAutomationClient_TLB,
  DelphiUIAutomation.Base;

type
  IAutomationStringGridItem = interface(IAutomationBase)
  ['{D4F198BF-2137-4073-B3F2-378601E56854}']
    function Select : HResult;
  end;

  TAutomationStringGridItem = class(TAutomationBase, IAutomationStringGridItem)
  strict private
    FSelectionItemPattern : IUIAutomationSelectionItemPattern;
  private
    procedure GetSelectionItemPattern;
  public
    function Select : HResult;
  end;

implementation

uses
  DelphiUIAutomation.Exception,
  DelphiUIAutomation.PatternIDs;

{ TAutomationStringGridItem }

function TAutomationStringGridItem.Select : HResult;
begin
  result := self.FSelectionItemPattern.select;
end;

procedure TAutomationStringGridItem.GetSelectionItemPattern;
var
  inter: IInterface;

begin
  fElement.GetCurrentPattern(UIA_SelectionItemPatternId, inter);
  if (inter <> nil) then
  begin
  if Inter.QueryInterface(IID_IUIAutomationSelectionItemPattern, FSelectionItemPattern) <> S_OK then
    begin
      raise EDelphiAutomationException.Create('Unable to initialise control pattern');
    end;
  end;
end;

end.
