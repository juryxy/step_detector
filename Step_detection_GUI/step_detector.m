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

% Last Modified by GUIDE v2.5 10-Dec-2021 09:27:43

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
[path,filename] = fileparts(full_path);
set(handles.file_loaded,'String', full_path);
data = csvread_my(full_path,';');
data_n = cell2num_my(data(2:end,:));

try
    full_path_gyro = regexprep(full_path,'accelerometer.csv','gyroscope.csv');
    data_gyro = csvread_my(full_path_gyro,';');
    data_n_gyro = cell2num_my(data_gyro(2:end,:));
    index_gyro = find_closest_values(data_n_gyro(:,4),data_n(:,4));
    data_n_gyro = data_n_gyro(index_gyro,:);
catch
    disp('Gyroscope data not found');
end


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
       disp(mean(data_n));
       if exist('data_n_gyro','var')
           data_n_gyro(:,i) = filter_my(data_n_gyro(:,i),lowPassfilter,highPassfilter,frequency);
       end
    end
end



xyz = sqrt(sum(data_n(:,1:N)'.^2)');
try
data_n_gyro = sqrt(sum(data_n_gyro(:,1:N)'.^2)');
end

hold(handles.axes1,'off');
hold(handles.axes2,'off');
hold(handles.axes3,'off');
if size(data_n,2)>3
    tt = generate_colors_nice_my(4);
else
    tt = generate_colors_nice_my(size(data_n,2)+1);
end


for i = 1:N
    plot(handles.axes1,data_n(:,i),'-','color',tt(i,:));
    hold(handles.axes1,'on');
%         if exist('data_n_gyro','var')
%          plot(handles.axes3,data_n_gyro(:,i),'-','color',tt(i,:));
%          hold(handles.axes3,'on');
%     end
end

         plot(handles.axes3,data_n_gyro,'-','color',tt(1,:));
         hold(handles.axes3,'on');

plot(handles.axes2,xyz,'-','color',tt(end,:));
hold(handles.axes2,'on');
ylabel(handles.axes1,'Accelerometer');
ylabel(handles.axes3,'Gyroscope');
ylabel(handles.axes2,'sqrt(sum(data^2))');
zoom(handles.axes2,'on');
h = zoom;
setAllowAxesZoom(h,handles.axes1,false);
x_lim = xlim(handles.axes2);
y_lim = ylim(handles.axes2);
y_lim2 = ylim(handles.axes1);
y_lim3 = ylim(handles.axes3);
global data_all;
data_all.data_n = data_n;
data_all.data_n_gyro = data_n_gyro;
% data_all.data_n_gyro_f = data_n_gyro_f;
data_all.xyz = xyz;
data_all.tt = tt;
data_all.x_lim = x_lim;
data_all.y_lim = y_lim;
data_all.y_lim2 = y_lim2;
data_all.y_lim3 = y_lim3;
data_all.start_val_all = [];
data_all.stop_val_all = [];
data_all.step_all = [];
data_all.full_path = full_path;
data_all.filename = filename;



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
y_lim3 = data_all.y_lim3;
hold(handles.axes1,'off');
hold(handles.axes2,'off');
if isfield(data_all,'data_n_gyro')
    hold(handles.axes3,'off');
end

if size(data_all.data_n,2)>3
    N = 3;
else
    N = size(data_all.data_n,2);
end

for i = 1:N
    plot(handles.axes1,data_all.data_n(:,i),'-','color',data_all.tt(i,:));
    hold(handles.axes1,'on');
%     if isfield(data_all,'data_n_gyro')
%         plot(handles.axes3,data_all.data_n_gyro(:,i),'-','color',data_all.tt(i,:));
%         hold(handles.axes3,'on');
%     end
end

        plot(handles.axes3,data_all.data_n_gyro,'-','color',data_all.tt(1,:));
        hold(handles.axes3,'on');

plot(handles.axes2,[data_all.xyz],'-','color',data_all.tt(end,:));
hold(handles.axes2,'on');
ylabel(handles.axes1,'accelerometer');
ylabel(handles.axes3,'gyroscope');
ylabel(handles.axes2,'sqrt(sum(data^2))');
for i = 1:length(data_all.start_val_all)
pch1 = patch(handles.axes2, [data_all.start_val_all(i),data_all.stop_val_all(i),data_all.stop_val_all(i), data_all.start_val_all(i)], [y_lim(1) y_lim(1) y_lim(2) y_lim(2)], 'r', ...
    'EdgeColor', 'none', 'FaceAlpha', 0.3);
pch1 = patch(handles.axes1, [data_all.start_val_all(i),data_all.stop_val_all(i),data_all.stop_val_all(i), data_all.start_val_all(i)], [y_lim2(1) y_lim2(1) y_lim2(2) y_lim2(2)], 'r', ...
    'EdgeColor', 'none', 'FaceAlpha', 0.3);
    if isfield(data_all,'data_n_gyro')
        pch1 = patch(handles.axes3, [data_all.start_val_all(i),data_all.stop_val_all(i),data_all.stop_val_all(i), data_all.start_val_all(i)], [y_lim3(1) y_lim3(1) y_lim3(2) y_lim3(2)], 'r', ...
        'EdgeColor', 'none', 'FaceAlpha', 0.3);
    end
end

for j = 1:length(data_all.step_all)
   plot(handles.axes2,data_all.step_all(j),data_all.xyz(data_all.step_all(j)),'o','MarkerFaceColor','green','color','green');
   plot(handles.axes1,data_all.step_all(j),y_lim2(2),'o','MarkerFaceColor','green','color','green');
    if isfield(data_all,'data_n_gyro')
        plot(handles.axes3,data_all.step_all(j),y_lim3(2),'o','MarkerFaceColor','green','color','green');
    end
end
h = zoom;
setAllowAxesZoom(h,handles.axes1,false);
setAllowAxesZoom(h,handles.axes3,false);


% --- Executes on button press in export_results.
function export_results_Callback(hObject, eventdata, handles)
% hObject    handle to export_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data_all;
dir_save = get(handles.dir_save,'String');%uigetdir();

try
step_all = ['Step_indices'; num2cell_my(data_all.step_all')];
cell2csv(fullfile(dir_save,[data_all.filename '_step_labels.csv']),step_all);
end

try
remove_all = [{'Remove_start' 'Remove_stop'}; num2cell_my([data_all.start_val_all data_all.stop_val_all])];
cell2csv(fullfile(dir_save,[data_all.filename '_remove_labels.csv']),remove_all);
end
% save_name = char(inputdlg({'Enter the file name to save the results'},'',[1 35]));



% F = getframe(handles.axes2);
% Image = frame2im(F);
% imwrite(Image, fullfile(dir_save,[save_name '_data_vis.png']),'XResolution',4000,'YResolution',2000)

fig2 = figure('visible','off');
newax = copyobj(handles.axes2,fig2);
hLeg = legend(handles.axes2,'Signal');
print(fig2,fullfile(dir_save,[data_all.filename '_data_vis.png']),'-dpng','-r300');
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



function dir_save_Callback(hObject, eventdata, handles)
% hObject    handle to dir_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dir_save as text
%        str2double(get(hObject,'String')) returns contents of dir_save as a double

% --- Executes during object creation, after setting all properties.
function dir_save_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dir_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in select_dir_save.
function select_dir_save_Callback(hObject, eventdata, handles)
% hObject    handle to select_dir_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dir_save = uigetdir(cd, 'Select directory to save data');
set(handles.dir_save,'String', dir_save);


function [data_num] = cell2num_my(data)

        tt = isemptycell(data);
        data(tt==1)= {'NaN'};

% [r,c]=ind2sub(size(data), strmatch('NA', data, 'exact'));
m = size(data);
% 
% for l = 1:length(r)
% data{r(l),c(l)}='-4';
% end

data_num = zeros(m(1),m(2));

if isstr(data{1,1})
for i=1:m(1)
%     disp(i);
    for j=1:m(2)
        data_num(i,j) = str2double(data{i,j});
    end
end
else
  for i=1:m(1)
%     disp(i);
    for j=1:m(2)
        data_num(i,j) = data{i,j};
    end
  end
end

function E = isemptycell(C)
% ISEMPTYCELL Apply the isempty function to each element of a cell array
% E = isemptycell(C)
%
% This is equivalent to E = cellfun('isempty', C),
% where cellfun is a function built-in to matlab version 5.3 or newer.

if 0 % all(version('-release') >= 12)
  E = cellfun('isempty', C);
else
  E = zeros(size(C));
  for i=1:prod(size(C))
    E(i) = isempty(C{i});
  end
  E = logical(E);
end


function cell2csv(fileName, cellArray, separator, excelYear, decimal)
% Writes cell array content into a *.csv file.
% 
% CELL2CSV(fileName, cellArray, separator, excelYear, decimal)
%
% fileName     = Name of the file to save. [ i.e. 'text.csv' ]
% cellArray    = Name of the Cell Array where the data is in
% separator    = sign separating the values (default = ';')
% excelYear    = depending on the Excel version, the cells are put into
%                quotes before they are written to the file. The separator
%                is set to semicolon (;)
% decimal      = defines the decimal separator (default = '.')
%
%         by Sylvain Fiedler, KA, 2004
% updated by Sylvain Fiedler, Metz, 06
% fixed the logical-bug, Kaiserslautern, 06/2008, S.Fiedler
% added the choice of decimal separator, 11/2010, S.Fiedler

%% Checking f�r optional Variables
if ~exist('separator', 'var')
    separator = ';';
end

if ~exist('excelYear', 'var')
    excelYear = 1997;
end

if ~exist('decimal', 'var')
    decimal = '.';
end

%% Setting separator for newer excelYears
if excelYear > 2000
    separator = ';';
end

%% Write file
datei = fopen(fileName, 'w');

for z=1:size(cellArray, 1)
    for s=1:size(cellArray, 2)
        
        var = eval(['cellArray{z,s}']);
        % If zero, then empty cell
        if size(var, 1) == 0
            var = '';
        end
        % If numeric -> String
        if isnumeric(var)
            var = num2str(var);
            % Conversion of decimal separator (4 Europe & South America)
            % http://commons.wikimedia.org/wiki/File:DecimalSeparator.svg
            if decimal ~= '.'
                var = strrep(var, '.', decimal);
            end
        end
        % If logical -> 'true' or 'false'
        if islogical(var)
            if var == 1
                var = 'TRUE';
            else
                var = 'FALSE';
            end
        end
        % If newer version of Excel -> Quotes 4 Strings
        if excelYear > 2000
            var = ['"' var '"'];
        end
        
        % OUTPUT value
        fprintf(datei, '%s', var);
        
        % OUTPUT separator
        if s ~= size(cellArray, 2)
            fprintf(datei, separator);
        end
    end
    if z ~= size(cellArray, 1) % prevent a empty line at EOF
        % OUTPUT newline
        fprintf(datei, '\n');
    end
end
% Closing file
fclose(datei);
% END
