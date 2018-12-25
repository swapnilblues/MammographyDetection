function stats = GLCM_Featuresl(InitImage)
    GLCM2 = myGrayCoMatrix(InitImage);
    stats = CalGLCM_Features(GLCM2,0);
end