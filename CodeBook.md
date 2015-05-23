The features selected come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyLinearAcceleration-XYZ and timeGravityLinearAcceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyLinearAccelerationJerk-XYZ and timeBodyAngularVelocityJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyLinearAccelerationMagnitude, timeGravityLinearAccelerationMagnitude, timeBodyLinearAccelerationJerkMagnitude, timeBodyAngularVelocityMagnitude, timeBodyAngularVelocityJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frecuencyBodyLinearAcceleration-XYZ, frecuencyBodyLinearAccelerationJerk-XYZ, frecuencyBodyAngularVelocity-XYZ, frecuencyBodyLinearAccelerationJerkMagnitude, frecuencyBodyAngularVelocityMagnitude, frecuencyBodyAngularVelocityJerkMagnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The Dataset provided offers the averaged values from the original measures taken,
per Subject, and by Activity.

Note: From `names(mytidydataset)` we get the following variable names.
Alongside it, a short description is provided.
| Variable/Column Name | Meaning |
| "Subject" | Subject ID that gathered the data |
| "ActivityName" | The activity name for the corresponding measures |
| timeBodyLinearAcceleration.mean.X | Average value for this variable for this subject and activity|
| timeBodyLinearAcceleration.mean.Y | Average value for this variable for this subject and activity|
| timeBodyLinearAcceleration.mean.Z | Average value for this variable for this subject and activity|
| timeBodyLinearAcceleration.std.X | Average value for this variable for this subject and activity|
| timeBodyLinearAcceleration.std.Y | Average value for this variable for this subject and activity|
| timeBodyLinearAcceleration.std.Z | Average value for this variable for this subject and activity|
| timeGravityLinearAcceleration.mean.X | Average value for this variable for this subject and activity|
| timeGravityLinearAcceleration.mean.Y | Average value for this variable for this subject and activity|
| timeGravityLinearAcceleration.mean.Z | Average value for this variable for this subject and activity|
| timeGravityLinearAcceleration.std.X | Average value for this variable for this subject and activity|
| timeGravityLinearAcceleration.std.Y | Average value for this variable for this subject and activity|
| timeGravityLinearAcceleration.std.Z | Average value for this variable for this subject and activity|
| timeBodyLinearAccelerationJerk.mean.X | Average value for this variable for this subject and activity|
| timeBodyLinearAccelerationJerk.mean.Y | Average value for this variable for this subject and activity|
| timeBodyLinearAccelerationJerk.mean.Z | Average value for this variable for this subject and activity|
| timeBodyLinearAccelerationJerk.std.X | Average value for this variable for this subject and activity|
| timeBodyLinearAccelerationJerk.std.Y | Average value for this variable for this subject and activity|
| timeBodyLinearAccelerationJerk.std.Z | Average value for this variable for this subject and activity|
| timeBodyAngularVelocity.mean.X | Average value for this variable for this subject and activity|
| timeBodyAngularVelocity.mean.Y | Average value for this variable for this subject and activity|
| timeBodyAngularVelocity.mean.Z | Average value for this variable for this subject and activity|
| timeBodyAngularVelocity.std.X | Average value for this variable for this subject and activity|
| timeBodyAngularVelocity.std.Y | Average value for this variable for this subject and activity|
| timeBodyAngularVelocity.std.Z | Average value for this variable for this subject and activity|
| timeBodyAngularVelocityJerk.mean.X | Average value for this variable for this subject and activity|
| timeBodyAngularVelocityJerk.mean.Y | Average value for this variable for this subject and activity|
| timeBodyAngularVelocityJerk.mean.Z | Average value for this variable for this subject and activity|
| timeBodyAngularVelocityJerk.std.X | Average value for this variable for this subject and activity|
| timeBodyAngularVelocityJerk.std.Y | Average value for this variable for this subject and activity|
| timeBodyAngularVelocityJerk.std.Z | Average value for this variable for this subject and activity|
| timeBodyLinearAccelerationMagnitude.mean | Average value for this variable for this subject and activity|
| timeBodyLinearAccelerationMagnitude.std | Average value for this variable for this subject and activity|
| timeGravityLinearAccelerationMagnitude.mean | Average value for this variable for this subject and activity|
| timeGravityLinearAccelerationMagnitude.std | Average value for this variable for this subject and activity|
| timeBodyLinearAccelerationJerkMagnitude.mean | Average value for this variable for this subject and activity|
| timeBodyLinearAccelerationJerkMagnitude.std | Average value for this variable for this subject and activity|
| timeBodyAngularVelocityMagnitude.mean | Average value for this variable for this subject and activity|
| timeBodyAngularVelocityMagnitude.std | Average value for this variable for this subject and activity|
| timeBodyAngularVelocityJerkMagnitude.mean | Average value for this variable for this subject and activity|
| timeBodyAngularVelocityJerkMagnitude.std | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAcceleration.mean.X | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAcceleration.mean.Y | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAcceleration.mean.Z | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAcceleration.std.X | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAcceleration.std.Y | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAcceleration.std.Z | Average value for this variable for this subject and activity|   
| FrecuencyBodyLinearAccelerationJerk.mean.X | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAccelerationJerk.mean.Y | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAccelerationJerk.mean.Z | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAccelerationJerk.std.X | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAccelerationJerk.std.Y | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAccelerationJerk.std.Z | Average value for this variable for this subject and activity|
| FrecuencyBodyAngularVelocity.mean.X | Average value for this variable for this subject and activity|
| FrecuencyBodyAngularVelocity.mean.Y | Average value for this variable for this subject and activity|
| FrecuencyBodyAngularVelocity.mean.Z | Average value for this variable for this subject and activity|
| FrecuencyBodyAngularVelocity.std.X | Average value for this variable for this subject and activity|
| FrecuencyBodyAngularVelocity.std.Y | Average value for this variable for this subject and activity|
| FrecuencyBodyAngularVelocity.std.Z | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAccelerationMagnitude.mean | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAccelerationMagnitude.std | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAccelerationJerkMagnitude.mean | Average value for this variable for this subject and activity|
| FrecuencyBodyLinearAccelerationJerkMagnitude.std | Average value for this variable for this subject and activity|
| FrecuencyBodyAngularVelocityMagnitude.mean | Average value for this variable for this subject and activity|
| FrecuencyBodyAngularVelocityMagnitude.std | Average value for this variable for this subject and activity|
| FrecuencyBodyAngularVelocityJerkMagnitude.mean | Average value for this variable for this subject and activity|
| FrecuencyBodyAngularVelocityJerkMagnitude.std | Average value for this variable for this subject and activity|