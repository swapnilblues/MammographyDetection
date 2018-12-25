function y = Quantize(x)
    if x<32
        y=1;
    elseif x<64
        y=2;
    elseif x<96
        y=3;
    elseif x<128
        y=4;
    elseif x<160
        y=5;
    elseif x<192
        y=6;
    elseif x<224
        y=7;
    else
        y=8;
    end
end
       