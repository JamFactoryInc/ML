??%
??
D
AddV2
x"T
y"T
z"T"
Ttype:
2	??
B
AssignVariableOp
resource
value"dtype"
dtypetype?
?
BatchToSpaceND

input"T
block_shape"Tblock_shape
crops"Tcrops
output"T"	
Ttype" 
Tblock_shapetype0:
2	"
Tcropstype0:
2	
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
?
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
:
FloorMod
x"T
y"T
z"T"
Ttype:
	2	
?
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
_
Pad

input"T
paddings"	Tpaddings
output"T"	
Ttype"
	Tpaddingstype0:
2	
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
?
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
@
ReadVariableOp
resource
value"dtype"
dtypetype?
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
?
SpaceToBatchND

input"T
block_shape"Tblock_shape
paddings"	Tpaddings
output"T"	
Ttype" 
Tblock_shapetype0:
2	"
	Tpaddingstype0:
2	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
?
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ?
@
StaticRegexFullMatch	
input

output
"
patternstring
?
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?"serve*	2.5.0-rc32v2.5.0-rc2-14-gfcdf65934708??"
z
conv1d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv1d/kernel
s
!conv1d/kernel/Read/ReadVariableOpReadVariableOpconv1d/kernel*"
_output_shapes
: *
dtype0
n
conv1d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv1d/bias
g
conv1d/bias/Read/ReadVariableOpReadVariableOpconv1d/bias*
_output_shapes
: *
dtype0
~
conv1d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  * 
shared_nameconv1d_1/kernel
w
#conv1d_1/kernel/Read/ReadVariableOpReadVariableOpconv1d_1/kernel*"
_output_shapes
:  *
dtype0
r
conv1d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv1d_1/bias
k
!conv1d_1/bias/Read/ReadVariableOpReadVariableOpconv1d_1/bias*
_output_shapes
: *
dtype0
~
conv1d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  * 
shared_nameconv1d_2/kernel
w
#conv1d_2/kernel/Read/ReadVariableOpReadVariableOpconv1d_2/kernel*"
_output_shapes
:  *
dtype0
r
conv1d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv1d_2/bias
k
!conv1d_2/bias/Read/ReadVariableOpReadVariableOpconv1d_2/bias*
_output_shapes
: *
dtype0
~
conv1d_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  * 
shared_nameconv1d_3/kernel
w
#conv1d_3/kernel/Read/ReadVariableOpReadVariableOpconv1d_3/kernel*"
_output_shapes
:  *
dtype0
r
conv1d_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv1d_3/bias
k
!conv1d_3/bias/Read/ReadVariableOpReadVariableOpconv1d_3/bias*
_output_shapes
: *
dtype0
~
conv1d_4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  * 
shared_nameconv1d_4/kernel
w
#conv1d_4/kernel/Read/ReadVariableOpReadVariableOpconv1d_4/kernel*"
_output_shapes
:  *
dtype0
r
conv1d_4/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv1d_4/bias
k
!conv1d_4/bias/Read/ReadVariableOpReadVariableOpconv1d_4/bias*
_output_shapes
: *
dtype0
~
conv1d_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  * 
shared_nameconv1d_5/kernel
w
#conv1d_5/kernel/Read/ReadVariableOpReadVariableOpconv1d_5/kernel*"
_output_shapes
:  *
dtype0
r
conv1d_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv1d_5/bias
k
!conv1d_5/bias/Read/ReadVariableOpReadVariableOpconv1d_5/bias*
_output_shapes
: *
dtype0
t
dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *
shared_namedense/kernel
m
 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_output_shapes

: *
dtype0
l

dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_name
dense/bias
e
dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes
:*
dtype0
~
conv1d_6/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:* 
shared_nameconv1d_6/kernel
w
#conv1d_6/kernel/Read/ReadVariableOpReadVariableOpconv1d_6/kernel*"
_output_shapes
:*
dtype0
r
conv1d_6/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nameconv1d_6/bias
k
!conv1d_6/bias/Read/ReadVariableOpReadVariableOpconv1d_6/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
?
Adam/conv1d/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d/kernel/m
?
(Adam/conv1d/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv1d/kernel/m*"
_output_shapes
: *
dtype0
|
Adam/conv1d/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/conv1d/bias/m
u
&Adam/conv1d/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv1d/bias/m*
_output_shapes
: *
dtype0
?
Adam/conv1d_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv1d_1/kernel/m
?
*Adam/conv1d_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_1/kernel/m*"
_output_shapes
:  *
dtype0
?
Adam/conv1d_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d_1/bias/m
y
(Adam/conv1d_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_1/bias/m*
_output_shapes
: *
dtype0
?
Adam/conv1d_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv1d_2/kernel/m
?
*Adam/conv1d_2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_2/kernel/m*"
_output_shapes
:  *
dtype0
?
Adam/conv1d_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d_2/bias/m
y
(Adam/conv1d_2/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_2/bias/m*
_output_shapes
: *
dtype0
?
Adam/conv1d_3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv1d_3/kernel/m
?
*Adam/conv1d_3/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_3/kernel/m*"
_output_shapes
:  *
dtype0
?
Adam/conv1d_3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d_3/bias/m
y
(Adam/conv1d_3/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_3/bias/m*
_output_shapes
: *
dtype0
?
Adam/conv1d_4/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv1d_4/kernel/m
?
*Adam/conv1d_4/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_4/kernel/m*"
_output_shapes
:  *
dtype0
?
Adam/conv1d_4/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d_4/bias/m
y
(Adam/conv1d_4/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_4/bias/m*
_output_shapes
: *
dtype0
?
Adam/conv1d_5/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv1d_5/kernel/m
?
*Adam/conv1d_5/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_5/kernel/m*"
_output_shapes
:  *
dtype0
?
Adam/conv1d_5/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d_5/bias/m
y
(Adam/conv1d_5/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_5/bias/m*
_output_shapes
: *
dtype0
?
Adam/dense/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *$
shared_nameAdam/dense/kernel/m
{
'Adam/dense/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense/kernel/m*
_output_shapes

: *
dtype0
z
Adam/dense/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_nameAdam/dense/bias/m
s
%Adam/dense/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense/bias/m*
_output_shapes
:*
dtype0
?
Adam/conv1d_6/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/conv1d_6/kernel/m
?
*Adam/conv1d_6/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_6/kernel/m*"
_output_shapes
:*
dtype0
?
Adam/conv1d_6/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/conv1d_6/bias/m
y
(Adam/conv1d_6/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv1d_6/bias/m*
_output_shapes
:*
dtype0
?
Adam/conv1d/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d/kernel/v
?
(Adam/conv1d/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv1d/kernel/v*"
_output_shapes
: *
dtype0
|
Adam/conv1d/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/conv1d/bias/v
u
&Adam/conv1d/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv1d/bias/v*
_output_shapes
: *
dtype0
?
Adam/conv1d_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv1d_1/kernel/v
?
*Adam/conv1d_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_1/kernel/v*"
_output_shapes
:  *
dtype0
?
Adam/conv1d_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d_1/bias/v
y
(Adam/conv1d_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_1/bias/v*
_output_shapes
: *
dtype0
?
Adam/conv1d_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv1d_2/kernel/v
?
*Adam/conv1d_2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_2/kernel/v*"
_output_shapes
:  *
dtype0
?
Adam/conv1d_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d_2/bias/v
y
(Adam/conv1d_2/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_2/bias/v*
_output_shapes
: *
dtype0
?
Adam/conv1d_3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv1d_3/kernel/v
?
*Adam/conv1d_3/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_3/kernel/v*"
_output_shapes
:  *
dtype0
?
Adam/conv1d_3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d_3/bias/v
y
(Adam/conv1d_3/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_3/bias/v*
_output_shapes
: *
dtype0
?
Adam/conv1d_4/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv1d_4/kernel/v
?
*Adam/conv1d_4/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_4/kernel/v*"
_output_shapes
:  *
dtype0
?
Adam/conv1d_4/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d_4/bias/v
y
(Adam/conv1d_4/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_4/bias/v*
_output_shapes
: *
dtype0
?
Adam/conv1d_5/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv1d_5/kernel/v
?
*Adam/conv1d_5/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_5/kernel/v*"
_output_shapes
:  *
dtype0
?
Adam/conv1d_5/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv1d_5/bias/v
y
(Adam/conv1d_5/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_5/bias/v*
_output_shapes
: *
dtype0
?
Adam/dense/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *$
shared_nameAdam/dense/kernel/v
{
'Adam/dense/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense/kernel/v*
_output_shapes

: *
dtype0
z
Adam/dense/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*"
shared_nameAdam/dense/bias/v
s
%Adam/dense/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense/bias/v*
_output_shapes
:*
dtype0
?
Adam/conv1d_6/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/conv1d_6/kernel/v
?
*Adam/conv1d_6/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_6/kernel/v*"
_output_shapes
:*
dtype0
?
Adam/conv1d_6/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/conv1d_6/bias/v
y
(Adam/conv1d_6/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv1d_6/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
?Q
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*?P
value?PB?P B?P
?
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
layer_with_weights-2
layer-2
layer_with_weights-3
layer-3
layer_with_weights-4
layer-4
layer_with_weights-5
layer-5
layer_with_weights-6
layer-6
layer_with_weights-7
layer-7
		optimizer

regularization_losses
	variables
trainable_variables
	keras_api

signatures
h

kernel
bias
regularization_losses
	variables
trainable_variables
	keras_api
h

kernel
bias
regularization_losses
	variables
trainable_variables
	keras_api
h

kernel
bias
regularization_losses
	variables
trainable_variables
 	keras_api
h

!kernel
"bias
#regularization_losses
$	variables
%trainable_variables
&	keras_api
h

'kernel
(bias
)regularization_losses
*	variables
+trainable_variables
,	keras_api
h

-kernel
.bias
/regularization_losses
0	variables
1trainable_variables
2	keras_api
h

3kernel
4bias
5regularization_losses
6	variables
7trainable_variables
8	keras_api
h

9kernel
:bias
;regularization_losses
<	variables
=trainable_variables
>	keras_api
?
?iter

@beta_1

Abeta_2
	Bdecay
Clearning_ratem|m}m~mm?m?!m?"m?'m?(m?-m?.m?3m?4m?9m?:m?v?v?v?v?v?v?!v?"v?'v?(v?-v?.v?3v?4v?9v?:v?
 
v
0
1
2
3
4
5
!6
"7
'8
(9
-10
.11
312
413
914
:15
v
0
1
2
3
4
5
!6
"7
'8
(9
-10
.11
312
413
914
:15
?

regularization_losses
Dnon_trainable_variables
Elayer_regularization_losses
Flayer_metrics
Gmetrics
	variables

Hlayers
trainable_variables
 
YW
VARIABLE_VALUEconv1d/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUEconv1d/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE
 

0
1

0
1
?
Inon_trainable_variables
regularization_losses
Jlayer_regularization_losses
Kmetrics
	variables
Llayer_metrics

Mlayers
trainable_variables
[Y
VARIABLE_VALUEconv1d_1/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEconv1d_1/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE
 

0
1

0
1
?
Nnon_trainable_variables
regularization_losses
Olayer_regularization_losses
Pmetrics
	variables
Qlayer_metrics

Rlayers
trainable_variables
[Y
VARIABLE_VALUEconv1d_2/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEconv1d_2/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE
 

0
1

0
1
?
Snon_trainable_variables
regularization_losses
Tlayer_regularization_losses
Umetrics
	variables
Vlayer_metrics

Wlayers
trainable_variables
[Y
VARIABLE_VALUEconv1d_3/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEconv1d_3/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE
 

!0
"1

!0
"1
?
Xnon_trainable_variables
#regularization_losses
Ylayer_regularization_losses
Zmetrics
$	variables
[layer_metrics

\layers
%trainable_variables
[Y
VARIABLE_VALUEconv1d_4/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEconv1d_4/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE
 

'0
(1

'0
(1
?
]non_trainable_variables
)regularization_losses
^layer_regularization_losses
_metrics
*	variables
`layer_metrics

alayers
+trainable_variables
[Y
VARIABLE_VALUEconv1d_5/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEconv1d_5/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE
 

-0
.1

-0
.1
?
bnon_trainable_variables
/regularization_losses
clayer_regularization_losses
dmetrics
0	variables
elayer_metrics

flayers
1trainable_variables
XV
VARIABLE_VALUEdense/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE
TR
VARIABLE_VALUE
dense/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE
 

30
41

30
41
?
gnon_trainable_variables
5regularization_losses
hlayer_regularization_losses
imetrics
6	variables
jlayer_metrics

klayers
7trainable_variables
[Y
VARIABLE_VALUEconv1d_6/kernel6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEconv1d_6/bias4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUE
 

90
:1

90
:1
?
lnon_trainable_variables
;regularization_losses
mlayer_regularization_losses
nmetrics
<	variables
olayer_metrics

players
=trainable_variables
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
 
 
 

q0
r1
8
0
1
2
3
4
5
6
7
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
4
	stotal
	tcount
u	variables
v	keras_api
D
	wtotal
	xcount
y
_fn_kwargs
z	variables
{	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

s0
t1

u	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE
 

w0
x1

z	variables
|z
VARIABLE_VALUEAdam/conv1d/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/conv1d/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_1/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_1/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_2/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_2/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_3/kernel/mRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_3/bias/mPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_4/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_4/bias/mPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_5/kernel/mRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_5/bias/mPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUEAdam/dense/kernel/mRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
wu
VARIABLE_VALUEAdam/dense/bias/mPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_6/kernel/mRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_6/bias/mPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/conv1d/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/conv1d/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_1/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_1/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_2/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_2/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_3/kernel/vRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_3/bias/vPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_4/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_4/bias/vPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_5/kernel/vRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_5/bias/vPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUEAdam/dense/kernel/vRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
wu
VARIABLE_VALUEAdam/dense/bias/vPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/conv1d_6/kernel/vRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/conv1d_6/bias/vPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
?
serving_default_input_1Placeholder*4
_output_shapes"
 :??????????????????*
dtype0*)
shape :??????????????????
?
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1conv1d/kernelconv1d/biasconv1d_1/kernelconv1d_1/biasconv1d_2/kernelconv1d_2/biasconv1d_3/kernelconv1d_3/biasconv1d_4/kernelconv1d_4/biasconv1d_5/kernelconv1d_5/biasdense/kernel
dense/biasconv1d_6/kernelconv1d_6/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? *-
f(R&
$__inference_signature_wrapper_148311
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename!conv1d/kernel/Read/ReadVariableOpconv1d/bias/Read/ReadVariableOp#conv1d_1/kernel/Read/ReadVariableOp!conv1d_1/bias/Read/ReadVariableOp#conv1d_2/kernel/Read/ReadVariableOp!conv1d_2/bias/Read/ReadVariableOp#conv1d_3/kernel/Read/ReadVariableOp!conv1d_3/bias/Read/ReadVariableOp#conv1d_4/kernel/Read/ReadVariableOp!conv1d_4/bias/Read/ReadVariableOp#conv1d_5/kernel/Read/ReadVariableOp!conv1d_5/bias/Read/ReadVariableOp dense/kernel/Read/ReadVariableOpdense/bias/Read/ReadVariableOp#conv1d_6/kernel/Read/ReadVariableOp!conv1d_6/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp(Adam/conv1d/kernel/m/Read/ReadVariableOp&Adam/conv1d/bias/m/Read/ReadVariableOp*Adam/conv1d_1/kernel/m/Read/ReadVariableOp(Adam/conv1d_1/bias/m/Read/ReadVariableOp*Adam/conv1d_2/kernel/m/Read/ReadVariableOp(Adam/conv1d_2/bias/m/Read/ReadVariableOp*Adam/conv1d_3/kernel/m/Read/ReadVariableOp(Adam/conv1d_3/bias/m/Read/ReadVariableOp*Adam/conv1d_4/kernel/m/Read/ReadVariableOp(Adam/conv1d_4/bias/m/Read/ReadVariableOp*Adam/conv1d_5/kernel/m/Read/ReadVariableOp(Adam/conv1d_5/bias/m/Read/ReadVariableOp'Adam/dense/kernel/m/Read/ReadVariableOp%Adam/dense/bias/m/Read/ReadVariableOp*Adam/conv1d_6/kernel/m/Read/ReadVariableOp(Adam/conv1d_6/bias/m/Read/ReadVariableOp(Adam/conv1d/kernel/v/Read/ReadVariableOp&Adam/conv1d/bias/v/Read/ReadVariableOp*Adam/conv1d_1/kernel/v/Read/ReadVariableOp(Adam/conv1d_1/bias/v/Read/ReadVariableOp*Adam/conv1d_2/kernel/v/Read/ReadVariableOp(Adam/conv1d_2/bias/v/Read/ReadVariableOp*Adam/conv1d_3/kernel/v/Read/ReadVariableOp(Adam/conv1d_3/bias/v/Read/ReadVariableOp*Adam/conv1d_4/kernel/v/Read/ReadVariableOp(Adam/conv1d_4/bias/v/Read/ReadVariableOp*Adam/conv1d_5/kernel/v/Read/ReadVariableOp(Adam/conv1d_5/bias/v/Read/ReadVariableOp'Adam/dense/kernel/v/Read/ReadVariableOp%Adam/dense/bias/v/Read/ReadVariableOp*Adam/conv1d_6/kernel/v/Read/ReadVariableOp(Adam/conv1d_6/bias/v/Read/ReadVariableOpConst*F
Tin?
=2;	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *(
f#R!
__inference__traced_save_149882
?

StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameconv1d/kernelconv1d/biasconv1d_1/kernelconv1d_1/biasconv1d_2/kernelconv1d_2/biasconv1d_3/kernelconv1d_3/biasconv1d_4/kernelconv1d_4/biasconv1d_5/kernelconv1d_5/biasdense/kernel
dense/biasconv1d_6/kernelconv1d_6/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_1Adam/conv1d/kernel/mAdam/conv1d/bias/mAdam/conv1d_1/kernel/mAdam/conv1d_1/bias/mAdam/conv1d_2/kernel/mAdam/conv1d_2/bias/mAdam/conv1d_3/kernel/mAdam/conv1d_3/bias/mAdam/conv1d_4/kernel/mAdam/conv1d_4/bias/mAdam/conv1d_5/kernel/mAdam/conv1d_5/bias/mAdam/dense/kernel/mAdam/dense/bias/mAdam/conv1d_6/kernel/mAdam/conv1d_6/bias/mAdam/conv1d/kernel/vAdam/conv1d/bias/vAdam/conv1d_1/kernel/vAdam/conv1d_1/bias/vAdam/conv1d_2/kernel/vAdam/conv1d_2/bias/vAdam/conv1d_3/kernel/vAdam/conv1d_3/bias/vAdam/conv1d_4/kernel/vAdam/conv1d_4/bias/vAdam/conv1d_5/kernel/vAdam/conv1d_5/bias/vAdam/dense/kernel/vAdam/dense/bias/vAdam/conv1d_6/kernel/vAdam/conv1d_6/bias/v*E
Tin>
<2:*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *+
f&R$
"__inference__traced_restore_150063?? 
?
?
+__inference_sequential_layer_call_fn_148385

inputs
unknown: 
	unknown_0: 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7:  
	unknown_8: 
	unknown_9:  

unknown_10: 

unknown_11: 

unknown_12: 

unknown_13:

unknown_14:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_1481062
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
?q
?
__inference__traced_save_149882
file_prefix,
(savev2_conv1d_kernel_read_readvariableop*
&savev2_conv1d_bias_read_readvariableop.
*savev2_conv1d_1_kernel_read_readvariableop,
(savev2_conv1d_1_bias_read_readvariableop.
*savev2_conv1d_2_kernel_read_readvariableop,
(savev2_conv1d_2_bias_read_readvariableop.
*savev2_conv1d_3_kernel_read_readvariableop,
(savev2_conv1d_3_bias_read_readvariableop.
*savev2_conv1d_4_kernel_read_readvariableop,
(savev2_conv1d_4_bias_read_readvariableop.
*savev2_conv1d_5_kernel_read_readvariableop,
(savev2_conv1d_5_bias_read_readvariableop+
'savev2_dense_kernel_read_readvariableop)
%savev2_dense_bias_read_readvariableop.
*savev2_conv1d_6_kernel_read_readvariableop,
(savev2_conv1d_6_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop3
/savev2_adam_conv1d_kernel_m_read_readvariableop1
-savev2_adam_conv1d_bias_m_read_readvariableop5
1savev2_adam_conv1d_1_kernel_m_read_readvariableop3
/savev2_adam_conv1d_1_bias_m_read_readvariableop5
1savev2_adam_conv1d_2_kernel_m_read_readvariableop3
/savev2_adam_conv1d_2_bias_m_read_readvariableop5
1savev2_adam_conv1d_3_kernel_m_read_readvariableop3
/savev2_adam_conv1d_3_bias_m_read_readvariableop5
1savev2_adam_conv1d_4_kernel_m_read_readvariableop3
/savev2_adam_conv1d_4_bias_m_read_readvariableop5
1savev2_adam_conv1d_5_kernel_m_read_readvariableop3
/savev2_adam_conv1d_5_bias_m_read_readvariableop2
.savev2_adam_dense_kernel_m_read_readvariableop0
,savev2_adam_dense_bias_m_read_readvariableop5
1savev2_adam_conv1d_6_kernel_m_read_readvariableop3
/savev2_adam_conv1d_6_bias_m_read_readvariableop3
/savev2_adam_conv1d_kernel_v_read_readvariableop1
-savev2_adam_conv1d_bias_v_read_readvariableop5
1savev2_adam_conv1d_1_kernel_v_read_readvariableop3
/savev2_adam_conv1d_1_bias_v_read_readvariableop5
1savev2_adam_conv1d_2_kernel_v_read_readvariableop3
/savev2_adam_conv1d_2_bias_v_read_readvariableop5
1savev2_adam_conv1d_3_kernel_v_read_readvariableop3
/savev2_adam_conv1d_3_bias_v_read_readvariableop5
1savev2_adam_conv1d_4_kernel_v_read_readvariableop3
/savev2_adam_conv1d_4_bias_v_read_readvariableop5
1savev2_adam_conv1d_5_kernel_v_read_readvariableop3
/savev2_adam_conv1d_5_bias_v_read_readvariableop2
.savev2_adam_dense_kernel_v_read_readvariableop0
,savev2_adam_dense_bias_v_read_readvariableop5
1savev2_adam_conv1d_6_kernel_v_read_readvariableop3
/savev2_adam_conv1d_6_bias_v_read_readvariableop
savev2_const

identity_1??MergeV2Checkpoints?
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1?
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename? 
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
::*
dtype0*?
value?B?:B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
::*
dtype0*?
value~B|:B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0(savev2_conv1d_kernel_read_readvariableop&savev2_conv1d_bias_read_readvariableop*savev2_conv1d_1_kernel_read_readvariableop(savev2_conv1d_1_bias_read_readvariableop*savev2_conv1d_2_kernel_read_readvariableop(savev2_conv1d_2_bias_read_readvariableop*savev2_conv1d_3_kernel_read_readvariableop(savev2_conv1d_3_bias_read_readvariableop*savev2_conv1d_4_kernel_read_readvariableop(savev2_conv1d_4_bias_read_readvariableop*savev2_conv1d_5_kernel_read_readvariableop(savev2_conv1d_5_bias_read_readvariableop'savev2_dense_kernel_read_readvariableop%savev2_dense_bias_read_readvariableop*savev2_conv1d_6_kernel_read_readvariableop(savev2_conv1d_6_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop/savev2_adam_conv1d_kernel_m_read_readvariableop-savev2_adam_conv1d_bias_m_read_readvariableop1savev2_adam_conv1d_1_kernel_m_read_readvariableop/savev2_adam_conv1d_1_bias_m_read_readvariableop1savev2_adam_conv1d_2_kernel_m_read_readvariableop/savev2_adam_conv1d_2_bias_m_read_readvariableop1savev2_adam_conv1d_3_kernel_m_read_readvariableop/savev2_adam_conv1d_3_bias_m_read_readvariableop1savev2_adam_conv1d_4_kernel_m_read_readvariableop/savev2_adam_conv1d_4_bias_m_read_readvariableop1savev2_adam_conv1d_5_kernel_m_read_readvariableop/savev2_adam_conv1d_5_bias_m_read_readvariableop.savev2_adam_dense_kernel_m_read_readvariableop,savev2_adam_dense_bias_m_read_readvariableop1savev2_adam_conv1d_6_kernel_m_read_readvariableop/savev2_adam_conv1d_6_bias_m_read_readvariableop/savev2_adam_conv1d_kernel_v_read_readvariableop-savev2_adam_conv1d_bias_v_read_readvariableop1savev2_adam_conv1d_1_kernel_v_read_readvariableop/savev2_adam_conv1d_1_bias_v_read_readvariableop1savev2_adam_conv1d_2_kernel_v_read_readvariableop/savev2_adam_conv1d_2_bias_v_read_readvariableop1savev2_adam_conv1d_3_kernel_v_read_readvariableop/savev2_adam_conv1d_3_bias_v_read_readvariableop1savev2_adam_conv1d_4_kernel_v_read_readvariableop/savev2_adam_conv1d_4_bias_v_read_readvariableop1savev2_adam_conv1d_5_kernel_v_read_readvariableop/savev2_adam_conv1d_5_bias_v_read_readvariableop.savev2_adam_dense_kernel_v_read_readvariableop,savev2_adam_dense_bias_v_read_readvariableop1savev2_adam_conv1d_6_kernel_v_read_readvariableop/savev2_adam_conv1d_6_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *H
dtypes>
<2:	2
SaveV2?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes?
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identitym

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*?
_input_shapes?
?: : : :  : :  : :  : :  : :  : : :::: : : : : : : : : : : :  : :  : :  : :  : :  : : :::: : :  : :  : :  : :  : :  : : :::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:($
"
_output_shapes
: : 

_output_shapes
: :($
"
_output_shapes
:  : 

_output_shapes
: :($
"
_output_shapes
:  : 

_output_shapes
: :($
"
_output_shapes
:  : 

_output_shapes
: :(	$
"
_output_shapes
:  : 


_output_shapes
: :($
"
_output_shapes
:  : 

_output_shapes
: :$ 

_output_shapes

: : 

_output_shapes
::($
"
_output_shapes
:: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :($
"
_output_shapes
: : 

_output_shapes
: :($
"
_output_shapes
:  : 

_output_shapes
: :($
"
_output_shapes
:  : 

_output_shapes
: :( $
"
_output_shapes
:  : !

_output_shapes
: :("$
"
_output_shapes
:  : #

_output_shapes
: :($$
"
_output_shapes
:  : %

_output_shapes
: :$& 

_output_shapes

: : '

_output_shapes
::(($
"
_output_shapes
:: )

_output_shapes
::(*$
"
_output_shapes
: : +

_output_shapes
: :(,$
"
_output_shapes
:  : -

_output_shapes
: :(.$
"
_output_shapes
:  : /

_output_shapes
: :(0$
"
_output_shapes
:  : 1

_output_shapes
: :(2$
"
_output_shapes
:  : 3

_output_shapes
: :(4$
"
_output_shapes
:  : 5

_output_shapes
: :$6 

_output_shapes

: : 7

_output_shapes
::(8$
"
_output_shapes
:: 9

_output_shapes
:::

_output_shapes
: 
?r
?
D__inference_conv1d_2_layer_call_and_return_conditional_losses_149378

inputsA
+conv1d_expanddims_1_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Padv
conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/dilation_rateX
conv1d/ShapeShapePad:output:0*
T0*
_output_shapes
:2
conv1d/Shape?
conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack?
conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_1?
conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_2?
conv1d/strided_sliceStridedSliceconv1d/Shape:output:0#conv1d/strided_slice/stack:output:0%conv1d/strided_slice/stack_1:output:0%conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d/strided_sliceq
conv1d/stackPackconv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d/stack?
5conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        27
5conv1d/required_space_to_batch_paddings/base_paddings?
;conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2=
;conv1d/required_space_to_batch_paddings/strided_slice/stack?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
5conv1d/required_space_to_batch_paddings/strided_sliceStridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Dconv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask27
5conv1d/required_space_to_batch_paddings/strided_slice?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_1StridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_1?
+conv1d/required_space_to_batch_paddings/addAddV2conv1d/stack:output:0>conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/add?
-conv1d/required_space_to_batch_paddings/add_1AddV2/conv1d/required_space_to_batch_paddings/add:z:0@conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_1?
+conv1d/required_space_to_batch_paddings/modFloorMod1conv1d/required_space_to_batch_paddings/add_1:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/mod?
+conv1d/required_space_to_batch_paddings/subSubconv1d/dilation_rate:output:0/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/sub?
-conv1d/required_space_to_batch_paddings/mod_1FloorMod/conv1d/required_space_to_batch_paddings/sub:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/mod_1?
-conv1d/required_space_to_batch_paddings/add_2AddV2@conv1d/required_space_to_batch_paddings/strided_slice_1:output:01conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_2StridedSlice>conv1d/required_space_to_batch_paddings/strided_slice:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice1conv1d/required_space_to_batch_paddings/add_2:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_3?
2conv1d/required_space_to_batch_paddings/paddings/0Pack@conv1d/required_space_to_batch_paddings/strided_slice_2:output:0@conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:24
2conv1d/required_space_to_batch_paddings/paddings/0?
0conv1d/required_space_to_batch_paddings/paddingsPack;conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:22
0conv1d/required_space_to_batch_paddings/paddings?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice1conv1d/required_space_to_batch_paddings/mod_1:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_4?
1conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 23
1conv1d/required_space_to_batch_paddings/crops/0/0?
/conv1d/required_space_to_batch_paddings/crops/0Pack:conv1d/required_space_to_batch_paddings/crops/0/0:output:0@conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:21
/conv1d/required_space_to_batch_paddings/crops/0?
-conv1d/required_space_to_batch_paddings/cropsPack8conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2/
-conv1d/required_space_to_batch_paddings/crops?
conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_1/stack?
conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_1?
conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_2?
conv1d/strided_slice_1StridedSlice9conv1d/required_space_to_batch_paddings/paddings:output:0%conv1d/strided_slice_1/stack:output:0'conv1d/strided_slice_1/stack_1:output:0'conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_1v
conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat/concat_dim?
conv1d/concat/concatIdentityconv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d/concat/concat?
conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_2/stack?
conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_1?
conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_2?
conv1d/strided_slice_2StridedSlice6conv1d/required_space_to_batch_paddings/crops:output:0%conv1d/strided_slice_2/stack:output:0'conv1d/strided_slice_2/stack_1:output:0'conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_2z
conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat_1/concat_dim?
conv1d/concat_1/concatIdentityconv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2
conv1d/concat_1/concat?
!conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/SpaceToBatchND/block_shape?
conv1d/SpaceToBatchNDSpaceToBatchNDPad:output:0*conv1d/SpaceToBatchND/block_shape:output:0conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/SpaceToBatchNDy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsconv1d/SpaceToBatchND:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
!conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/BatchToSpaceND/block_shape?
conv1d/BatchToSpaceNDBatchToSpaceNDconv1d/Squeeze:output:0*conv1d/BatchToSpaceND/block_shape:output:0conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BatchToSpaceND?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/BatchToSpaceND:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?
?
D__inference_conv1d_6_layer_call_and_return_conditional_losses_149688

inputsA
+conv1d_expanddims_1_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOpy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"??????????????????*
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :??????????????????*
squeeze_dims

?????????2
conv1d/Squeeze?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :??????????????????2	
BiasAdd?
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:??????????????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
?!
?
A__inference_dense_layer_call_and_return_conditional_losses_149664

inputs3
!tensordot_readvariableop_resource: -
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp?
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes

: *
dtype02
Tensordot/ReadVariableOpj
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:2
Tensordot/axesq
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       2
Tensordot/freeX
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:2
Tensordot/Shapet
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/GatherV2/axis?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
Tensordot/GatherV2x
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/GatherV2_1/axis?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
Tensordot/GatherV2_1l
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
Tensordot/Const?
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: 2
Tensordot/Prodp
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 2
Tensordot/Const_1?
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: 2
Tensordot/Prod_1p
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/concat/axis?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:2
Tensordot/concat?
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:2
Tensordot/stack?
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Tensordot/transpose?
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:??????????????????2
Tensordot/Reshape?
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
Tensordot/MatMulp
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:2
Tensordot/Const_2t
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/concat_1/axis?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:2
Tensordot/concat_1?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*4
_output_shapes"
 :??????????????????2
	Tensordot?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :??????????????????2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :??????????????????2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?,
?
F__inference_sequential_layer_call_and_return_conditional_losses_148222
input_1#
conv1d_148181: 
conv1d_148183: %
conv1d_1_148186:  
conv1d_1_148188: %
conv1d_2_148191:  
conv1d_2_148193: %
conv1d_3_148196:  
conv1d_3_148198: %
conv1d_4_148201:  
conv1d_4_148203: %
conv1d_5_148206:  
conv1d_5_148208: 
dense_148211: 
dense_148213:%
conv1d_6_148216:
conv1d_6_148218:
identity??conv1d/StatefulPartitionedCall? conv1d_1/StatefulPartitionedCall? conv1d_2/StatefulPartitionedCall? conv1d_3/StatefulPartitionedCall? conv1d_4/StatefulPartitionedCall? conv1d_5/StatefulPartitionedCall? conv1d_6/StatefulPartitionedCall?dense/StatefulPartitionedCall?
conv1d/StatefulPartitionedCallStatefulPartitionedCallinput_1conv1d_148181conv1d_148183*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_conv1d_layer_call_and_return_conditional_losses_1474482 
conv1d/StatefulPartitionedCall?
 conv1d_1/StatefulPartitionedCallStatefulPartitionedCall'conv1d/StatefulPartitionedCall:output:0conv1d_1_148186conv1d_1_148188*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_1_layer_call_and_return_conditional_losses_1475272"
 conv1d_1/StatefulPartitionedCall?
 conv1d_2/StatefulPartitionedCallStatefulPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0conv1d_2_148191conv1d_2_148193*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_2_layer_call_and_return_conditional_losses_1476062"
 conv1d_2/StatefulPartitionedCall?
 conv1d_3/StatefulPartitionedCallStatefulPartitionedCall)conv1d_2/StatefulPartitionedCall:output:0conv1d_3_148196conv1d_3_148198*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_3_layer_call_and_return_conditional_losses_1476852"
 conv1d_3/StatefulPartitionedCall?
 conv1d_4/StatefulPartitionedCallStatefulPartitionedCall)conv1d_3/StatefulPartitionedCall:output:0conv1d_4_148201conv1d_4_148203*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_4_layer_call_and_return_conditional_losses_1477642"
 conv1d_4/StatefulPartitionedCall?
 conv1d_5/StatefulPartitionedCallStatefulPartitionedCall)conv1d_4/StatefulPartitionedCall:output:0conv1d_5_148206conv1d_5_148208*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_5_layer_call_and_return_conditional_losses_1478432"
 conv1d_5/StatefulPartitionedCall?
dense/StatefulPartitionedCallStatefulPartitionedCall)conv1d_5/StatefulPartitionedCall:output:0dense_148211dense_148213*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_1478802
dense/StatefulPartitionedCall?
 conv1d_6/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0conv1d_6_148216conv1d_6_148218*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_6_layer_call_and_return_conditional_losses_1479012"
 conv1d_6/StatefulPartitionedCall?
IdentityIdentity)conv1d_6/StatefulPartitionedCall:output:0^conv1d/StatefulPartitionedCall!^conv1d_1/StatefulPartitionedCall!^conv1d_2/StatefulPartitionedCall!^conv1d_3/StatefulPartitionedCall!^conv1d_4/StatefulPartitionedCall!^conv1d_5/StatefulPartitionedCall!^conv1d_6/StatefulPartitionedCall^dense/StatefulPartitionedCall*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 2@
conv1d/StatefulPartitionedCallconv1d/StatefulPartitionedCall2D
 conv1d_1/StatefulPartitionedCall conv1d_1/StatefulPartitionedCall2D
 conv1d_2/StatefulPartitionedCall conv1d_2/StatefulPartitionedCall2D
 conv1d_3/StatefulPartitionedCall conv1d_3/StatefulPartitionedCall2D
 conv1d_4/StatefulPartitionedCall conv1d_4/StatefulPartitionedCall2D
 conv1d_5/StatefulPartitionedCall conv1d_5/StatefulPartitionedCall2D
 conv1d_6/StatefulPartitionedCall conv1d_6/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:] Y
4
_output_shapes"
 :??????????????????
!
_user_specified_name	input_1
?r
?
D__inference_conv1d_1_layer_call_and_return_conditional_losses_147527

inputsA
+conv1d_expanddims_1_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Padv
conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/dilation_rateX
conv1d/ShapeShapePad:output:0*
T0*
_output_shapes
:2
conv1d/Shape?
conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack?
conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_1?
conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_2?
conv1d/strided_sliceStridedSliceconv1d/Shape:output:0#conv1d/strided_slice/stack:output:0%conv1d/strided_slice/stack_1:output:0%conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d/strided_sliceq
conv1d/stackPackconv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d/stack?
5conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        27
5conv1d/required_space_to_batch_paddings/base_paddings?
;conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2=
;conv1d/required_space_to_batch_paddings/strided_slice/stack?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
5conv1d/required_space_to_batch_paddings/strided_sliceStridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Dconv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask27
5conv1d/required_space_to_batch_paddings/strided_slice?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_1StridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_1?
+conv1d/required_space_to_batch_paddings/addAddV2conv1d/stack:output:0>conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/add?
-conv1d/required_space_to_batch_paddings/add_1AddV2/conv1d/required_space_to_batch_paddings/add:z:0@conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_1?
+conv1d/required_space_to_batch_paddings/modFloorMod1conv1d/required_space_to_batch_paddings/add_1:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/mod?
+conv1d/required_space_to_batch_paddings/subSubconv1d/dilation_rate:output:0/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/sub?
-conv1d/required_space_to_batch_paddings/mod_1FloorMod/conv1d/required_space_to_batch_paddings/sub:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/mod_1?
-conv1d/required_space_to_batch_paddings/add_2AddV2@conv1d/required_space_to_batch_paddings/strided_slice_1:output:01conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_2StridedSlice>conv1d/required_space_to_batch_paddings/strided_slice:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice1conv1d/required_space_to_batch_paddings/add_2:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_3?
2conv1d/required_space_to_batch_paddings/paddings/0Pack@conv1d/required_space_to_batch_paddings/strided_slice_2:output:0@conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:24
2conv1d/required_space_to_batch_paddings/paddings/0?
0conv1d/required_space_to_batch_paddings/paddingsPack;conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:22
0conv1d/required_space_to_batch_paddings/paddings?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice1conv1d/required_space_to_batch_paddings/mod_1:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_4?
1conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 23
1conv1d/required_space_to_batch_paddings/crops/0/0?
/conv1d/required_space_to_batch_paddings/crops/0Pack:conv1d/required_space_to_batch_paddings/crops/0/0:output:0@conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:21
/conv1d/required_space_to_batch_paddings/crops/0?
-conv1d/required_space_to_batch_paddings/cropsPack8conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2/
-conv1d/required_space_to_batch_paddings/crops?
conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_1/stack?
conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_1?
conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_2?
conv1d/strided_slice_1StridedSlice9conv1d/required_space_to_batch_paddings/paddings:output:0%conv1d/strided_slice_1/stack:output:0'conv1d/strided_slice_1/stack_1:output:0'conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_1v
conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat/concat_dim?
conv1d/concat/concatIdentityconv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d/concat/concat?
conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_2/stack?
conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_1?
conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_2?
conv1d/strided_slice_2StridedSlice6conv1d/required_space_to_batch_paddings/crops:output:0%conv1d/strided_slice_2/stack:output:0'conv1d/strided_slice_2/stack_1:output:0'conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_2z
conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat_1/concat_dim?
conv1d/concat_1/concatIdentityconv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2
conv1d/concat_1/concat?
!conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/SpaceToBatchND/block_shape?
conv1d/SpaceToBatchNDSpaceToBatchNDPad:output:0*conv1d/SpaceToBatchND/block_shape:output:0conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/SpaceToBatchNDy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsconv1d/SpaceToBatchND:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
!conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/BatchToSpaceND/block_shape?
conv1d/BatchToSpaceNDBatchToSpaceNDconv1d/Squeeze:output:0*conv1d/BatchToSpaceND/block_shape:output:0conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BatchToSpaceND?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/BatchToSpaceND:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?
?
$__inference_signature_wrapper_148311
input_1
unknown: 
	unknown_0: 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7:  
	unknown_8: 
	unknown_9:  

unknown_10: 

unknown_11: 

unknown_12: 

unknown_13:

unknown_14:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? **
f%R#
!__inference__wrapped_model_1474232
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:] Y
4
_output_shapes"
 :??????????????????
!
_user_specified_name	input_1
?r
?
D__inference_conv1d_5_layer_call_and_return_conditional_losses_149624

inputsA
+conv1d_expanddims_1_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                        2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Padv
conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/dilation_rateX
conv1d/ShapeShapePad:output:0*
T0*
_output_shapes
:2
conv1d/Shape?
conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack?
conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_1?
conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_2?
conv1d/strided_sliceStridedSliceconv1d/Shape:output:0#conv1d/strided_slice/stack:output:0%conv1d/strided_slice/stack_1:output:0%conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d/strided_sliceq
conv1d/stackPackconv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d/stack?
5conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        27
5conv1d/required_space_to_batch_paddings/base_paddings?
;conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2=
;conv1d/required_space_to_batch_paddings/strided_slice/stack?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
5conv1d/required_space_to_batch_paddings/strided_sliceStridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Dconv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask27
5conv1d/required_space_to_batch_paddings/strided_slice?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_1StridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_1?
+conv1d/required_space_to_batch_paddings/addAddV2conv1d/stack:output:0>conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/add?
-conv1d/required_space_to_batch_paddings/add_1AddV2/conv1d/required_space_to_batch_paddings/add:z:0@conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_1?
+conv1d/required_space_to_batch_paddings/modFloorMod1conv1d/required_space_to_batch_paddings/add_1:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/mod?
+conv1d/required_space_to_batch_paddings/subSubconv1d/dilation_rate:output:0/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/sub?
-conv1d/required_space_to_batch_paddings/mod_1FloorMod/conv1d/required_space_to_batch_paddings/sub:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/mod_1?
-conv1d/required_space_to_batch_paddings/add_2AddV2@conv1d/required_space_to_batch_paddings/strided_slice_1:output:01conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_2StridedSlice>conv1d/required_space_to_batch_paddings/strided_slice:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice1conv1d/required_space_to_batch_paddings/add_2:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_3?
2conv1d/required_space_to_batch_paddings/paddings/0Pack@conv1d/required_space_to_batch_paddings/strided_slice_2:output:0@conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:24
2conv1d/required_space_to_batch_paddings/paddings/0?
0conv1d/required_space_to_batch_paddings/paddingsPack;conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:22
0conv1d/required_space_to_batch_paddings/paddings?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice1conv1d/required_space_to_batch_paddings/mod_1:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_4?
1conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 23
1conv1d/required_space_to_batch_paddings/crops/0/0?
/conv1d/required_space_to_batch_paddings/crops/0Pack:conv1d/required_space_to_batch_paddings/crops/0/0:output:0@conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:21
/conv1d/required_space_to_batch_paddings/crops/0?
-conv1d/required_space_to_batch_paddings/cropsPack8conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2/
-conv1d/required_space_to_batch_paddings/crops?
conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_1/stack?
conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_1?
conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_2?
conv1d/strided_slice_1StridedSlice9conv1d/required_space_to_batch_paddings/paddings:output:0%conv1d/strided_slice_1/stack:output:0'conv1d/strided_slice_1/stack_1:output:0'conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_1v
conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat/concat_dim?
conv1d/concat/concatIdentityconv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d/concat/concat?
conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_2/stack?
conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_1?
conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_2?
conv1d/strided_slice_2StridedSlice6conv1d/required_space_to_batch_paddings/crops:output:0%conv1d/strided_slice_2/stack:output:0'conv1d/strided_slice_2/stack_1:output:0'conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_2z
conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat_1/concat_dim?
conv1d/concat_1/concatIdentityconv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2
conv1d/concat_1/concat?
!conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB: 2#
!conv1d/SpaceToBatchND/block_shape?
conv1d/SpaceToBatchNDSpaceToBatchNDPad:output:0*conv1d/SpaceToBatchND/block_shape:output:0conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/SpaceToBatchNDy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsconv1d/SpaceToBatchND:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
!conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB: 2#
!conv1d/BatchToSpaceND/block_shape?
conv1d/BatchToSpaceNDBatchToSpaceNDconv1d/Squeeze:output:0*conv1d/BatchToSpaceND/block_shape:output:0conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BatchToSpaceND?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/BatchToSpaceND:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?r
?
D__inference_conv1d_3_layer_call_and_return_conditional_losses_147685

inputsA
+conv1d_expanddims_1_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Padv
conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/dilation_rateX
conv1d/ShapeShapePad:output:0*
T0*
_output_shapes
:2
conv1d/Shape?
conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack?
conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_1?
conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_2?
conv1d/strided_sliceStridedSliceconv1d/Shape:output:0#conv1d/strided_slice/stack:output:0%conv1d/strided_slice/stack_1:output:0%conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d/strided_sliceq
conv1d/stackPackconv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d/stack?
5conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        27
5conv1d/required_space_to_batch_paddings/base_paddings?
;conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2=
;conv1d/required_space_to_batch_paddings/strided_slice/stack?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
5conv1d/required_space_to_batch_paddings/strided_sliceStridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Dconv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask27
5conv1d/required_space_to_batch_paddings/strided_slice?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_1StridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_1?
+conv1d/required_space_to_batch_paddings/addAddV2conv1d/stack:output:0>conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/add?
-conv1d/required_space_to_batch_paddings/add_1AddV2/conv1d/required_space_to_batch_paddings/add:z:0@conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_1?
+conv1d/required_space_to_batch_paddings/modFloorMod1conv1d/required_space_to_batch_paddings/add_1:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/mod?
+conv1d/required_space_to_batch_paddings/subSubconv1d/dilation_rate:output:0/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/sub?
-conv1d/required_space_to_batch_paddings/mod_1FloorMod/conv1d/required_space_to_batch_paddings/sub:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/mod_1?
-conv1d/required_space_to_batch_paddings/add_2AddV2@conv1d/required_space_to_batch_paddings/strided_slice_1:output:01conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_2StridedSlice>conv1d/required_space_to_batch_paddings/strided_slice:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice1conv1d/required_space_to_batch_paddings/add_2:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_3?
2conv1d/required_space_to_batch_paddings/paddings/0Pack@conv1d/required_space_to_batch_paddings/strided_slice_2:output:0@conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:24
2conv1d/required_space_to_batch_paddings/paddings/0?
0conv1d/required_space_to_batch_paddings/paddingsPack;conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:22
0conv1d/required_space_to_batch_paddings/paddings?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice1conv1d/required_space_to_batch_paddings/mod_1:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_4?
1conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 23
1conv1d/required_space_to_batch_paddings/crops/0/0?
/conv1d/required_space_to_batch_paddings/crops/0Pack:conv1d/required_space_to_batch_paddings/crops/0/0:output:0@conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:21
/conv1d/required_space_to_batch_paddings/crops/0?
-conv1d/required_space_to_batch_paddings/cropsPack8conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2/
-conv1d/required_space_to_batch_paddings/crops?
conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_1/stack?
conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_1?
conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_2?
conv1d/strided_slice_1StridedSlice9conv1d/required_space_to_batch_paddings/paddings:output:0%conv1d/strided_slice_1/stack:output:0'conv1d/strided_slice_1/stack_1:output:0'conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_1v
conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat/concat_dim?
conv1d/concat/concatIdentityconv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d/concat/concat?
conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_2/stack?
conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_1?
conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_2?
conv1d/strided_slice_2StridedSlice6conv1d/required_space_to_batch_paddings/crops:output:0%conv1d/strided_slice_2/stack:output:0'conv1d/strided_slice_2/stack_1:output:0'conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_2z
conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat_1/concat_dim?
conv1d/concat_1/concatIdentityconv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2
conv1d/concat_1/concat?
!conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/SpaceToBatchND/block_shape?
conv1d/SpaceToBatchNDSpaceToBatchNDPad:output:0*conv1d/SpaceToBatchND/block_shape:output:0conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/SpaceToBatchNDy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsconv1d/SpaceToBatchND:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
!conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/BatchToSpaceND/block_shape?
conv1d/BatchToSpaceNDBatchToSpaceNDconv1d/Squeeze:output:0*conv1d/BatchToSpaceND/block_shape:output:0conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BatchToSpaceND?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/BatchToSpaceND:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?
?
D__inference_conv1d_6_layer_call_and_return_conditional_losses_147901

inputsA
+conv1d_expanddims_1_readvariableop_resource:-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOpy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"??????????????????*
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :??????????????????*
squeeze_dims

?????????2
conv1d/Squeeze?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :??????????????????2	
BiasAdd?
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:??????????????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
?,
?
F__inference_sequential_layer_call_and_return_conditional_losses_148106

inputs#
conv1d_148065: 
conv1d_148067: %
conv1d_1_148070:  
conv1d_1_148072: %
conv1d_2_148075:  
conv1d_2_148077: %
conv1d_3_148080:  
conv1d_3_148082: %
conv1d_4_148085:  
conv1d_4_148087: %
conv1d_5_148090:  
conv1d_5_148092: 
dense_148095: 
dense_148097:%
conv1d_6_148100:
conv1d_6_148102:
identity??conv1d/StatefulPartitionedCall? conv1d_1/StatefulPartitionedCall? conv1d_2/StatefulPartitionedCall? conv1d_3/StatefulPartitionedCall? conv1d_4/StatefulPartitionedCall? conv1d_5/StatefulPartitionedCall? conv1d_6/StatefulPartitionedCall?dense/StatefulPartitionedCall?
conv1d/StatefulPartitionedCallStatefulPartitionedCallinputsconv1d_148065conv1d_148067*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_conv1d_layer_call_and_return_conditional_losses_1474482 
conv1d/StatefulPartitionedCall?
 conv1d_1/StatefulPartitionedCallStatefulPartitionedCall'conv1d/StatefulPartitionedCall:output:0conv1d_1_148070conv1d_1_148072*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_1_layer_call_and_return_conditional_losses_1475272"
 conv1d_1/StatefulPartitionedCall?
 conv1d_2/StatefulPartitionedCallStatefulPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0conv1d_2_148075conv1d_2_148077*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_2_layer_call_and_return_conditional_losses_1476062"
 conv1d_2/StatefulPartitionedCall?
 conv1d_3/StatefulPartitionedCallStatefulPartitionedCall)conv1d_2/StatefulPartitionedCall:output:0conv1d_3_148080conv1d_3_148082*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_3_layer_call_and_return_conditional_losses_1476852"
 conv1d_3/StatefulPartitionedCall?
 conv1d_4/StatefulPartitionedCallStatefulPartitionedCall)conv1d_3/StatefulPartitionedCall:output:0conv1d_4_148085conv1d_4_148087*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_4_layer_call_and_return_conditional_losses_1477642"
 conv1d_4/StatefulPartitionedCall?
 conv1d_5/StatefulPartitionedCallStatefulPartitionedCall)conv1d_4/StatefulPartitionedCall:output:0conv1d_5_148090conv1d_5_148092*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_5_layer_call_and_return_conditional_losses_1478432"
 conv1d_5/StatefulPartitionedCall?
dense/StatefulPartitionedCallStatefulPartitionedCall)conv1d_5/StatefulPartitionedCall:output:0dense_148095dense_148097*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_1478802
dense/StatefulPartitionedCall?
 conv1d_6/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0conv1d_6_148100conv1d_6_148102*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_6_layer_call_and_return_conditional_losses_1479012"
 conv1d_6/StatefulPartitionedCall?
IdentityIdentity)conv1d_6/StatefulPartitionedCall:output:0^conv1d/StatefulPartitionedCall!^conv1d_1/StatefulPartitionedCall!^conv1d_2/StatefulPartitionedCall!^conv1d_3/StatefulPartitionedCall!^conv1d_4/StatefulPartitionedCall!^conv1d_5/StatefulPartitionedCall!^conv1d_6/StatefulPartitionedCall^dense/StatefulPartitionedCall*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 2@
conv1d/StatefulPartitionedCallconv1d/StatefulPartitionedCall2D
 conv1d_1/StatefulPartitionedCall conv1d_1/StatefulPartitionedCall2D
 conv1d_2/StatefulPartitionedCall conv1d_2/StatefulPartitionedCall2D
 conv1d_3/StatefulPartitionedCall conv1d_3/StatefulPartitionedCall2D
 conv1d_4/StatefulPartitionedCall conv1d_4/StatefulPartitionedCall2D
 conv1d_5/StatefulPartitionedCall conv1d_5/StatefulPartitionedCall2D
 conv1d_6/StatefulPartitionedCall conv1d_6/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
?
?
B__inference_conv1d_layer_call_and_return_conditional_losses_147448

inputsA
+conv1d_expanddims_1_readvariableop_resource: -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :??????????????????2
Pady
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsPad:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
: *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
: 2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:??????????????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
?
?
)__inference_conv1d_3_layer_call_fn_149387

inputs
unknown:  
	unknown_0: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_3_layer_call_and_return_conditional_losses_1476852
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?r
?
D__inference_conv1d_5_layer_call_and_return_conditional_losses_147843

inputsA
+conv1d_expanddims_1_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                        2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Padv
conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/dilation_rateX
conv1d/ShapeShapePad:output:0*
T0*
_output_shapes
:2
conv1d/Shape?
conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack?
conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_1?
conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_2?
conv1d/strided_sliceStridedSliceconv1d/Shape:output:0#conv1d/strided_slice/stack:output:0%conv1d/strided_slice/stack_1:output:0%conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d/strided_sliceq
conv1d/stackPackconv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d/stack?
5conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        27
5conv1d/required_space_to_batch_paddings/base_paddings?
;conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2=
;conv1d/required_space_to_batch_paddings/strided_slice/stack?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
5conv1d/required_space_to_batch_paddings/strided_sliceStridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Dconv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask27
5conv1d/required_space_to_batch_paddings/strided_slice?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_1StridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_1?
+conv1d/required_space_to_batch_paddings/addAddV2conv1d/stack:output:0>conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/add?
-conv1d/required_space_to_batch_paddings/add_1AddV2/conv1d/required_space_to_batch_paddings/add:z:0@conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_1?
+conv1d/required_space_to_batch_paddings/modFloorMod1conv1d/required_space_to_batch_paddings/add_1:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/mod?
+conv1d/required_space_to_batch_paddings/subSubconv1d/dilation_rate:output:0/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/sub?
-conv1d/required_space_to_batch_paddings/mod_1FloorMod/conv1d/required_space_to_batch_paddings/sub:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/mod_1?
-conv1d/required_space_to_batch_paddings/add_2AddV2@conv1d/required_space_to_batch_paddings/strided_slice_1:output:01conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_2StridedSlice>conv1d/required_space_to_batch_paddings/strided_slice:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice1conv1d/required_space_to_batch_paddings/add_2:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_3?
2conv1d/required_space_to_batch_paddings/paddings/0Pack@conv1d/required_space_to_batch_paddings/strided_slice_2:output:0@conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:24
2conv1d/required_space_to_batch_paddings/paddings/0?
0conv1d/required_space_to_batch_paddings/paddingsPack;conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:22
0conv1d/required_space_to_batch_paddings/paddings?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice1conv1d/required_space_to_batch_paddings/mod_1:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_4?
1conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 23
1conv1d/required_space_to_batch_paddings/crops/0/0?
/conv1d/required_space_to_batch_paddings/crops/0Pack:conv1d/required_space_to_batch_paddings/crops/0/0:output:0@conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:21
/conv1d/required_space_to_batch_paddings/crops/0?
-conv1d/required_space_to_batch_paddings/cropsPack8conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2/
-conv1d/required_space_to_batch_paddings/crops?
conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_1/stack?
conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_1?
conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_2?
conv1d/strided_slice_1StridedSlice9conv1d/required_space_to_batch_paddings/paddings:output:0%conv1d/strided_slice_1/stack:output:0'conv1d/strided_slice_1/stack_1:output:0'conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_1v
conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat/concat_dim?
conv1d/concat/concatIdentityconv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d/concat/concat?
conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_2/stack?
conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_1?
conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_2?
conv1d/strided_slice_2StridedSlice6conv1d/required_space_to_batch_paddings/crops:output:0%conv1d/strided_slice_2/stack:output:0'conv1d/strided_slice_2/stack_1:output:0'conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_2z
conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat_1/concat_dim?
conv1d/concat_1/concatIdentityconv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2
conv1d/concat_1/concat?
!conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB: 2#
!conv1d/SpaceToBatchND/block_shape?
conv1d/SpaceToBatchNDSpaceToBatchNDPad:output:0*conv1d/SpaceToBatchND/block_shape:output:0conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/SpaceToBatchNDy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsconv1d/SpaceToBatchND:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
!conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB: 2#
!conv1d/BatchToSpaceND/block_shape?
conv1d/BatchToSpaceNDBatchToSpaceNDconv1d/Squeeze:output:0*conv1d/BatchToSpaceND/block_shape:output:0conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BatchToSpaceND?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/BatchToSpaceND:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?!
?
A__inference_dense_layer_call_and_return_conditional_losses_147880

inputs3
!tensordot_readvariableop_resource: -
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?Tensordot/ReadVariableOp?
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes

: *
dtype02
Tensordot/ReadVariableOpj
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:2
Tensordot/axesq
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       2
Tensordot/freeX
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:2
Tensordot/Shapet
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/GatherV2/axis?
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
Tensordot/GatherV2x
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/GatherV2_1/axis?
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
Tensordot/GatherV2_1l
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
Tensordot/Const?
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: 2
Tensordot/Prodp
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 2
Tensordot/Const_1?
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: 2
Tensordot/Prod_1p
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/concat/axis?
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:2
Tensordot/concat?
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:2
Tensordot/stack?
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Tensordot/transpose?
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:??????????????????2
Tensordot/Reshape?
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
Tensordot/MatMulp
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:2
Tensordot/Const_2t
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
Tensordot/concat_1/axis?
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:2
Tensordot/concat_1?
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*4
_output_shapes"
 :??????????????????2
	Tensordot?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :??????????????????2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :??????????????????2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?
?
+__inference_sequential_layer_call_fn_147943
input_1
unknown: 
	unknown_0: 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7:  
	unknown_8: 
	unknown_9:  

unknown_10: 

unknown_11: 

unknown_12: 

unknown_13:

unknown_14:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_1479082
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:] Y
4
_output_shapes"
 :??????????????????
!
_user_specified_name	input_1
?
?
+__inference_sequential_layer_call_fn_148178
input_1
unknown: 
	unknown_0: 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7:  
	unknown_8: 
	unknown_9:  

unknown_10: 

unknown_11: 

unknown_12: 

unknown_13:

unknown_14:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_1481062
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:] Y
4
_output_shapes"
 :??????????????????
!
_user_specified_name	input_1
?
?
)__inference_conv1d_2_layer_call_fn_149305

inputs
unknown:  
	unknown_0: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_2_layer_call_and_return_conditional_losses_1476062
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?r
?
D__inference_conv1d_3_layer_call_and_return_conditional_losses_149460

inputsA
+conv1d_expanddims_1_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Padv
conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/dilation_rateX
conv1d/ShapeShapePad:output:0*
T0*
_output_shapes
:2
conv1d/Shape?
conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack?
conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_1?
conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_2?
conv1d/strided_sliceStridedSliceconv1d/Shape:output:0#conv1d/strided_slice/stack:output:0%conv1d/strided_slice/stack_1:output:0%conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d/strided_sliceq
conv1d/stackPackconv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d/stack?
5conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        27
5conv1d/required_space_to_batch_paddings/base_paddings?
;conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2=
;conv1d/required_space_to_batch_paddings/strided_slice/stack?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
5conv1d/required_space_to_batch_paddings/strided_sliceStridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Dconv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask27
5conv1d/required_space_to_batch_paddings/strided_slice?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_1StridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_1?
+conv1d/required_space_to_batch_paddings/addAddV2conv1d/stack:output:0>conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/add?
-conv1d/required_space_to_batch_paddings/add_1AddV2/conv1d/required_space_to_batch_paddings/add:z:0@conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_1?
+conv1d/required_space_to_batch_paddings/modFloorMod1conv1d/required_space_to_batch_paddings/add_1:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/mod?
+conv1d/required_space_to_batch_paddings/subSubconv1d/dilation_rate:output:0/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/sub?
-conv1d/required_space_to_batch_paddings/mod_1FloorMod/conv1d/required_space_to_batch_paddings/sub:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/mod_1?
-conv1d/required_space_to_batch_paddings/add_2AddV2@conv1d/required_space_to_batch_paddings/strided_slice_1:output:01conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_2StridedSlice>conv1d/required_space_to_batch_paddings/strided_slice:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice1conv1d/required_space_to_batch_paddings/add_2:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_3?
2conv1d/required_space_to_batch_paddings/paddings/0Pack@conv1d/required_space_to_batch_paddings/strided_slice_2:output:0@conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:24
2conv1d/required_space_to_batch_paddings/paddings/0?
0conv1d/required_space_to_batch_paddings/paddingsPack;conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:22
0conv1d/required_space_to_batch_paddings/paddings?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice1conv1d/required_space_to_batch_paddings/mod_1:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_4?
1conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 23
1conv1d/required_space_to_batch_paddings/crops/0/0?
/conv1d/required_space_to_batch_paddings/crops/0Pack:conv1d/required_space_to_batch_paddings/crops/0/0:output:0@conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:21
/conv1d/required_space_to_batch_paddings/crops/0?
-conv1d/required_space_to_batch_paddings/cropsPack8conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2/
-conv1d/required_space_to_batch_paddings/crops?
conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_1/stack?
conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_1?
conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_2?
conv1d/strided_slice_1StridedSlice9conv1d/required_space_to_batch_paddings/paddings:output:0%conv1d/strided_slice_1/stack:output:0'conv1d/strided_slice_1/stack_1:output:0'conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_1v
conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat/concat_dim?
conv1d/concat/concatIdentityconv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d/concat/concat?
conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_2/stack?
conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_1?
conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_2?
conv1d/strided_slice_2StridedSlice6conv1d/required_space_to_batch_paddings/crops:output:0%conv1d/strided_slice_2/stack:output:0'conv1d/strided_slice_2/stack_1:output:0'conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_2z
conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat_1/concat_dim?
conv1d/concat_1/concatIdentityconv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2
conv1d/concat_1/concat?
!conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/SpaceToBatchND/block_shape?
conv1d/SpaceToBatchNDSpaceToBatchNDPad:output:0*conv1d/SpaceToBatchND/block_shape:output:0conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/SpaceToBatchNDy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsconv1d/SpaceToBatchND:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
!conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/BatchToSpaceND/block_shape?
conv1d/BatchToSpaceNDBatchToSpaceNDconv1d/Squeeze:output:0*conv1d/BatchToSpaceND/block_shape:output:0conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BatchToSpaceND?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/BatchToSpaceND:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?
?
)__inference_conv1d_5_layer_call_fn_149551

inputs
unknown:  
	unknown_0: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_5_layer_call_and_return_conditional_losses_1478432
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?
?
'__inference_conv1d_layer_call_fn_149196

inputs
unknown: 
	unknown_0: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_conv1d_layer_call_and_return_conditional_losses_1474482
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:??????????????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
?r
?
D__inference_conv1d_1_layer_call_and_return_conditional_losses_149296

inputsA
+conv1d_expanddims_1_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Padv
conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/dilation_rateX
conv1d/ShapeShapePad:output:0*
T0*
_output_shapes
:2
conv1d/Shape?
conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack?
conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_1?
conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_2?
conv1d/strided_sliceStridedSliceconv1d/Shape:output:0#conv1d/strided_slice/stack:output:0%conv1d/strided_slice/stack_1:output:0%conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d/strided_sliceq
conv1d/stackPackconv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d/stack?
5conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        27
5conv1d/required_space_to_batch_paddings/base_paddings?
;conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2=
;conv1d/required_space_to_batch_paddings/strided_slice/stack?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
5conv1d/required_space_to_batch_paddings/strided_sliceStridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Dconv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask27
5conv1d/required_space_to_batch_paddings/strided_slice?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_1StridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_1?
+conv1d/required_space_to_batch_paddings/addAddV2conv1d/stack:output:0>conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/add?
-conv1d/required_space_to_batch_paddings/add_1AddV2/conv1d/required_space_to_batch_paddings/add:z:0@conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_1?
+conv1d/required_space_to_batch_paddings/modFloorMod1conv1d/required_space_to_batch_paddings/add_1:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/mod?
+conv1d/required_space_to_batch_paddings/subSubconv1d/dilation_rate:output:0/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/sub?
-conv1d/required_space_to_batch_paddings/mod_1FloorMod/conv1d/required_space_to_batch_paddings/sub:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/mod_1?
-conv1d/required_space_to_batch_paddings/add_2AddV2@conv1d/required_space_to_batch_paddings/strided_slice_1:output:01conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_2StridedSlice>conv1d/required_space_to_batch_paddings/strided_slice:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice1conv1d/required_space_to_batch_paddings/add_2:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_3?
2conv1d/required_space_to_batch_paddings/paddings/0Pack@conv1d/required_space_to_batch_paddings/strided_slice_2:output:0@conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:24
2conv1d/required_space_to_batch_paddings/paddings/0?
0conv1d/required_space_to_batch_paddings/paddingsPack;conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:22
0conv1d/required_space_to_batch_paddings/paddings?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice1conv1d/required_space_to_batch_paddings/mod_1:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_4?
1conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 23
1conv1d/required_space_to_batch_paddings/crops/0/0?
/conv1d/required_space_to_batch_paddings/crops/0Pack:conv1d/required_space_to_batch_paddings/crops/0/0:output:0@conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:21
/conv1d/required_space_to_batch_paddings/crops/0?
-conv1d/required_space_to_batch_paddings/cropsPack8conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2/
-conv1d/required_space_to_batch_paddings/crops?
conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_1/stack?
conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_1?
conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_2?
conv1d/strided_slice_1StridedSlice9conv1d/required_space_to_batch_paddings/paddings:output:0%conv1d/strided_slice_1/stack:output:0'conv1d/strided_slice_1/stack_1:output:0'conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_1v
conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat/concat_dim?
conv1d/concat/concatIdentityconv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d/concat/concat?
conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_2/stack?
conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_1?
conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_2?
conv1d/strided_slice_2StridedSlice6conv1d/required_space_to_batch_paddings/crops:output:0%conv1d/strided_slice_2/stack:output:0'conv1d/strided_slice_2/stack_1:output:0'conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_2z
conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat_1/concat_dim?
conv1d/concat_1/concatIdentityconv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2
conv1d/concat_1/concat?
!conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/SpaceToBatchND/block_shape?
conv1d/SpaceToBatchNDSpaceToBatchNDPad:output:0*conv1d/SpaceToBatchND/block_shape:output:0conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/SpaceToBatchNDy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsconv1d/SpaceToBatchND:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
!conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/BatchToSpaceND/block_shape?
conv1d/BatchToSpaceNDBatchToSpaceNDconv1d/Squeeze:output:0*conv1d/BatchToSpaceND/block_shape:output:0conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BatchToSpaceND?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/BatchToSpaceND:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
??
?
F__inference_sequential_layer_call_and_return_conditional_losses_148786

inputsH
2conv1d_conv1d_expanddims_1_readvariableop_resource: 4
&conv1d_biasadd_readvariableop_resource: J
4conv1d_1_conv1d_expanddims_1_readvariableop_resource:  6
(conv1d_1_biasadd_readvariableop_resource: J
4conv1d_2_conv1d_expanddims_1_readvariableop_resource:  6
(conv1d_2_biasadd_readvariableop_resource: J
4conv1d_3_conv1d_expanddims_1_readvariableop_resource:  6
(conv1d_3_biasadd_readvariableop_resource: J
4conv1d_4_conv1d_expanddims_1_readvariableop_resource:  6
(conv1d_4_biasadd_readvariableop_resource: J
4conv1d_5_conv1d_expanddims_1_readvariableop_resource:  6
(conv1d_5_biasadd_readvariableop_resource: 9
'dense_tensordot_readvariableop_resource: 3
%dense_biasadd_readvariableop_resource:J
4conv1d_6_conv1d_expanddims_1_readvariableop_resource:6
(conv1d_6_biasadd_readvariableop_resource:
identity??conv1d/BiasAdd/ReadVariableOp?)conv1d/conv1d/ExpandDims_1/ReadVariableOp?conv1d_1/BiasAdd/ReadVariableOp?+conv1d_1/conv1d/ExpandDims_1/ReadVariableOp?conv1d_2/BiasAdd/ReadVariableOp?+conv1d_2/conv1d/ExpandDims_1/ReadVariableOp?conv1d_3/BiasAdd/ReadVariableOp?+conv1d_3/conv1d/ExpandDims_1/ReadVariableOp?conv1d_4/BiasAdd/ReadVariableOp?+conv1d_4/conv1d/ExpandDims_1/ReadVariableOp?conv1d_5/BiasAdd/ReadVariableOp?+conv1d_5/conv1d/ExpandDims_1/ReadVariableOp?conv1d_6/BiasAdd/ReadVariableOp?+conv1d_6/conv1d/ExpandDims_1/ReadVariableOp?dense/BiasAdd/ReadVariableOp?dense/Tensordot/ReadVariableOp?
conv1d/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
conv1d/Pad/paddings?

conv1d/PadPadinputsconv1d/Pad/paddings:output:0*
T0*4
_output_shapes"
 :??????????????????2

conv1d/Pad?
conv1d/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/conv1d/ExpandDims/dim?
conv1d/conv1d/ExpandDims
ExpandDimsconv1d/Pad:output:0%conv1d/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????2
conv1d/conv1d/ExpandDims?
)conv1d/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp2conv1d_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
: *
dtype02+
)conv1d/conv1d/ExpandDims_1/ReadVariableOp?
conv1d/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2 
conv1d/conv1d/ExpandDims_1/dim?
conv1d/conv1d/ExpandDims_1
ExpandDims1conv1d/conv1d/ExpandDims_1/ReadVariableOp:value:0'conv1d/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
: 2
conv1d/conv1d/ExpandDims_1?
conv1d/conv1dConv2D!conv1d/conv1d/ExpandDims:output:0#conv1d/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d/conv1d?
conv1d/conv1d/SqueezeSqueezeconv1d/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/conv1d/Squeeze?
conv1d/BiasAdd/ReadVariableOpReadVariableOp&conv1d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02
conv1d/BiasAdd/ReadVariableOp?
conv1d/BiasAddBiasAddconv1d/conv1d/Squeeze:output:0%conv1d/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BiasAddz
conv1d/ReluReluconv1d/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/Relu?
conv1d_1/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
conv1d_1/Pad/paddings?
conv1d_1/PadPadconv1d/Relu:activations:0conv1d_1/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_1/Pad?
conv1d_1/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d_1/conv1d/dilation_rates
conv1d_1/conv1d/ShapeShapeconv1d_1/Pad:output:0*
T0*
_output_shapes
:2
conv1d_1/conv1d/Shape?
#conv1d_1/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2%
#conv1d_1/conv1d/strided_slice/stack?
%conv1d_1/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_1/conv1d/strided_slice/stack_1?
%conv1d_1/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_1/conv1d/strided_slice/stack_2?
conv1d_1/conv1d/strided_sliceStridedSliceconv1d_1/conv1d/Shape:output:0,conv1d_1/conv1d/strided_slice/stack:output:0.conv1d_1/conv1d/strided_slice/stack_1:output:0.conv1d_1/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d_1/conv1d/strided_slice?
conv1d_1/conv1d/stackPack&conv1d_1/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d_1/conv1d/stack?
>conv1d_1/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2@
>conv1d_1/conv1d/required_space_to_batch_paddings/base_paddings?
Dconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2F
Dconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
>conv1d_1/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceGconv1d_1/conv1d/required_space_to_batch_paddings/base_paddings:output:0Mconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2@
>conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceGconv1d_1/conv1d/required_space_to_batch_paddings/base_paddings:output:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2B
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1?
4conv1d_1/conv1d/required_space_to_batch_paddings/addAddV2conv1d_1/conv1d/stack:output:0Gconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:26
4conv1d_1/conv1d/required_space_to_batch_paddings/add?
6conv1d_1/conv1d/required_space_to_batch_paddings/add_1AddV28conv1d_1/conv1d/required_space_to_batch_paddings/add:z:0Iconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:28
6conv1d_1/conv1d/required_space_to_batch_paddings/add_1?
4conv1d_1/conv1d/required_space_to_batch_paddings/modFloorMod:conv1d_1/conv1d/required_space_to_batch_paddings/add_1:z:0&conv1d_1/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:26
4conv1d_1/conv1d/required_space_to_batch_paddings/mod?
4conv1d_1/conv1d/required_space_to_batch_paddings/subSub&conv1d_1/conv1d/dilation_rate:output:08conv1d_1/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:26
4conv1d_1/conv1d/required_space_to_batch_paddings/sub?
6conv1d_1/conv1d/required_space_to_batch_paddings/mod_1FloorMod8conv1d_1/conv1d/required_space_to_batch_paddings/sub:z:0&conv1d_1/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:28
6conv1d_1/conv1d/required_space_to_batch_paddings/mod_1?
6conv1d_1/conv1d/required_space_to_batch_paddings/add_2AddV2Iconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0:conv1d_1/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:28
6conv1d_1/conv1d/required_space_to_batch_paddings/add_2?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceGconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice:output:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice:conv1d_1/conv1d/required_space_to_batch_paddings/add_2:z:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3?
;conv1d_1/conv1d/required_space_to_batch_paddings/paddings/0PackIconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Iconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2=
;conv1d_1/conv1d/required_space_to_batch_paddings/paddings/0?
9conv1d_1/conv1d/required_space_to_batch_paddings/paddingsPackDconv1d_1/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2;
9conv1d_1/conv1d/required_space_to_batch_paddings/paddings?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice:conv1d_1/conv1d/required_space_to_batch_paddings/mod_1:z:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4?
:conv1d_1/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2<
:conv1d_1/conv1d/required_space_to_batch_paddings/crops/0/0?
8conv1d_1/conv1d/required_space_to_batch_paddings/crops/0PackCconv1d_1/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Iconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2:
8conv1d_1/conv1d/required_space_to_batch_paddings/crops/0?
6conv1d_1/conv1d/required_space_to_batch_paddings/cropsPackAconv1d_1/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:28
6conv1d_1/conv1d/required_space_to_batch_paddings/crops?
%conv1d_1/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_1/conv1d/strided_slice_1/stack?
'conv1d_1/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_1/conv1d/strided_slice_1/stack_1?
'conv1d_1/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_1/conv1d/strided_slice_1/stack_2?
conv1d_1/conv1d/strided_slice_1StridedSliceBconv1d_1/conv1d/required_space_to_batch_paddings/paddings:output:0.conv1d_1/conv1d/strided_slice_1/stack:output:00conv1d_1/conv1d/strided_slice_1/stack_1:output:00conv1d_1/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_1/conv1d/strided_slice_1?
!conv1d_1/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2#
!conv1d_1/conv1d/concat/concat_dim?
conv1d_1/conv1d/concat/concatIdentity(conv1d_1/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d_1/conv1d/concat/concat?
%conv1d_1/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_1/conv1d/strided_slice_2/stack?
'conv1d_1/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_1/conv1d/strided_slice_2/stack_1?
'conv1d_1/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_1/conv1d/strided_slice_2/stack_2?
conv1d_1/conv1d/strided_slice_2StridedSlice?conv1d_1/conv1d/required_space_to_batch_paddings/crops:output:0.conv1d_1/conv1d/strided_slice_2/stack:output:00conv1d_1/conv1d/strided_slice_2/stack_1:output:00conv1d_1/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_1/conv1d/strided_slice_2?
#conv1d_1/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2%
#conv1d_1/conv1d/concat_1/concat_dim?
conv1d_1/conv1d/concat_1/concatIdentity(conv1d_1/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2!
conv1d_1/conv1d/concat_1/concat?
*conv1d_1/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_1/conv1d/SpaceToBatchND/block_shape?
conv1d_1/conv1d/SpaceToBatchNDSpaceToBatchNDconv1d_1/Pad:output:03conv1d_1/conv1d/SpaceToBatchND/block_shape:output:0&conv1d_1/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_1/conv1d/SpaceToBatchND?
conv1d_1/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_1/conv1d/ExpandDims/dim?
conv1d_1/conv1d/ExpandDims
ExpandDims'conv1d_1/conv1d/SpaceToBatchND:output:0'conv1d_1/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d_1/conv1d/ExpandDims?
+conv1d_1/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_1_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02-
+conv1d_1/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_1/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_1/conv1d/ExpandDims_1/dim?
conv1d_1/conv1d/ExpandDims_1
ExpandDims3conv1d_1/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_1/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d_1/conv1d/ExpandDims_1?
conv1d_1/conv1dConv2D#conv1d_1/conv1d/ExpandDims:output:0%conv1d_1/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d_1/conv1d?
conv1d_1/conv1d/SqueezeSqueezeconv1d_1/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d_1/conv1d/Squeeze?
*conv1d_1/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_1/conv1d/BatchToSpaceND/block_shape?
conv1d_1/conv1d/BatchToSpaceNDBatchToSpaceND conv1d_1/conv1d/Squeeze:output:03conv1d_1/conv1d/BatchToSpaceND/block_shape:output:0(conv1d_1/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_1/conv1d/BatchToSpaceND?
conv1d_1/BiasAdd/ReadVariableOpReadVariableOp(conv1d_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
conv1d_1/BiasAdd/ReadVariableOp?
conv1d_1/BiasAddBiasAdd'conv1d_1/conv1d/BatchToSpaceND:output:0'conv1d_1/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_1/BiasAdd?
conv1d_1/ReluReluconv1d_1/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_1/Relu?
conv1d_2/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
conv1d_2/Pad/paddings?
conv1d_2/PadPadconv1d_1/Relu:activations:0conv1d_2/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_2/Pad?
conv1d_2/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d_2/conv1d/dilation_rates
conv1d_2/conv1d/ShapeShapeconv1d_2/Pad:output:0*
T0*
_output_shapes
:2
conv1d_2/conv1d/Shape?
#conv1d_2/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2%
#conv1d_2/conv1d/strided_slice/stack?
%conv1d_2/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_2/conv1d/strided_slice/stack_1?
%conv1d_2/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_2/conv1d/strided_slice/stack_2?
conv1d_2/conv1d/strided_sliceStridedSliceconv1d_2/conv1d/Shape:output:0,conv1d_2/conv1d/strided_slice/stack:output:0.conv1d_2/conv1d/strided_slice/stack_1:output:0.conv1d_2/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d_2/conv1d/strided_slice?
conv1d_2/conv1d/stackPack&conv1d_2/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d_2/conv1d/stack?
>conv1d_2/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2@
>conv1d_2/conv1d/required_space_to_batch_paddings/base_paddings?
Dconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2F
Dconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
>conv1d_2/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceGconv1d_2/conv1d/required_space_to_batch_paddings/base_paddings:output:0Mconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2@
>conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceGconv1d_2/conv1d/required_space_to_batch_paddings/base_paddings:output:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2B
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1?
4conv1d_2/conv1d/required_space_to_batch_paddings/addAddV2conv1d_2/conv1d/stack:output:0Gconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:26
4conv1d_2/conv1d/required_space_to_batch_paddings/add?
6conv1d_2/conv1d/required_space_to_batch_paddings/add_1AddV28conv1d_2/conv1d/required_space_to_batch_paddings/add:z:0Iconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:28
6conv1d_2/conv1d/required_space_to_batch_paddings/add_1?
4conv1d_2/conv1d/required_space_to_batch_paddings/modFloorMod:conv1d_2/conv1d/required_space_to_batch_paddings/add_1:z:0&conv1d_2/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:26
4conv1d_2/conv1d/required_space_to_batch_paddings/mod?
4conv1d_2/conv1d/required_space_to_batch_paddings/subSub&conv1d_2/conv1d/dilation_rate:output:08conv1d_2/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:26
4conv1d_2/conv1d/required_space_to_batch_paddings/sub?
6conv1d_2/conv1d/required_space_to_batch_paddings/mod_1FloorMod8conv1d_2/conv1d/required_space_to_batch_paddings/sub:z:0&conv1d_2/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:28
6conv1d_2/conv1d/required_space_to_batch_paddings/mod_1?
6conv1d_2/conv1d/required_space_to_batch_paddings/add_2AddV2Iconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0:conv1d_2/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:28
6conv1d_2/conv1d/required_space_to_batch_paddings/add_2?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceGconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice:output:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice:conv1d_2/conv1d/required_space_to_batch_paddings/add_2:z:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3?
;conv1d_2/conv1d/required_space_to_batch_paddings/paddings/0PackIconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Iconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2=
;conv1d_2/conv1d/required_space_to_batch_paddings/paddings/0?
9conv1d_2/conv1d/required_space_to_batch_paddings/paddingsPackDconv1d_2/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2;
9conv1d_2/conv1d/required_space_to_batch_paddings/paddings?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice:conv1d_2/conv1d/required_space_to_batch_paddings/mod_1:z:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4?
:conv1d_2/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2<
:conv1d_2/conv1d/required_space_to_batch_paddings/crops/0/0?
8conv1d_2/conv1d/required_space_to_batch_paddings/crops/0PackCconv1d_2/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Iconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2:
8conv1d_2/conv1d/required_space_to_batch_paddings/crops/0?
6conv1d_2/conv1d/required_space_to_batch_paddings/cropsPackAconv1d_2/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:28
6conv1d_2/conv1d/required_space_to_batch_paddings/crops?
%conv1d_2/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_2/conv1d/strided_slice_1/stack?
'conv1d_2/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_2/conv1d/strided_slice_1/stack_1?
'conv1d_2/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_2/conv1d/strided_slice_1/stack_2?
conv1d_2/conv1d/strided_slice_1StridedSliceBconv1d_2/conv1d/required_space_to_batch_paddings/paddings:output:0.conv1d_2/conv1d/strided_slice_1/stack:output:00conv1d_2/conv1d/strided_slice_1/stack_1:output:00conv1d_2/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_2/conv1d/strided_slice_1?
!conv1d_2/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2#
!conv1d_2/conv1d/concat/concat_dim?
conv1d_2/conv1d/concat/concatIdentity(conv1d_2/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d_2/conv1d/concat/concat?
%conv1d_2/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_2/conv1d/strided_slice_2/stack?
'conv1d_2/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_2/conv1d/strided_slice_2/stack_1?
'conv1d_2/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_2/conv1d/strided_slice_2/stack_2?
conv1d_2/conv1d/strided_slice_2StridedSlice?conv1d_2/conv1d/required_space_to_batch_paddings/crops:output:0.conv1d_2/conv1d/strided_slice_2/stack:output:00conv1d_2/conv1d/strided_slice_2/stack_1:output:00conv1d_2/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_2/conv1d/strided_slice_2?
#conv1d_2/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2%
#conv1d_2/conv1d/concat_1/concat_dim?
conv1d_2/conv1d/concat_1/concatIdentity(conv1d_2/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2!
conv1d_2/conv1d/concat_1/concat?
*conv1d_2/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_2/conv1d/SpaceToBatchND/block_shape?
conv1d_2/conv1d/SpaceToBatchNDSpaceToBatchNDconv1d_2/Pad:output:03conv1d_2/conv1d/SpaceToBatchND/block_shape:output:0&conv1d_2/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_2/conv1d/SpaceToBatchND?
conv1d_2/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_2/conv1d/ExpandDims/dim?
conv1d_2/conv1d/ExpandDims
ExpandDims'conv1d_2/conv1d/SpaceToBatchND:output:0'conv1d_2/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d_2/conv1d/ExpandDims?
+conv1d_2/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_2_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02-
+conv1d_2/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_2/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_2/conv1d/ExpandDims_1/dim?
conv1d_2/conv1d/ExpandDims_1
ExpandDims3conv1d_2/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_2/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d_2/conv1d/ExpandDims_1?
conv1d_2/conv1dConv2D#conv1d_2/conv1d/ExpandDims:output:0%conv1d_2/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d_2/conv1d?
conv1d_2/conv1d/SqueezeSqueezeconv1d_2/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d_2/conv1d/Squeeze?
*conv1d_2/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_2/conv1d/BatchToSpaceND/block_shape?
conv1d_2/conv1d/BatchToSpaceNDBatchToSpaceND conv1d_2/conv1d/Squeeze:output:03conv1d_2/conv1d/BatchToSpaceND/block_shape:output:0(conv1d_2/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_2/conv1d/BatchToSpaceND?
conv1d_2/BiasAdd/ReadVariableOpReadVariableOp(conv1d_2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
conv1d_2/BiasAdd/ReadVariableOp?
conv1d_2/BiasAddBiasAdd'conv1d_2/conv1d/BatchToSpaceND:output:0'conv1d_2/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_2/BiasAdd?
conv1d_2/ReluReluconv1d_2/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_2/Relu?
conv1d_3/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
conv1d_3/Pad/paddings?
conv1d_3/PadPadconv1d_2/Relu:activations:0conv1d_3/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_3/Pad?
conv1d_3/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d_3/conv1d/dilation_rates
conv1d_3/conv1d/ShapeShapeconv1d_3/Pad:output:0*
T0*
_output_shapes
:2
conv1d_3/conv1d/Shape?
#conv1d_3/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2%
#conv1d_3/conv1d/strided_slice/stack?
%conv1d_3/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_3/conv1d/strided_slice/stack_1?
%conv1d_3/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_3/conv1d/strided_slice/stack_2?
conv1d_3/conv1d/strided_sliceStridedSliceconv1d_3/conv1d/Shape:output:0,conv1d_3/conv1d/strided_slice/stack:output:0.conv1d_3/conv1d/strided_slice/stack_1:output:0.conv1d_3/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d_3/conv1d/strided_slice?
conv1d_3/conv1d/stackPack&conv1d_3/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d_3/conv1d/stack?
>conv1d_3/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2@
>conv1d_3/conv1d/required_space_to_batch_paddings/base_paddings?
Dconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2F
Dconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
>conv1d_3/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceGconv1d_3/conv1d/required_space_to_batch_paddings/base_paddings:output:0Mconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2@
>conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceGconv1d_3/conv1d/required_space_to_batch_paddings/base_paddings:output:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2B
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1?
4conv1d_3/conv1d/required_space_to_batch_paddings/addAddV2conv1d_3/conv1d/stack:output:0Gconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:26
4conv1d_3/conv1d/required_space_to_batch_paddings/add?
6conv1d_3/conv1d/required_space_to_batch_paddings/add_1AddV28conv1d_3/conv1d/required_space_to_batch_paddings/add:z:0Iconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:28
6conv1d_3/conv1d/required_space_to_batch_paddings/add_1?
4conv1d_3/conv1d/required_space_to_batch_paddings/modFloorMod:conv1d_3/conv1d/required_space_to_batch_paddings/add_1:z:0&conv1d_3/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:26
4conv1d_3/conv1d/required_space_to_batch_paddings/mod?
4conv1d_3/conv1d/required_space_to_batch_paddings/subSub&conv1d_3/conv1d/dilation_rate:output:08conv1d_3/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:26
4conv1d_3/conv1d/required_space_to_batch_paddings/sub?
6conv1d_3/conv1d/required_space_to_batch_paddings/mod_1FloorMod8conv1d_3/conv1d/required_space_to_batch_paddings/sub:z:0&conv1d_3/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:28
6conv1d_3/conv1d/required_space_to_batch_paddings/mod_1?
6conv1d_3/conv1d/required_space_to_batch_paddings/add_2AddV2Iconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0:conv1d_3/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:28
6conv1d_3/conv1d/required_space_to_batch_paddings/add_2?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceGconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice:output:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice:conv1d_3/conv1d/required_space_to_batch_paddings/add_2:z:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3?
;conv1d_3/conv1d/required_space_to_batch_paddings/paddings/0PackIconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Iconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2=
;conv1d_3/conv1d/required_space_to_batch_paddings/paddings/0?
9conv1d_3/conv1d/required_space_to_batch_paddings/paddingsPackDconv1d_3/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2;
9conv1d_3/conv1d/required_space_to_batch_paddings/paddings?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice:conv1d_3/conv1d/required_space_to_batch_paddings/mod_1:z:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4?
:conv1d_3/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2<
:conv1d_3/conv1d/required_space_to_batch_paddings/crops/0/0?
8conv1d_3/conv1d/required_space_to_batch_paddings/crops/0PackCconv1d_3/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Iconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2:
8conv1d_3/conv1d/required_space_to_batch_paddings/crops/0?
6conv1d_3/conv1d/required_space_to_batch_paddings/cropsPackAconv1d_3/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:28
6conv1d_3/conv1d/required_space_to_batch_paddings/crops?
%conv1d_3/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_3/conv1d/strided_slice_1/stack?
'conv1d_3/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_3/conv1d/strided_slice_1/stack_1?
'conv1d_3/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_3/conv1d/strided_slice_1/stack_2?
conv1d_3/conv1d/strided_slice_1StridedSliceBconv1d_3/conv1d/required_space_to_batch_paddings/paddings:output:0.conv1d_3/conv1d/strided_slice_1/stack:output:00conv1d_3/conv1d/strided_slice_1/stack_1:output:00conv1d_3/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_3/conv1d/strided_slice_1?
!conv1d_3/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2#
!conv1d_3/conv1d/concat/concat_dim?
conv1d_3/conv1d/concat/concatIdentity(conv1d_3/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d_3/conv1d/concat/concat?
%conv1d_3/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_3/conv1d/strided_slice_2/stack?
'conv1d_3/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_3/conv1d/strided_slice_2/stack_1?
'conv1d_3/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_3/conv1d/strided_slice_2/stack_2?
conv1d_3/conv1d/strided_slice_2StridedSlice?conv1d_3/conv1d/required_space_to_batch_paddings/crops:output:0.conv1d_3/conv1d/strided_slice_2/stack:output:00conv1d_3/conv1d/strided_slice_2/stack_1:output:00conv1d_3/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_3/conv1d/strided_slice_2?
#conv1d_3/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2%
#conv1d_3/conv1d/concat_1/concat_dim?
conv1d_3/conv1d/concat_1/concatIdentity(conv1d_3/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2!
conv1d_3/conv1d/concat_1/concat?
*conv1d_3/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_3/conv1d/SpaceToBatchND/block_shape?
conv1d_3/conv1d/SpaceToBatchNDSpaceToBatchNDconv1d_3/Pad:output:03conv1d_3/conv1d/SpaceToBatchND/block_shape:output:0&conv1d_3/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_3/conv1d/SpaceToBatchND?
conv1d_3/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_3/conv1d/ExpandDims/dim?
conv1d_3/conv1d/ExpandDims
ExpandDims'conv1d_3/conv1d/SpaceToBatchND:output:0'conv1d_3/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d_3/conv1d/ExpandDims?
+conv1d_3/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_3_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02-
+conv1d_3/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_3/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_3/conv1d/ExpandDims_1/dim?
conv1d_3/conv1d/ExpandDims_1
ExpandDims3conv1d_3/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_3/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d_3/conv1d/ExpandDims_1?
conv1d_3/conv1dConv2D#conv1d_3/conv1d/ExpandDims:output:0%conv1d_3/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d_3/conv1d?
conv1d_3/conv1d/SqueezeSqueezeconv1d_3/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d_3/conv1d/Squeeze?
*conv1d_3/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_3/conv1d/BatchToSpaceND/block_shape?
conv1d_3/conv1d/BatchToSpaceNDBatchToSpaceND conv1d_3/conv1d/Squeeze:output:03conv1d_3/conv1d/BatchToSpaceND/block_shape:output:0(conv1d_3/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_3/conv1d/BatchToSpaceND?
conv1d_3/BiasAdd/ReadVariableOpReadVariableOp(conv1d_3_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
conv1d_3/BiasAdd/ReadVariableOp?
conv1d_3/BiasAddBiasAdd'conv1d_3/conv1d/BatchToSpaceND:output:0'conv1d_3/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_3/BiasAdd?
conv1d_3/ReluReluconv1d_3/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_3/Relu?
conv1d_4/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
conv1d_4/Pad/paddings?
conv1d_4/PadPadconv1d_3/Relu:activations:0conv1d_4/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_4/Pad?
conv1d_4/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d_4/conv1d/dilation_rates
conv1d_4/conv1d/ShapeShapeconv1d_4/Pad:output:0*
T0*
_output_shapes
:2
conv1d_4/conv1d/Shape?
#conv1d_4/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2%
#conv1d_4/conv1d/strided_slice/stack?
%conv1d_4/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_4/conv1d/strided_slice/stack_1?
%conv1d_4/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_4/conv1d/strided_slice/stack_2?
conv1d_4/conv1d/strided_sliceStridedSliceconv1d_4/conv1d/Shape:output:0,conv1d_4/conv1d/strided_slice/stack:output:0.conv1d_4/conv1d/strided_slice/stack_1:output:0.conv1d_4/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d_4/conv1d/strided_slice?
conv1d_4/conv1d/stackPack&conv1d_4/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d_4/conv1d/stack?
>conv1d_4/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2@
>conv1d_4/conv1d/required_space_to_batch_paddings/base_paddings?
Dconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2F
Dconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
>conv1d_4/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceGconv1d_4/conv1d/required_space_to_batch_paddings/base_paddings:output:0Mconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2@
>conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceGconv1d_4/conv1d/required_space_to_batch_paddings/base_paddings:output:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2B
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1?
4conv1d_4/conv1d/required_space_to_batch_paddings/addAddV2conv1d_4/conv1d/stack:output:0Gconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:26
4conv1d_4/conv1d/required_space_to_batch_paddings/add?
6conv1d_4/conv1d/required_space_to_batch_paddings/add_1AddV28conv1d_4/conv1d/required_space_to_batch_paddings/add:z:0Iconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:28
6conv1d_4/conv1d/required_space_to_batch_paddings/add_1?
4conv1d_4/conv1d/required_space_to_batch_paddings/modFloorMod:conv1d_4/conv1d/required_space_to_batch_paddings/add_1:z:0&conv1d_4/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:26
4conv1d_4/conv1d/required_space_to_batch_paddings/mod?
4conv1d_4/conv1d/required_space_to_batch_paddings/subSub&conv1d_4/conv1d/dilation_rate:output:08conv1d_4/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:26
4conv1d_4/conv1d/required_space_to_batch_paddings/sub?
6conv1d_4/conv1d/required_space_to_batch_paddings/mod_1FloorMod8conv1d_4/conv1d/required_space_to_batch_paddings/sub:z:0&conv1d_4/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:28
6conv1d_4/conv1d/required_space_to_batch_paddings/mod_1?
6conv1d_4/conv1d/required_space_to_batch_paddings/add_2AddV2Iconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0:conv1d_4/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:28
6conv1d_4/conv1d/required_space_to_batch_paddings/add_2?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceGconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice:output:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice:conv1d_4/conv1d/required_space_to_batch_paddings/add_2:z:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3?
;conv1d_4/conv1d/required_space_to_batch_paddings/paddings/0PackIconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Iconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2=
;conv1d_4/conv1d/required_space_to_batch_paddings/paddings/0?
9conv1d_4/conv1d/required_space_to_batch_paddings/paddingsPackDconv1d_4/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2;
9conv1d_4/conv1d/required_space_to_batch_paddings/paddings?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice:conv1d_4/conv1d/required_space_to_batch_paddings/mod_1:z:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4?
:conv1d_4/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2<
:conv1d_4/conv1d/required_space_to_batch_paddings/crops/0/0?
8conv1d_4/conv1d/required_space_to_batch_paddings/crops/0PackCconv1d_4/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Iconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2:
8conv1d_4/conv1d/required_space_to_batch_paddings/crops/0?
6conv1d_4/conv1d/required_space_to_batch_paddings/cropsPackAconv1d_4/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:28
6conv1d_4/conv1d/required_space_to_batch_paddings/crops?
%conv1d_4/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_4/conv1d/strided_slice_1/stack?
'conv1d_4/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_4/conv1d/strided_slice_1/stack_1?
'conv1d_4/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_4/conv1d/strided_slice_1/stack_2?
conv1d_4/conv1d/strided_slice_1StridedSliceBconv1d_4/conv1d/required_space_to_batch_paddings/paddings:output:0.conv1d_4/conv1d/strided_slice_1/stack:output:00conv1d_4/conv1d/strided_slice_1/stack_1:output:00conv1d_4/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_4/conv1d/strided_slice_1?
!conv1d_4/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2#
!conv1d_4/conv1d/concat/concat_dim?
conv1d_4/conv1d/concat/concatIdentity(conv1d_4/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d_4/conv1d/concat/concat?
%conv1d_4/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_4/conv1d/strided_slice_2/stack?
'conv1d_4/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_4/conv1d/strided_slice_2/stack_1?
'conv1d_4/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_4/conv1d/strided_slice_2/stack_2?
conv1d_4/conv1d/strided_slice_2StridedSlice?conv1d_4/conv1d/required_space_to_batch_paddings/crops:output:0.conv1d_4/conv1d/strided_slice_2/stack:output:00conv1d_4/conv1d/strided_slice_2/stack_1:output:00conv1d_4/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_4/conv1d/strided_slice_2?
#conv1d_4/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2%
#conv1d_4/conv1d/concat_1/concat_dim?
conv1d_4/conv1d/concat_1/concatIdentity(conv1d_4/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2!
conv1d_4/conv1d/concat_1/concat?
*conv1d_4/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_4/conv1d/SpaceToBatchND/block_shape?
conv1d_4/conv1d/SpaceToBatchNDSpaceToBatchNDconv1d_4/Pad:output:03conv1d_4/conv1d/SpaceToBatchND/block_shape:output:0&conv1d_4/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_4/conv1d/SpaceToBatchND?
conv1d_4/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_4/conv1d/ExpandDims/dim?
conv1d_4/conv1d/ExpandDims
ExpandDims'conv1d_4/conv1d/SpaceToBatchND:output:0'conv1d_4/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d_4/conv1d/ExpandDims?
+conv1d_4/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_4_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02-
+conv1d_4/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_4/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_4/conv1d/ExpandDims_1/dim?
conv1d_4/conv1d/ExpandDims_1
ExpandDims3conv1d_4/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_4/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d_4/conv1d/ExpandDims_1?
conv1d_4/conv1dConv2D#conv1d_4/conv1d/ExpandDims:output:0%conv1d_4/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d_4/conv1d?
conv1d_4/conv1d/SqueezeSqueezeconv1d_4/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d_4/conv1d/Squeeze?
*conv1d_4/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_4/conv1d/BatchToSpaceND/block_shape?
conv1d_4/conv1d/BatchToSpaceNDBatchToSpaceND conv1d_4/conv1d/Squeeze:output:03conv1d_4/conv1d/BatchToSpaceND/block_shape:output:0(conv1d_4/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_4/conv1d/BatchToSpaceND?
conv1d_4/BiasAdd/ReadVariableOpReadVariableOp(conv1d_4_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
conv1d_4/BiasAdd/ReadVariableOp?
conv1d_4/BiasAddBiasAdd'conv1d_4/conv1d/BatchToSpaceND:output:0'conv1d_4/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_4/BiasAdd?
conv1d_4/ReluReluconv1d_4/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_4/Relu?
conv1d_5/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                        2
conv1d_5/Pad/paddings?
conv1d_5/PadPadconv1d_4/Relu:activations:0conv1d_5/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_5/Pad?
conv1d_5/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d_5/conv1d/dilation_rates
conv1d_5/conv1d/ShapeShapeconv1d_5/Pad:output:0*
T0*
_output_shapes
:2
conv1d_5/conv1d/Shape?
#conv1d_5/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2%
#conv1d_5/conv1d/strided_slice/stack?
%conv1d_5/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_5/conv1d/strided_slice/stack_1?
%conv1d_5/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_5/conv1d/strided_slice/stack_2?
conv1d_5/conv1d/strided_sliceStridedSliceconv1d_5/conv1d/Shape:output:0,conv1d_5/conv1d/strided_slice/stack:output:0.conv1d_5/conv1d/strided_slice/stack_1:output:0.conv1d_5/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d_5/conv1d/strided_slice?
conv1d_5/conv1d/stackPack&conv1d_5/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d_5/conv1d/stack?
>conv1d_5/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2@
>conv1d_5/conv1d/required_space_to_batch_paddings/base_paddings?
Dconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2F
Dconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
>conv1d_5/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceGconv1d_5/conv1d/required_space_to_batch_paddings/base_paddings:output:0Mconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2@
>conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceGconv1d_5/conv1d/required_space_to_batch_paddings/base_paddings:output:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2B
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1?
4conv1d_5/conv1d/required_space_to_batch_paddings/addAddV2conv1d_5/conv1d/stack:output:0Gconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:26
4conv1d_5/conv1d/required_space_to_batch_paddings/add?
6conv1d_5/conv1d/required_space_to_batch_paddings/add_1AddV28conv1d_5/conv1d/required_space_to_batch_paddings/add:z:0Iconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:28
6conv1d_5/conv1d/required_space_to_batch_paddings/add_1?
4conv1d_5/conv1d/required_space_to_batch_paddings/modFloorMod:conv1d_5/conv1d/required_space_to_batch_paddings/add_1:z:0&conv1d_5/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:26
4conv1d_5/conv1d/required_space_to_batch_paddings/mod?
4conv1d_5/conv1d/required_space_to_batch_paddings/subSub&conv1d_5/conv1d/dilation_rate:output:08conv1d_5/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:26
4conv1d_5/conv1d/required_space_to_batch_paddings/sub?
6conv1d_5/conv1d/required_space_to_batch_paddings/mod_1FloorMod8conv1d_5/conv1d/required_space_to_batch_paddings/sub:z:0&conv1d_5/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:28
6conv1d_5/conv1d/required_space_to_batch_paddings/mod_1?
6conv1d_5/conv1d/required_space_to_batch_paddings/add_2AddV2Iconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0:conv1d_5/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:28
6conv1d_5/conv1d/required_space_to_batch_paddings/add_2?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceGconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice:output:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice:conv1d_5/conv1d/required_space_to_batch_paddings/add_2:z:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3?
;conv1d_5/conv1d/required_space_to_batch_paddings/paddings/0PackIconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Iconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2=
;conv1d_5/conv1d/required_space_to_batch_paddings/paddings/0?
9conv1d_5/conv1d/required_space_to_batch_paddings/paddingsPackDconv1d_5/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2;
9conv1d_5/conv1d/required_space_to_batch_paddings/paddings?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice:conv1d_5/conv1d/required_space_to_batch_paddings/mod_1:z:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4?
:conv1d_5/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2<
:conv1d_5/conv1d/required_space_to_batch_paddings/crops/0/0?
8conv1d_5/conv1d/required_space_to_batch_paddings/crops/0PackCconv1d_5/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Iconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2:
8conv1d_5/conv1d/required_space_to_batch_paddings/crops/0?
6conv1d_5/conv1d/required_space_to_batch_paddings/cropsPackAconv1d_5/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:28
6conv1d_5/conv1d/required_space_to_batch_paddings/crops?
%conv1d_5/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_5/conv1d/strided_slice_1/stack?
'conv1d_5/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_5/conv1d/strided_slice_1/stack_1?
'conv1d_5/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_5/conv1d/strided_slice_1/stack_2?
conv1d_5/conv1d/strided_slice_1StridedSliceBconv1d_5/conv1d/required_space_to_batch_paddings/paddings:output:0.conv1d_5/conv1d/strided_slice_1/stack:output:00conv1d_5/conv1d/strided_slice_1/stack_1:output:00conv1d_5/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_5/conv1d/strided_slice_1?
!conv1d_5/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2#
!conv1d_5/conv1d/concat/concat_dim?
conv1d_5/conv1d/concat/concatIdentity(conv1d_5/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d_5/conv1d/concat/concat?
%conv1d_5/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_5/conv1d/strided_slice_2/stack?
'conv1d_5/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_5/conv1d/strided_slice_2/stack_1?
'conv1d_5/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_5/conv1d/strided_slice_2/stack_2?
conv1d_5/conv1d/strided_slice_2StridedSlice?conv1d_5/conv1d/required_space_to_batch_paddings/crops:output:0.conv1d_5/conv1d/strided_slice_2/stack:output:00conv1d_5/conv1d/strided_slice_2/stack_1:output:00conv1d_5/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_5/conv1d/strided_slice_2?
#conv1d_5/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2%
#conv1d_5/conv1d/concat_1/concat_dim?
conv1d_5/conv1d/concat_1/concatIdentity(conv1d_5/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2!
conv1d_5/conv1d/concat_1/concat?
*conv1d_5/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB: 2,
*conv1d_5/conv1d/SpaceToBatchND/block_shape?
conv1d_5/conv1d/SpaceToBatchNDSpaceToBatchNDconv1d_5/Pad:output:03conv1d_5/conv1d/SpaceToBatchND/block_shape:output:0&conv1d_5/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_5/conv1d/SpaceToBatchND?
conv1d_5/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_5/conv1d/ExpandDims/dim?
conv1d_5/conv1d/ExpandDims
ExpandDims'conv1d_5/conv1d/SpaceToBatchND:output:0'conv1d_5/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d_5/conv1d/ExpandDims?
+conv1d_5/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_5_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02-
+conv1d_5/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_5/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_5/conv1d/ExpandDims_1/dim?
conv1d_5/conv1d/ExpandDims_1
ExpandDims3conv1d_5/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_5/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d_5/conv1d/ExpandDims_1?
conv1d_5/conv1dConv2D#conv1d_5/conv1d/ExpandDims:output:0%conv1d_5/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d_5/conv1d?
conv1d_5/conv1d/SqueezeSqueezeconv1d_5/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d_5/conv1d/Squeeze?
*conv1d_5/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB: 2,
*conv1d_5/conv1d/BatchToSpaceND/block_shape?
conv1d_5/conv1d/BatchToSpaceNDBatchToSpaceND conv1d_5/conv1d/Squeeze:output:03conv1d_5/conv1d/BatchToSpaceND/block_shape:output:0(conv1d_5/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_5/conv1d/BatchToSpaceND?
conv1d_5/BiasAdd/ReadVariableOpReadVariableOp(conv1d_5_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
conv1d_5/BiasAdd/ReadVariableOp?
conv1d_5/BiasAddBiasAdd'conv1d_5/conv1d/BatchToSpaceND:output:0'conv1d_5/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_5/BiasAdd?
conv1d_5/ReluReluconv1d_5/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_5/Relu?
dense/Tensordot/ReadVariableOpReadVariableOp'dense_tensordot_readvariableop_resource*
_output_shapes

: *
dtype02 
dense/Tensordot/ReadVariableOpv
dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:2
dense/Tensordot/axes}
dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       2
dense/Tensordot/freey
dense/Tensordot/ShapeShapeconv1d_5/Relu:activations:0*
T0*
_output_shapes
:2
dense/Tensordot/Shape?
dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
dense/Tensordot/GatherV2/axis?
dense/Tensordot/GatherV2GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/free:output:0&dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
dense/Tensordot/GatherV2?
dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2!
dense/Tensordot/GatherV2_1/axis?
dense/Tensordot/GatherV2_1GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/axes:output:0(dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
dense/Tensordot/GatherV2_1x
dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
dense/Tensordot/Const?
dense/Tensordot/ProdProd!dense/Tensordot/GatherV2:output:0dense/Tensordot/Const:output:0*
T0*
_output_shapes
: 2
dense/Tensordot/Prod|
dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 2
dense/Tensordot/Const_1?
dense/Tensordot/Prod_1Prod#dense/Tensordot/GatherV2_1:output:0 dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: 2
dense/Tensordot/Prod_1|
dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
dense/Tensordot/concat/axis?
dense/Tensordot/concatConcatV2dense/Tensordot/free:output:0dense/Tensordot/axes:output:0$dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:2
dense/Tensordot/concat?
dense/Tensordot/stackPackdense/Tensordot/Prod:output:0dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:2
dense/Tensordot/stack?
dense/Tensordot/transpose	Transposeconv1d_5/Relu:activations:0dense/Tensordot/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
dense/Tensordot/transpose?
dense/Tensordot/ReshapeReshapedense/Tensordot/transpose:y:0dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:??????????????????2
dense/Tensordot/Reshape?
dense/Tensordot/MatMulMatMul dense/Tensordot/Reshape:output:0&dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
dense/Tensordot/MatMul|
dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:2
dense/Tensordot/Const_2?
dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
dense/Tensordot/concat_1/axis?
dense/Tensordot/concat_1ConcatV2!dense/Tensordot/GatherV2:output:0 dense/Tensordot/Const_2:output:0&dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:2
dense/Tensordot/concat_1?
dense/TensordotReshape dense/Tensordot/MatMul:product:0!dense/Tensordot/concat_1:output:0*
T0*4
_output_shapes"
 :??????????????????2
dense/Tensordot?
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
dense/BiasAdd/ReadVariableOp?
dense/BiasAddBiasAdddense/Tensordot:output:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :??????????????????2
dense/BiasAddw

dense/ReluReludense/BiasAdd:output:0*
T0*4
_output_shapes"
 :??????????????????2

dense/Relu?
conv1d_6/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_6/conv1d/ExpandDims/dim?
conv1d_6/conv1d/ExpandDims
ExpandDimsdense/Relu:activations:0'conv1d_6/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????2
conv1d_6/conv1d/ExpandDims?
+conv1d_6/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_6_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:*
dtype02-
+conv1d_6/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_6/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_6/conv1d/ExpandDims_1/dim?
conv1d_6/conv1d/ExpandDims_1
ExpandDims3conv1d_6/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_6/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:2
conv1d_6/conv1d/ExpandDims_1?
conv1d_6/conv1dConv2D#conv1d_6/conv1d/ExpandDims:output:0%conv1d_6/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"??????????????????*
paddingVALID*
strides
2
conv1d_6/conv1d?
conv1d_6/conv1d/SqueezeSqueezeconv1d_6/conv1d:output:0*
T0*4
_output_shapes"
 :??????????????????*
squeeze_dims

?????????2
conv1d_6/conv1d/Squeeze?
conv1d_6/BiasAdd/ReadVariableOpReadVariableOp(conv1d_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02!
conv1d_6/BiasAdd/ReadVariableOp?
conv1d_6/BiasAddBiasAdd conv1d_6/conv1d/Squeeze:output:0'conv1d_6/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :??????????????????2
conv1d_6/BiasAdd?
IdentityIdentityconv1d_6/BiasAdd:output:0^conv1d/BiasAdd/ReadVariableOp*^conv1d/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_1/BiasAdd/ReadVariableOp,^conv1d_1/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_2/BiasAdd/ReadVariableOp,^conv1d_2/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_3/BiasAdd/ReadVariableOp,^conv1d_3/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_4/BiasAdd/ReadVariableOp,^conv1d_4/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_5/BiasAdd/ReadVariableOp,^conv1d_5/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_6/BiasAdd/ReadVariableOp,^conv1d_6/conv1d/ExpandDims_1/ReadVariableOp^dense/BiasAdd/ReadVariableOp^dense/Tensordot/ReadVariableOp*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 2>
conv1d/BiasAdd/ReadVariableOpconv1d/BiasAdd/ReadVariableOp2V
)conv1d/conv1d/ExpandDims_1/ReadVariableOp)conv1d/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_1/BiasAdd/ReadVariableOpconv1d_1/BiasAdd/ReadVariableOp2Z
+conv1d_1/conv1d/ExpandDims_1/ReadVariableOp+conv1d_1/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_2/BiasAdd/ReadVariableOpconv1d_2/BiasAdd/ReadVariableOp2Z
+conv1d_2/conv1d/ExpandDims_1/ReadVariableOp+conv1d_2/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_3/BiasAdd/ReadVariableOpconv1d_3/BiasAdd/ReadVariableOp2Z
+conv1d_3/conv1d/ExpandDims_1/ReadVariableOp+conv1d_3/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_4/BiasAdd/ReadVariableOpconv1d_4/BiasAdd/ReadVariableOp2Z
+conv1d_4/conv1d/ExpandDims_1/ReadVariableOp+conv1d_4/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_5/BiasAdd/ReadVariableOpconv1d_5/BiasAdd/ReadVariableOp2Z
+conv1d_5/conv1d/ExpandDims_1/ReadVariableOp+conv1d_5/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_6/BiasAdd/ReadVariableOpconv1d_6/BiasAdd/ReadVariableOp2Z
+conv1d_6/conv1d/ExpandDims_1/ReadVariableOp+conv1d_6/conv1d/ExpandDims_1/ReadVariableOp2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2@
dense/Tensordot/ReadVariableOpdense/Tensordot/ReadVariableOp:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
?r
?
D__inference_conv1d_4_layer_call_and_return_conditional_losses_149542

inputsA
+conv1d_expanddims_1_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Padv
conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/dilation_rateX
conv1d/ShapeShapePad:output:0*
T0*
_output_shapes
:2
conv1d/Shape?
conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack?
conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_1?
conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_2?
conv1d/strided_sliceStridedSliceconv1d/Shape:output:0#conv1d/strided_slice/stack:output:0%conv1d/strided_slice/stack_1:output:0%conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d/strided_sliceq
conv1d/stackPackconv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d/stack?
5conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        27
5conv1d/required_space_to_batch_paddings/base_paddings?
;conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2=
;conv1d/required_space_to_batch_paddings/strided_slice/stack?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
5conv1d/required_space_to_batch_paddings/strided_sliceStridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Dconv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask27
5conv1d/required_space_to_batch_paddings/strided_slice?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_1StridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_1?
+conv1d/required_space_to_batch_paddings/addAddV2conv1d/stack:output:0>conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/add?
-conv1d/required_space_to_batch_paddings/add_1AddV2/conv1d/required_space_to_batch_paddings/add:z:0@conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_1?
+conv1d/required_space_to_batch_paddings/modFloorMod1conv1d/required_space_to_batch_paddings/add_1:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/mod?
+conv1d/required_space_to_batch_paddings/subSubconv1d/dilation_rate:output:0/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/sub?
-conv1d/required_space_to_batch_paddings/mod_1FloorMod/conv1d/required_space_to_batch_paddings/sub:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/mod_1?
-conv1d/required_space_to_batch_paddings/add_2AddV2@conv1d/required_space_to_batch_paddings/strided_slice_1:output:01conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_2StridedSlice>conv1d/required_space_to_batch_paddings/strided_slice:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice1conv1d/required_space_to_batch_paddings/add_2:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_3?
2conv1d/required_space_to_batch_paddings/paddings/0Pack@conv1d/required_space_to_batch_paddings/strided_slice_2:output:0@conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:24
2conv1d/required_space_to_batch_paddings/paddings/0?
0conv1d/required_space_to_batch_paddings/paddingsPack;conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:22
0conv1d/required_space_to_batch_paddings/paddings?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice1conv1d/required_space_to_batch_paddings/mod_1:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_4?
1conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 23
1conv1d/required_space_to_batch_paddings/crops/0/0?
/conv1d/required_space_to_batch_paddings/crops/0Pack:conv1d/required_space_to_batch_paddings/crops/0/0:output:0@conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:21
/conv1d/required_space_to_batch_paddings/crops/0?
-conv1d/required_space_to_batch_paddings/cropsPack8conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2/
-conv1d/required_space_to_batch_paddings/crops?
conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_1/stack?
conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_1?
conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_2?
conv1d/strided_slice_1StridedSlice9conv1d/required_space_to_batch_paddings/paddings:output:0%conv1d/strided_slice_1/stack:output:0'conv1d/strided_slice_1/stack_1:output:0'conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_1v
conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat/concat_dim?
conv1d/concat/concatIdentityconv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d/concat/concat?
conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_2/stack?
conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_1?
conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_2?
conv1d/strided_slice_2StridedSlice6conv1d/required_space_to_batch_paddings/crops:output:0%conv1d/strided_slice_2/stack:output:0'conv1d/strided_slice_2/stack_1:output:0'conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_2z
conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat_1/concat_dim?
conv1d/concat_1/concatIdentityconv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2
conv1d/concat_1/concat?
!conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/SpaceToBatchND/block_shape?
conv1d/SpaceToBatchNDSpaceToBatchNDPad:output:0*conv1d/SpaceToBatchND/block_shape:output:0conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/SpaceToBatchNDy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsconv1d/SpaceToBatchND:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
!conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/BatchToSpaceND/block_shape?
conv1d/BatchToSpaceNDBatchToSpaceNDconv1d/Squeeze:output:0*conv1d/BatchToSpaceND/block_shape:output:0conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BatchToSpaceND?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/BatchToSpaceND:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?
?
&__inference_dense_layer_call_fn_149633

inputs
unknown: 
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_1478802
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?r
?
D__inference_conv1d_4_layer_call_and_return_conditional_losses_147764

inputsA
+conv1d_expanddims_1_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Padv
conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/dilation_rateX
conv1d/ShapeShapePad:output:0*
T0*
_output_shapes
:2
conv1d/Shape?
conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack?
conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_1?
conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_2?
conv1d/strided_sliceStridedSliceconv1d/Shape:output:0#conv1d/strided_slice/stack:output:0%conv1d/strided_slice/stack_1:output:0%conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d/strided_sliceq
conv1d/stackPackconv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d/stack?
5conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        27
5conv1d/required_space_to_batch_paddings/base_paddings?
;conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2=
;conv1d/required_space_to_batch_paddings/strided_slice/stack?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
5conv1d/required_space_to_batch_paddings/strided_sliceStridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Dconv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask27
5conv1d/required_space_to_batch_paddings/strided_slice?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_1StridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_1?
+conv1d/required_space_to_batch_paddings/addAddV2conv1d/stack:output:0>conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/add?
-conv1d/required_space_to_batch_paddings/add_1AddV2/conv1d/required_space_to_batch_paddings/add:z:0@conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_1?
+conv1d/required_space_to_batch_paddings/modFloorMod1conv1d/required_space_to_batch_paddings/add_1:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/mod?
+conv1d/required_space_to_batch_paddings/subSubconv1d/dilation_rate:output:0/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/sub?
-conv1d/required_space_to_batch_paddings/mod_1FloorMod/conv1d/required_space_to_batch_paddings/sub:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/mod_1?
-conv1d/required_space_to_batch_paddings/add_2AddV2@conv1d/required_space_to_batch_paddings/strided_slice_1:output:01conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_2StridedSlice>conv1d/required_space_to_batch_paddings/strided_slice:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice1conv1d/required_space_to_batch_paddings/add_2:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_3?
2conv1d/required_space_to_batch_paddings/paddings/0Pack@conv1d/required_space_to_batch_paddings/strided_slice_2:output:0@conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:24
2conv1d/required_space_to_batch_paddings/paddings/0?
0conv1d/required_space_to_batch_paddings/paddingsPack;conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:22
0conv1d/required_space_to_batch_paddings/paddings?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice1conv1d/required_space_to_batch_paddings/mod_1:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_4?
1conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 23
1conv1d/required_space_to_batch_paddings/crops/0/0?
/conv1d/required_space_to_batch_paddings/crops/0Pack:conv1d/required_space_to_batch_paddings/crops/0/0:output:0@conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:21
/conv1d/required_space_to_batch_paddings/crops/0?
-conv1d/required_space_to_batch_paddings/cropsPack8conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2/
-conv1d/required_space_to_batch_paddings/crops?
conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_1/stack?
conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_1?
conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_2?
conv1d/strided_slice_1StridedSlice9conv1d/required_space_to_batch_paddings/paddings:output:0%conv1d/strided_slice_1/stack:output:0'conv1d/strided_slice_1/stack_1:output:0'conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_1v
conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat/concat_dim?
conv1d/concat/concatIdentityconv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d/concat/concat?
conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_2/stack?
conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_1?
conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_2?
conv1d/strided_slice_2StridedSlice6conv1d/required_space_to_batch_paddings/crops:output:0%conv1d/strided_slice_2/stack:output:0'conv1d/strided_slice_2/stack_1:output:0'conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_2z
conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat_1/concat_dim?
conv1d/concat_1/concatIdentityconv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2
conv1d/concat_1/concat?
!conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/SpaceToBatchND/block_shape?
conv1d/SpaceToBatchNDSpaceToBatchNDPad:output:0*conv1d/SpaceToBatchND/block_shape:output:0conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/SpaceToBatchNDy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsconv1d/SpaceToBatchND:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
!conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/BatchToSpaceND/block_shape?
conv1d/BatchToSpaceNDBatchToSpaceNDconv1d/Squeeze:output:0*conv1d/BatchToSpaceND/block_shape:output:0conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BatchToSpaceND?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/BatchToSpaceND:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?,
?
F__inference_sequential_layer_call_and_return_conditional_losses_148266
input_1#
conv1d_148225: 
conv1d_148227: %
conv1d_1_148230:  
conv1d_1_148232: %
conv1d_2_148235:  
conv1d_2_148237: %
conv1d_3_148240:  
conv1d_3_148242: %
conv1d_4_148245:  
conv1d_4_148247: %
conv1d_5_148250:  
conv1d_5_148252: 
dense_148255: 
dense_148257:%
conv1d_6_148260:
conv1d_6_148262:
identity??conv1d/StatefulPartitionedCall? conv1d_1/StatefulPartitionedCall? conv1d_2/StatefulPartitionedCall? conv1d_3/StatefulPartitionedCall? conv1d_4/StatefulPartitionedCall? conv1d_5/StatefulPartitionedCall? conv1d_6/StatefulPartitionedCall?dense/StatefulPartitionedCall?
conv1d/StatefulPartitionedCallStatefulPartitionedCallinput_1conv1d_148225conv1d_148227*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_conv1d_layer_call_and_return_conditional_losses_1474482 
conv1d/StatefulPartitionedCall?
 conv1d_1/StatefulPartitionedCallStatefulPartitionedCall'conv1d/StatefulPartitionedCall:output:0conv1d_1_148230conv1d_1_148232*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_1_layer_call_and_return_conditional_losses_1475272"
 conv1d_1/StatefulPartitionedCall?
 conv1d_2/StatefulPartitionedCallStatefulPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0conv1d_2_148235conv1d_2_148237*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_2_layer_call_and_return_conditional_losses_1476062"
 conv1d_2/StatefulPartitionedCall?
 conv1d_3/StatefulPartitionedCallStatefulPartitionedCall)conv1d_2/StatefulPartitionedCall:output:0conv1d_3_148240conv1d_3_148242*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_3_layer_call_and_return_conditional_losses_1476852"
 conv1d_3/StatefulPartitionedCall?
 conv1d_4/StatefulPartitionedCallStatefulPartitionedCall)conv1d_3/StatefulPartitionedCall:output:0conv1d_4_148245conv1d_4_148247*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_4_layer_call_and_return_conditional_losses_1477642"
 conv1d_4/StatefulPartitionedCall?
 conv1d_5/StatefulPartitionedCallStatefulPartitionedCall)conv1d_4/StatefulPartitionedCall:output:0conv1d_5_148250conv1d_5_148252*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_5_layer_call_and_return_conditional_losses_1478432"
 conv1d_5/StatefulPartitionedCall?
dense/StatefulPartitionedCallStatefulPartitionedCall)conv1d_5/StatefulPartitionedCall:output:0dense_148255dense_148257*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_1478802
dense/StatefulPartitionedCall?
 conv1d_6/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0conv1d_6_148260conv1d_6_148262*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_6_layer_call_and_return_conditional_losses_1479012"
 conv1d_6/StatefulPartitionedCall?
IdentityIdentity)conv1d_6/StatefulPartitionedCall:output:0^conv1d/StatefulPartitionedCall!^conv1d_1/StatefulPartitionedCall!^conv1d_2/StatefulPartitionedCall!^conv1d_3/StatefulPartitionedCall!^conv1d_4/StatefulPartitionedCall!^conv1d_5/StatefulPartitionedCall!^conv1d_6/StatefulPartitionedCall^dense/StatefulPartitionedCall*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 2@
conv1d/StatefulPartitionedCallconv1d/StatefulPartitionedCall2D
 conv1d_1/StatefulPartitionedCall conv1d_1/StatefulPartitionedCall2D
 conv1d_2/StatefulPartitionedCall conv1d_2/StatefulPartitionedCall2D
 conv1d_3/StatefulPartitionedCall conv1d_3/StatefulPartitionedCall2D
 conv1d_4/StatefulPartitionedCall conv1d_4/StatefulPartitionedCall2D
 conv1d_5/StatefulPartitionedCall conv1d_5/StatefulPartitionedCall2D
 conv1d_6/StatefulPartitionedCall conv1d_6/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:] Y
4
_output_shapes"
 :??????????????????
!
_user_specified_name	input_1
?,
?
F__inference_sequential_layer_call_and_return_conditional_losses_147908

inputs#
conv1d_147449: 
conv1d_147451: %
conv1d_1_147528:  
conv1d_1_147530: %
conv1d_2_147607:  
conv1d_2_147609: %
conv1d_3_147686:  
conv1d_3_147688: %
conv1d_4_147765:  
conv1d_4_147767: %
conv1d_5_147844:  
conv1d_5_147846: 
dense_147881: 
dense_147883:%
conv1d_6_147902:
conv1d_6_147904:
identity??conv1d/StatefulPartitionedCall? conv1d_1/StatefulPartitionedCall? conv1d_2/StatefulPartitionedCall? conv1d_3/StatefulPartitionedCall? conv1d_4/StatefulPartitionedCall? conv1d_5/StatefulPartitionedCall? conv1d_6/StatefulPartitionedCall?dense/StatefulPartitionedCall?
conv1d/StatefulPartitionedCallStatefulPartitionedCallinputsconv1d_147449conv1d_147451*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_conv1d_layer_call_and_return_conditional_losses_1474482 
conv1d/StatefulPartitionedCall?
 conv1d_1/StatefulPartitionedCallStatefulPartitionedCall'conv1d/StatefulPartitionedCall:output:0conv1d_1_147528conv1d_1_147530*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_1_layer_call_and_return_conditional_losses_1475272"
 conv1d_1/StatefulPartitionedCall?
 conv1d_2/StatefulPartitionedCallStatefulPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0conv1d_2_147607conv1d_2_147609*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_2_layer_call_and_return_conditional_losses_1476062"
 conv1d_2/StatefulPartitionedCall?
 conv1d_3/StatefulPartitionedCallStatefulPartitionedCall)conv1d_2/StatefulPartitionedCall:output:0conv1d_3_147686conv1d_3_147688*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_3_layer_call_and_return_conditional_losses_1476852"
 conv1d_3/StatefulPartitionedCall?
 conv1d_4/StatefulPartitionedCallStatefulPartitionedCall)conv1d_3/StatefulPartitionedCall:output:0conv1d_4_147765conv1d_4_147767*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_4_layer_call_and_return_conditional_losses_1477642"
 conv1d_4/StatefulPartitionedCall?
 conv1d_5/StatefulPartitionedCallStatefulPartitionedCall)conv1d_4/StatefulPartitionedCall:output:0conv1d_5_147844conv1d_5_147846*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_5_layer_call_and_return_conditional_losses_1478432"
 conv1d_5/StatefulPartitionedCall?
dense/StatefulPartitionedCallStatefulPartitionedCall)conv1d_5/StatefulPartitionedCall:output:0dense_147881dense_147883*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_1478802
dense/StatefulPartitionedCall?
 conv1d_6/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0conv1d_6_147902conv1d_6_147904*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_6_layer_call_and_return_conditional_losses_1479012"
 conv1d_6/StatefulPartitionedCall?
IdentityIdentity)conv1d_6/StatefulPartitionedCall:output:0^conv1d/StatefulPartitionedCall!^conv1d_1/StatefulPartitionedCall!^conv1d_2/StatefulPartitionedCall!^conv1d_3/StatefulPartitionedCall!^conv1d_4/StatefulPartitionedCall!^conv1d_5/StatefulPartitionedCall!^conv1d_6/StatefulPartitionedCall^dense/StatefulPartitionedCall*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 2@
conv1d/StatefulPartitionedCallconv1d/StatefulPartitionedCall2D
 conv1d_1/StatefulPartitionedCall conv1d_1/StatefulPartitionedCall2D
 conv1d_2/StatefulPartitionedCall conv1d_2/StatefulPartitionedCall2D
 conv1d_3/StatefulPartitionedCall conv1d_3/StatefulPartitionedCall2D
 conv1d_4/StatefulPartitionedCall conv1d_4/StatefulPartitionedCall2D
 conv1d_5/StatefulPartitionedCall conv1d_5/StatefulPartitionedCall2D
 conv1d_6/StatefulPartitionedCall conv1d_6/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
?
?
+__inference_sequential_layer_call_fn_148348

inputs
unknown: 
	unknown_0: 
	unknown_1:  
	unknown_2: 
	unknown_3:  
	unknown_4: 
	unknown_5:  
	unknown_6: 
	unknown_7:  
	unknown_8: 
	unknown_9:  

unknown_10: 

unknown_11: 

unknown_12: 

unknown_13:

unknown_14:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_1479082
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
??
?"
"__inference__traced_restore_150063
file_prefix4
assignvariableop_conv1d_kernel: ,
assignvariableop_1_conv1d_bias: 8
"assignvariableop_2_conv1d_1_kernel:  .
 assignvariableop_3_conv1d_1_bias: 8
"assignvariableop_4_conv1d_2_kernel:  .
 assignvariableop_5_conv1d_2_bias: 8
"assignvariableop_6_conv1d_3_kernel:  .
 assignvariableop_7_conv1d_3_bias: 8
"assignvariableop_8_conv1d_4_kernel:  .
 assignvariableop_9_conv1d_4_bias: 9
#assignvariableop_10_conv1d_5_kernel:  /
!assignvariableop_11_conv1d_5_bias: 2
 assignvariableop_12_dense_kernel: ,
assignvariableop_13_dense_bias:9
#assignvariableop_14_conv1d_6_kernel:/
!assignvariableop_15_conv1d_6_bias:'
assignvariableop_16_adam_iter:	 )
assignvariableop_17_adam_beta_1: )
assignvariableop_18_adam_beta_2: (
assignvariableop_19_adam_decay: 0
&assignvariableop_20_adam_learning_rate: #
assignvariableop_21_total: #
assignvariableop_22_count: %
assignvariableop_23_total_1: %
assignvariableop_24_count_1: >
(assignvariableop_25_adam_conv1d_kernel_m: 4
&assignvariableop_26_adam_conv1d_bias_m: @
*assignvariableop_27_adam_conv1d_1_kernel_m:  6
(assignvariableop_28_adam_conv1d_1_bias_m: @
*assignvariableop_29_adam_conv1d_2_kernel_m:  6
(assignvariableop_30_adam_conv1d_2_bias_m: @
*assignvariableop_31_adam_conv1d_3_kernel_m:  6
(assignvariableop_32_adam_conv1d_3_bias_m: @
*assignvariableop_33_adam_conv1d_4_kernel_m:  6
(assignvariableop_34_adam_conv1d_4_bias_m: @
*assignvariableop_35_adam_conv1d_5_kernel_m:  6
(assignvariableop_36_adam_conv1d_5_bias_m: 9
'assignvariableop_37_adam_dense_kernel_m: 3
%assignvariableop_38_adam_dense_bias_m:@
*assignvariableop_39_adam_conv1d_6_kernel_m:6
(assignvariableop_40_adam_conv1d_6_bias_m:>
(assignvariableop_41_adam_conv1d_kernel_v: 4
&assignvariableop_42_adam_conv1d_bias_v: @
*assignvariableop_43_adam_conv1d_1_kernel_v:  6
(assignvariableop_44_adam_conv1d_1_bias_v: @
*assignvariableop_45_adam_conv1d_2_kernel_v:  6
(assignvariableop_46_adam_conv1d_2_bias_v: @
*assignvariableop_47_adam_conv1d_3_kernel_v:  6
(assignvariableop_48_adam_conv1d_3_bias_v: @
*assignvariableop_49_adam_conv1d_4_kernel_v:  6
(assignvariableop_50_adam_conv1d_4_bias_v: @
*assignvariableop_51_adam_conv1d_5_kernel_v:  6
(assignvariableop_52_adam_conv1d_5_bias_v: 9
'assignvariableop_53_adam_dense_kernel_v: 3
%assignvariableop_54_adam_dense_bias_v:@
*assignvariableop_55_adam_conv1d_6_kernel_v:6
(assignvariableop_56_adam_conv1d_6_bias_v:
identity_58??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_11?AssignVariableOp_12?AssignVariableOp_13?AssignVariableOp_14?AssignVariableOp_15?AssignVariableOp_16?AssignVariableOp_17?AssignVariableOp_18?AssignVariableOp_19?AssignVariableOp_2?AssignVariableOp_20?AssignVariableOp_21?AssignVariableOp_22?AssignVariableOp_23?AssignVariableOp_24?AssignVariableOp_25?AssignVariableOp_26?AssignVariableOp_27?AssignVariableOp_28?AssignVariableOp_29?AssignVariableOp_3?AssignVariableOp_30?AssignVariableOp_31?AssignVariableOp_32?AssignVariableOp_33?AssignVariableOp_34?AssignVariableOp_35?AssignVariableOp_36?AssignVariableOp_37?AssignVariableOp_38?AssignVariableOp_39?AssignVariableOp_4?AssignVariableOp_40?AssignVariableOp_41?AssignVariableOp_42?AssignVariableOp_43?AssignVariableOp_44?AssignVariableOp_45?AssignVariableOp_46?AssignVariableOp_47?AssignVariableOp_48?AssignVariableOp_49?AssignVariableOp_5?AssignVariableOp_50?AssignVariableOp_51?AssignVariableOp_52?AssignVariableOp_53?AssignVariableOp_54?AssignVariableOp_55?AssignVariableOp_56?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9? 
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
::*
dtype0*?
value?B?:B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
::*
dtype0*?
value~B|:B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*?
_output_shapes?
?::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*H
dtypes>
<2:	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity?
AssignVariableOpAssignVariableOpassignvariableop_conv1d_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1?
AssignVariableOp_1AssignVariableOpassignvariableop_1_conv1d_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2?
AssignVariableOp_2AssignVariableOp"assignvariableop_2_conv1d_1_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3?
AssignVariableOp_3AssignVariableOp assignvariableop_3_conv1d_1_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4?
AssignVariableOp_4AssignVariableOp"assignvariableop_4_conv1d_2_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5?
AssignVariableOp_5AssignVariableOp assignvariableop_5_conv1d_2_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6?
AssignVariableOp_6AssignVariableOp"assignvariableop_6_conv1d_3_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7?
AssignVariableOp_7AssignVariableOp assignvariableop_7_conv1d_3_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8?
AssignVariableOp_8AssignVariableOp"assignvariableop_8_conv1d_4_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9?
AssignVariableOp_9AssignVariableOp assignvariableop_9_conv1d_4_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10?
AssignVariableOp_10AssignVariableOp#assignvariableop_10_conv1d_5_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11?
AssignVariableOp_11AssignVariableOp!assignvariableop_11_conv1d_5_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12?
AssignVariableOp_12AssignVariableOp assignvariableop_12_dense_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13?
AssignVariableOp_13AssignVariableOpassignvariableop_13_dense_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14?
AssignVariableOp_14AssignVariableOp#assignvariableop_14_conv1d_6_kernelIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15?
AssignVariableOp_15AssignVariableOp!assignvariableop_15_conv1d_6_biasIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0	*
_output_shapes
:2
Identity_16?
AssignVariableOp_16AssignVariableOpassignvariableop_16_adam_iterIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17?
AssignVariableOp_17AssignVariableOpassignvariableop_17_adam_beta_1Identity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18?
AssignVariableOp_18AssignVariableOpassignvariableop_18_adam_beta_2Identity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19?
AssignVariableOp_19AssignVariableOpassignvariableop_19_adam_decayIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20?
AssignVariableOp_20AssignVariableOp&assignvariableop_20_adam_learning_rateIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21?
AssignVariableOp_21AssignVariableOpassignvariableop_21_totalIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22?
AssignVariableOp_22AssignVariableOpassignvariableop_22_countIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23?
AssignVariableOp_23AssignVariableOpassignvariableop_23_total_1Identity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_23n
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:2
Identity_24?
AssignVariableOp_24AssignVariableOpassignvariableop_24_count_1Identity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_24n
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:2
Identity_25?
AssignVariableOp_25AssignVariableOp(assignvariableop_25_adam_conv1d_kernel_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_25n
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:2
Identity_26?
AssignVariableOp_26AssignVariableOp&assignvariableop_26_adam_conv1d_bias_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_26n
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:2
Identity_27?
AssignVariableOp_27AssignVariableOp*assignvariableop_27_adam_conv1d_1_kernel_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_27n
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:2
Identity_28?
AssignVariableOp_28AssignVariableOp(assignvariableop_28_adam_conv1d_1_bias_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_28n
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:2
Identity_29?
AssignVariableOp_29AssignVariableOp*assignvariableop_29_adam_conv1d_2_kernel_mIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_29n
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:2
Identity_30?
AssignVariableOp_30AssignVariableOp(assignvariableop_30_adam_conv1d_2_bias_mIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_30n
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:2
Identity_31?
AssignVariableOp_31AssignVariableOp*assignvariableop_31_adam_conv1d_3_kernel_mIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_31n
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:2
Identity_32?
AssignVariableOp_32AssignVariableOp(assignvariableop_32_adam_conv1d_3_bias_mIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_32n
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:2
Identity_33?
AssignVariableOp_33AssignVariableOp*assignvariableop_33_adam_conv1d_4_kernel_mIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_33n
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:2
Identity_34?
AssignVariableOp_34AssignVariableOp(assignvariableop_34_adam_conv1d_4_bias_mIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_34n
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:2
Identity_35?
AssignVariableOp_35AssignVariableOp*assignvariableop_35_adam_conv1d_5_kernel_mIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_35n
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:2
Identity_36?
AssignVariableOp_36AssignVariableOp(assignvariableop_36_adam_conv1d_5_bias_mIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_36n
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:2
Identity_37?
AssignVariableOp_37AssignVariableOp'assignvariableop_37_adam_dense_kernel_mIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_37n
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:2
Identity_38?
AssignVariableOp_38AssignVariableOp%assignvariableop_38_adam_dense_bias_mIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_38n
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:2
Identity_39?
AssignVariableOp_39AssignVariableOp*assignvariableop_39_adam_conv1d_6_kernel_mIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_39n
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:2
Identity_40?
AssignVariableOp_40AssignVariableOp(assignvariableop_40_adam_conv1d_6_bias_mIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_40n
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:2
Identity_41?
AssignVariableOp_41AssignVariableOp(assignvariableop_41_adam_conv1d_kernel_vIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_41n
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:2
Identity_42?
AssignVariableOp_42AssignVariableOp&assignvariableop_42_adam_conv1d_bias_vIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_42n
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:2
Identity_43?
AssignVariableOp_43AssignVariableOp*assignvariableop_43_adam_conv1d_1_kernel_vIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_43n
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:2
Identity_44?
AssignVariableOp_44AssignVariableOp(assignvariableop_44_adam_conv1d_1_bias_vIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_44n
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:2
Identity_45?
AssignVariableOp_45AssignVariableOp*assignvariableop_45_adam_conv1d_2_kernel_vIdentity_45:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_45n
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:2
Identity_46?
AssignVariableOp_46AssignVariableOp(assignvariableop_46_adam_conv1d_2_bias_vIdentity_46:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_46n
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:2
Identity_47?
AssignVariableOp_47AssignVariableOp*assignvariableop_47_adam_conv1d_3_kernel_vIdentity_47:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_47n
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:2
Identity_48?
AssignVariableOp_48AssignVariableOp(assignvariableop_48_adam_conv1d_3_bias_vIdentity_48:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_48n
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:2
Identity_49?
AssignVariableOp_49AssignVariableOp*assignvariableop_49_adam_conv1d_4_kernel_vIdentity_49:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_49n
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:2
Identity_50?
AssignVariableOp_50AssignVariableOp(assignvariableop_50_adam_conv1d_4_bias_vIdentity_50:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_50n
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:2
Identity_51?
AssignVariableOp_51AssignVariableOp*assignvariableop_51_adam_conv1d_5_kernel_vIdentity_51:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_51n
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:2
Identity_52?
AssignVariableOp_52AssignVariableOp(assignvariableop_52_adam_conv1d_5_bias_vIdentity_52:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_52n
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:2
Identity_53?
AssignVariableOp_53AssignVariableOp'assignvariableop_53_adam_dense_kernel_vIdentity_53:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_53n
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0*
_output_shapes
:2
Identity_54?
AssignVariableOp_54AssignVariableOp%assignvariableop_54_adam_dense_bias_vIdentity_54:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_54n
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:2
Identity_55?
AssignVariableOp_55AssignVariableOp*assignvariableop_55_adam_conv1d_6_kernel_vIdentity_55:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_55n
Identity_56IdentityRestoreV2:tensors:56"/device:CPU:0*
T0*
_output_shapes
:2
Identity_56?
AssignVariableOp_56AssignVariableOp(assignvariableop_56_adam_conv1d_6_bias_vIdentity_56:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_569
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp?

Identity_57Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_57?

Identity_58IdentityIdentity_57:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
T0*
_output_shapes
: 2
Identity_58"#
identity_58Identity_58:output:0*?
_input_shapesv
t: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_5AssignVariableOp_52*
AssignVariableOp_50AssignVariableOp_502*
AssignVariableOp_51AssignVariableOp_512*
AssignVariableOp_52AssignVariableOp_522*
AssignVariableOp_53AssignVariableOp_532*
AssignVariableOp_54AssignVariableOp_542*
AssignVariableOp_55AssignVariableOp_552*
AssignVariableOp_56AssignVariableOp_562(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
?r
?
D__inference_conv1d_2_layer_call_and_return_conditional_losses_147606

inputsA
+conv1d_expanddims_1_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Padv
conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/dilation_rateX
conv1d/ShapeShapePad:output:0*
T0*
_output_shapes
:2
conv1d/Shape?
conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack?
conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_1?
conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
conv1d/strided_slice/stack_2?
conv1d/strided_sliceStridedSliceconv1d/Shape:output:0#conv1d/strided_slice/stack:output:0%conv1d/strided_slice/stack_1:output:0%conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d/strided_sliceq
conv1d/stackPackconv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d/stack?
5conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        27
5conv1d/required_space_to_batch_paddings/base_paddings?
;conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2=
;conv1d/required_space_to_batch_paddings/strided_slice/stack?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2?
=conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
5conv1d/required_space_to_batch_paddings/strided_sliceStridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Dconv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Fconv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask27
5conv1d/required_space_to_batch_paddings/strided_slice?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2?
=conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2A
?conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_1StridedSlice>conv1d/required_space_to_batch_paddings/base_paddings:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_1?
+conv1d/required_space_to_batch_paddings/addAddV2conv1d/stack:output:0>conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/add?
-conv1d/required_space_to_batch_paddings/add_1AddV2/conv1d/required_space_to_batch_paddings/add:z:0@conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_1?
+conv1d/required_space_to_batch_paddings/modFloorMod1conv1d/required_space_to_batch_paddings/add_1:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/mod?
+conv1d/required_space_to_batch_paddings/subSubconv1d/dilation_rate:output:0/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2-
+conv1d/required_space_to_batch_paddings/sub?
-conv1d/required_space_to_batch_paddings/mod_1FloorMod/conv1d/required_space_to_batch_paddings/sub:z:0conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/mod_1?
-conv1d/required_space_to_batch_paddings/add_2AddV2@conv1d/required_space_to_batch_paddings/strided_slice_1:output:01conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2/
-conv1d/required_space_to_batch_paddings/add_2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_2StridedSlice>conv1d/required_space_to_batch_paddings/strided_slice:output:0Fconv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice1conv1d/required_space_to_batch_paddings/add_2:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_3?
2conv1d/required_space_to_batch_paddings/paddings/0Pack@conv1d/required_space_to_batch_paddings/strided_slice_2:output:0@conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:24
2conv1d/required_space_to_batch_paddings/paddings/0?
0conv1d/required_space_to_batch_paddings/paddingsPack;conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:22
0conv1d/required_space_to_batch_paddings/paddings?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2?
=conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2A
?conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
7conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice1conv1d/required_space_to_batch_paddings/mod_1:z:0Fconv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Hconv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask29
7conv1d/required_space_to_batch_paddings/strided_slice_4?
1conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 23
1conv1d/required_space_to_batch_paddings/crops/0/0?
/conv1d/required_space_to_batch_paddings/crops/0Pack:conv1d/required_space_to_batch_paddings/crops/0/0:output:0@conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:21
/conv1d/required_space_to_batch_paddings/crops/0?
-conv1d/required_space_to_batch_paddings/cropsPack8conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2/
-conv1d/required_space_to_batch_paddings/crops?
conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_1/stack?
conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_1?
conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_1/stack_2?
conv1d/strided_slice_1StridedSlice9conv1d/required_space_to_batch_paddings/paddings:output:0%conv1d/strided_slice_1/stack:output:0'conv1d/strided_slice_1/stack_1:output:0'conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_1v
conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat/concat_dim?
conv1d/concat/concatIdentityconv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d/concat/concat?
conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d/strided_slice_2/stack?
conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_1?
conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2 
conv1d/strided_slice_2/stack_2?
conv1d/strided_slice_2StridedSlice6conv1d/required_space_to_batch_paddings/crops:output:0%conv1d/strided_slice_2/stack:output:0'conv1d/strided_slice_2/stack_1:output:0'conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2
conv1d/strided_slice_2z
conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/concat_1/concat_dim?
conv1d/concat_1/concatIdentityconv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2
conv1d/concat_1/concat?
!conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/SpaceToBatchND/block_shape?
conv1d/SpaceToBatchNDSpaceToBatchNDPad:output:0*conv1d/SpaceToBatchND/block_shape:output:0conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/SpaceToBatchNDy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsconv1d/SpaceToBatchND:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
!conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2#
!conv1d/BatchToSpaceND/block_shape?
conv1d/BatchToSpaceNDBatchToSpaceNDconv1d/Squeeze:output:0*conv1d/BatchToSpaceND/block_shape:output:0conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BatchToSpaceND?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/BatchToSpaceND:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
??
?
F__inference_sequential_layer_call_and_return_conditional_losses_149187

inputsH
2conv1d_conv1d_expanddims_1_readvariableop_resource: 4
&conv1d_biasadd_readvariableop_resource: J
4conv1d_1_conv1d_expanddims_1_readvariableop_resource:  6
(conv1d_1_biasadd_readvariableop_resource: J
4conv1d_2_conv1d_expanddims_1_readvariableop_resource:  6
(conv1d_2_biasadd_readvariableop_resource: J
4conv1d_3_conv1d_expanddims_1_readvariableop_resource:  6
(conv1d_3_biasadd_readvariableop_resource: J
4conv1d_4_conv1d_expanddims_1_readvariableop_resource:  6
(conv1d_4_biasadd_readvariableop_resource: J
4conv1d_5_conv1d_expanddims_1_readvariableop_resource:  6
(conv1d_5_biasadd_readvariableop_resource: 9
'dense_tensordot_readvariableop_resource: 3
%dense_biasadd_readvariableop_resource:J
4conv1d_6_conv1d_expanddims_1_readvariableop_resource:6
(conv1d_6_biasadd_readvariableop_resource:
identity??conv1d/BiasAdd/ReadVariableOp?)conv1d/conv1d/ExpandDims_1/ReadVariableOp?conv1d_1/BiasAdd/ReadVariableOp?+conv1d_1/conv1d/ExpandDims_1/ReadVariableOp?conv1d_2/BiasAdd/ReadVariableOp?+conv1d_2/conv1d/ExpandDims_1/ReadVariableOp?conv1d_3/BiasAdd/ReadVariableOp?+conv1d_3/conv1d/ExpandDims_1/ReadVariableOp?conv1d_4/BiasAdd/ReadVariableOp?+conv1d_4/conv1d/ExpandDims_1/ReadVariableOp?conv1d_5/BiasAdd/ReadVariableOp?+conv1d_5/conv1d/ExpandDims_1/ReadVariableOp?conv1d_6/BiasAdd/ReadVariableOp?+conv1d_6/conv1d/ExpandDims_1/ReadVariableOp?dense/BiasAdd/ReadVariableOp?dense/Tensordot/ReadVariableOp?
conv1d/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
conv1d/Pad/paddings?

conv1d/PadPadinputsconv1d/Pad/paddings:output:0*
T0*4
_output_shapes"
 :??????????????????2

conv1d/Pad?
conv1d/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/conv1d/ExpandDims/dim?
conv1d/conv1d/ExpandDims
ExpandDimsconv1d/Pad:output:0%conv1d/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????2
conv1d/conv1d/ExpandDims?
)conv1d/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp2conv1d_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
: *
dtype02+
)conv1d/conv1d/ExpandDims_1/ReadVariableOp?
conv1d/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2 
conv1d/conv1d/ExpandDims_1/dim?
conv1d/conv1d/ExpandDims_1
ExpandDims1conv1d/conv1d/ExpandDims_1/ReadVariableOp:value:0'conv1d/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
: 2
conv1d/conv1d/ExpandDims_1?
conv1d/conv1dConv2D!conv1d/conv1d/ExpandDims:output:0#conv1d/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d/conv1d?
conv1d/conv1d/SqueezeSqueezeconv1d/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/conv1d/Squeeze?
conv1d/BiasAdd/ReadVariableOpReadVariableOp&conv1d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02
conv1d/BiasAdd/ReadVariableOp?
conv1d/BiasAddBiasAddconv1d/conv1d/Squeeze:output:0%conv1d/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/BiasAddz
conv1d/ReluReluconv1d/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d/Relu?
conv1d_1/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
conv1d_1/Pad/paddings?
conv1d_1/PadPadconv1d/Relu:activations:0conv1d_1/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_1/Pad?
conv1d_1/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d_1/conv1d/dilation_rates
conv1d_1/conv1d/ShapeShapeconv1d_1/Pad:output:0*
T0*
_output_shapes
:2
conv1d_1/conv1d/Shape?
#conv1d_1/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2%
#conv1d_1/conv1d/strided_slice/stack?
%conv1d_1/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_1/conv1d/strided_slice/stack_1?
%conv1d_1/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_1/conv1d/strided_slice/stack_2?
conv1d_1/conv1d/strided_sliceStridedSliceconv1d_1/conv1d/Shape:output:0,conv1d_1/conv1d/strided_slice/stack:output:0.conv1d_1/conv1d/strided_slice/stack_1:output:0.conv1d_1/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d_1/conv1d/strided_slice?
conv1d_1/conv1d/stackPack&conv1d_1/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d_1/conv1d/stack?
>conv1d_1/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2@
>conv1d_1/conv1d/required_space_to_batch_paddings/base_paddings?
Dconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2F
Dconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
>conv1d_1/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceGconv1d_1/conv1d/required_space_to_batch_paddings/base_paddings:output:0Mconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2@
>conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceGconv1d_1/conv1d/required_space_to_batch_paddings/base_paddings:output:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2B
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1?
4conv1d_1/conv1d/required_space_to_batch_paddings/addAddV2conv1d_1/conv1d/stack:output:0Gconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:26
4conv1d_1/conv1d/required_space_to_batch_paddings/add?
6conv1d_1/conv1d/required_space_to_batch_paddings/add_1AddV28conv1d_1/conv1d/required_space_to_batch_paddings/add:z:0Iconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:28
6conv1d_1/conv1d/required_space_to_batch_paddings/add_1?
4conv1d_1/conv1d/required_space_to_batch_paddings/modFloorMod:conv1d_1/conv1d/required_space_to_batch_paddings/add_1:z:0&conv1d_1/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:26
4conv1d_1/conv1d/required_space_to_batch_paddings/mod?
4conv1d_1/conv1d/required_space_to_batch_paddings/subSub&conv1d_1/conv1d/dilation_rate:output:08conv1d_1/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:26
4conv1d_1/conv1d/required_space_to_batch_paddings/sub?
6conv1d_1/conv1d/required_space_to_batch_paddings/mod_1FloorMod8conv1d_1/conv1d/required_space_to_batch_paddings/sub:z:0&conv1d_1/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:28
6conv1d_1/conv1d/required_space_to_batch_paddings/mod_1?
6conv1d_1/conv1d/required_space_to_batch_paddings/add_2AddV2Iconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0:conv1d_1/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:28
6conv1d_1/conv1d/required_space_to_batch_paddings/add_2?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceGconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice:output:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice:conv1d_1/conv1d/required_space_to_batch_paddings/add_2:z:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3?
;conv1d_1/conv1d/required_space_to_batch_paddings/paddings/0PackIconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Iconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2=
;conv1d_1/conv1d/required_space_to_batch_paddings/paddings/0?
9conv1d_1/conv1d/required_space_to_batch_paddings/paddingsPackDconv1d_1/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2;
9conv1d_1/conv1d/required_space_to_batch_paddings/paddings?
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice:conv1d_1/conv1d/required_space_to_batch_paddings/mod_1:z:0Oconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Qconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4?
:conv1d_1/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2<
:conv1d_1/conv1d/required_space_to_batch_paddings/crops/0/0?
8conv1d_1/conv1d/required_space_to_batch_paddings/crops/0PackCconv1d_1/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Iconv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2:
8conv1d_1/conv1d/required_space_to_batch_paddings/crops/0?
6conv1d_1/conv1d/required_space_to_batch_paddings/cropsPackAconv1d_1/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:28
6conv1d_1/conv1d/required_space_to_batch_paddings/crops?
%conv1d_1/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_1/conv1d/strided_slice_1/stack?
'conv1d_1/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_1/conv1d/strided_slice_1/stack_1?
'conv1d_1/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_1/conv1d/strided_slice_1/stack_2?
conv1d_1/conv1d/strided_slice_1StridedSliceBconv1d_1/conv1d/required_space_to_batch_paddings/paddings:output:0.conv1d_1/conv1d/strided_slice_1/stack:output:00conv1d_1/conv1d/strided_slice_1/stack_1:output:00conv1d_1/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_1/conv1d/strided_slice_1?
!conv1d_1/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2#
!conv1d_1/conv1d/concat/concat_dim?
conv1d_1/conv1d/concat/concatIdentity(conv1d_1/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d_1/conv1d/concat/concat?
%conv1d_1/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_1/conv1d/strided_slice_2/stack?
'conv1d_1/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_1/conv1d/strided_slice_2/stack_1?
'conv1d_1/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_1/conv1d/strided_slice_2/stack_2?
conv1d_1/conv1d/strided_slice_2StridedSlice?conv1d_1/conv1d/required_space_to_batch_paddings/crops:output:0.conv1d_1/conv1d/strided_slice_2/stack:output:00conv1d_1/conv1d/strided_slice_2/stack_1:output:00conv1d_1/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_1/conv1d/strided_slice_2?
#conv1d_1/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2%
#conv1d_1/conv1d/concat_1/concat_dim?
conv1d_1/conv1d/concat_1/concatIdentity(conv1d_1/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2!
conv1d_1/conv1d/concat_1/concat?
*conv1d_1/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_1/conv1d/SpaceToBatchND/block_shape?
conv1d_1/conv1d/SpaceToBatchNDSpaceToBatchNDconv1d_1/Pad:output:03conv1d_1/conv1d/SpaceToBatchND/block_shape:output:0&conv1d_1/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_1/conv1d/SpaceToBatchND?
conv1d_1/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_1/conv1d/ExpandDims/dim?
conv1d_1/conv1d/ExpandDims
ExpandDims'conv1d_1/conv1d/SpaceToBatchND:output:0'conv1d_1/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d_1/conv1d/ExpandDims?
+conv1d_1/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_1_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02-
+conv1d_1/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_1/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_1/conv1d/ExpandDims_1/dim?
conv1d_1/conv1d/ExpandDims_1
ExpandDims3conv1d_1/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_1/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d_1/conv1d/ExpandDims_1?
conv1d_1/conv1dConv2D#conv1d_1/conv1d/ExpandDims:output:0%conv1d_1/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d_1/conv1d?
conv1d_1/conv1d/SqueezeSqueezeconv1d_1/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d_1/conv1d/Squeeze?
*conv1d_1/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_1/conv1d/BatchToSpaceND/block_shape?
conv1d_1/conv1d/BatchToSpaceNDBatchToSpaceND conv1d_1/conv1d/Squeeze:output:03conv1d_1/conv1d/BatchToSpaceND/block_shape:output:0(conv1d_1/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_1/conv1d/BatchToSpaceND?
conv1d_1/BiasAdd/ReadVariableOpReadVariableOp(conv1d_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
conv1d_1/BiasAdd/ReadVariableOp?
conv1d_1/BiasAddBiasAdd'conv1d_1/conv1d/BatchToSpaceND:output:0'conv1d_1/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_1/BiasAdd?
conv1d_1/ReluReluconv1d_1/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_1/Relu?
conv1d_2/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
conv1d_2/Pad/paddings?
conv1d_2/PadPadconv1d_1/Relu:activations:0conv1d_2/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_2/Pad?
conv1d_2/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d_2/conv1d/dilation_rates
conv1d_2/conv1d/ShapeShapeconv1d_2/Pad:output:0*
T0*
_output_shapes
:2
conv1d_2/conv1d/Shape?
#conv1d_2/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2%
#conv1d_2/conv1d/strided_slice/stack?
%conv1d_2/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_2/conv1d/strided_slice/stack_1?
%conv1d_2/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_2/conv1d/strided_slice/stack_2?
conv1d_2/conv1d/strided_sliceStridedSliceconv1d_2/conv1d/Shape:output:0,conv1d_2/conv1d/strided_slice/stack:output:0.conv1d_2/conv1d/strided_slice/stack_1:output:0.conv1d_2/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d_2/conv1d/strided_slice?
conv1d_2/conv1d/stackPack&conv1d_2/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d_2/conv1d/stack?
>conv1d_2/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2@
>conv1d_2/conv1d/required_space_to_batch_paddings/base_paddings?
Dconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2F
Dconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
>conv1d_2/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceGconv1d_2/conv1d/required_space_to_batch_paddings/base_paddings:output:0Mconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2@
>conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceGconv1d_2/conv1d/required_space_to_batch_paddings/base_paddings:output:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2B
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1?
4conv1d_2/conv1d/required_space_to_batch_paddings/addAddV2conv1d_2/conv1d/stack:output:0Gconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:26
4conv1d_2/conv1d/required_space_to_batch_paddings/add?
6conv1d_2/conv1d/required_space_to_batch_paddings/add_1AddV28conv1d_2/conv1d/required_space_to_batch_paddings/add:z:0Iconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:28
6conv1d_2/conv1d/required_space_to_batch_paddings/add_1?
4conv1d_2/conv1d/required_space_to_batch_paddings/modFloorMod:conv1d_2/conv1d/required_space_to_batch_paddings/add_1:z:0&conv1d_2/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:26
4conv1d_2/conv1d/required_space_to_batch_paddings/mod?
4conv1d_2/conv1d/required_space_to_batch_paddings/subSub&conv1d_2/conv1d/dilation_rate:output:08conv1d_2/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:26
4conv1d_2/conv1d/required_space_to_batch_paddings/sub?
6conv1d_2/conv1d/required_space_to_batch_paddings/mod_1FloorMod8conv1d_2/conv1d/required_space_to_batch_paddings/sub:z:0&conv1d_2/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:28
6conv1d_2/conv1d/required_space_to_batch_paddings/mod_1?
6conv1d_2/conv1d/required_space_to_batch_paddings/add_2AddV2Iconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0:conv1d_2/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:28
6conv1d_2/conv1d/required_space_to_batch_paddings/add_2?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceGconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice:output:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice:conv1d_2/conv1d/required_space_to_batch_paddings/add_2:z:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3?
;conv1d_2/conv1d/required_space_to_batch_paddings/paddings/0PackIconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Iconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2=
;conv1d_2/conv1d/required_space_to_batch_paddings/paddings/0?
9conv1d_2/conv1d/required_space_to_batch_paddings/paddingsPackDconv1d_2/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2;
9conv1d_2/conv1d/required_space_to_batch_paddings/paddings?
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice:conv1d_2/conv1d/required_space_to_batch_paddings/mod_1:z:0Oconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Qconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4?
:conv1d_2/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2<
:conv1d_2/conv1d/required_space_to_batch_paddings/crops/0/0?
8conv1d_2/conv1d/required_space_to_batch_paddings/crops/0PackCconv1d_2/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Iconv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2:
8conv1d_2/conv1d/required_space_to_batch_paddings/crops/0?
6conv1d_2/conv1d/required_space_to_batch_paddings/cropsPackAconv1d_2/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:28
6conv1d_2/conv1d/required_space_to_batch_paddings/crops?
%conv1d_2/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_2/conv1d/strided_slice_1/stack?
'conv1d_2/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_2/conv1d/strided_slice_1/stack_1?
'conv1d_2/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_2/conv1d/strided_slice_1/stack_2?
conv1d_2/conv1d/strided_slice_1StridedSliceBconv1d_2/conv1d/required_space_to_batch_paddings/paddings:output:0.conv1d_2/conv1d/strided_slice_1/stack:output:00conv1d_2/conv1d/strided_slice_1/stack_1:output:00conv1d_2/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_2/conv1d/strided_slice_1?
!conv1d_2/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2#
!conv1d_2/conv1d/concat/concat_dim?
conv1d_2/conv1d/concat/concatIdentity(conv1d_2/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d_2/conv1d/concat/concat?
%conv1d_2/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_2/conv1d/strided_slice_2/stack?
'conv1d_2/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_2/conv1d/strided_slice_2/stack_1?
'conv1d_2/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_2/conv1d/strided_slice_2/stack_2?
conv1d_2/conv1d/strided_slice_2StridedSlice?conv1d_2/conv1d/required_space_to_batch_paddings/crops:output:0.conv1d_2/conv1d/strided_slice_2/stack:output:00conv1d_2/conv1d/strided_slice_2/stack_1:output:00conv1d_2/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_2/conv1d/strided_slice_2?
#conv1d_2/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2%
#conv1d_2/conv1d/concat_1/concat_dim?
conv1d_2/conv1d/concat_1/concatIdentity(conv1d_2/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2!
conv1d_2/conv1d/concat_1/concat?
*conv1d_2/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_2/conv1d/SpaceToBatchND/block_shape?
conv1d_2/conv1d/SpaceToBatchNDSpaceToBatchNDconv1d_2/Pad:output:03conv1d_2/conv1d/SpaceToBatchND/block_shape:output:0&conv1d_2/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_2/conv1d/SpaceToBatchND?
conv1d_2/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_2/conv1d/ExpandDims/dim?
conv1d_2/conv1d/ExpandDims
ExpandDims'conv1d_2/conv1d/SpaceToBatchND:output:0'conv1d_2/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d_2/conv1d/ExpandDims?
+conv1d_2/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_2_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02-
+conv1d_2/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_2/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_2/conv1d/ExpandDims_1/dim?
conv1d_2/conv1d/ExpandDims_1
ExpandDims3conv1d_2/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_2/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d_2/conv1d/ExpandDims_1?
conv1d_2/conv1dConv2D#conv1d_2/conv1d/ExpandDims:output:0%conv1d_2/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d_2/conv1d?
conv1d_2/conv1d/SqueezeSqueezeconv1d_2/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d_2/conv1d/Squeeze?
*conv1d_2/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_2/conv1d/BatchToSpaceND/block_shape?
conv1d_2/conv1d/BatchToSpaceNDBatchToSpaceND conv1d_2/conv1d/Squeeze:output:03conv1d_2/conv1d/BatchToSpaceND/block_shape:output:0(conv1d_2/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_2/conv1d/BatchToSpaceND?
conv1d_2/BiasAdd/ReadVariableOpReadVariableOp(conv1d_2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
conv1d_2/BiasAdd/ReadVariableOp?
conv1d_2/BiasAddBiasAdd'conv1d_2/conv1d/BatchToSpaceND:output:0'conv1d_2/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_2/BiasAdd?
conv1d_2/ReluReluconv1d_2/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_2/Relu?
conv1d_3/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
conv1d_3/Pad/paddings?
conv1d_3/PadPadconv1d_2/Relu:activations:0conv1d_3/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_3/Pad?
conv1d_3/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d_3/conv1d/dilation_rates
conv1d_3/conv1d/ShapeShapeconv1d_3/Pad:output:0*
T0*
_output_shapes
:2
conv1d_3/conv1d/Shape?
#conv1d_3/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2%
#conv1d_3/conv1d/strided_slice/stack?
%conv1d_3/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_3/conv1d/strided_slice/stack_1?
%conv1d_3/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_3/conv1d/strided_slice/stack_2?
conv1d_3/conv1d/strided_sliceStridedSliceconv1d_3/conv1d/Shape:output:0,conv1d_3/conv1d/strided_slice/stack:output:0.conv1d_3/conv1d/strided_slice/stack_1:output:0.conv1d_3/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d_3/conv1d/strided_slice?
conv1d_3/conv1d/stackPack&conv1d_3/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d_3/conv1d/stack?
>conv1d_3/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2@
>conv1d_3/conv1d/required_space_to_batch_paddings/base_paddings?
Dconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2F
Dconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
>conv1d_3/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceGconv1d_3/conv1d/required_space_to_batch_paddings/base_paddings:output:0Mconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2@
>conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceGconv1d_3/conv1d/required_space_to_batch_paddings/base_paddings:output:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2B
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1?
4conv1d_3/conv1d/required_space_to_batch_paddings/addAddV2conv1d_3/conv1d/stack:output:0Gconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:26
4conv1d_3/conv1d/required_space_to_batch_paddings/add?
6conv1d_3/conv1d/required_space_to_batch_paddings/add_1AddV28conv1d_3/conv1d/required_space_to_batch_paddings/add:z:0Iconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:28
6conv1d_3/conv1d/required_space_to_batch_paddings/add_1?
4conv1d_3/conv1d/required_space_to_batch_paddings/modFloorMod:conv1d_3/conv1d/required_space_to_batch_paddings/add_1:z:0&conv1d_3/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:26
4conv1d_3/conv1d/required_space_to_batch_paddings/mod?
4conv1d_3/conv1d/required_space_to_batch_paddings/subSub&conv1d_3/conv1d/dilation_rate:output:08conv1d_3/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:26
4conv1d_3/conv1d/required_space_to_batch_paddings/sub?
6conv1d_3/conv1d/required_space_to_batch_paddings/mod_1FloorMod8conv1d_3/conv1d/required_space_to_batch_paddings/sub:z:0&conv1d_3/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:28
6conv1d_3/conv1d/required_space_to_batch_paddings/mod_1?
6conv1d_3/conv1d/required_space_to_batch_paddings/add_2AddV2Iconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0:conv1d_3/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:28
6conv1d_3/conv1d/required_space_to_batch_paddings/add_2?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceGconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice:output:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice:conv1d_3/conv1d/required_space_to_batch_paddings/add_2:z:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3?
;conv1d_3/conv1d/required_space_to_batch_paddings/paddings/0PackIconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Iconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2=
;conv1d_3/conv1d/required_space_to_batch_paddings/paddings/0?
9conv1d_3/conv1d/required_space_to_batch_paddings/paddingsPackDconv1d_3/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2;
9conv1d_3/conv1d/required_space_to_batch_paddings/paddings?
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice:conv1d_3/conv1d/required_space_to_batch_paddings/mod_1:z:0Oconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Qconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4?
:conv1d_3/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2<
:conv1d_3/conv1d/required_space_to_batch_paddings/crops/0/0?
8conv1d_3/conv1d/required_space_to_batch_paddings/crops/0PackCconv1d_3/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Iconv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2:
8conv1d_3/conv1d/required_space_to_batch_paddings/crops/0?
6conv1d_3/conv1d/required_space_to_batch_paddings/cropsPackAconv1d_3/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:28
6conv1d_3/conv1d/required_space_to_batch_paddings/crops?
%conv1d_3/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_3/conv1d/strided_slice_1/stack?
'conv1d_3/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_3/conv1d/strided_slice_1/stack_1?
'conv1d_3/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_3/conv1d/strided_slice_1/stack_2?
conv1d_3/conv1d/strided_slice_1StridedSliceBconv1d_3/conv1d/required_space_to_batch_paddings/paddings:output:0.conv1d_3/conv1d/strided_slice_1/stack:output:00conv1d_3/conv1d/strided_slice_1/stack_1:output:00conv1d_3/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_3/conv1d/strided_slice_1?
!conv1d_3/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2#
!conv1d_3/conv1d/concat/concat_dim?
conv1d_3/conv1d/concat/concatIdentity(conv1d_3/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d_3/conv1d/concat/concat?
%conv1d_3/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_3/conv1d/strided_slice_2/stack?
'conv1d_3/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_3/conv1d/strided_slice_2/stack_1?
'conv1d_3/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_3/conv1d/strided_slice_2/stack_2?
conv1d_3/conv1d/strided_slice_2StridedSlice?conv1d_3/conv1d/required_space_to_batch_paddings/crops:output:0.conv1d_3/conv1d/strided_slice_2/stack:output:00conv1d_3/conv1d/strided_slice_2/stack_1:output:00conv1d_3/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_3/conv1d/strided_slice_2?
#conv1d_3/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2%
#conv1d_3/conv1d/concat_1/concat_dim?
conv1d_3/conv1d/concat_1/concatIdentity(conv1d_3/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2!
conv1d_3/conv1d/concat_1/concat?
*conv1d_3/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_3/conv1d/SpaceToBatchND/block_shape?
conv1d_3/conv1d/SpaceToBatchNDSpaceToBatchNDconv1d_3/Pad:output:03conv1d_3/conv1d/SpaceToBatchND/block_shape:output:0&conv1d_3/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_3/conv1d/SpaceToBatchND?
conv1d_3/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_3/conv1d/ExpandDims/dim?
conv1d_3/conv1d/ExpandDims
ExpandDims'conv1d_3/conv1d/SpaceToBatchND:output:0'conv1d_3/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d_3/conv1d/ExpandDims?
+conv1d_3/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_3_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02-
+conv1d_3/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_3/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_3/conv1d/ExpandDims_1/dim?
conv1d_3/conv1d/ExpandDims_1
ExpandDims3conv1d_3/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_3/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d_3/conv1d/ExpandDims_1?
conv1d_3/conv1dConv2D#conv1d_3/conv1d/ExpandDims:output:0%conv1d_3/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d_3/conv1d?
conv1d_3/conv1d/SqueezeSqueezeconv1d_3/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d_3/conv1d/Squeeze?
*conv1d_3/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_3/conv1d/BatchToSpaceND/block_shape?
conv1d_3/conv1d/BatchToSpaceNDBatchToSpaceND conv1d_3/conv1d/Squeeze:output:03conv1d_3/conv1d/BatchToSpaceND/block_shape:output:0(conv1d_3/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_3/conv1d/BatchToSpaceND?
conv1d_3/BiasAdd/ReadVariableOpReadVariableOp(conv1d_3_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
conv1d_3/BiasAdd/ReadVariableOp?
conv1d_3/BiasAddBiasAdd'conv1d_3/conv1d/BatchToSpaceND:output:0'conv1d_3/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_3/BiasAdd?
conv1d_3/ReluReluconv1d_3/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_3/Relu?
conv1d_4/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
conv1d_4/Pad/paddings?
conv1d_4/PadPadconv1d_3/Relu:activations:0conv1d_4/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_4/Pad?
conv1d_4/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2
conv1d_4/conv1d/dilation_rates
conv1d_4/conv1d/ShapeShapeconv1d_4/Pad:output:0*
T0*
_output_shapes
:2
conv1d_4/conv1d/Shape?
#conv1d_4/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2%
#conv1d_4/conv1d/strided_slice/stack?
%conv1d_4/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_4/conv1d/strided_slice/stack_1?
%conv1d_4/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_4/conv1d/strided_slice/stack_2?
conv1d_4/conv1d/strided_sliceStridedSliceconv1d_4/conv1d/Shape:output:0,conv1d_4/conv1d/strided_slice/stack:output:0.conv1d_4/conv1d/strided_slice/stack_1:output:0.conv1d_4/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d_4/conv1d/strided_slice?
conv1d_4/conv1d/stackPack&conv1d_4/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d_4/conv1d/stack?
>conv1d_4/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2@
>conv1d_4/conv1d/required_space_to_batch_paddings/base_paddings?
Dconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2F
Dconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
>conv1d_4/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceGconv1d_4/conv1d/required_space_to_batch_paddings/base_paddings:output:0Mconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2@
>conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceGconv1d_4/conv1d/required_space_to_batch_paddings/base_paddings:output:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2B
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1?
4conv1d_4/conv1d/required_space_to_batch_paddings/addAddV2conv1d_4/conv1d/stack:output:0Gconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:26
4conv1d_4/conv1d/required_space_to_batch_paddings/add?
6conv1d_4/conv1d/required_space_to_batch_paddings/add_1AddV28conv1d_4/conv1d/required_space_to_batch_paddings/add:z:0Iconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:28
6conv1d_4/conv1d/required_space_to_batch_paddings/add_1?
4conv1d_4/conv1d/required_space_to_batch_paddings/modFloorMod:conv1d_4/conv1d/required_space_to_batch_paddings/add_1:z:0&conv1d_4/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:26
4conv1d_4/conv1d/required_space_to_batch_paddings/mod?
4conv1d_4/conv1d/required_space_to_batch_paddings/subSub&conv1d_4/conv1d/dilation_rate:output:08conv1d_4/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:26
4conv1d_4/conv1d/required_space_to_batch_paddings/sub?
6conv1d_4/conv1d/required_space_to_batch_paddings/mod_1FloorMod8conv1d_4/conv1d/required_space_to_batch_paddings/sub:z:0&conv1d_4/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:28
6conv1d_4/conv1d/required_space_to_batch_paddings/mod_1?
6conv1d_4/conv1d/required_space_to_batch_paddings/add_2AddV2Iconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0:conv1d_4/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:28
6conv1d_4/conv1d/required_space_to_batch_paddings/add_2?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceGconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice:output:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice:conv1d_4/conv1d/required_space_to_batch_paddings/add_2:z:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3?
;conv1d_4/conv1d/required_space_to_batch_paddings/paddings/0PackIconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Iconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2=
;conv1d_4/conv1d/required_space_to_batch_paddings/paddings/0?
9conv1d_4/conv1d/required_space_to_batch_paddings/paddingsPackDconv1d_4/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2;
9conv1d_4/conv1d/required_space_to_batch_paddings/paddings?
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice:conv1d_4/conv1d/required_space_to_batch_paddings/mod_1:z:0Oconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Qconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4?
:conv1d_4/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2<
:conv1d_4/conv1d/required_space_to_batch_paddings/crops/0/0?
8conv1d_4/conv1d/required_space_to_batch_paddings/crops/0PackCconv1d_4/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Iconv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2:
8conv1d_4/conv1d/required_space_to_batch_paddings/crops/0?
6conv1d_4/conv1d/required_space_to_batch_paddings/cropsPackAconv1d_4/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:28
6conv1d_4/conv1d/required_space_to_batch_paddings/crops?
%conv1d_4/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_4/conv1d/strided_slice_1/stack?
'conv1d_4/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_4/conv1d/strided_slice_1/stack_1?
'conv1d_4/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_4/conv1d/strided_slice_1/stack_2?
conv1d_4/conv1d/strided_slice_1StridedSliceBconv1d_4/conv1d/required_space_to_batch_paddings/paddings:output:0.conv1d_4/conv1d/strided_slice_1/stack:output:00conv1d_4/conv1d/strided_slice_1/stack_1:output:00conv1d_4/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_4/conv1d/strided_slice_1?
!conv1d_4/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2#
!conv1d_4/conv1d/concat/concat_dim?
conv1d_4/conv1d/concat/concatIdentity(conv1d_4/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d_4/conv1d/concat/concat?
%conv1d_4/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_4/conv1d/strided_slice_2/stack?
'conv1d_4/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_4/conv1d/strided_slice_2/stack_1?
'conv1d_4/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_4/conv1d/strided_slice_2/stack_2?
conv1d_4/conv1d/strided_slice_2StridedSlice?conv1d_4/conv1d/required_space_to_batch_paddings/crops:output:0.conv1d_4/conv1d/strided_slice_2/stack:output:00conv1d_4/conv1d/strided_slice_2/stack_1:output:00conv1d_4/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_4/conv1d/strided_slice_2?
#conv1d_4/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2%
#conv1d_4/conv1d/concat_1/concat_dim?
conv1d_4/conv1d/concat_1/concatIdentity(conv1d_4/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2!
conv1d_4/conv1d/concat_1/concat?
*conv1d_4/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_4/conv1d/SpaceToBatchND/block_shape?
conv1d_4/conv1d/SpaceToBatchNDSpaceToBatchNDconv1d_4/Pad:output:03conv1d_4/conv1d/SpaceToBatchND/block_shape:output:0&conv1d_4/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_4/conv1d/SpaceToBatchND?
conv1d_4/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_4/conv1d/ExpandDims/dim?
conv1d_4/conv1d/ExpandDims
ExpandDims'conv1d_4/conv1d/SpaceToBatchND:output:0'conv1d_4/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d_4/conv1d/ExpandDims?
+conv1d_4/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_4_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02-
+conv1d_4/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_4/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_4/conv1d/ExpandDims_1/dim?
conv1d_4/conv1d/ExpandDims_1
ExpandDims3conv1d_4/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_4/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d_4/conv1d/ExpandDims_1?
conv1d_4/conv1dConv2D#conv1d_4/conv1d/ExpandDims:output:0%conv1d_4/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d_4/conv1d?
conv1d_4/conv1d/SqueezeSqueezeconv1d_4/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d_4/conv1d/Squeeze?
*conv1d_4/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:2,
*conv1d_4/conv1d/BatchToSpaceND/block_shape?
conv1d_4/conv1d/BatchToSpaceNDBatchToSpaceND conv1d_4/conv1d/Squeeze:output:03conv1d_4/conv1d/BatchToSpaceND/block_shape:output:0(conv1d_4/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_4/conv1d/BatchToSpaceND?
conv1d_4/BiasAdd/ReadVariableOpReadVariableOp(conv1d_4_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
conv1d_4/BiasAdd/ReadVariableOp?
conv1d_4/BiasAddBiasAdd'conv1d_4/conv1d/BatchToSpaceND:output:0'conv1d_4/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_4/BiasAdd?
conv1d_4/ReluReluconv1d_4/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_4/Relu?
conv1d_5/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                        2
conv1d_5/Pad/paddings?
conv1d_5/PadPadconv1d_4/Relu:activations:0conv1d_5/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_5/Pad?
conv1d_5/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB: 2
conv1d_5/conv1d/dilation_rates
conv1d_5/conv1d/ShapeShapeconv1d_5/Pad:output:0*
T0*
_output_shapes
:2
conv1d_5/conv1d/Shape?
#conv1d_5/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2%
#conv1d_5/conv1d/strided_slice/stack?
%conv1d_5/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_5/conv1d/strided_slice/stack_1?
%conv1d_5/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2'
%conv1d_5/conv1d/strided_slice/stack_2?
conv1d_5/conv1d/strided_sliceStridedSliceconv1d_5/conv1d/Shape:output:0,conv1d_5/conv1d/strided_slice/stack:output:0.conv1d_5/conv1d/strided_slice/stack_1:output:0.conv1d_5/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
conv1d_5/conv1d/strided_slice?
conv1d_5/conv1d/stackPack&conv1d_5/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2
conv1d_5/conv1d/stack?
>conv1d_5/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2@
>conv1d_5/conv1d/required_space_to_batch_paddings/base_paddings?
Dconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2F
Dconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
>conv1d_5/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceGconv1d_5/conv1d/required_space_to_batch_paddings/base_paddings:output:0Mconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2@
>conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceGconv1d_5/conv1d/required_space_to_batch_paddings/base_paddings:output:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2B
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1?
4conv1d_5/conv1d/required_space_to_batch_paddings/addAddV2conv1d_5/conv1d/stack:output:0Gconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:26
4conv1d_5/conv1d/required_space_to_batch_paddings/add?
6conv1d_5/conv1d/required_space_to_batch_paddings/add_1AddV28conv1d_5/conv1d/required_space_to_batch_paddings/add:z:0Iconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:28
6conv1d_5/conv1d/required_space_to_batch_paddings/add_1?
4conv1d_5/conv1d/required_space_to_batch_paddings/modFloorMod:conv1d_5/conv1d/required_space_to_batch_paddings/add_1:z:0&conv1d_5/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:26
4conv1d_5/conv1d/required_space_to_batch_paddings/mod?
4conv1d_5/conv1d/required_space_to_batch_paddings/subSub&conv1d_5/conv1d/dilation_rate:output:08conv1d_5/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:26
4conv1d_5/conv1d/required_space_to_batch_paddings/sub?
6conv1d_5/conv1d/required_space_to_batch_paddings/mod_1FloorMod8conv1d_5/conv1d/required_space_to_batch_paddings/sub:z:0&conv1d_5/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:28
6conv1d_5/conv1d/required_space_to_batch_paddings/mod_1?
6conv1d_5/conv1d/required_space_to_batch_paddings/add_2AddV2Iconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0:conv1d_5/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:28
6conv1d_5/conv1d/required_space_to_batch_paddings/add_2?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceGconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice:output:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSlice:conv1d_5/conv1d/required_space_to_batch_paddings/add_2:z:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3?
;conv1d_5/conv1d/required_space_to_batch_paddings/paddings/0PackIconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Iconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2=
;conv1d_5/conv1d/required_space_to_batch_paddings/paddings/0?
9conv1d_5/conv1d/required_space_to_batch_paddings/paddingsPackDconv1d_5/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2;
9conv1d_5/conv1d/required_space_to_batch_paddings/paddings?
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2H
Fconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2J
Hconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSlice:conv1d_5/conv1d/required_space_to_batch_paddings/mod_1:z:0Oconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0Qconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2B
@conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4?
:conv1d_5/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2<
:conv1d_5/conv1d/required_space_to_batch_paddings/crops/0/0?
8conv1d_5/conv1d/required_space_to_batch_paddings/crops/0PackCconv1d_5/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Iconv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2:
8conv1d_5/conv1d/required_space_to_batch_paddings/crops/0?
6conv1d_5/conv1d/required_space_to_batch_paddings/cropsPackAconv1d_5/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:28
6conv1d_5/conv1d/required_space_to_batch_paddings/crops?
%conv1d_5/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_5/conv1d/strided_slice_1/stack?
'conv1d_5/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_5/conv1d/strided_slice_1/stack_1?
'conv1d_5/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_5/conv1d/strided_slice_1/stack_2?
conv1d_5/conv1d/strided_slice_1StridedSliceBconv1d_5/conv1d/required_space_to_batch_paddings/paddings:output:0.conv1d_5/conv1d/strided_slice_1/stack:output:00conv1d_5/conv1d/strided_slice_1/stack_1:output:00conv1d_5/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_5/conv1d/strided_slice_1?
!conv1d_5/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2#
!conv1d_5/conv1d/concat/concat_dim?
conv1d_5/conv1d/concat/concatIdentity(conv1d_5/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2
conv1d_5/conv1d/concat/concat?
%conv1d_5/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%conv1d_5/conv1d/strided_slice_2/stack?
'conv1d_5/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_5/conv1d/strided_slice_2/stack_1?
'conv1d_5/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'conv1d_5/conv1d/strided_slice_2/stack_2?
conv1d_5/conv1d/strided_slice_2StridedSlice?conv1d_5/conv1d/required_space_to_batch_paddings/crops:output:0.conv1d_5/conv1d/strided_slice_2/stack:output:00conv1d_5/conv1d/strided_slice_2/stack_1:output:00conv1d_5/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2!
conv1d_5/conv1d/strided_slice_2?
#conv1d_5/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2%
#conv1d_5/conv1d/concat_1/concat_dim?
conv1d_5/conv1d/concat_1/concatIdentity(conv1d_5/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2!
conv1d_5/conv1d/concat_1/concat?
*conv1d_5/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB: 2,
*conv1d_5/conv1d/SpaceToBatchND/block_shape?
conv1d_5/conv1d/SpaceToBatchNDSpaceToBatchNDconv1d_5/Pad:output:03conv1d_5/conv1d/SpaceToBatchND/block_shape:output:0&conv1d_5/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_5/conv1d/SpaceToBatchND?
conv1d_5/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_5/conv1d/ExpandDims/dim?
conv1d_5/conv1d/ExpandDims
ExpandDims'conv1d_5/conv1d/SpaceToBatchND:output:0'conv1d_5/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2
conv1d_5/conv1d/ExpandDims?
+conv1d_5/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_5_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype02-
+conv1d_5/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_5/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_5/conv1d/ExpandDims_1/dim?
conv1d_5/conv1d/ExpandDims_1
ExpandDims3conv1d_5/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_5/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2
conv1d_5/conv1d/ExpandDims_1?
conv1d_5/conv1dConv2D#conv1d_5/conv1d/ExpandDims:output:0%conv1d_5/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d_5/conv1d?
conv1d_5/conv1d/SqueezeSqueezeconv1d_5/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d_5/conv1d/Squeeze?
*conv1d_5/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB: 2,
*conv1d_5/conv1d/BatchToSpaceND/block_shape?
conv1d_5/conv1d/BatchToSpaceNDBatchToSpaceND conv1d_5/conv1d/Squeeze:output:03conv1d_5/conv1d/BatchToSpaceND/block_shape:output:0(conv1d_5/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2 
conv1d_5/conv1d/BatchToSpaceND?
conv1d_5/BiasAdd/ReadVariableOpReadVariableOp(conv1d_5_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
conv1d_5/BiasAdd/ReadVariableOp?
conv1d_5/BiasAddBiasAdd'conv1d_5/conv1d/BatchToSpaceND:output:0'conv1d_5/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_5/BiasAdd?
conv1d_5/ReluReluconv1d_5/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
conv1d_5/Relu?
dense/Tensordot/ReadVariableOpReadVariableOp'dense_tensordot_readvariableop_resource*
_output_shapes

: *
dtype02 
dense/Tensordot/ReadVariableOpv
dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:2
dense/Tensordot/axes}
dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       2
dense/Tensordot/freey
dense/Tensordot/ShapeShapeconv1d_5/Relu:activations:0*
T0*
_output_shapes
:2
dense/Tensordot/Shape?
dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
dense/Tensordot/GatherV2/axis?
dense/Tensordot/GatherV2GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/free:output:0&dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
dense/Tensordot/GatherV2?
dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2!
dense/Tensordot/GatherV2_1/axis?
dense/Tensordot/GatherV2_1GatherV2dense/Tensordot/Shape:output:0dense/Tensordot/axes:output:0(dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2
dense/Tensordot/GatherV2_1x
dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
dense/Tensordot/Const?
dense/Tensordot/ProdProd!dense/Tensordot/GatherV2:output:0dense/Tensordot/Const:output:0*
T0*
_output_shapes
: 2
dense/Tensordot/Prod|
dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 2
dense/Tensordot/Const_1?
dense/Tensordot/Prod_1Prod#dense/Tensordot/GatherV2_1:output:0 dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: 2
dense/Tensordot/Prod_1|
dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
dense/Tensordot/concat/axis?
dense/Tensordot/concatConcatV2dense/Tensordot/free:output:0dense/Tensordot/axes:output:0$dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:2
dense/Tensordot/concat?
dense/Tensordot/stackPackdense/Tensordot/Prod:output:0dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:2
dense/Tensordot/stack?
dense/Tensordot/transpose	Transposeconv1d_5/Relu:activations:0dense/Tensordot/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
dense/Tensordot/transpose?
dense/Tensordot/ReshapeReshapedense/Tensordot/transpose:y:0dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:??????????????????2
dense/Tensordot/Reshape?
dense/Tensordot/MatMulMatMul dense/Tensordot/Reshape:output:0&dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
dense/Tensordot/MatMul|
dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:2
dense/Tensordot/Const_2?
dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2
dense/Tensordot/concat_1/axis?
dense/Tensordot/concat_1ConcatV2!dense/Tensordot/GatherV2:output:0 dense/Tensordot/Const_2:output:0&dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:2
dense/Tensordot/concat_1?
dense/TensordotReshape dense/Tensordot/MatMul:product:0!dense/Tensordot/concat_1:output:0*
T0*4
_output_shapes"
 :??????????????????2
dense/Tensordot?
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
dense/BiasAdd/ReadVariableOp?
dense/BiasAddBiasAdddense/Tensordot:output:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :??????????????????2
dense/BiasAddw

dense/ReluReludense/BiasAdd:output:0*
T0*4
_output_shapes"
 :??????????????????2

dense/Relu?
conv1d_6/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2 
conv1d_6/conv1d/ExpandDims/dim?
conv1d_6/conv1d/ExpandDims
ExpandDimsdense/Relu:activations:0'conv1d_6/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????2
conv1d_6/conv1d/ExpandDims?
+conv1d_6/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp4conv1d_6_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:*
dtype02-
+conv1d_6/conv1d/ExpandDims_1/ReadVariableOp?
 conv1d_6/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2"
 conv1d_6/conv1d/ExpandDims_1/dim?
conv1d_6/conv1d/ExpandDims_1
ExpandDims3conv1d_6/conv1d/ExpandDims_1/ReadVariableOp:value:0)conv1d_6/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:2
conv1d_6/conv1d/ExpandDims_1?
conv1d_6/conv1dConv2D#conv1d_6/conv1d/ExpandDims:output:0%conv1d_6/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"??????????????????*
paddingVALID*
strides
2
conv1d_6/conv1d?
conv1d_6/conv1d/SqueezeSqueezeconv1d_6/conv1d:output:0*
T0*4
_output_shapes"
 :??????????????????*
squeeze_dims

?????????2
conv1d_6/conv1d/Squeeze?
conv1d_6/BiasAdd/ReadVariableOpReadVariableOp(conv1d_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02!
conv1d_6/BiasAdd/ReadVariableOp?
conv1d_6/BiasAddBiasAdd conv1d_6/conv1d/Squeeze:output:0'conv1d_6/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :??????????????????2
conv1d_6/BiasAdd?
IdentityIdentityconv1d_6/BiasAdd:output:0^conv1d/BiasAdd/ReadVariableOp*^conv1d/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_1/BiasAdd/ReadVariableOp,^conv1d_1/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_2/BiasAdd/ReadVariableOp,^conv1d_2/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_3/BiasAdd/ReadVariableOp,^conv1d_3/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_4/BiasAdd/ReadVariableOp,^conv1d_4/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_5/BiasAdd/ReadVariableOp,^conv1d_5/conv1d/ExpandDims_1/ReadVariableOp ^conv1d_6/BiasAdd/ReadVariableOp,^conv1d_6/conv1d/ExpandDims_1/ReadVariableOp^dense/BiasAdd/ReadVariableOp^dense/Tensordot/ReadVariableOp*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 2>
conv1d/BiasAdd/ReadVariableOpconv1d/BiasAdd/ReadVariableOp2V
)conv1d/conv1d/ExpandDims_1/ReadVariableOp)conv1d/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_1/BiasAdd/ReadVariableOpconv1d_1/BiasAdd/ReadVariableOp2Z
+conv1d_1/conv1d/ExpandDims_1/ReadVariableOp+conv1d_1/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_2/BiasAdd/ReadVariableOpconv1d_2/BiasAdd/ReadVariableOp2Z
+conv1d_2/conv1d/ExpandDims_1/ReadVariableOp+conv1d_2/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_3/BiasAdd/ReadVariableOpconv1d_3/BiasAdd/ReadVariableOp2Z
+conv1d_3/conv1d/ExpandDims_1/ReadVariableOp+conv1d_3/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_4/BiasAdd/ReadVariableOpconv1d_4/BiasAdd/ReadVariableOp2Z
+conv1d_4/conv1d/ExpandDims_1/ReadVariableOp+conv1d_4/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_5/BiasAdd/ReadVariableOpconv1d_5/BiasAdd/ReadVariableOp2Z
+conv1d_5/conv1d/ExpandDims_1/ReadVariableOp+conv1d_5/conv1d/ExpandDims_1/ReadVariableOp2B
conv1d_6/BiasAdd/ReadVariableOpconv1d_6/BiasAdd/ReadVariableOp2Z
+conv1d_6/conv1d/ExpandDims_1/ReadVariableOp+conv1d_6/conv1d/ExpandDims_1/ReadVariableOp2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2@
dense/Tensordot/ReadVariableOpdense/Tensordot/ReadVariableOp:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
?
?
)__inference_conv1d_4_layer_call_fn_149469

inputs
unknown:  
	unknown_0: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_4_layer_call_and_return_conditional_losses_1477642
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?
?
)__inference_conv1d_6_layer_call_fn_149673

inputs
unknown:
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :??????????????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_6_layer_call_and_return_conditional_losses_1479012
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:??????????????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs
??
?
!__inference__wrapped_model_147423
input_1S
=sequential_conv1d_conv1d_expanddims_1_readvariableop_resource: ?
1sequential_conv1d_biasadd_readvariableop_resource: U
?sequential_conv1d_1_conv1d_expanddims_1_readvariableop_resource:  A
3sequential_conv1d_1_biasadd_readvariableop_resource: U
?sequential_conv1d_2_conv1d_expanddims_1_readvariableop_resource:  A
3sequential_conv1d_2_biasadd_readvariableop_resource: U
?sequential_conv1d_3_conv1d_expanddims_1_readvariableop_resource:  A
3sequential_conv1d_3_biasadd_readvariableop_resource: U
?sequential_conv1d_4_conv1d_expanddims_1_readvariableop_resource:  A
3sequential_conv1d_4_biasadd_readvariableop_resource: U
?sequential_conv1d_5_conv1d_expanddims_1_readvariableop_resource:  A
3sequential_conv1d_5_biasadd_readvariableop_resource: D
2sequential_dense_tensordot_readvariableop_resource: >
0sequential_dense_biasadd_readvariableop_resource:U
?sequential_conv1d_6_conv1d_expanddims_1_readvariableop_resource:A
3sequential_conv1d_6_biasadd_readvariableop_resource:
identity??(sequential/conv1d/BiasAdd/ReadVariableOp?4sequential/conv1d/conv1d/ExpandDims_1/ReadVariableOp?*sequential/conv1d_1/BiasAdd/ReadVariableOp?6sequential/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp?*sequential/conv1d_2/BiasAdd/ReadVariableOp?6sequential/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp?*sequential/conv1d_3/BiasAdd/ReadVariableOp?6sequential/conv1d_3/conv1d/ExpandDims_1/ReadVariableOp?*sequential/conv1d_4/BiasAdd/ReadVariableOp?6sequential/conv1d_4/conv1d/ExpandDims_1/ReadVariableOp?*sequential/conv1d_5/BiasAdd/ReadVariableOp?6sequential/conv1d_5/conv1d/ExpandDims_1/ReadVariableOp?*sequential/conv1d_6/BiasAdd/ReadVariableOp?6sequential/conv1d_6/conv1d/ExpandDims_1/ReadVariableOp?'sequential/dense/BiasAdd/ReadVariableOp?)sequential/dense/Tensordot/ReadVariableOp?
sequential/conv1d/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2 
sequential/conv1d/Pad/paddings?
sequential/conv1d/PadPadinput_1'sequential/conv1d/Pad/paddings:output:0*
T0*4
_output_shapes"
 :??????????????????2
sequential/conv1d/Pad?
'sequential/conv1d/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2)
'sequential/conv1d/conv1d/ExpandDims/dim?
#sequential/conv1d/conv1d/ExpandDims
ExpandDimssequential/conv1d/Pad:output:00sequential/conv1d/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????2%
#sequential/conv1d/conv1d/ExpandDims?
4sequential/conv1d/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp=sequential_conv1d_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
: *
dtype026
4sequential/conv1d/conv1d/ExpandDims_1/ReadVariableOp?
)sequential/conv1d/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2+
)sequential/conv1d/conv1d/ExpandDims_1/dim?
%sequential/conv1d/conv1d/ExpandDims_1
ExpandDims<sequential/conv1d/conv1d/ExpandDims_1/ReadVariableOp:value:02sequential/conv1d/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
: 2'
%sequential/conv1d/conv1d/ExpandDims_1?
sequential/conv1d/conv1dConv2D,sequential/conv1d/conv1d/ExpandDims:output:0.sequential/conv1d/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
sequential/conv1d/conv1d?
 sequential/conv1d/conv1d/SqueezeSqueeze!sequential/conv1d/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2"
 sequential/conv1d/conv1d/Squeeze?
(sequential/conv1d/BiasAdd/ReadVariableOpReadVariableOp1sequential_conv1d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02*
(sequential/conv1d/BiasAdd/ReadVariableOp?
sequential/conv1d/BiasAddBiasAdd)sequential/conv1d/conv1d/Squeeze:output:00sequential/conv1d/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d/BiasAdd?
sequential/conv1d/ReluRelu"sequential/conv1d/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d/Relu?
 sequential/conv1d_1/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2"
 sequential/conv1d_1/Pad/paddings?
sequential/conv1d_1/PadPad$sequential/conv1d/Relu:activations:0)sequential/conv1d_1/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_1/Pad?
(sequential/conv1d_1/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2*
(sequential/conv1d_1/conv1d/dilation_rate?
 sequential/conv1d_1/conv1d/ShapeShape sequential/conv1d_1/Pad:output:0*
T0*
_output_shapes
:2"
 sequential/conv1d_1/conv1d/Shape?
.sequential/conv1d_1/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:20
.sequential/conv1d_1/conv1d/strided_slice/stack?
0sequential/conv1d_1/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:22
0sequential/conv1d_1/conv1d/strided_slice/stack_1?
0sequential/conv1d_1/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:22
0sequential/conv1d_1/conv1d/strided_slice/stack_2?
(sequential/conv1d_1/conv1d/strided_sliceStridedSlice)sequential/conv1d_1/conv1d/Shape:output:07sequential/conv1d_1/conv1d/strided_slice/stack:output:09sequential/conv1d_1/conv1d/strided_slice/stack_1:output:09sequential/conv1d_1/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2*
(sequential/conv1d_1/conv1d/strided_slice?
 sequential/conv1d_1/conv1d/stackPack1sequential/conv1d_1/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2"
 sequential/conv1d_1/conv1d/stack?
Isequential/conv1d_1/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2K
Isequential/conv1d_1/conv1d/required_space_to_batch_paddings/base_paddings?
Osequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2Q
Osequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2S
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2S
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
Isequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceRsequential/conv1d_1/conv1d/required_space_to_batch_paddings/base_paddings:output:0Xsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Zsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Zsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2K
Isequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice?
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2S
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2U
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2U
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
Ksequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceRsequential/conv1d_1/conv1d/required_space_to_batch_paddings/base_paddings:output:0Zsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0\sequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0\sequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2M
Ksequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1?
?sequential/conv1d_1/conv1d/required_space_to_batch_paddings/addAddV2)sequential/conv1d_1/conv1d/stack:output:0Rsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2A
?sequential/conv1d_1/conv1d/required_space_to_batch_paddings/add?
Asequential/conv1d_1/conv1d/required_space_to_batch_paddings/add_1AddV2Csequential/conv1d_1/conv1d/required_space_to_batch_paddings/add:z:0Tsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2C
Asequential/conv1d_1/conv1d/required_space_to_batch_paddings/add_1?
?sequential/conv1d_1/conv1d/required_space_to_batch_paddings/modFloorModEsequential/conv1d_1/conv1d/required_space_to_batch_paddings/add_1:z:01sequential/conv1d_1/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2A
?sequential/conv1d_1/conv1d/required_space_to_batch_paddings/mod?
?sequential/conv1d_1/conv1d/required_space_to_batch_paddings/subSub1sequential/conv1d_1/conv1d/dilation_rate:output:0Csequential/conv1d_1/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2A
?sequential/conv1d_1/conv1d/required_space_to_batch_paddings/sub?
Asequential/conv1d_1/conv1d/required_space_to_batch_paddings/mod_1FloorModCsequential/conv1d_1/conv1d/required_space_to_batch_paddings/sub:z:01sequential/conv1d_1/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2C
Asequential/conv1d_1/conv1d/required_space_to_batch_paddings/mod_1?
Asequential/conv1d_1/conv1d/required_space_to_batch_paddings/add_2AddV2Tsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0Esequential/conv1d_1/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2C
Asequential/conv1d_1/conv1d/required_space_to_batch_paddings/add_2?
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
Ksequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceRsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice:output:0Zsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0\sequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0\sequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2?
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
Ksequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSliceEsequential/conv1d_1/conv1d/required_space_to_batch_paddings/add_2:z:0Zsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0\sequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0\sequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3?
Fsequential/conv1d_1/conv1d/required_space_to_batch_paddings/paddings/0PackTsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Tsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2H
Fsequential/conv1d_1/conv1d/required_space_to_batch_paddings/paddings/0?
Dsequential/conv1d_1/conv1d/required_space_to_batch_paddings/paddingsPackOsequential/conv1d_1/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2F
Dsequential/conv1d_1/conv1d/required_space_to_batch_paddings/paddings?
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
Ksequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSliceEsequential/conv1d_1/conv1d/required_space_to_batch_paddings/mod_1:z:0Zsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0\sequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0\sequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4?
Esequential/conv1d_1/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2G
Esequential/conv1d_1/conv1d/required_space_to_batch_paddings/crops/0/0?
Csequential/conv1d_1/conv1d/required_space_to_batch_paddings/crops/0PackNsequential/conv1d_1/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Tsequential/conv1d_1/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2E
Csequential/conv1d_1/conv1d/required_space_to_batch_paddings/crops/0?
Asequential/conv1d_1/conv1d/required_space_to_batch_paddings/cropsPackLsequential/conv1d_1/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2C
Asequential/conv1d_1/conv1d/required_space_to_batch_paddings/crops?
0sequential/conv1d_1/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 22
0sequential/conv1d_1/conv1d/strided_slice_1/stack?
2sequential/conv1d_1/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_1/conv1d/strided_slice_1/stack_1?
2sequential/conv1d_1/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_1/conv1d/strided_slice_1/stack_2?
*sequential/conv1d_1/conv1d/strided_slice_1StridedSliceMsequential/conv1d_1/conv1d/required_space_to_batch_paddings/paddings:output:09sequential/conv1d_1/conv1d/strided_slice_1/stack:output:0;sequential/conv1d_1/conv1d/strided_slice_1/stack_1:output:0;sequential/conv1d_1/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2,
*sequential/conv1d_1/conv1d/strided_slice_1?
,sequential/conv1d_1/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2.
,sequential/conv1d_1/conv1d/concat/concat_dim?
(sequential/conv1d_1/conv1d/concat/concatIdentity3sequential/conv1d_1/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2*
(sequential/conv1d_1/conv1d/concat/concat?
0sequential/conv1d_1/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 22
0sequential/conv1d_1/conv1d/strided_slice_2/stack?
2sequential/conv1d_1/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_1/conv1d/strided_slice_2/stack_1?
2sequential/conv1d_1/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_1/conv1d/strided_slice_2/stack_2?
*sequential/conv1d_1/conv1d/strided_slice_2StridedSliceJsequential/conv1d_1/conv1d/required_space_to_batch_paddings/crops:output:09sequential/conv1d_1/conv1d/strided_slice_2/stack:output:0;sequential/conv1d_1/conv1d/strided_slice_2/stack_1:output:0;sequential/conv1d_1/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2,
*sequential/conv1d_1/conv1d/strided_slice_2?
.sequential/conv1d_1/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 20
.sequential/conv1d_1/conv1d/concat_1/concat_dim?
*sequential/conv1d_1/conv1d/concat_1/concatIdentity3sequential/conv1d_1/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2,
*sequential/conv1d_1/conv1d/concat_1/concat?
5sequential/conv1d_1/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:27
5sequential/conv1d_1/conv1d/SpaceToBatchND/block_shape?
)sequential/conv1d_1/conv1d/SpaceToBatchNDSpaceToBatchND sequential/conv1d_1/Pad:output:0>sequential/conv1d_1/conv1d/SpaceToBatchND/block_shape:output:01sequential/conv1d_1/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2+
)sequential/conv1d_1/conv1d/SpaceToBatchND?
)sequential/conv1d_1/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2+
)sequential/conv1d_1/conv1d/ExpandDims/dim?
%sequential/conv1d_1/conv1d/ExpandDims
ExpandDims2sequential/conv1d_1/conv1d/SpaceToBatchND:output:02sequential/conv1d_1/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2'
%sequential/conv1d_1/conv1d/ExpandDims?
6sequential/conv1d_1/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp?sequential_conv1d_1_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype028
6sequential/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp?
+sequential/conv1d_1/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2-
+sequential/conv1d_1/conv1d/ExpandDims_1/dim?
'sequential/conv1d_1/conv1d/ExpandDims_1
ExpandDims>sequential/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp:value:04sequential/conv1d_1/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2)
'sequential/conv1d_1/conv1d/ExpandDims_1?
sequential/conv1d_1/conv1dConv2D.sequential/conv1d_1/conv1d/ExpandDims:output:00sequential/conv1d_1/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
sequential/conv1d_1/conv1d?
"sequential/conv1d_1/conv1d/SqueezeSqueeze#sequential/conv1d_1/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2$
"sequential/conv1d_1/conv1d/Squeeze?
5sequential/conv1d_1/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:27
5sequential/conv1d_1/conv1d/BatchToSpaceND/block_shape?
)sequential/conv1d_1/conv1d/BatchToSpaceNDBatchToSpaceND+sequential/conv1d_1/conv1d/Squeeze:output:0>sequential/conv1d_1/conv1d/BatchToSpaceND/block_shape:output:03sequential/conv1d_1/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2+
)sequential/conv1d_1/conv1d/BatchToSpaceND?
*sequential/conv1d_1/BiasAdd/ReadVariableOpReadVariableOp3sequential_conv1d_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02,
*sequential/conv1d_1/BiasAdd/ReadVariableOp?
sequential/conv1d_1/BiasAddBiasAdd2sequential/conv1d_1/conv1d/BatchToSpaceND:output:02sequential/conv1d_1/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_1/BiasAdd?
sequential/conv1d_1/ReluRelu$sequential/conv1d_1/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_1/Relu?
 sequential/conv1d_2/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2"
 sequential/conv1d_2/Pad/paddings?
sequential/conv1d_2/PadPad&sequential/conv1d_1/Relu:activations:0)sequential/conv1d_2/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_2/Pad?
(sequential/conv1d_2/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2*
(sequential/conv1d_2/conv1d/dilation_rate?
 sequential/conv1d_2/conv1d/ShapeShape sequential/conv1d_2/Pad:output:0*
T0*
_output_shapes
:2"
 sequential/conv1d_2/conv1d/Shape?
.sequential/conv1d_2/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:20
.sequential/conv1d_2/conv1d/strided_slice/stack?
0sequential/conv1d_2/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:22
0sequential/conv1d_2/conv1d/strided_slice/stack_1?
0sequential/conv1d_2/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:22
0sequential/conv1d_2/conv1d/strided_slice/stack_2?
(sequential/conv1d_2/conv1d/strided_sliceStridedSlice)sequential/conv1d_2/conv1d/Shape:output:07sequential/conv1d_2/conv1d/strided_slice/stack:output:09sequential/conv1d_2/conv1d/strided_slice/stack_1:output:09sequential/conv1d_2/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2*
(sequential/conv1d_2/conv1d/strided_slice?
 sequential/conv1d_2/conv1d/stackPack1sequential/conv1d_2/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2"
 sequential/conv1d_2/conv1d/stack?
Isequential/conv1d_2/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2K
Isequential/conv1d_2/conv1d/required_space_to_batch_paddings/base_paddings?
Osequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2Q
Osequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2S
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2S
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
Isequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceRsequential/conv1d_2/conv1d/required_space_to_batch_paddings/base_paddings:output:0Xsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Zsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Zsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2K
Isequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice?
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2S
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2U
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2U
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
Ksequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceRsequential/conv1d_2/conv1d/required_space_to_batch_paddings/base_paddings:output:0Zsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0\sequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0\sequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2M
Ksequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1?
?sequential/conv1d_2/conv1d/required_space_to_batch_paddings/addAddV2)sequential/conv1d_2/conv1d/stack:output:0Rsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2A
?sequential/conv1d_2/conv1d/required_space_to_batch_paddings/add?
Asequential/conv1d_2/conv1d/required_space_to_batch_paddings/add_1AddV2Csequential/conv1d_2/conv1d/required_space_to_batch_paddings/add:z:0Tsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2C
Asequential/conv1d_2/conv1d/required_space_to_batch_paddings/add_1?
?sequential/conv1d_2/conv1d/required_space_to_batch_paddings/modFloorModEsequential/conv1d_2/conv1d/required_space_to_batch_paddings/add_1:z:01sequential/conv1d_2/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2A
?sequential/conv1d_2/conv1d/required_space_to_batch_paddings/mod?
?sequential/conv1d_2/conv1d/required_space_to_batch_paddings/subSub1sequential/conv1d_2/conv1d/dilation_rate:output:0Csequential/conv1d_2/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2A
?sequential/conv1d_2/conv1d/required_space_to_batch_paddings/sub?
Asequential/conv1d_2/conv1d/required_space_to_batch_paddings/mod_1FloorModCsequential/conv1d_2/conv1d/required_space_to_batch_paddings/sub:z:01sequential/conv1d_2/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2C
Asequential/conv1d_2/conv1d/required_space_to_batch_paddings/mod_1?
Asequential/conv1d_2/conv1d/required_space_to_batch_paddings/add_2AddV2Tsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0Esequential/conv1d_2/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2C
Asequential/conv1d_2/conv1d/required_space_to_batch_paddings/add_2?
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
Ksequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceRsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice:output:0Zsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0\sequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0\sequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2?
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
Ksequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSliceEsequential/conv1d_2/conv1d/required_space_to_batch_paddings/add_2:z:0Zsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0\sequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0\sequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3?
Fsequential/conv1d_2/conv1d/required_space_to_batch_paddings/paddings/0PackTsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Tsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2H
Fsequential/conv1d_2/conv1d/required_space_to_batch_paddings/paddings/0?
Dsequential/conv1d_2/conv1d/required_space_to_batch_paddings/paddingsPackOsequential/conv1d_2/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2F
Dsequential/conv1d_2/conv1d/required_space_to_batch_paddings/paddings?
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
Ksequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSliceEsequential/conv1d_2/conv1d/required_space_to_batch_paddings/mod_1:z:0Zsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0\sequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0\sequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4?
Esequential/conv1d_2/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2G
Esequential/conv1d_2/conv1d/required_space_to_batch_paddings/crops/0/0?
Csequential/conv1d_2/conv1d/required_space_to_batch_paddings/crops/0PackNsequential/conv1d_2/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Tsequential/conv1d_2/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2E
Csequential/conv1d_2/conv1d/required_space_to_batch_paddings/crops/0?
Asequential/conv1d_2/conv1d/required_space_to_batch_paddings/cropsPackLsequential/conv1d_2/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2C
Asequential/conv1d_2/conv1d/required_space_to_batch_paddings/crops?
0sequential/conv1d_2/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 22
0sequential/conv1d_2/conv1d/strided_slice_1/stack?
2sequential/conv1d_2/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_2/conv1d/strided_slice_1/stack_1?
2sequential/conv1d_2/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_2/conv1d/strided_slice_1/stack_2?
*sequential/conv1d_2/conv1d/strided_slice_1StridedSliceMsequential/conv1d_2/conv1d/required_space_to_batch_paddings/paddings:output:09sequential/conv1d_2/conv1d/strided_slice_1/stack:output:0;sequential/conv1d_2/conv1d/strided_slice_1/stack_1:output:0;sequential/conv1d_2/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2,
*sequential/conv1d_2/conv1d/strided_slice_1?
,sequential/conv1d_2/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2.
,sequential/conv1d_2/conv1d/concat/concat_dim?
(sequential/conv1d_2/conv1d/concat/concatIdentity3sequential/conv1d_2/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2*
(sequential/conv1d_2/conv1d/concat/concat?
0sequential/conv1d_2/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 22
0sequential/conv1d_2/conv1d/strided_slice_2/stack?
2sequential/conv1d_2/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_2/conv1d/strided_slice_2/stack_1?
2sequential/conv1d_2/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_2/conv1d/strided_slice_2/stack_2?
*sequential/conv1d_2/conv1d/strided_slice_2StridedSliceJsequential/conv1d_2/conv1d/required_space_to_batch_paddings/crops:output:09sequential/conv1d_2/conv1d/strided_slice_2/stack:output:0;sequential/conv1d_2/conv1d/strided_slice_2/stack_1:output:0;sequential/conv1d_2/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2,
*sequential/conv1d_2/conv1d/strided_slice_2?
.sequential/conv1d_2/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 20
.sequential/conv1d_2/conv1d/concat_1/concat_dim?
*sequential/conv1d_2/conv1d/concat_1/concatIdentity3sequential/conv1d_2/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2,
*sequential/conv1d_2/conv1d/concat_1/concat?
5sequential/conv1d_2/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:27
5sequential/conv1d_2/conv1d/SpaceToBatchND/block_shape?
)sequential/conv1d_2/conv1d/SpaceToBatchNDSpaceToBatchND sequential/conv1d_2/Pad:output:0>sequential/conv1d_2/conv1d/SpaceToBatchND/block_shape:output:01sequential/conv1d_2/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2+
)sequential/conv1d_2/conv1d/SpaceToBatchND?
)sequential/conv1d_2/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2+
)sequential/conv1d_2/conv1d/ExpandDims/dim?
%sequential/conv1d_2/conv1d/ExpandDims
ExpandDims2sequential/conv1d_2/conv1d/SpaceToBatchND:output:02sequential/conv1d_2/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2'
%sequential/conv1d_2/conv1d/ExpandDims?
6sequential/conv1d_2/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp?sequential_conv1d_2_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype028
6sequential/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp?
+sequential/conv1d_2/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2-
+sequential/conv1d_2/conv1d/ExpandDims_1/dim?
'sequential/conv1d_2/conv1d/ExpandDims_1
ExpandDims>sequential/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp:value:04sequential/conv1d_2/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2)
'sequential/conv1d_2/conv1d/ExpandDims_1?
sequential/conv1d_2/conv1dConv2D.sequential/conv1d_2/conv1d/ExpandDims:output:00sequential/conv1d_2/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
sequential/conv1d_2/conv1d?
"sequential/conv1d_2/conv1d/SqueezeSqueeze#sequential/conv1d_2/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2$
"sequential/conv1d_2/conv1d/Squeeze?
5sequential/conv1d_2/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:27
5sequential/conv1d_2/conv1d/BatchToSpaceND/block_shape?
)sequential/conv1d_2/conv1d/BatchToSpaceNDBatchToSpaceND+sequential/conv1d_2/conv1d/Squeeze:output:0>sequential/conv1d_2/conv1d/BatchToSpaceND/block_shape:output:03sequential/conv1d_2/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2+
)sequential/conv1d_2/conv1d/BatchToSpaceND?
*sequential/conv1d_2/BiasAdd/ReadVariableOpReadVariableOp3sequential_conv1d_2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02,
*sequential/conv1d_2/BiasAdd/ReadVariableOp?
sequential/conv1d_2/BiasAddBiasAdd2sequential/conv1d_2/conv1d/BatchToSpaceND:output:02sequential/conv1d_2/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_2/BiasAdd?
sequential/conv1d_2/ReluRelu$sequential/conv1d_2/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_2/Relu?
 sequential/conv1d_3/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2"
 sequential/conv1d_3/Pad/paddings?
sequential/conv1d_3/PadPad&sequential/conv1d_2/Relu:activations:0)sequential/conv1d_3/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_3/Pad?
(sequential/conv1d_3/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2*
(sequential/conv1d_3/conv1d/dilation_rate?
 sequential/conv1d_3/conv1d/ShapeShape sequential/conv1d_3/Pad:output:0*
T0*
_output_shapes
:2"
 sequential/conv1d_3/conv1d/Shape?
.sequential/conv1d_3/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:20
.sequential/conv1d_3/conv1d/strided_slice/stack?
0sequential/conv1d_3/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:22
0sequential/conv1d_3/conv1d/strided_slice/stack_1?
0sequential/conv1d_3/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:22
0sequential/conv1d_3/conv1d/strided_slice/stack_2?
(sequential/conv1d_3/conv1d/strided_sliceStridedSlice)sequential/conv1d_3/conv1d/Shape:output:07sequential/conv1d_3/conv1d/strided_slice/stack:output:09sequential/conv1d_3/conv1d/strided_slice/stack_1:output:09sequential/conv1d_3/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2*
(sequential/conv1d_3/conv1d/strided_slice?
 sequential/conv1d_3/conv1d/stackPack1sequential/conv1d_3/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2"
 sequential/conv1d_3/conv1d/stack?
Isequential/conv1d_3/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2K
Isequential/conv1d_3/conv1d/required_space_to_batch_paddings/base_paddings?
Osequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2Q
Osequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2S
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2S
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
Isequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceRsequential/conv1d_3/conv1d/required_space_to_batch_paddings/base_paddings:output:0Xsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Zsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Zsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2K
Isequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice?
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2S
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2U
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2U
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
Ksequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceRsequential/conv1d_3/conv1d/required_space_to_batch_paddings/base_paddings:output:0Zsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0\sequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0\sequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2M
Ksequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1?
?sequential/conv1d_3/conv1d/required_space_to_batch_paddings/addAddV2)sequential/conv1d_3/conv1d/stack:output:0Rsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2A
?sequential/conv1d_3/conv1d/required_space_to_batch_paddings/add?
Asequential/conv1d_3/conv1d/required_space_to_batch_paddings/add_1AddV2Csequential/conv1d_3/conv1d/required_space_to_batch_paddings/add:z:0Tsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2C
Asequential/conv1d_3/conv1d/required_space_to_batch_paddings/add_1?
?sequential/conv1d_3/conv1d/required_space_to_batch_paddings/modFloorModEsequential/conv1d_3/conv1d/required_space_to_batch_paddings/add_1:z:01sequential/conv1d_3/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2A
?sequential/conv1d_3/conv1d/required_space_to_batch_paddings/mod?
?sequential/conv1d_3/conv1d/required_space_to_batch_paddings/subSub1sequential/conv1d_3/conv1d/dilation_rate:output:0Csequential/conv1d_3/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2A
?sequential/conv1d_3/conv1d/required_space_to_batch_paddings/sub?
Asequential/conv1d_3/conv1d/required_space_to_batch_paddings/mod_1FloorModCsequential/conv1d_3/conv1d/required_space_to_batch_paddings/sub:z:01sequential/conv1d_3/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2C
Asequential/conv1d_3/conv1d/required_space_to_batch_paddings/mod_1?
Asequential/conv1d_3/conv1d/required_space_to_batch_paddings/add_2AddV2Tsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0Esequential/conv1d_3/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2C
Asequential/conv1d_3/conv1d/required_space_to_batch_paddings/add_2?
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
Ksequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceRsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice:output:0Zsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0\sequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0\sequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2?
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
Ksequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSliceEsequential/conv1d_3/conv1d/required_space_to_batch_paddings/add_2:z:0Zsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0\sequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0\sequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3?
Fsequential/conv1d_3/conv1d/required_space_to_batch_paddings/paddings/0PackTsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Tsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2H
Fsequential/conv1d_3/conv1d/required_space_to_batch_paddings/paddings/0?
Dsequential/conv1d_3/conv1d/required_space_to_batch_paddings/paddingsPackOsequential/conv1d_3/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2F
Dsequential/conv1d_3/conv1d/required_space_to_batch_paddings/paddings?
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
Ksequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSliceEsequential/conv1d_3/conv1d/required_space_to_batch_paddings/mod_1:z:0Zsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0\sequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0\sequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4?
Esequential/conv1d_3/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2G
Esequential/conv1d_3/conv1d/required_space_to_batch_paddings/crops/0/0?
Csequential/conv1d_3/conv1d/required_space_to_batch_paddings/crops/0PackNsequential/conv1d_3/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Tsequential/conv1d_3/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2E
Csequential/conv1d_3/conv1d/required_space_to_batch_paddings/crops/0?
Asequential/conv1d_3/conv1d/required_space_to_batch_paddings/cropsPackLsequential/conv1d_3/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2C
Asequential/conv1d_3/conv1d/required_space_to_batch_paddings/crops?
0sequential/conv1d_3/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 22
0sequential/conv1d_3/conv1d/strided_slice_1/stack?
2sequential/conv1d_3/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_3/conv1d/strided_slice_1/stack_1?
2sequential/conv1d_3/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_3/conv1d/strided_slice_1/stack_2?
*sequential/conv1d_3/conv1d/strided_slice_1StridedSliceMsequential/conv1d_3/conv1d/required_space_to_batch_paddings/paddings:output:09sequential/conv1d_3/conv1d/strided_slice_1/stack:output:0;sequential/conv1d_3/conv1d/strided_slice_1/stack_1:output:0;sequential/conv1d_3/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2,
*sequential/conv1d_3/conv1d/strided_slice_1?
,sequential/conv1d_3/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2.
,sequential/conv1d_3/conv1d/concat/concat_dim?
(sequential/conv1d_3/conv1d/concat/concatIdentity3sequential/conv1d_3/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2*
(sequential/conv1d_3/conv1d/concat/concat?
0sequential/conv1d_3/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 22
0sequential/conv1d_3/conv1d/strided_slice_2/stack?
2sequential/conv1d_3/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_3/conv1d/strided_slice_2/stack_1?
2sequential/conv1d_3/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_3/conv1d/strided_slice_2/stack_2?
*sequential/conv1d_3/conv1d/strided_slice_2StridedSliceJsequential/conv1d_3/conv1d/required_space_to_batch_paddings/crops:output:09sequential/conv1d_3/conv1d/strided_slice_2/stack:output:0;sequential/conv1d_3/conv1d/strided_slice_2/stack_1:output:0;sequential/conv1d_3/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2,
*sequential/conv1d_3/conv1d/strided_slice_2?
.sequential/conv1d_3/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 20
.sequential/conv1d_3/conv1d/concat_1/concat_dim?
*sequential/conv1d_3/conv1d/concat_1/concatIdentity3sequential/conv1d_3/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2,
*sequential/conv1d_3/conv1d/concat_1/concat?
5sequential/conv1d_3/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:27
5sequential/conv1d_3/conv1d/SpaceToBatchND/block_shape?
)sequential/conv1d_3/conv1d/SpaceToBatchNDSpaceToBatchND sequential/conv1d_3/Pad:output:0>sequential/conv1d_3/conv1d/SpaceToBatchND/block_shape:output:01sequential/conv1d_3/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2+
)sequential/conv1d_3/conv1d/SpaceToBatchND?
)sequential/conv1d_3/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2+
)sequential/conv1d_3/conv1d/ExpandDims/dim?
%sequential/conv1d_3/conv1d/ExpandDims
ExpandDims2sequential/conv1d_3/conv1d/SpaceToBatchND:output:02sequential/conv1d_3/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2'
%sequential/conv1d_3/conv1d/ExpandDims?
6sequential/conv1d_3/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp?sequential_conv1d_3_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype028
6sequential/conv1d_3/conv1d/ExpandDims_1/ReadVariableOp?
+sequential/conv1d_3/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2-
+sequential/conv1d_3/conv1d/ExpandDims_1/dim?
'sequential/conv1d_3/conv1d/ExpandDims_1
ExpandDims>sequential/conv1d_3/conv1d/ExpandDims_1/ReadVariableOp:value:04sequential/conv1d_3/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2)
'sequential/conv1d_3/conv1d/ExpandDims_1?
sequential/conv1d_3/conv1dConv2D.sequential/conv1d_3/conv1d/ExpandDims:output:00sequential/conv1d_3/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
sequential/conv1d_3/conv1d?
"sequential/conv1d_3/conv1d/SqueezeSqueeze#sequential/conv1d_3/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2$
"sequential/conv1d_3/conv1d/Squeeze?
5sequential/conv1d_3/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:27
5sequential/conv1d_3/conv1d/BatchToSpaceND/block_shape?
)sequential/conv1d_3/conv1d/BatchToSpaceNDBatchToSpaceND+sequential/conv1d_3/conv1d/Squeeze:output:0>sequential/conv1d_3/conv1d/BatchToSpaceND/block_shape:output:03sequential/conv1d_3/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2+
)sequential/conv1d_3/conv1d/BatchToSpaceND?
*sequential/conv1d_3/BiasAdd/ReadVariableOpReadVariableOp3sequential_conv1d_3_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02,
*sequential/conv1d_3/BiasAdd/ReadVariableOp?
sequential/conv1d_3/BiasAddBiasAdd2sequential/conv1d_3/conv1d/BatchToSpaceND:output:02sequential/conv1d_3/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_3/BiasAdd?
sequential/conv1d_3/ReluRelu$sequential/conv1d_3/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_3/Relu?
 sequential/conv1d_4/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2"
 sequential/conv1d_4/Pad/paddings?
sequential/conv1d_4/PadPad&sequential/conv1d_3/Relu:activations:0)sequential/conv1d_4/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_4/Pad?
(sequential/conv1d_4/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB:2*
(sequential/conv1d_4/conv1d/dilation_rate?
 sequential/conv1d_4/conv1d/ShapeShape sequential/conv1d_4/Pad:output:0*
T0*
_output_shapes
:2"
 sequential/conv1d_4/conv1d/Shape?
.sequential/conv1d_4/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:20
.sequential/conv1d_4/conv1d/strided_slice/stack?
0sequential/conv1d_4/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:22
0sequential/conv1d_4/conv1d/strided_slice/stack_1?
0sequential/conv1d_4/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:22
0sequential/conv1d_4/conv1d/strided_slice/stack_2?
(sequential/conv1d_4/conv1d/strided_sliceStridedSlice)sequential/conv1d_4/conv1d/Shape:output:07sequential/conv1d_4/conv1d/strided_slice/stack:output:09sequential/conv1d_4/conv1d/strided_slice/stack_1:output:09sequential/conv1d_4/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2*
(sequential/conv1d_4/conv1d/strided_slice?
 sequential/conv1d_4/conv1d/stackPack1sequential/conv1d_4/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2"
 sequential/conv1d_4/conv1d/stack?
Isequential/conv1d_4/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2K
Isequential/conv1d_4/conv1d/required_space_to_batch_paddings/base_paddings?
Osequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2Q
Osequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2S
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2S
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
Isequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceRsequential/conv1d_4/conv1d/required_space_to_batch_paddings/base_paddings:output:0Xsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Zsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Zsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2K
Isequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice?
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2S
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2U
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2U
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
Ksequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceRsequential/conv1d_4/conv1d/required_space_to_batch_paddings/base_paddings:output:0Zsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0\sequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0\sequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2M
Ksequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1?
?sequential/conv1d_4/conv1d/required_space_to_batch_paddings/addAddV2)sequential/conv1d_4/conv1d/stack:output:0Rsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2A
?sequential/conv1d_4/conv1d/required_space_to_batch_paddings/add?
Asequential/conv1d_4/conv1d/required_space_to_batch_paddings/add_1AddV2Csequential/conv1d_4/conv1d/required_space_to_batch_paddings/add:z:0Tsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2C
Asequential/conv1d_4/conv1d/required_space_to_batch_paddings/add_1?
?sequential/conv1d_4/conv1d/required_space_to_batch_paddings/modFloorModEsequential/conv1d_4/conv1d/required_space_to_batch_paddings/add_1:z:01sequential/conv1d_4/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2A
?sequential/conv1d_4/conv1d/required_space_to_batch_paddings/mod?
?sequential/conv1d_4/conv1d/required_space_to_batch_paddings/subSub1sequential/conv1d_4/conv1d/dilation_rate:output:0Csequential/conv1d_4/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2A
?sequential/conv1d_4/conv1d/required_space_to_batch_paddings/sub?
Asequential/conv1d_4/conv1d/required_space_to_batch_paddings/mod_1FloorModCsequential/conv1d_4/conv1d/required_space_to_batch_paddings/sub:z:01sequential/conv1d_4/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2C
Asequential/conv1d_4/conv1d/required_space_to_batch_paddings/mod_1?
Asequential/conv1d_4/conv1d/required_space_to_batch_paddings/add_2AddV2Tsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0Esequential/conv1d_4/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2C
Asequential/conv1d_4/conv1d/required_space_to_batch_paddings/add_2?
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
Ksequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceRsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice:output:0Zsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0\sequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0\sequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2?
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
Ksequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSliceEsequential/conv1d_4/conv1d/required_space_to_batch_paddings/add_2:z:0Zsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0\sequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0\sequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3?
Fsequential/conv1d_4/conv1d/required_space_to_batch_paddings/paddings/0PackTsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Tsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2H
Fsequential/conv1d_4/conv1d/required_space_to_batch_paddings/paddings/0?
Dsequential/conv1d_4/conv1d/required_space_to_batch_paddings/paddingsPackOsequential/conv1d_4/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2F
Dsequential/conv1d_4/conv1d/required_space_to_batch_paddings/paddings?
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
Ksequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSliceEsequential/conv1d_4/conv1d/required_space_to_batch_paddings/mod_1:z:0Zsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0\sequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0\sequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4?
Esequential/conv1d_4/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2G
Esequential/conv1d_4/conv1d/required_space_to_batch_paddings/crops/0/0?
Csequential/conv1d_4/conv1d/required_space_to_batch_paddings/crops/0PackNsequential/conv1d_4/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Tsequential/conv1d_4/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2E
Csequential/conv1d_4/conv1d/required_space_to_batch_paddings/crops/0?
Asequential/conv1d_4/conv1d/required_space_to_batch_paddings/cropsPackLsequential/conv1d_4/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2C
Asequential/conv1d_4/conv1d/required_space_to_batch_paddings/crops?
0sequential/conv1d_4/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 22
0sequential/conv1d_4/conv1d/strided_slice_1/stack?
2sequential/conv1d_4/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_4/conv1d/strided_slice_1/stack_1?
2sequential/conv1d_4/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_4/conv1d/strided_slice_1/stack_2?
*sequential/conv1d_4/conv1d/strided_slice_1StridedSliceMsequential/conv1d_4/conv1d/required_space_to_batch_paddings/paddings:output:09sequential/conv1d_4/conv1d/strided_slice_1/stack:output:0;sequential/conv1d_4/conv1d/strided_slice_1/stack_1:output:0;sequential/conv1d_4/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2,
*sequential/conv1d_4/conv1d/strided_slice_1?
,sequential/conv1d_4/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2.
,sequential/conv1d_4/conv1d/concat/concat_dim?
(sequential/conv1d_4/conv1d/concat/concatIdentity3sequential/conv1d_4/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2*
(sequential/conv1d_4/conv1d/concat/concat?
0sequential/conv1d_4/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 22
0sequential/conv1d_4/conv1d/strided_slice_2/stack?
2sequential/conv1d_4/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_4/conv1d/strided_slice_2/stack_1?
2sequential/conv1d_4/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_4/conv1d/strided_slice_2/stack_2?
*sequential/conv1d_4/conv1d/strided_slice_2StridedSliceJsequential/conv1d_4/conv1d/required_space_to_batch_paddings/crops:output:09sequential/conv1d_4/conv1d/strided_slice_2/stack:output:0;sequential/conv1d_4/conv1d/strided_slice_2/stack_1:output:0;sequential/conv1d_4/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2,
*sequential/conv1d_4/conv1d/strided_slice_2?
.sequential/conv1d_4/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 20
.sequential/conv1d_4/conv1d/concat_1/concat_dim?
*sequential/conv1d_4/conv1d/concat_1/concatIdentity3sequential/conv1d_4/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2,
*sequential/conv1d_4/conv1d/concat_1/concat?
5sequential/conv1d_4/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:27
5sequential/conv1d_4/conv1d/SpaceToBatchND/block_shape?
)sequential/conv1d_4/conv1d/SpaceToBatchNDSpaceToBatchND sequential/conv1d_4/Pad:output:0>sequential/conv1d_4/conv1d/SpaceToBatchND/block_shape:output:01sequential/conv1d_4/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2+
)sequential/conv1d_4/conv1d/SpaceToBatchND?
)sequential/conv1d_4/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2+
)sequential/conv1d_4/conv1d/ExpandDims/dim?
%sequential/conv1d_4/conv1d/ExpandDims
ExpandDims2sequential/conv1d_4/conv1d/SpaceToBatchND:output:02sequential/conv1d_4/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2'
%sequential/conv1d_4/conv1d/ExpandDims?
6sequential/conv1d_4/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp?sequential_conv1d_4_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype028
6sequential/conv1d_4/conv1d/ExpandDims_1/ReadVariableOp?
+sequential/conv1d_4/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2-
+sequential/conv1d_4/conv1d/ExpandDims_1/dim?
'sequential/conv1d_4/conv1d/ExpandDims_1
ExpandDims>sequential/conv1d_4/conv1d/ExpandDims_1/ReadVariableOp:value:04sequential/conv1d_4/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2)
'sequential/conv1d_4/conv1d/ExpandDims_1?
sequential/conv1d_4/conv1dConv2D.sequential/conv1d_4/conv1d/ExpandDims:output:00sequential/conv1d_4/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
sequential/conv1d_4/conv1d?
"sequential/conv1d_4/conv1d/SqueezeSqueeze#sequential/conv1d_4/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2$
"sequential/conv1d_4/conv1d/Squeeze?
5sequential/conv1d_4/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB:27
5sequential/conv1d_4/conv1d/BatchToSpaceND/block_shape?
)sequential/conv1d_4/conv1d/BatchToSpaceNDBatchToSpaceND+sequential/conv1d_4/conv1d/Squeeze:output:0>sequential/conv1d_4/conv1d/BatchToSpaceND/block_shape:output:03sequential/conv1d_4/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2+
)sequential/conv1d_4/conv1d/BatchToSpaceND?
*sequential/conv1d_4/BiasAdd/ReadVariableOpReadVariableOp3sequential_conv1d_4_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02,
*sequential/conv1d_4/BiasAdd/ReadVariableOp?
sequential/conv1d_4/BiasAddBiasAdd2sequential/conv1d_4/conv1d/BatchToSpaceND:output:02sequential/conv1d_4/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_4/BiasAdd?
sequential/conv1d_4/ReluRelu$sequential/conv1d_4/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_4/Relu?
 sequential/conv1d_5/Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                        2"
 sequential/conv1d_5/Pad/paddings?
sequential/conv1d_5/PadPad&sequential/conv1d_4/Relu:activations:0)sequential/conv1d_5/Pad/paddings:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_5/Pad?
(sequential/conv1d_5/conv1d/dilation_rateConst*
_output_shapes
:*
dtype0*
valueB: 2*
(sequential/conv1d_5/conv1d/dilation_rate?
 sequential/conv1d_5/conv1d/ShapeShape sequential/conv1d_5/Pad:output:0*
T0*
_output_shapes
:2"
 sequential/conv1d_5/conv1d/Shape?
.sequential/conv1d_5/conv1d/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:20
.sequential/conv1d_5/conv1d/strided_slice/stack?
0sequential/conv1d_5/conv1d/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:22
0sequential/conv1d_5/conv1d/strided_slice/stack_1?
0sequential/conv1d_5/conv1d/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:22
0sequential/conv1d_5/conv1d/strided_slice/stack_2?
(sequential/conv1d_5/conv1d/strided_sliceStridedSlice)sequential/conv1d_5/conv1d/Shape:output:07sequential/conv1d_5/conv1d/strided_slice/stack:output:09sequential/conv1d_5/conv1d/strided_slice/stack_1:output:09sequential/conv1d_5/conv1d/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2*
(sequential/conv1d_5/conv1d/strided_slice?
 sequential/conv1d_5/conv1d/stackPack1sequential/conv1d_5/conv1d/strided_slice:output:0*
N*
T0*
_output_shapes
:2"
 sequential/conv1d_5/conv1d/stack?
Isequential/conv1d_5/conv1d/required_space_to_batch_paddings/base_paddingsConst*
_output_shapes

:*
dtype0*!
valueB"        2K
Isequential/conv1d_5/conv1d/required_space_to_batch_paddings/base_paddings?
Osequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        2Q
Osequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack?
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2S
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_1?
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2S
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_2?
Isequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_sliceStridedSliceRsequential/conv1d_5/conv1d/required_space_to_batch_paddings/base_paddings:output:0Xsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack:output:0Zsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_1:output:0Zsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2K
Isequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice?
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       2S
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack?
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       2U
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1?
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      2U
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2?
Ksequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1StridedSliceRsequential/conv1d_5/conv1d/required_space_to_batch_paddings/base_paddings:output:0Zsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack:output:0\sequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_1:output:0\sequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
:*

begin_mask*
end_mask*
shrink_axis_mask2M
Ksequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1?
?sequential/conv1d_5/conv1d/required_space_to_batch_paddings/addAddV2)sequential/conv1d_5/conv1d/stack:output:0Rsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice:output:0*
T0*
_output_shapes
:2A
?sequential/conv1d_5/conv1d/required_space_to_batch_paddings/add?
Asequential/conv1d_5/conv1d/required_space_to_batch_paddings/add_1AddV2Csequential/conv1d_5/conv1d/required_space_to_batch_paddings/add:z:0Tsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0*
T0*
_output_shapes
:2C
Asequential/conv1d_5/conv1d/required_space_to_batch_paddings/add_1?
?sequential/conv1d_5/conv1d/required_space_to_batch_paddings/modFloorModEsequential/conv1d_5/conv1d/required_space_to_batch_paddings/add_1:z:01sequential/conv1d_5/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2A
?sequential/conv1d_5/conv1d/required_space_to_batch_paddings/mod?
?sequential/conv1d_5/conv1d/required_space_to_batch_paddings/subSub1sequential/conv1d_5/conv1d/dilation_rate:output:0Csequential/conv1d_5/conv1d/required_space_to_batch_paddings/mod:z:0*
T0*
_output_shapes
:2A
?sequential/conv1d_5/conv1d/required_space_to_batch_paddings/sub?
Asequential/conv1d_5/conv1d/required_space_to_batch_paddings/mod_1FloorModCsequential/conv1d_5/conv1d/required_space_to_batch_paddings/sub:z:01sequential/conv1d_5/conv1d/dilation_rate:output:0*
T0*
_output_shapes
:2C
Asequential/conv1d_5/conv1d/required_space_to_batch_paddings/mod_1?
Asequential/conv1d_5/conv1d/required_space_to_batch_paddings/add_2AddV2Tsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_1:output:0Esequential/conv1d_5/conv1d/required_space_to_batch_paddings/mod_1:z:0*
T0*
_output_shapes
:2C
Asequential/conv1d_5/conv1d/required_space_to_batch_paddings/add_2?
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack?
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1?
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2?
Ksequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2StridedSliceRsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice:output:0Zsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack:output:0\sequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_1:output:0\sequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2?
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack?
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1?
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2?
Ksequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3StridedSliceEsequential/conv1d_5/conv1d/required_space_to_batch_paddings/add_2:z:0Zsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack:output:0\sequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_1:output:0\sequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3?
Fsequential/conv1d_5/conv1d/required_space_to_batch_paddings/paddings/0PackTsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_2:output:0Tsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_3:output:0*
N*
T0*
_output_shapes
:2H
Fsequential/conv1d_5/conv1d/required_space_to_batch_paddings/paddings/0?
Dsequential/conv1d_5/conv1d/required_space_to_batch_paddings/paddingsPackOsequential/conv1d_5/conv1d/required_space_to_batch_paddings/paddings/0:output:0*
N*
T0*
_output_shapes

:2F
Dsequential/conv1d_5/conv1d/required_space_to_batch_paddings/paddings?
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
Qsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack?
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1?
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
Ssequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2?
Ksequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4StridedSliceEsequential/conv1d_5/conv1d/required_space_to_batch_paddings/mod_1:z:0Zsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack:output:0\sequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_1:output:0\sequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2M
Ksequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4?
Esequential/conv1d_5/conv1d/required_space_to_batch_paddings/crops/0/0Const*
_output_shapes
: *
dtype0*
value	B : 2G
Esequential/conv1d_5/conv1d/required_space_to_batch_paddings/crops/0/0?
Csequential/conv1d_5/conv1d/required_space_to_batch_paddings/crops/0PackNsequential/conv1d_5/conv1d/required_space_to_batch_paddings/crops/0/0:output:0Tsequential/conv1d_5/conv1d/required_space_to_batch_paddings/strided_slice_4:output:0*
N*
T0*
_output_shapes
:2E
Csequential/conv1d_5/conv1d/required_space_to_batch_paddings/crops/0?
Asequential/conv1d_5/conv1d/required_space_to_batch_paddings/cropsPackLsequential/conv1d_5/conv1d/required_space_to_batch_paddings/crops/0:output:0*
N*
T0*
_output_shapes

:2C
Asequential/conv1d_5/conv1d/required_space_to_batch_paddings/crops?
0sequential/conv1d_5/conv1d/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 22
0sequential/conv1d_5/conv1d/strided_slice_1/stack?
2sequential/conv1d_5/conv1d/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_5/conv1d/strided_slice_1/stack_1?
2sequential/conv1d_5/conv1d/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_5/conv1d/strided_slice_1/stack_2?
*sequential/conv1d_5/conv1d/strided_slice_1StridedSliceMsequential/conv1d_5/conv1d/required_space_to_batch_paddings/paddings:output:09sequential/conv1d_5/conv1d/strided_slice_1/stack:output:0;sequential/conv1d_5/conv1d/strided_slice_1/stack_1:output:0;sequential/conv1d_5/conv1d/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

:2,
*sequential/conv1d_5/conv1d/strided_slice_1?
,sequential/conv1d_5/conv1d/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 2.
,sequential/conv1d_5/conv1d/concat/concat_dim?
(sequential/conv1d_5/conv1d/concat/concatIdentity3sequential/conv1d_5/conv1d/strided_slice_1:output:0*
T0*
_output_shapes

:2*
(sequential/conv1d_5/conv1d/concat/concat?
0sequential/conv1d_5/conv1d/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: 22
0sequential/conv1d_5/conv1d/strided_slice_2/stack?
2sequential/conv1d_5/conv1d/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_5/conv1d/strided_slice_2/stack_1?
2sequential/conv1d_5/conv1d/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:24
2sequential/conv1d_5/conv1d/strided_slice_2/stack_2?
*sequential/conv1d_5/conv1d/strided_slice_2StridedSliceJsequential/conv1d_5/conv1d/required_space_to_batch_paddings/crops:output:09sequential/conv1d_5/conv1d/strided_slice_2/stack:output:0;sequential/conv1d_5/conv1d/strided_slice_2/stack_1:output:0;sequential/conv1d_5/conv1d/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes

:2,
*sequential/conv1d_5/conv1d/strided_slice_2?
.sequential/conv1d_5/conv1d/concat_1/concat_dimConst*
_output_shapes
: *
dtype0*
value	B : 20
.sequential/conv1d_5/conv1d/concat_1/concat_dim?
*sequential/conv1d_5/conv1d/concat_1/concatIdentity3sequential/conv1d_5/conv1d/strided_slice_2:output:0*
T0*
_output_shapes

:2,
*sequential/conv1d_5/conv1d/concat_1/concat?
5sequential/conv1d_5/conv1d/SpaceToBatchND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB: 27
5sequential/conv1d_5/conv1d/SpaceToBatchND/block_shape?
)sequential/conv1d_5/conv1d/SpaceToBatchNDSpaceToBatchND sequential/conv1d_5/Pad:output:0>sequential/conv1d_5/conv1d/SpaceToBatchND/block_shape:output:01sequential/conv1d_5/conv1d/concat/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2+
)sequential/conv1d_5/conv1d/SpaceToBatchND?
)sequential/conv1d_5/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2+
)sequential/conv1d_5/conv1d/ExpandDims/dim?
%sequential/conv1d_5/conv1d/ExpandDims
ExpandDims2sequential/conv1d_5/conv1d/SpaceToBatchND:output:02sequential/conv1d_5/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"?????????????????? 2'
%sequential/conv1d_5/conv1d/ExpandDims?
6sequential/conv1d_5/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp?sequential_conv1d_5_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:  *
dtype028
6sequential/conv1d_5/conv1d/ExpandDims_1/ReadVariableOp?
+sequential/conv1d_5/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2-
+sequential/conv1d_5/conv1d/ExpandDims_1/dim?
'sequential/conv1d_5/conv1d/ExpandDims_1
ExpandDims>sequential/conv1d_5/conv1d/ExpandDims_1/ReadVariableOp:value:04sequential/conv1d_5/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:  2)
'sequential/conv1d_5/conv1d/ExpandDims_1?
sequential/conv1d_5/conv1dConv2D.sequential/conv1d_5/conv1d/ExpandDims:output:00sequential/conv1d_5/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
sequential/conv1d_5/conv1d?
"sequential/conv1d_5/conv1d/SqueezeSqueeze#sequential/conv1d_5/conv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2$
"sequential/conv1d_5/conv1d/Squeeze?
5sequential/conv1d_5/conv1d/BatchToSpaceND/block_shapeConst*
_output_shapes
:*
dtype0*
valueB: 27
5sequential/conv1d_5/conv1d/BatchToSpaceND/block_shape?
)sequential/conv1d_5/conv1d/BatchToSpaceNDBatchToSpaceND+sequential/conv1d_5/conv1d/Squeeze:output:0>sequential/conv1d_5/conv1d/BatchToSpaceND/block_shape:output:03sequential/conv1d_5/conv1d/concat_1/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2+
)sequential/conv1d_5/conv1d/BatchToSpaceND?
*sequential/conv1d_5/BiasAdd/ReadVariableOpReadVariableOp3sequential_conv1d_5_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02,
*sequential/conv1d_5/BiasAdd/ReadVariableOp?
sequential/conv1d_5/BiasAddBiasAdd2sequential/conv1d_5/conv1d/BatchToSpaceND:output:02sequential/conv1d_5/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_5/BiasAdd?
sequential/conv1d_5/ReluRelu$sequential/conv1d_5/BiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
sequential/conv1d_5/Relu?
)sequential/dense/Tensordot/ReadVariableOpReadVariableOp2sequential_dense_tensordot_readvariableop_resource*
_output_shapes

: *
dtype02+
)sequential/dense/Tensordot/ReadVariableOp?
sequential/dense/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:2!
sequential/dense/Tensordot/axes?
sequential/dense/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       2!
sequential/dense/Tensordot/free?
 sequential/dense/Tensordot/ShapeShape&sequential/conv1d_5/Relu:activations:0*
T0*
_output_shapes
:2"
 sequential/dense/Tensordot/Shape?
(sequential/dense/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2*
(sequential/dense/Tensordot/GatherV2/axis?
#sequential/dense/Tensordot/GatherV2GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/free:output:01sequential/dense/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2%
#sequential/dense/Tensordot/GatherV2?
*sequential/dense/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2,
*sequential/dense/Tensordot/GatherV2_1/axis?
%sequential/dense/Tensordot/GatherV2_1GatherV2)sequential/dense/Tensordot/Shape:output:0(sequential/dense/Tensordot/axes:output:03sequential/dense/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:2'
%sequential/dense/Tensordot/GatherV2_1?
 sequential/dense/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2"
 sequential/dense/Tensordot/Const?
sequential/dense/Tensordot/ProdProd,sequential/dense/Tensordot/GatherV2:output:0)sequential/dense/Tensordot/Const:output:0*
T0*
_output_shapes
: 2!
sequential/dense/Tensordot/Prod?
"sequential/dense/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 2$
"sequential/dense/Tensordot/Const_1?
!sequential/dense/Tensordot/Prod_1Prod.sequential/dense/Tensordot/GatherV2_1:output:0+sequential/dense/Tensordot/Const_1:output:0*
T0*
_output_shapes
: 2#
!sequential/dense/Tensordot/Prod_1?
&sequential/dense/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2(
&sequential/dense/Tensordot/concat/axis?
!sequential/dense/Tensordot/concatConcatV2(sequential/dense/Tensordot/free:output:0(sequential/dense/Tensordot/axes:output:0/sequential/dense/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:2#
!sequential/dense/Tensordot/concat?
 sequential/dense/Tensordot/stackPack(sequential/dense/Tensordot/Prod:output:0*sequential/dense/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:2"
 sequential/dense/Tensordot/stack?
$sequential/dense/Tensordot/transpose	Transpose&sequential/conv1d_5/Relu:activations:0*sequential/dense/Tensordot/concat:output:0*
T0*4
_output_shapes"
 :?????????????????? 2&
$sequential/dense/Tensordot/transpose?
"sequential/dense/Tensordot/ReshapeReshape(sequential/dense/Tensordot/transpose:y:0)sequential/dense/Tensordot/stack:output:0*
T0*0
_output_shapes
:??????????????????2$
"sequential/dense/Tensordot/Reshape?
!sequential/dense/Tensordot/MatMulMatMul+sequential/dense/Tensordot/Reshape:output:01sequential/dense/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2#
!sequential/dense/Tensordot/MatMul?
"sequential/dense/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:2$
"sequential/dense/Tensordot/Const_2?
(sequential/dense/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 2*
(sequential/dense/Tensordot/concat_1/axis?
#sequential/dense/Tensordot/concat_1ConcatV2,sequential/dense/Tensordot/GatherV2:output:0+sequential/dense/Tensordot/Const_2:output:01sequential/dense/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:2%
#sequential/dense/Tensordot/concat_1?
sequential/dense/TensordotReshape+sequential/dense/Tensordot/MatMul:product:0,sequential/dense/Tensordot/concat_1:output:0*
T0*4
_output_shapes"
 :??????????????????2
sequential/dense/Tensordot?
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp0sequential_dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02)
'sequential/dense/BiasAdd/ReadVariableOp?
sequential/dense/BiasAddBiasAdd#sequential/dense/Tensordot:output:0/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :??????????????????2
sequential/dense/BiasAdd?
sequential/dense/ReluRelu!sequential/dense/BiasAdd:output:0*
T0*4
_output_shapes"
 :??????????????????2
sequential/dense/Relu?
)sequential/conv1d_6/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2+
)sequential/conv1d_6/conv1d/ExpandDims/dim?
%sequential/conv1d_6/conv1d/ExpandDims
ExpandDims#sequential/dense/Relu:activations:02sequential/conv1d_6/conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????2'
%sequential/conv1d_6/conv1d/ExpandDims?
6sequential/conv1d_6/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp?sequential_conv1d_6_conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
:*
dtype028
6sequential/conv1d_6/conv1d/ExpandDims_1/ReadVariableOp?
+sequential/conv1d_6/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2-
+sequential/conv1d_6/conv1d/ExpandDims_1/dim?
'sequential/conv1d_6/conv1d/ExpandDims_1
ExpandDims>sequential/conv1d_6/conv1d/ExpandDims_1/ReadVariableOp:value:04sequential/conv1d_6/conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
:2)
'sequential/conv1d_6/conv1d/ExpandDims_1?
sequential/conv1d_6/conv1dConv2D.sequential/conv1d_6/conv1d/ExpandDims:output:00sequential/conv1d_6/conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"??????????????????*
paddingVALID*
strides
2
sequential/conv1d_6/conv1d?
"sequential/conv1d_6/conv1d/SqueezeSqueeze#sequential/conv1d_6/conv1d:output:0*
T0*4
_output_shapes"
 :??????????????????*
squeeze_dims

?????????2$
"sequential/conv1d_6/conv1d/Squeeze?
*sequential/conv1d_6/BiasAdd/ReadVariableOpReadVariableOp3sequential_conv1d_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02,
*sequential/conv1d_6/BiasAdd/ReadVariableOp?
sequential/conv1d_6/BiasAddBiasAdd+sequential/conv1d_6/conv1d/Squeeze:output:02sequential/conv1d_6/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :??????????????????2
sequential/conv1d_6/BiasAdd?
IdentityIdentity$sequential/conv1d_6/BiasAdd:output:0)^sequential/conv1d/BiasAdd/ReadVariableOp5^sequential/conv1d/conv1d/ExpandDims_1/ReadVariableOp+^sequential/conv1d_1/BiasAdd/ReadVariableOp7^sequential/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp+^sequential/conv1d_2/BiasAdd/ReadVariableOp7^sequential/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp+^sequential/conv1d_3/BiasAdd/ReadVariableOp7^sequential/conv1d_3/conv1d/ExpandDims_1/ReadVariableOp+^sequential/conv1d_4/BiasAdd/ReadVariableOp7^sequential/conv1d_4/conv1d/ExpandDims_1/ReadVariableOp+^sequential/conv1d_5/BiasAdd/ReadVariableOp7^sequential/conv1d_5/conv1d/ExpandDims_1/ReadVariableOp+^sequential/conv1d_6/BiasAdd/ReadVariableOp7^sequential/conv1d_6/conv1d/ExpandDims_1/ReadVariableOp(^sequential/dense/BiasAdd/ReadVariableOp*^sequential/dense/Tensordot/ReadVariableOp*
T0*4
_output_shapes"
 :??????????????????2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*S
_input_shapesB
@:??????????????????: : : : : : : : : : : : : : : : 2T
(sequential/conv1d/BiasAdd/ReadVariableOp(sequential/conv1d/BiasAdd/ReadVariableOp2l
4sequential/conv1d/conv1d/ExpandDims_1/ReadVariableOp4sequential/conv1d/conv1d/ExpandDims_1/ReadVariableOp2X
*sequential/conv1d_1/BiasAdd/ReadVariableOp*sequential/conv1d_1/BiasAdd/ReadVariableOp2p
6sequential/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp6sequential/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp2X
*sequential/conv1d_2/BiasAdd/ReadVariableOp*sequential/conv1d_2/BiasAdd/ReadVariableOp2p
6sequential/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp6sequential/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp2X
*sequential/conv1d_3/BiasAdd/ReadVariableOp*sequential/conv1d_3/BiasAdd/ReadVariableOp2p
6sequential/conv1d_3/conv1d/ExpandDims_1/ReadVariableOp6sequential/conv1d_3/conv1d/ExpandDims_1/ReadVariableOp2X
*sequential/conv1d_4/BiasAdd/ReadVariableOp*sequential/conv1d_4/BiasAdd/ReadVariableOp2p
6sequential/conv1d_4/conv1d/ExpandDims_1/ReadVariableOp6sequential/conv1d_4/conv1d/ExpandDims_1/ReadVariableOp2X
*sequential/conv1d_5/BiasAdd/ReadVariableOp*sequential/conv1d_5/BiasAdd/ReadVariableOp2p
6sequential/conv1d_5/conv1d/ExpandDims_1/ReadVariableOp6sequential/conv1d_5/conv1d/ExpandDims_1/ReadVariableOp2X
*sequential/conv1d_6/BiasAdd/ReadVariableOp*sequential/conv1d_6/BiasAdd/ReadVariableOp2p
6sequential/conv1d_6/conv1d/ExpandDims_1/ReadVariableOp6sequential/conv1d_6/conv1d/ExpandDims_1/ReadVariableOp2R
'sequential/dense/BiasAdd/ReadVariableOp'sequential/dense/BiasAdd/ReadVariableOp2V
)sequential/dense/Tensordot/ReadVariableOp)sequential/dense/Tensordot/ReadVariableOp:] Y
4
_output_shapes"
 :??????????????????
!
_user_specified_name	input_1
?
?
)__inference_conv1d_1_layer_call_fn_149223

inputs
unknown:  
	unknown_0: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :?????????????????? *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_conv1d_1_layer_call_and_return_conditional_losses_1475272
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:?????????????????? : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :?????????????????? 
 
_user_specified_nameinputs
?
?
B__inference_conv1d_layer_call_and_return_conditional_losses_149214

inputsA
+conv1d_expanddims_1_readvariableop_resource: -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?"conv1d/ExpandDims_1/ReadVariableOp?
Pad/paddingsConst*
_output_shapes

:*
dtype0*1
value(B&"                       2
Pad/paddingso
PadPadinputsPad/paddings:output:0*
T0*4
_output_shapes"
 :??????????????????2
Pady
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
?????????2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsPad:output:0conv1d/ExpandDims/dim:output:0*
T0*8
_output_shapes&
$:"??????????????????2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*"
_output_shapes
: *
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*&
_output_shapes
: 2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*8
_output_shapes&
$:"?????????????????? *
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*4
_output_shapes"
 :?????????????????? *
squeeze_dims

?????????2
conv1d/Squeeze?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :?????????????????? 2	
BiasAdde
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :?????????????????? 2
Relu?
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*4
_output_shapes"
 :?????????????????? 2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:??????????????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:\ X
4
_output_shapes"
 :??????????????????
 
_user_specified_nameinputs"?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
H
input_1=
serving_default_input_1:0??????????????????I
conv1d_6=
StatefulPartitionedCall:0??????????????????tensorflow/serving/predict:??
?f
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
layer_with_weights-2
layer-2
layer_with_weights-3
layer-3
layer_with_weights-4
layer-4
layer_with_weights-5
layer-5
layer_with_weights-6
layer-6
layer_with_weights-7
layer-7
		optimizer

regularization_losses
	variables
trainable_variables
	keras_api

signatures
?__call__
?_default_save_signature
+?&call_and_return_all_conditional_losses"?b
_tf_keras_sequential?b{"name": "sequential", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "class_name": "Sequential", "config": {"name": "sequential", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_1"}}, {"class_name": "Conv1D", "config": {"name": "conv1d", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Conv1D", "config": {"name": "conv1d_1", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [2]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Conv1D", "config": {"name": "conv1d_2", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [4]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Conv1D", "config": {"name": "conv1d_3", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [8]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Conv1D", "config": {"name": "conv1d_4", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [16]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Conv1D", "config": {"name": "conv1d_5", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [32]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Dense", "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 16, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}, {"class_name": "Conv1D", "config": {"name": "conv1d_6", "trainable": true, "dtype": "float32", "filters": 1, "kernel_size": {"class_name": "__tuple__", "items": [1]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}]}, "shared_object_id": 25, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 1}}, "shared_object_id": 26}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 1]}, "is_graph_network": true, "save_spec": {"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, null, 1]}, "float32", "input_1"]}, "keras_version": "2.5.0", "backend": "tensorflow", "model_config": {"class_name": "Sequential", "config": {"name": "sequential", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_1"}, "shared_object_id": 0}, {"class_name": "Conv1D", "config": {"name": "conv1d", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 1}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 2}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 3}, {"class_name": "Conv1D", "config": {"name": "conv1d_1", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [2]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 4}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 5}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 6}, {"class_name": "Conv1D", "config": {"name": "conv1d_2", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [4]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 7}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 8}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 9}, {"class_name": "Conv1D", "config": {"name": "conv1d_3", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [8]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 10}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 11}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 12}, {"class_name": "Conv1D", "config": {"name": "conv1d_4", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [16]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 13}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 14}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 15}, {"class_name": "Conv1D", "config": {"name": "conv1d_5", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [32]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 16}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 17}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 18}, {"class_name": "Dense", "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 16, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 19}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 20}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 21}, {"class_name": "Conv1D", "config": {"name": "conv1d_6", "trainable": true, "dtype": "float32", "filters": 1, "kernel_size": {"class_name": "__tuple__", "items": [1]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 22}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 23}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 24}]}}, "training_config": {"loss": {"class_name": "Huber", "config": {"reduction": "auto", "name": "huber_loss", "delta": 1.0}, "shared_object_id": 27}, "metrics": [[{"class_name": "MeanMetricWrapper", "config": {"name": "mae", "dtype": "float32", "fn": "mean_absolute_error"}, "shared_object_id": 28}]], "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Adam", "config": {"name": "Adam", "learning_rate": 0.001500000013038516, "decay": 0.0, "beta_1": 0.8999999761581421, "beta_2": 0.9990000128746033, "epsilon": 1e-07, "amsgrad": false}}}}
?


kernel
bias
regularization_losses
	variables
trainable_variables
	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?	
_tf_keras_layer?	{"name": "conv1d", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv1D", "config": {"name": "conv1d", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 1}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 2}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 3, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 1}}, "shared_object_id": 26}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 1]}}
?


kernel
bias
regularization_losses
	variables
trainable_variables
	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?	
_tf_keras_layer?	{"name": "conv1d_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv1D", "config": {"name": "conv1d_1", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [2]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 4}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 5}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 6, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 32}}, "shared_object_id": 29}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 32]}}
?


kernel
bias
regularization_losses
	variables
trainable_variables
 	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?	
_tf_keras_layer?	{"name": "conv1d_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv1D", "config": {"name": "conv1d_2", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [4]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 7}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 8}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 9, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 32}}, "shared_object_id": 30}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 32]}}
?


!kernel
"bias
#regularization_losses
$	variables
%trainable_variables
&	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?	
_tf_keras_layer?	{"name": "conv1d_3", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv1D", "config": {"name": "conv1d_3", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [8]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 10}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 11}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 12, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 32}}, "shared_object_id": 31}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 32]}}
?


'kernel
(bias
)regularization_losses
*	variables
+trainable_variables
,	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?	
_tf_keras_layer?	{"name": "conv1d_4", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv1D", "config": {"name": "conv1d_4", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [16]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 13}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 14}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 15, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 32}}, "shared_object_id": 32}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 32]}}
?


-kernel
.bias
/regularization_losses
0	variables
1trainable_variables
2	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?	
_tf_keras_layer?	{"name": "conv1d_5", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv1D", "config": {"name": "conv1d_5", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [2]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "causal", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [32]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 16}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 17}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 18, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 32}}, "shared_object_id": 33}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 32]}}
?

3kernel
4bias
5regularization_losses
6	variables
7trainable_variables
8	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"name": "dense", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dense", "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 16, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 19}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 20}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 21, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 32}}, "shared_object_id": 34}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 32]}}
?


9kernel
:bias
;regularization_losses
<	variables
=trainable_variables
>	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?	
_tf_keras_layer?	{"name": "conv1d_6", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Conv1D", "config": {"name": "conv1d_6", "trainable": true, "dtype": "float32", "filters": 1, "kernel_size": {"class_name": "__tuple__", "items": [1]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 22}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 23}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 24, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 16}}, "shared_object_id": 35}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 16]}}
?
?iter

@beta_1

Abeta_2
	Bdecay
Clearning_ratem|m}m~mm?m?!m?"m?'m?(m?-m?.m?3m?4m?9m?:m?v?v?v?v?v?v?!v?"v?'v?(v?-v?.v?3v?4v?9v?:v?"
	optimizer
 "
trackable_list_wrapper
?
0
1
2
3
4
5
!6
"7
'8
(9
-10
.11
312
413
914
:15"
trackable_list_wrapper
?
0
1
2
3
4
5
!6
"7
'8
(9
-10
.11
312
413
914
:15"
trackable_list_wrapper
?

regularization_losses
Dnon_trainable_variables
Elayer_regularization_losses
Flayer_metrics
Gmetrics
	variables

Hlayers
trainable_variables
?__call__
?_default_save_signature
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
-
?serving_default"
signature_map
#:! 2conv1d/kernel
: 2conv1d/bias
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
?
Inon_trainable_variables
regularization_losses
Jlayer_regularization_losses
Kmetrics
	variables
Llayer_metrics

Mlayers
trainable_variables
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
%:#  2conv1d_1/kernel
: 2conv1d_1/bias
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
?
Nnon_trainable_variables
regularization_losses
Olayer_regularization_losses
Pmetrics
	variables
Qlayer_metrics

Rlayers
trainable_variables
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
%:#  2conv1d_2/kernel
: 2conv1d_2/bias
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
?
Snon_trainable_variables
regularization_losses
Tlayer_regularization_losses
Umetrics
	variables
Vlayer_metrics

Wlayers
trainable_variables
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
%:#  2conv1d_3/kernel
: 2conv1d_3/bias
 "
trackable_list_wrapper
.
!0
"1"
trackable_list_wrapper
.
!0
"1"
trackable_list_wrapper
?
Xnon_trainable_variables
#regularization_losses
Ylayer_regularization_losses
Zmetrics
$	variables
[layer_metrics

\layers
%trainable_variables
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
%:#  2conv1d_4/kernel
: 2conv1d_4/bias
 "
trackable_list_wrapper
.
'0
(1"
trackable_list_wrapper
.
'0
(1"
trackable_list_wrapper
?
]non_trainable_variables
)regularization_losses
^layer_regularization_losses
_metrics
*	variables
`layer_metrics

alayers
+trainable_variables
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
%:#  2conv1d_5/kernel
: 2conv1d_5/bias
 "
trackable_list_wrapper
.
-0
.1"
trackable_list_wrapper
.
-0
.1"
trackable_list_wrapper
?
bnon_trainable_variables
/regularization_losses
clayer_regularization_losses
dmetrics
0	variables
elayer_metrics

flayers
1trainable_variables
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
: 2dense/kernel
:2
dense/bias
 "
trackable_list_wrapper
.
30
41"
trackable_list_wrapper
.
30
41"
trackable_list_wrapper
?
gnon_trainable_variables
5regularization_losses
hlayer_regularization_losses
imetrics
6	variables
jlayer_metrics

klayers
7trainable_variables
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
%:#2conv1d_6/kernel
:2conv1d_6/bias
 "
trackable_list_wrapper
.
90
:1"
trackable_list_wrapper
.
90
:1"
trackable_list_wrapper
?
lnon_trainable_variables
;regularization_losses
mlayer_regularization_losses
nmetrics
<	variables
olayer_metrics

players
=trainable_variables
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
q0
r1"
trackable_list_wrapper
X
0
1
2
3
4
5
6
7"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
?
	stotal
	tcount
u	variables
v	keras_api"?
_tf_keras_metric?{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}, "shared_object_id": 36}
?
	wtotal
	xcount
y
_fn_kwargs
z	variables
{	keras_api"?
_tf_keras_metric?{"class_name": "MeanMetricWrapper", "name": "mae", "dtype": "float32", "config": {"name": "mae", "dtype": "float32", "fn": "mean_absolute_error"}, "shared_object_id": 28}
:  (2total
:  (2count
.
s0
t1"
trackable_list_wrapper
-
u	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
.
w0
x1"
trackable_list_wrapper
-
z	variables"
_generic_user_object
(:& 2Adam/conv1d/kernel/m
: 2Adam/conv1d/bias/m
*:(  2Adam/conv1d_1/kernel/m
 : 2Adam/conv1d_1/bias/m
*:(  2Adam/conv1d_2/kernel/m
 : 2Adam/conv1d_2/bias/m
*:(  2Adam/conv1d_3/kernel/m
 : 2Adam/conv1d_3/bias/m
*:(  2Adam/conv1d_4/kernel/m
 : 2Adam/conv1d_4/bias/m
*:(  2Adam/conv1d_5/kernel/m
 : 2Adam/conv1d_5/bias/m
#:! 2Adam/dense/kernel/m
:2Adam/dense/bias/m
*:(2Adam/conv1d_6/kernel/m
 :2Adam/conv1d_6/bias/m
(:& 2Adam/conv1d/kernel/v
: 2Adam/conv1d/bias/v
*:(  2Adam/conv1d_1/kernel/v
 : 2Adam/conv1d_1/bias/v
*:(  2Adam/conv1d_2/kernel/v
 : 2Adam/conv1d_2/bias/v
*:(  2Adam/conv1d_3/kernel/v
 : 2Adam/conv1d_3/bias/v
*:(  2Adam/conv1d_4/kernel/v
 : 2Adam/conv1d_4/bias/v
*:(  2Adam/conv1d_5/kernel/v
 : 2Adam/conv1d_5/bias/v
#:! 2Adam/dense/kernel/v
:2Adam/dense/bias/v
*:(2Adam/conv1d_6/kernel/v
 :2Adam/conv1d_6/bias/v
?2?
+__inference_sequential_layer_call_fn_147943
+__inference_sequential_layer_call_fn_148348
+__inference_sequential_layer_call_fn_148385
+__inference_sequential_layer_call_fn_148178?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
!__inference__wrapped_model_147423?
???
FullArgSpec
args? 
varargsjargs
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *3?0
.?+
input_1??????????????????
?2?
F__inference_sequential_layer_call_and_return_conditional_losses_148786
F__inference_sequential_layer_call_and_return_conditional_losses_149187
F__inference_sequential_layer_call_and_return_conditional_losses_148222
F__inference_sequential_layer_call_and_return_conditional_losses_148266?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
'__inference_conv1d_layer_call_fn_149196?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
B__inference_conv1d_layer_call_and_return_conditional_losses_149214?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_conv1d_1_layer_call_fn_149223?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_conv1d_1_layer_call_and_return_conditional_losses_149296?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_conv1d_2_layer_call_fn_149305?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_conv1d_2_layer_call_and_return_conditional_losses_149378?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_conv1d_3_layer_call_fn_149387?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_conv1d_3_layer_call_and_return_conditional_losses_149460?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_conv1d_4_layer_call_fn_149469?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_conv1d_4_layer_call_and_return_conditional_losses_149542?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_conv1d_5_layer_call_fn_149551?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_conv1d_5_layer_call_and_return_conditional_losses_149624?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
&__inference_dense_layer_call_fn_149633?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
A__inference_dense_layer_call_and_return_conditional_losses_149664?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_conv1d_6_layer_call_fn_149673?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_conv1d_6_layer_call_and_return_conditional_losses_149688?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
$__inference_signature_wrapper_148311input_1"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 ?
!__inference__wrapped_model_147423?!"'(-.349:=?:
3?0
.?+
input_1??????????????????
? "@?=
;
conv1d_6/?,
conv1d_6???????????????????
D__inference_conv1d_1_layer_call_and_return_conditional_losses_149296v<?9
2?/
-?*
inputs?????????????????? 
? "2?/
(?%
0?????????????????? 
? ?
)__inference_conv1d_1_layer_call_fn_149223i<?9
2?/
-?*
inputs?????????????????? 
? "%?"?????????????????? ?
D__inference_conv1d_2_layer_call_and_return_conditional_losses_149378v<?9
2?/
-?*
inputs?????????????????? 
? "2?/
(?%
0?????????????????? 
? ?
)__inference_conv1d_2_layer_call_fn_149305i<?9
2?/
-?*
inputs?????????????????? 
? "%?"?????????????????? ?
D__inference_conv1d_3_layer_call_and_return_conditional_losses_149460v!"<?9
2?/
-?*
inputs?????????????????? 
? "2?/
(?%
0?????????????????? 
? ?
)__inference_conv1d_3_layer_call_fn_149387i!"<?9
2?/
-?*
inputs?????????????????? 
? "%?"?????????????????? ?
D__inference_conv1d_4_layer_call_and_return_conditional_losses_149542v'(<?9
2?/
-?*
inputs?????????????????? 
? "2?/
(?%
0?????????????????? 
? ?
)__inference_conv1d_4_layer_call_fn_149469i'(<?9
2?/
-?*
inputs?????????????????? 
? "%?"?????????????????? ?
D__inference_conv1d_5_layer_call_and_return_conditional_losses_149624v-.<?9
2?/
-?*
inputs?????????????????? 
? "2?/
(?%
0?????????????????? 
? ?
)__inference_conv1d_5_layer_call_fn_149551i-.<?9
2?/
-?*
inputs?????????????????? 
? "%?"?????????????????? ?
D__inference_conv1d_6_layer_call_and_return_conditional_losses_149688v9:<?9
2?/
-?*
inputs??????????????????
? "2?/
(?%
0??????????????????
? ?
)__inference_conv1d_6_layer_call_fn_149673i9:<?9
2?/
-?*
inputs??????????????????
? "%?"???????????????????
B__inference_conv1d_layer_call_and_return_conditional_losses_149214v<?9
2?/
-?*
inputs??????????????????
? "2?/
(?%
0?????????????????? 
? ?
'__inference_conv1d_layer_call_fn_149196i<?9
2?/
-?*
inputs??????????????????
? "%?"?????????????????? ?
A__inference_dense_layer_call_and_return_conditional_losses_149664v34<?9
2?/
-?*
inputs?????????????????? 
? "2?/
(?%
0??????????????????
? ?
&__inference_dense_layer_call_fn_149633i34<?9
2?/
-?*
inputs?????????????????? 
? "%?"???????????????????
F__inference_sequential_layer_call_and_return_conditional_losses_148222?!"'(-.349:E?B
;?8
.?+
input_1??????????????????
p 

 
? "2?/
(?%
0??????????????????
? ?
F__inference_sequential_layer_call_and_return_conditional_losses_148266?!"'(-.349:E?B
;?8
.?+
input_1??????????????????
p

 
? "2?/
(?%
0??????????????????
? ?
F__inference_sequential_layer_call_and_return_conditional_losses_148786?!"'(-.349:D?A
:?7
-?*
inputs??????????????????
p 

 
? "2?/
(?%
0??????????????????
? ?
F__inference_sequential_layer_call_and_return_conditional_losses_149187?!"'(-.349:D?A
:?7
-?*
inputs??????????????????
p

 
? "2?/
(?%
0??????????????????
? ?
+__inference_sequential_layer_call_fn_147943?!"'(-.349:E?B
;?8
.?+
input_1??????????????????
p 

 
? "%?"???????????????????
+__inference_sequential_layer_call_fn_148178?!"'(-.349:E?B
;?8
.?+
input_1??????????????????
p

 
? "%?"???????????????????
+__inference_sequential_layer_call_fn_148348!"'(-.349:D?A
:?7
-?*
inputs??????????????????
p 

 
? "%?"???????????????????
+__inference_sequential_layer_call_fn_148385!"'(-.349:D?A
:?7
-?*
inputs??????????????????
p

 
? "%?"???????????????????
$__inference_signature_wrapper_148311?!"'(-.349:H?E
? 
>?;
9
input_1.?+
input_1??????????????????"@?=
;
conv1d_6/?,
conv1d_6??????????????????