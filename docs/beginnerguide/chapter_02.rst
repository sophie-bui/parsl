2. Introduction to Parsl
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Overview
---------

What is Parsl and What Can It Be Used For?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Parsl is a Python library designed to simplify parallel programming. It allows you to write Python code that can run across multiple computers or processors at the same time, potentially speeding up your calculations and data processing tasks significantly. Parsl is particularly well-suited for problems that can be broken down into smaller, independent steps. It can handle a wide range of applications, from simple Python functions to complex workflows involving multiple steps and different types of tasks.

Common applications for Parsl include:

- Data processing and analysis: Parsl can be used to process large datasets in parallel, speeding up tasks like data cleaning, transformation, and analysis. Researchers can use Parsl to parallelize genomic data analysis, where large datasets of DNA sequences are cleaned, aligned, and analyzed to identify genetic variations. This process can be significantly accelerated by executing tasks like sequence alignment and variant calling in parallel across multiple computing nodes.
- Scientific simulations: Parsl can be used to run complex simulations in parallel, such as those used in physics, chemistry, and biology. In chemistry, Parsl has been used to parallelize dynamic simulations of small CO\ :sub:`2` molecule clusters. This involves using a flexible monomer two-body carbon dioxide potential function to understand the vibrational structure of these clusters at high levels of quantum mechanical theory. By running these simulations in parallel, computational efficiency is increased, and statistical sampling is improved.
- Machine learning: Parsl can be used to train and deploy machine learning models in parallel, improving performance and scalability. Parsl can be employed to parallelize the training of models. An example is training multiple deep learning models with different hyperparameters simultaneously to find the best-performing model. This parallel training can be done across various GPUs, reducing the time required to train and evaluate the models.
- Parameter studies: Parsl can be used to run multiple instances of a program with different parameters in parallel, exploring a wider range of possibilities. Parsl is useful for parameter studies, such as in materials science, where researchers might run simulations to study the properties of new materials under different conditions. By using Parsl, they can execute multiple instances of a simulation with varying parameters, like temperature or pressure, in parallel. This allows for a comprehensive exploration of the material’s behavior across a range of conditions.

Script vs. Workflow
-----------------------

In Parsl, there's a distinction between a script and a workflow:

- Script: A single Python file containing Parsl code. It defines the tasks to be executed and their dependencies.
- Workflow: The actual execution of a Parsl script. It involves coordinating multiple tasks across different resources, such as processors or computers.

A Parsl script can be thought of as a recipe, while a workflow is the process of cooking that recipe. The script defines the ingredients (tasks) and the steps (dependencies), while the workflow orchestrates the cooking process, ensuring that the steps are followed correctly and the ingredients are combined at the right time.

Key Features and Benefits
-------------------------

Parsl offers several features and benefits that make it a powerful tool for parallel programming:

- Python-based: Parsl is written in Python, a popular and easy-to-learn programming language. This makes it accessible to a wide range of users, including those without extensive experience in parallel programming.
- Works everywhere: Parsl can run on various platforms, from your laptop to large-scale clusters and supercomputers. This flexibility allows you to develop and test your code locally and then easily scale it up to larger systems.
- Flexible: Parsl supports different task types, including Python functions, Bash scripts, and MPI applications. This allows you to leverage existing code and tools in your parallel workflows.
- Handles data: Parsl can automatically manage the movement of data between tasks, even if they are running on different computers. This simplifies the development of data-intensive workflows.
- Fast: Parsl is designed to be efficient and can handle thousands of tasks per second, making it suitable for high-performance computing applications.

Understanding Concurrency and Parallelism
--------------------------------------------

Concurrency vs. Parallelism
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Concurrency and parallelism are related but distinct concepts in computing:

- Concurrency is a program's ability to handle multiple tasks at once. These tasks may not necessarily be executed simultaneously, but they can be interleaved or overlapped in their execution.
- Parallelism is the simultaneous execution of multiple tasks on different processors or computers. This requires hardware support for parallel processing, such as multiple cores or nodes.

Concurrency is a more general concept that can be achieved even on a single processor through techniques like time-sharing or multithreading. Whereas parallelism requires multiple processors and involves the actual simultaneous execution of tasks.

Parsl enables both concurrency and parallelism. It allows you to define tasks that can be executed concurrently, and leverages parallel hardware to run those tasks simultaneously on different processors or computers.

Parsl Facilitates Parallel Computing
----------------------------------------

Parsl makes parallel computing easier by offering a simple way to define and run tasks. You don't need to worry about the low-level details of managing threads, processes, or inter-node communication. Parsl takes care of these aspects, allowing you to focus on your application logic:

- Task definition: You define tasks as Python functions or Bash scripts, using decorators to indicate that they can be run in parallel.
- Dependency management: You specify dependencies between tasks, indicating which tasks must be completed before others can start.
- Resource allocation: Parsl automatically allocates resources (processors or computers) to tasks based on their dependencies and the available resources.
- Task execution: Parsl executes tasks in parallel, utilizing the available resources.
- Data management: Parsl automatically manages the data movement between tasks, ensuring that each task has the necessary input data when it starts.
- Result collection: Parsl collects the results of tasks as they complete, allowing you to access them in your Python code.

By handling these aspects, Parsl makes writing parallel programs that are efficient, scalable, and portable across different platforms easier.

Getting Started Tutorial
----------------------------

The best way to learn Parsl is by doing. Let's revisit the "Hello World" example from the "Getting Started with Parsl" section:

.. code-block:: python

   import parsl
   from parsl import python_app

   # Start Parsl
   parsl.load(config)

   # Define a Parsl app (a function that can run in parallel)
   @python_app
   def hello(name):
       return f'Hello, {name}!'

   # Run the app and get the result
   result = hello("World").result()
   print(result)  # Output: Hello, World!

This script demonstrates the core components of a Parsl program:

- Importing Parsl: The `` import parsl `` line brings in the Parsl library, giving you access to its functions and classes.
- Loading Configuration: The `` parsl.load(config) `` line initializes Parsl with your chosen configuration (this is addressed in chapter 6). This configuration specifies how Parsl will use your computing resources. In this example, we're using a simple configuration for running Parsl on your local machine.
- Defining an App: The `` @python_app `` decorator tells Parsl that the `` hello `` function is a Parsl app, meaning it can be run in parallel.
- Calling the App: The `` hello("World") `` line calls the app with the argument "World". This doesn't run the function immediately; instead, it returns a future, a placeholder for the result that will be available later.
- Getting the Result: The ``.result()`` method waits for the app to finish and then returns the result, which is the string "Hello, World!".
- Printing the Result: The last line prints the result to the console.

Practical Example: Setting Up Your First Parsl Workflow
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To set up your first Parsl workflow, you'll need to:

1. Install Parsl: Follow the instructions in the "Installation and Setup" section to install Parsl on your system.
2. Choose a configuration: Select a configuration that matches your computing environment. Parsl provides several example configurations for different platforms, such as laptops, clusters, and clouds. You can also create custom settings.
3. Write a Parsl script: Define the tasks you want to run in parallel and their dependencies.
4. Load the configuration: Use the ``parsl.load()`` function to load your chosen configuration.
5. Run your script: Execute a Parsl script like any other Python script. Parsl will then take care of executing your tasks in parallel, managing dependencies, and moving data as needed.

Infographics: Script vs Workflow
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. image:: images/script_vs_workflow.png
   :width: 800px
   :align: center
   :alt: Script vs Workflow Infographic
