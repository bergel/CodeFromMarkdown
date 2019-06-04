Class {
	#name : #CFMTest,
	#superclass : #TestCase,
	#category : #CodeFromMarkdown
}

{ #category : #examples }
CFMTest >> exampleLarge [

^ '# A Matrix Library

We have presented an implementation of a neural network that is is made of instances of `NeuronLayer` and `Neuron`. Although instructive, our implementation does not reflects traditional ways of implementing a network.  

Neural networks are implemented using matrices. This chapter lays out a small library to build and manipulate matrices. Costly matrix operations are implemented in C.

In addition to defining a matrix library, this chapters highlights one particular aspect of Pharo, which is the use of Foreign Function Interface (FFI). This is a relevant whenever one wish to make Pharo use external libraries written using the C or C++ languages. For example, TensorFlow is written in C++, which may be accessed from Pharo using the very same technique presented in this chapter.

## Matrix operations in C

Pharo does not provide built-in features to manipulate matrices. Although we could implement them in Pharo, it would suffer from very poor performances. Instead, we will code a small library in C to support the elementary C operations. 

Create a file named `matrix.c` with the following C code:

```C
void dot(double *m1, int m1_nb_rows, int m1_nb_columns, double *m2,
			int m2_nb_rows, int m2_nb_columns, double *res) { 
              
    int col, row, k; 
    for (col = 0; col < m2_nb_columns; col++) { 
        for (row = 0; row < m1_nb_rows; row++) { 
				  double tmp = 0;
            for (k = 0; k < m2_nb_rows; k++) 
					   tmp += m1[row * m1_nb_columns + k] * m2[k * m2_nb_columns + col];
				  res[row * m2_nb_columns + col] = tmp;
} } } 
void sub(double *m1, int nb_rows, int nb_columns, 
			double *m2, double *res) {
   int col, row; 
    for (col = 0; col < nb_columns; col++) { 
        for (row = 0; row < nb_rows; row++) { 
			   res[row * nb_columns + col] = 
				  m1[row * nb_columns + col] - m2[row * nb_columns + col];
} } } 
void add(double *m1, int nb_rows, int nb_columns, 
			double *m2, double *res) {
   int col, row; 
    for (col = 0; col < nb_columns; col++) { 
        for (row = 0; row < nb_rows; row++) { 
			   res[row * nb_columns + col] = 
				  m1[row * nb_columns + col] + m2[row * nb_columns + col];
} } } 
```
This small libraries is composed of three C functions: 
- `dot` to perform the multiplication of matrices
- `sub` to subtract one matrix from another
- `add` to sum two matrices.

The C code does not allocate memory for its own use. This will have to be provided from Pharo. The library has to be compiled. We can use the gcc standard compiler for this:

```bash
gcc -dynamiclib -o matrix.dylib matrix.c

```

Our matrix file is compiled as a dynamic library, loadable within Pharo. The compilation produces the `matrix.dylib` file. 


## The Matrix class

We can now write the Pharo class `MMatrix` which will use our C-library. Note that Pharo 7 contains a deprecated class `Matrix`, which is why our class is prefixed with an additional `M`.

In a new package called `Matrix`, we define the class:

```Smalltalk
Object subclass: #MMatrixfdsfd
	instanceVariableNames: ''nbRows nbColumns array''
	classVariableNames: ''''
	package: ''TMPTMP''
```

The two first variables describe the shape of the matrix while the variable `array` will refer to an array containing the actual values of the matrix. This array will have to be accessible from Pharo.

On the class side of the class `MMatrix` we define a number of useful methods to create matrices. You need to switch the class browser to the class mode to define class methods. The method `newFromArrays:` creates a matrix from a collection of arrays:

```Smalltalk
MMatrixfdsfd class>>newFromArrays: arrays
	"
	MMatrix newFromArrays: #(#(1 2 3) #(4 5 6))
	MMatrix newFromArrays: #(#(1 2 3))
	"
	^ self basicNew
		initializeRows: arrays size columns: arrays first size;
		fromContents: (arrays flatCollect: #yourself);
		yourself
```


```Smalltalk
MMatrixfdsfd>>newRows: numRows columns: numColumns
	"Create a matrix with a given shape"
	^ self basicNew
		initializeRows: numRows columns: numColumns;
		yourself
```
'
]

{ #category : #running }
CFMTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	(Smalltalk includesKey: #MMatrixfdsfd) 
		ifTrue: [ (Smalltalk at: #MMatrixfdsfd) removeFromSystem ]
]

{ #category : #tests }
CFMTest >> testBasic [

	| c |
	c := CodeFromMarkdown new.
	self assert: c numberOfExtractedCode equals: 0.
	self assert: c extractedCodes isEmpty
]

{ #category : #tests }
CFMTest >> testOnLargeExample [

	| c |
	c := CodeFromMarkdown new.
	c processText: self exampleLarge.
	self assert: c numberOfExtractedCode equals: 3.
	self assert: c extractedCodes size equals: 3.
	self assert: c extractedCodes notEmpty.
	
	self assert: c extractedCodes first code equals: 
'Object subclass: #MMatrixfdsfd
	instanceVariableNames: ''nbRows nbColumns array''
	classVariableNames: ''''
	package: ''TMPTMP'''.
	
	self assert: c extractedCodes second code equals: 
'MMatrixfdsfd class>>newFromArrays: arrays
	"
	MMatrix newFromArrays: #(#(1 2 3) #(4 5 6))
	MMatrix newFromArrays: #(#(1 2 3))
	"
	^ self basicNew
		initializeRows: arrays size columns: arrays first size;
		fromContents: (arrays flatCollect: #yourself);
		yourself'.

	self assert: c extractedCodes third code equals: 
'MMatrixfdsfd>>newRows: numRows columns: numColumns
	"Create a matrix with a given shape"
	^ self basicNew
		initializeRows: numRows columns: numColumns;
		yourself'
]

{ #category : #tests }
CFMTest >> testOnLargeExample2 [

	| c cls |
	c := CodeFromMarkdown new.
	c processText: self exampleLarge.
	
	self deny: (Smalltalk includesKey: #MMatrixfdsfd).
	c install.
	self assert: (Smalltalk includesKey: #MMatrixfdsfd).
	cls := Smalltalk at: #MMatrixfdsfd.
	self assert: (cls class >> #newFromArrays:) isCompiledMethod.
	self assert: (cls >> #newRows:columns:) isCompiledMethod.
]

{ #category : #tests }
CFMTest >> testWithSpace [

	| c |
	c := CodeFromMarkdown new.
	c processText: 
'
hello world
```Smalltalk
BMPReadWriter>>+ matrixOrVector
	^ 5 + 6
```
'.
	
	c install.
	self assert: (BMPReadWriter new + 6) equals: 11
]
