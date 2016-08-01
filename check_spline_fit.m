%May 14, 2014
%Plots splines from auto foil kinematics vi on top of the foil avi images to
%verify fit.


%This script requires a list of splines from the auto foil kinematics vi
%(from the "Save extra splines (at increment) to txt file" feature).


%Import the splines text file as a matrix and call it "data"

%Update the next two commands.
pixfact=0.336634;     %DaVis pixel scale factor (mm/pixel) used with this video in the AFK vi
mov=VideoReader('G:\Kinematics_nlSPS_05_12_2014\Data_videos\0_3_heave_05_12_2014.avi');        %File name and path for the foil avi




%Set some indices
c1=1;
c2=2;
j=0;
clear M


%Plot each spline on top of its corresponding avi image
while c2<=size(data,2)
    im=data(1,c1);          %Get the current frame number
    
    xdata=data(2:end,c1);       %Get x data for the spline
    ydata=data(2:end,c2);       %Get y data for the spline


    frame=read(mov,im);         %Get the corresponding avi image
    
    
    
    %Update or comment out the next lines to match the image
    %mirroring/rotations done in the auto foil kinematics vi (get the
    %leading edge to the left side, clean side up)
    
    frame=imrotate(frame,180);
    %frame=fliplr(frame)
    %frame=flipud(frame)
    
    
    
    imshow(frame,'XData',[0 1024*pixfact],'YData',[0 1024*pixfact]);        %Display the image scaled to match the spline's axes
    hold on         %Keep the image on
    
    plot(xdata,ydata,'LineWidth',2,'Color','red')       %Plot the spline on top of the image
    
    
    %Get the figure
    j=j+1;
    M(j)=getframe(gcf);

    %Increment indices
    c1=c1+2;
    c2=c2+2;
end

%Use the last line to save a video of the spline on top of the image
movie2avi(M,'G:\Kinematics_nlSPS_05_12_2014\Kinematics_results\checkspline_0_3_heave_5cyc_incr5.avi')