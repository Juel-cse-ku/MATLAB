function varargout = SURF_KNN(varargin)
clc;
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SURF_KNN_OpeningFcn, ...
                   'gui_OutputFcn',  @SURF_KNN_OutputFcn, ...
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
function SURF_KNN_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;


guidata(hObject, handles);
function varargout = SURF_KNN_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function btn_load_dataset_Callback(hObject, eventdata, handles)
global dataset;
dataset = uigetdir('E:\Academic\4th Year 2nd Term\CSE-4224 Data Warehousing and Mining Lab\project 3(b)');

set(handles.text_browse,'String','Browse Done');

function btn_extract_features_Callback(hObject, eventdata, handles)
 global dataset;
 features = zeros(150);
 images = dir(strcat(dataset,'\*.jpg'));
 
for i=1:length(images)
    img_name = strcat(dataset,'\',images(i).name);
    img = imread(img_name);
    a = detectSURFFeatures(rgb2gray(img));
    feature = a.selectStrongest(500);
    feature = feature.Location;
    feature = transpose(feature);
    
    xlswrite('surf_features.xlsx',feature,strcat('A',num2str(i),':','SF',num2str(i)));
    set(handles.text_extract_feature,'String','Features Extracting...');
end
set(handles.text_extract_feature,'String','Features Extracted');
    

function listbox1_Callback(hObject, eventdata, handles)

function listbox1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function btn_load_features_Callback(hObject, eventdata, handles)
global features;
 file_name = uigetfile('*.xlsx');
 features = xlsread(file_name);
 features(isnan(features))=0;
 set(handles.text_load_feature,'String','Features Loaded');
 
function btn_testing_image_Callback(hObject, eventdata, handles)
global img;
img_name = uigetfile('*.jpg');
img = imread(img_name);
set(handles.text_img_read,'String','Image Loaded');
imshow(img);

function btn_classification_Callback(hObject, eventdata, handles)
global img;
global features;
class = xlsread('class.xlsx');
knn = fitcknn(features,class);
img_feature = detectSURFFeatures(rgb2gray(img));
img_feature = img_feature.selectStrongest(500);
img_feature = img_feature.Location;

img_feature = img_feature(:);
img_feature = transpose(img_feature);
img_feature(isnan(img_feature))=0;

for i=length(img_feature)+1:500
    img_feature(i)=0;
end
if length(img_feature)>500
    img_feature = img_feature(1,1:500);
end

obj_class = predict(knn,double(img_feature));
disp(obj_class);
if obj_class==1
    oc = ['Your Imgage belongs to class: ' 'Bus'];
elseif obj_class==2
    oc = ['Your Imgage belongs to class: ' 'Dinosaur'];
else
    oc = ['Your Imgage belongs to class: ' 'Flower'];
end
% oc = ['Your Imgage belongs to class: ' num2str(obj_class)];
set(handles.text_class,'String',oc);
