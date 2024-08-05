Glossary Terms
###################

This glossary defines terms based on their usage within Parsl. By defining our terminology, we hope to create understanding across our community and reduce confusion. When asking for or providing support to fellow Parsl users, please use these terms as defined.

Our glossary is organized alphabetically by the English alphabet. Feel free to contribute terms and definitions to this list that will benefit Parsl users.

.. glossary::

  App
    A Python function decorated with @python_app or @bash_app that tells Parsl it can be run in parallel.

  AppFuture
    A future that represents the execution of a Parsl app.

  Block
    A group of resources used by Parsl.

  Concurrency
    The ability of a program to handle multiple tasks at once.

  DataFlowKernel (DFK)
    The part of Parsl that manages the execution of your apps and the flow of data between them.

  DataFuture
    A future that represents a file produced by a Parsl app.

  Elasticity
    Parsl's ability to dynamically adjust how many blocks it uses.

  Execution Provider
    A component that connects Parsl to computing resources.

  Executor
    The part of Parsl that runs your apps on different computers or processors.

  Future
    A placeholder for the result of a task that hasn't finished yet. You can use the .result() method to get the actual result when it's ready.

  Job
    A task or set of tasks that need to be completed within a process.

  Launcher
    A component that starts worker processes to execute tasks.

  Thread
    A lightweight process that allows for concurrent execution of tasks within a single program.

