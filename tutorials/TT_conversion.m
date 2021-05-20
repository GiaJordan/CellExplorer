%Tried to write a script to load the timestamps from each cluster and
%aggregate them into info for each tetrode. No example data is given for
%the data at this stage, so I'm unsure if this is the optimal format to
%load into

fileList = dir(fullfile('TT*.t'));

tetName='';
ts=[];

for i=1:length(fileList)
    
    if ~strcmp(fileList(i).name(1:5),tetName)
        
        
        
        currTet=fileList(i).name;
        tetName=currTet(1:5)
    
    end
    
    currTet=fileList(i).name
    disp(currTet)
    f=fopen(currTet);
    
    value=fread(f,'uint16');
    
    %disp(value')
    if ~isempty(value)
        %ts=horzcat(ts,value);
        %ts=vertcat(ts,value');
        ts=vertcat(ts,value);
    end
    value=[];
    %ts=fread(f,'uint16');
    %disp(fread(f,'uint16')')
    %disp(ts)
    fclose(f);
    
    
        
    try    
        if ~strcmp(fileList(i+1).name(1:5),tetName)


            ts=sort(ts);
            save(tetName,'ts');



            ts=[];

        end
    catch
        if i==length(fileList)
            
            ts=sort(ts);
            save(tetName,'ts');
        end
    
    end
    
end