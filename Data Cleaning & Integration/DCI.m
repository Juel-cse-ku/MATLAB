
function varargout = DCI(varargin)

clc;
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DCI_OpeningFcn, ...
                   'gui_OutputFcn',  @DCI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function DCI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = DCI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function reading_file_Callback(hObject, eventdata, handles)

global value;
[value,~,~] = xlsread('input.xlsx');
set(handles.tbl_read_file,'Data',value);


function btn_data_cleaning_Callback(hObject, eventdata, handles)

global value;
global filled_data;
B = reshape(value,[6,4,2]);
filled_data = fillmissing(B,'movmedian',6);
set(handles.tbl_cleaned_data,'data',reshape(filled_data,[24,2]));
xlswrite('filled_data.xlsx',reshape(filled_data,[24,2]),'B2:C25');


function btn_data_smoothing_Callback(hObject, eventdata, handles)

global filled_data;
global binning_data;
binning_data = zeros(6,4,2);
for i=1: 4
    binning_data(:,i,1) = mean(filled_data(:,i,1));
    binning_data(:,i,2) = mean(filled_data(:,i,2));
end
set(handles.tbl_data_smoothing,'data',reshape(binning_data,[24,2]));
xlswrite('binning_data.xlsx',reshape(binning_data,[24,2]),'B2:C25');


function txt_price_status_Callback(hObject, eventdata, handles)

global filled_data;

filled_data = reshape(filled_data,[24,2]);
S = sum(filled_data);
sum_A = S(:,1);
sum_B = S(:,2);

sum_AB = 0;
for i=1:24
    sum_AB = sum_AB + (filled_data(i,1) * filled_data(i,2));
end

covariance = (sum_AB/24) - ((sum_A * sum_B)/576);

if covariance > 0
    set(handles.txt_price_status,'string','prices are rising');
else 
    set(handles.txt_price_status,'string','prices are falling');
end
