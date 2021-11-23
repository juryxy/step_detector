function varargout = step_detector(varargin)
% STEP_DETECTOR MATLAB code for step_detector.fig
%      STEP_DETECTOR, by itself, creates a new STEP_DETECTOR or raises the existing
%      singleton*.
%
%      H = STEP_DETECTOR returns the handle to a new STEP_DETECTOR or the handle to
%      the existing singleton*.
%
%      STEP_DETECTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STEP_DETECTOR.M with the given input arguments.
%
%      STEP_DETECTOR('Property','Value',...) creates a new STEP_DETECTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before step_detector_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to step_detector_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help step_detector

% Last Modified by GUIDE v2.5 23-Nov-2021 20:00:38

% Begin initialization code - DO NOT EDIT
% Written by Juergen Dukart, 23.11.2021

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @step_detector_OpeningFcn, ...
                   'gui_OutputFcn',  @step_detector_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before step_detector is made visible.
function step_detector_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to step_detector (see VARARGIN)

% Choose default command line output for step_detector
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes step_detector wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = step_detector_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Remove_data.
function Remove_data_Callback(hObject, eventdata, handles)
% hObject    handle to Remove_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global start_val; 
% global stop_val;
global data_all;

start_val = str2num(get(handles.start_remove,'String'));
stop_val = str2num(get(handles.stop_remove,'String'));

data_all.start_val_all = [data_all.start_val_all; start_val];
data_all.stop_val_all = [data_all.stop_val_all; stop_val];
redraw_figures(handles);




% --- Executes on button press in mark_step.
function mark_step_Callback(hObject, eventdata, handles)
% hObject    handle to mark_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data_all
step_val = str2num(get(handles.step_index,'String'));
data_all.step_all = [data_all.step_all step_val];
redraw_figures(handles);


function start_remove_Callback(hObject, eventdata, handles)
% hObject    handle to start_remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of start_remove as text
%        str2double(get(hObject,'String')) returns contents of start_remove as a double


% --- Executes during object creation, after setting all properties.
function start_remove_CreateFcn(hObject, eventdata, handles)
% hObject    handle to start_remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stop_remove_Callback(hObject, eventdata, handles)
% hObject    handle to stop_remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stop_remove as text
%        str2double(get(hObject,'String')) returns contents of stop_remove as a double


% --- Executes during object creation, after setting all properties.
function stop_remove_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stop_remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function step_index_Callback(hObject, eventdata, handles)
% hObject    handle to step_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step_index as text
%        str2double(get(hObject,'String')) returns contents of step_index as a double


% --- Executes during object creation, after setting all properties.
function step_index_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load_file.
function load_file_Callback(hObject, eventdata, handles)
% hObject    handle to load_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('.csv');
full_path = fullfile(pathname,filename);
set(handles.file_loaded,'String', full_path);
data = csvread_my(full_path,';');
data_n = cell2num_my(data(2:end,:));

if size(data_n,2)>3
    N = 3;
else
    N = size(data_n,2);
end

opt_filter =  get(handles.opt_filt,'Value');


if opt_filter
    frequency = str2num(get(handles.edit8,'String'));
    if isempty(frequency)
        frequency = 200;
    end
    lowPassfilter = 0.1;
    highPassfilter = Inf;
    
    for i = 1:N
       data_n(:,i) = filter_my(data_n(:,i),lowPassfilter,highPassfilter,frequency);
    end
end



xyz = sqrt(sum(data_n(:,1:N)'.^2)');
hold(handles.axes1,'off');
hold(handles.axes2,'off');
if size(data_n,2)>3
    tt = generate_colors_nice_my(4);
else
    tt = generate_colors_nice_my(size(data_n,2)+1);
end


for i = 1:N
    plot(handles.axes1,data_n(:,i),'-','color',tt(i,:));
    hold(handles.axes1,'on');
end

plot(handles.axes2,[xyz],'-','color',tt(end,:));
hold(handles.axes2,'on');
ylabel(handles.axes1,'Raw data');
ylabel(handles.axes2,'sqrt(sum(columns)^2)');
zoom(handles.axes2,'on');
h = zoom;
setAllowAxesZoom(h,handles.axes1,false);
x_lim = xlim(handles.axes2);
y_lim = ylim(handles.axes2);
y_lim2 = ylim(handles.axes1);
global data_all;
data_all.data_n = data_n;
data_all.xyz = xyz;
data_all.tt = tt;
data_all.x_lim = x_lim;
data_all.y_lim = y_lim;
data_all.y_lim2 = y_lim2;
data_all.start_val_all = [];
data_all.stop_val_all = [];
data_all.step_all = [];
data_all.full_path = full_path;



function file_loaded_Callback(hObject, eventdata, handles)
% hObject    handle to file_loaded (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_loaded as text
%        str2double(get(hObject,'String')) returns contents of file_loaded as a double


% --- Executes during object creation, after setting all properties.
function file_loaded_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_loaded (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in select_remove_start.
function select_remove_start_Callback(hObject, eventdata, handles)
% hObject    handle to select_remove_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coords = ginput(1);
% global start_val;
% start_val = coords(1);
set(handles.start_remove,'String', num2str(round(coords(1))));
zoom(handles.axes2,'on');

% --- Executes on button press in select_remove_stop.
function select_remove_stop_Callback(hObject, eventdata, handles)
% hObject    handle to select_remove_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coords = ginput(1);
% global stop_val;
% stop_val = coords(1);
set(handles.stop_remove,'String', num2str(round(coords(1))));
zoom(handles.axes2,'on');

% --- Executes on button press in select_step.
function select_step_Callback(hObject, eventdata, handles)
% hObject    handle to select_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Nsteps = inputdlg({'Enter number of steps you want to define'},'',[1 35]);
coords = ginput(cell2num_my(Nsteps));
% global step_val;
% step_val = coords(1);
set(handles.step_index,'String', sprintf('%d ',round(coords(:,1))));
zoom(handles.axes2,'on');


% --- Executes on button press in undo_remove.
function undo_remove_Callback(hObject, eventdata, handles)
% hObject    handle to undo_remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data_all
data_all.start_val_all = data_all.start_val_all(1:end-1);
data_all.stop_val_all = data_all.stop_val_all(1:end-1);
redraw_figures(handles);

% --- Executes on button press in undo_step.
function undo_step_Callback(hObject, eventdata, handles)
% hObject    handle to undo_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data_all
data_all.step_all = data_all.step_all(1:end-1);
redraw_figures(handles);

function redraw_figures(handles)
global data_all;

y_lim = data_all.y_lim;
y_lim2 = data_all.y_lim2;
hold(handles.axes1,'off');
hold(handles.axes2,'off');

if size(data_all.data_n,2)>3
    N = 3;
else
    N = size(data_all.data_n,2);
end

for i = 1:N
    plot(handles.axes1,data_all.data_n(:,i),'-','color',data_all.tt(i,:));
    hold(handles.axes1,'on');
end

plot(handles.axes2,[data_all.xyz],'-','color',data_all.tt(end,:));
hold(handles.axes2,'on');
ylabel(handles.axes1,'Raw data)');
ylabel(handles.axes2,'sqrt(sum(columns)^2)');
for i = 1:length(data_all.start_val_all)
pch1 = patch(handles.axes2, [data_all.start_val_all(i),data_all.stop_val_all(i),data_all.stop_val_all(i), data_all.start_val_all(i)], [y_lim(1) y_lim(1) y_lim(2) y_lim(2)], 'r', ...
    'EdgeColor', 'none', 'FaceAlpha', 0.3);
pch1 = patch(handles.axes1, [data_all.start_val_all(i),data_all.stop_val_all(i),data_all.stop_val_all(i), data_all.start_val_all(i)], [y_lim2(1) y_lim2(1) y_lim2(2) y_lim2(2)], 'r', ...
    'EdgeColor', 'none', 'FaceAlpha', 0.3);
end

for j = 1:length(data_all.step_all)
   plot(handles.axes2,data_all.step_all(j),data_all.xyz(data_all.step_all(j)),'o','MarkerFaceColor','green','color','green');
    plot(handles.axes1,data_all.step_all(j),y_lim2(2),'o','MarkerFaceColor','green','color','green');
end
h = zoom;
setAllowAxesZoom(h,handles.axes1,false);

% --- Executes on button press in export_results.
function export_results_Callback(hObject, eventdata, handles)
% hObject    handle to export_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data_all;
step_all = ['Step_indices'; num2cell_my(data_all.step_all')];
remove_all = [{'Remove_start' 'Remove_stop'}; num2cell_my([data_all.start_val_all data_all.stop_val_all])];
save_name = char(inputdlg({'Enter the file name to save the results'},'',[1 35]));
dir_save = uigetdir();
cell2csv(fullfile(dir_save,[save_name '_step_all.csv']),step_all);
cell2csv(fullfile(dir_save,[save_name '_remove_all.csv']),remove_all);

% F = getframe(handles.axes2);
% Image = frame2im(F);
% imwrite(Image, fullfile(dir_save,[save_name '_data_vis.png']),'XResolution',4000,'YResolution',2000)

fig2 = figure('visible','off');
newax = copyobj(handles.axes2,fig2);
hLeg = legend(handles.axes2,'Signal');
print(fig2,fullfile(dir_save,[save_name '_data_vis.png']),'-dpng','-r300');
close(fig2);



%___________________
% support function
%__________________

function [data_num] = num2cell_my(data)

% [r,c]=ind2sub(size(data), strmatch('NA', data, 'exact'));
m = size(data);

% for l = 1:length(r)
% data{r(l),c(l)}='-4';
% end

% data_num = zeros(m(1),m(2));

for i=1:m(2)
        data_num(:,i) = regexprep(cellstr(num2str(data(:,i))),' ','');
end

function colors = generate_colors_nice_my(N)
% function colors = generate_colors_nice_my(N)
% from pa_LCH2RGB
N = N+1;
L = repmat(65,N,1);
C = repmat(75,N,1);
H = linspace(25,385,N)';


a = cos(H*pi/180).*C;
b = sin(H*pi/180).*C;

%% Different L*ab -> XYZ from http://www.brucelindbloom.com/index.html?Eqn_Lab_to_XYZ.html

f_y=(L+16)/116;
f_x	= f_y+a/500;
f_z	= f_y-b/200;

epsilon=0.008856;
kappa=903.3;

X=f_x.^3;
sel=f_x.^3<=epsilon;
X(sel)=(116*f_x(sel)-16)/kappa;

Y=((L+16)/116).^3;
sel=L<=(kappa*epsilon);
Y(sel)=L(sel)/kappa;

Z=f_z.^3;
sel=f_z<=epsilon;
Z(sel)=(116*f_z(sel)-16)/kappa;

XYZ = [X Y Z];

ref	=  [95.05, 100.000, 108.90]/100;
XYZ =  bsxfun(@times,XYZ,ref);


    T=[3.2406, -1.5372, -0.4986;...
        -0.9689, 1.8758, 0.0415;...
        0.0557, -0.2040, 1.0570];
    
    RGB		= XYZ*T';
    
    % Gamma correction to convert RGB to sRGB
    sel			= RGB>0.0031308; % colorspace: 0.0031306684425005883
    RGB(sel)	= 1.055*(RGB(sel).^(1/2.4))-0.055;
    RGB(~sel)	= 12.92*RGB(~sel);
    
   
RGB(RGB>1)	= 1;
RGB(RGB<0)	= 0;
colors = RGB(1:end-1,:);

function [data] = csvread_my(file,delimiter)


smri=importdata(file,'');
m = length(regexp(smri{1},delimiter, 'split'));
data = cell(length(smri), m);
for i = 1:length(smri)
mm = regexp(smri{i},delimiter, 'split');
data(i,1:length(mm)) = regexp(smri{i},delimiter, 'split');
    if rem(i,1000)==0
        disp(i)
    end
end

function data = filter_my(data_in,lp,hp, frequency)
% function data = filter_my(data_in,lp,hp, frequency)
    N  = length(data_in);
%     data_n = data_in - mean(data_in);
    data_n = data_in;
    nn = frequency./N;
    ff  = (-frequency./2:nn:frequency./2-nn)';
    filt = ([lp < abs(ff)] & [abs(ff) < hp]);
    spect = fftshift(fft(data_n))/N;
    spect_filt = filt.*spect;
    data = ifft(ifftshift(spect_filt)); 
    data = real(data).*size(data,1);


% --- Executes on button press in opt_filt.
function opt_filt_Callback(hObject, eventdata, handles)
% hObject    handle to opt_filt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of opt_filt



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
