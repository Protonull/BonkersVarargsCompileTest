# BonkersVarargsCompileTest

Came across this while working on a fork for a project. There was a class,
ostensibly static, but was just an exposed, mutable HashMap. I switched this
over to Java's fancy new Map APIs to create unmodifiable Maps... but this
turned out to increase the compile time of the project from around 10 seconds
to around 11 minutes, a 66x increase.

After some asking around and testing, we narrowed it down to vararg type
inference.

- **ColourConstantsVarargs.java:** This is a direct copy-paste of my edit that
  sent ruined my life for two hours.

- **ColourConstantsPremadeVarargs.java:** This was a hacky test to determine
  whether the auto-generated varargs-array was the problem. (It was.)

- **ColourConstantsCopyOf.java:** This is what the class looked like before my
  edit, except I've wrapped it in a Map.copyOf() just to see whether there's
  some issue with Map APIs.

- **ColourConstantsTypedVarargs.java:** This was to test whether removing type
  inference by making it explicit removes the problem. (It does.)

There's something in particular about type-inference within an auto-generated
varargs array that the compiler just does not like.

## How to run

Clone this repo and execute `sh run.sh`

## Results

```
openjdk 17.0.9 2023-10-17 LTS
OpenJDK Runtime Environment Corretto-17.0.9.8.1 (build 17.0.9+8-LTS)
OpenJDK 64-Bit Server VM Corretto-17.0.9.8.1 (build 17.0.9+8-LTS, mixed mode, sharing)

Compiling Varargs
Time: 4:52.91

Compiling Premade Varargs
Time: 0:00.65

Compiling Copy Of
Time: 0:00.53

Compiling Typed Varargs
Time: 0:00.60
```

How did you do?
