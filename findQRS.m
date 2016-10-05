% ecg: An ECG signal
function indices = findQRS(ecg)
    y2 = zeros(size(ecg));
    qrs = 0;
    % indices: locations of QRS complexes in ecg 
    %   (one index per QRS)  
    indices = []; % final answer 
    
    for i = 5:length(ecg)
        y0 = abs(ecg(i)-(ecg(i-2))) % first derivative
        y1 = abs(ecg(i)-(2*ecg(i-2))+ecg(i-4)) % second derivative
        y2(i) = (1.3*y0)+(1.1*y1); % combo of 1st and 2nd
        y3 = sum(y2(max(1,i-9):i)); % average of y2 over time
        
        if qrs == 0;
            qrs = y3>4;
            if qrs
                indices = [indices i]
            end
        else
            qrs = y3>4;
        end
    end
end