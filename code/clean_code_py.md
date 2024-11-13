# Clean Code: Python

## Importance of Clean Code

Writing clean code has a number of benefits. For instance, clean code is:

- easy to understand
- more efficient
- easier to maintain, scale, debug, and refactor

It also tends to require less documentation.

## Code Standards

Code standards are collections of coding rules, guidelines, and best practices. Each programming language comes with its own coding standards, which should be followed in order to write cleaner code. They usually address:

- file organization
- programming-practices and principles
- code formatting (indentation, declarations, statements)
- naming conventions
- comments

## PEP 8 (Python Enhancement Proposal)

PEP 8 is a style guide that describes the coding standards for Python. It's the most popular guide within the Python community. The most important rules state the following:

### PEP 8 naming conventions

- class names should be CamelCase (`MyClass`)
- variable names should be snake_case and all lowercase (first_name)
- function names should be snake_case and all lowercase (quick_sort())
- constants should be snake_case and all uppercase (PI = 3.14159)
- modules should have short, snake_case names and all lowercase (numpy)
- single quotes and double quotes are treated the same (just pick one and be consistent)

### PEP 8 line formatting

- indent using 4 spaces (spaces are preferred over tabs)
- lines should not be longer than 79 characters
- avoid multiple statements on the same line
- top-level function and class definitions are surrounded with two blank lines
- method definitions inside a class are surrounded by a single blank line
- imports should be on separate lines

### PEP 8 whitespace

avoid extra spaces within brackets or braces
avoid trailing whitespace anywhere
always surround binary operators with a single space on either side
if operators with different priorities are used, consider adding whitespace around the operators with the lowest priority
don't use spaces around the = sign when used to indicate a keyword argument
PEP 8 comments:

- comments should not contradict the code
- comments should be complete sentences
- comments should have a space after the # sign with the first word capitalized
- multi-line comments used in functions (docstrings) should have a short single-line description followed by more text

If you want to learn more read the official PEP 8 reference.

## Pythonic Code

Pythonic code is a set of idioms, adopted by the Python community. It simply means that you're using Python's idioms and paradigms well in order to make your cleaner, readable, and highly performant.

Pythonic code includes:

- variable tricks
- list manipulation (initialization, slicing)
- dealing with functions
- explicit code

There's a big difference between writing Python code and writing Pythonic code. To write Pythonic code you can't just idiomatically translate another language (like Java or C++) to Python; you need to be thinking in Python to being with.

Let's look at an example. We have to add the first 10 numbers together like so `1 + 2 + ... + 10`.

A non-Pythonic solution would be something like this:

```python
n = 10
sum_all = 0

for i in range(1, n + 1):
    sum_all = sum_all + i

print(sum_all)  # 55
```

A more Pythonic solution might look like this:

```python
n = 10
sum_all = sum(range(1, n + 1))

print(sum_all)  # 55
```

This second example is much easier to read by an experienced Python developer, but it does require a deeper understanding of Python's built-in functions and syntax. The easiest way to write Pythonic code is to keep the Zen of Python in mind as you're writing code and to incrementally learn Python's standard library.

## The Zen of Python

The Zen of Python is a collection of 19 "guiding principles" for writing computer programs in Python. The collection was written in 1999 by software engineer Tim Peters. It's included as an Easter egg in the Python interpreter.

You can see it by executing the following command:

`import this`

```python
>>> import this

The Zen of Python, by Tim Peters

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!
If you're curious about the meaning of the "poem", check out The Zen of Python, Explained, which provides a line-by-line explanation.
```

## Code Principles

There are numerous coding principles you can follow to write better code, each having their own pros/cons and tradeoffs. This article covers four of the more popular principles: DRY, KISS, SoC, and SOLID.

### DRY (Don't repeat yourself)

> Every piece of knowledge must have a single, unambiguous, authoritative representation within a system.

This is one of the simplest coding principles. Its only rule is that code should not be duplicated. Instead of duplicating lines, find an algorithm that uses iteration. DRY code is easily maintainable. You can take this principle even further with model/data abstraction.

The cons of the DRY principle are that you can end up with too many abstractions, external dependency creations, and complex code. DRY can also cause complications if you try to change a bigger chunk of your codebase. This is why you should avoid DRYing your code too early. It's always better to have a few repeated code sections than wrong abstractions.

### KISS (Keep it simple, stupid)

> Most systems work best if they are kept simple, rather than made complicated.

The KISS principle states that most systems work best if they are kept simple rather than made complicated. Simplicity should be a key goal in design, and unnecessary complexity should be avoided.

### SoC (Separation of concerns)

> SoC is a design principle for separating a computer program into distinct sections such that each section addresses a separate concern. A concern is a set of information that affects the code of a computer program.

A good example of SoC is MVC (Model - View - Controller).

If you decide to go with this approach be careful not to split your app into too many modules. You should only create a new module when it makes sense to do so. More modules equals more problems.

### SOLID

> SOLID is a mnemonic acronym for five design principles intended to make software designs more understandable, flexible, and maintainable.

SOLID is extremely useful when writing OOP code. It talks about splitting your class into multiple subclasses, inheritance, abstraction, interfaces, and more.

It consists of the following five concepts:

- The Single-responsibility principle: "A class should have one, and only one, reason to change."
- The Open–closed principle: "Entities should be open for extension, but closed for modification."
- The Liskov substitution principle: "Functions that use pointers or references to base classes must be able to use objects of derived classes without knowing it."
- The Interface segregation principle: "A client should not be forced to implement an interface that it doesn’t use."
- The Dependency inversion principle: "Depend upon abstractions, not concretions."

## Code Formatters

Code formatters enforce coding style through automatic formatting and help to achieve and maintain clean code. Most of them allow you to create a style configuration file that you can share with your colleagues.

The most popular Python code formatters are:

- black
- flake8
- autopep8
- yapf

Most modern IDEs also include linters, which run in the background as you type and help to identify small coding mistakes, errors, dangerous code patterns and keep your code formatted. There are two types of linters: logical and stylistic.

The most popular Python linters are:

- Pylint
- PyFlakes
- mypy

> For more on linting and code formatting, review [Python Code Quality](https://testdriven.io/blog/python-code-quality/).

## Naming Conventions

One of the most important aspects of writing clean code is naming conventions. You should always use meaningful and intention-revealing names. It's always better to use long, descriptive names than short names with comments.

```bash
# This is bad
# represents the number of active users
au = 55

# This is good
active_user_amount = 55
```

We'll look at more examples in the next two sections.

## Variables

### 1. Use nouns for variable names

### 2. Use descriptive/intention-revealing names

Other developers should be able to figure out what a variable stores just by reading its name.

```python
# This is bad
c = 5
d = 12

# This is good
city_counter = 5
elapsed_time_in_days = 12
```

### 3. Use pronounceable names

You should always use pronounceable names; otherwise, you'll have a hard time explaining your algorithms out loud.

```python
from datetime import datetime

# This is bad
genyyyymmddhhmmss = datetime.strptime('04/27/95 07:14:22', '%m/%d/%y %H:%M:%S')

# This is good
generation_datetime = datetime.strptime('04/27/95 07:14:22', '%m/%d/%y %H:%M:%S')
```

### 4. Avoid using ambiguous abbreviations

Don't try to come up with your own abbreviations. It's better for a variable to have a longer name than a confusing name.

```python
# This is bad
fna = 'Bob'
cre_tmstp = 1621535852

# This is good
first_name = 'Bob'
creation_timestamp = 1621535852
```

### 5. Always use the same vocabulary

Avoid using synonyms when naming variables.

```python
# This is bad
client_first_name = 'Bob'
customer_last_name = 'Smith'

# This is good
client_first_name = 'Bob'
client_last_name = 'Smith'
```

### 6. Don't use "magic numbers"

Magic numbers are strange numbers that appear in code, which do not have a clear meaning. Let's take a look at an example:

```python
import random

# This is bad
def roll():
    return random.randint(0, 36)  # what is 36 supposed to represent?

# This is good
ROULETTE_POCKET_COUNT = 36

def roll():
    return random.randint(0, ROULETTE_POCKET_COUNT)
```

Instead of using magic numbers, we can extract them into a meaningful variable.

### 7. Use solution domain names

If you use a lot of different data types in your algorithm or class and you can't figure them out from the variable name itself, don't be afraid to add data type suffix to your variable name. For example:

```python
# This is good
score_list = [12, 33, 14, 24]
word_dict = {
    'a': 'apple',
    'b': 'banana',
    'c': 'cherry',
}
```

And here's a bad example (because you can't figure out the data type from the variable name):

```bash
# This is bad
names = ["Nick", "Mike", "John"]
```

### 8. Don't add redundant context

Do not add unnecessary data to variable names, especially if you're working with classes.

```python
# This is bad
class Person:
    def __init__(self, person_first_name, person_last_name, person_age):
        self.person_first_name = person_first_name
        self.person_last_name = person_last_name
        self.person_age = person_age

# This is good
class Person:
    def __init__(self, first_name, last_name, age):
        self.first_name = first_name
        self.last_name = last_name
        self.age = age
```

We're already inside the Person class, so there's no need to add a person_ prefix to every class variable.

## Functions

### 1. Use verbs for function names

### 2. Do not use different words for the same concept

Pick a word for each concept and stick to it. Using different words for the same concept will cause confusion.

```python
# This is bad
def get_name(): pass
def fetch_age(): pass

# This is good
def get_name(): pass
def get_age(): pass
```

### 3. Write short and simple functions

### 4. Functions should only perform a single task

If your function contains the keyword 'and' you can probably split it into two functions. Let's look at an example:

```python
# This is bad
def fetch_and_display_personnel():
    data = # ...

    for person in data:
        print(person)


# This is good
def fetch_personnel():
    return # ...

def display_personnel(data):
    for person in data:
        print(person)
```

Functions should do one thing and, as a reader, they do what you expect them to do.

A good rule of thumb is that any given function shouldn't take longer than a few minutes to comprehend. Go back and review some of your old code that you wrote a few months ago. You should probably refactor any function that takes longer than five minutes for you to understand. This is your code after all. Think about how long it will take another developer to understand.

### 5. Keep your arguments at a minimum

The arguments in your function should be kept to a minimum. Ideally, your functions should only have one to two arguments. If you need to provide more arguments to the function, you can create a config object which you pass to the function or split it into multiple functions.

Example:
```python
# This is bad
def render_blog_post(title, author, created_timestamp, updated_timestamp, content):
    # ...

render_blog_post("Clean code", "Nik Tomazic", 1622148362, 1622148362, "...")


# This is good
class BlogPost:
    def __init__(self, title, author, created_timestamp, updated_timestamp, content):
        self.title = title
        self.author = author
        self.created_timestamp = created_timestamp
        self.updated_timestamp = updated_timestamp
        self.content = content

blog_post1 = BlogPost("Clean code", "Nik Tomazic", 1622148362, 1622148362, "...")

def render_blog_post(blog_post):
    # ...

render_blog_post(blog_post1)
```

### 6. Don't use flags in functions

Flags are variables (usually booleans) passed to functions, which the function uses to determine its behavior. They are considered bad design because functions should only perform one task. The easiest way to avoid flags is to split your function into smaller functions.

```python
text = "This is a cool blog post."


# This is bad
def transform(text, uppercase):
    if uppercase:
        return text.upper()
    else:
        return text.lower()

uppercase_text = transform(text, True)
lowercase_text = transform(text, False)


# This is good
def uppercase(text):
    return text.upper()

def lowercase(text):
    return text.lower()

uppercase_text = uppercase(text)
lowercase_text = lowercase(text)
```

### 7. Avoid side effects

A function produces a side effect if it does anything other than take a value in and return another value or values. For example, a side effect could be writing to a file or modifying a global variable.

## Comments

No matter how hard we try to write clean code, there are still going to be parts of your program that need additional explanation. Comments allow us to quickly tell other developers (and our future selves) why we wrote it in the manner that we did. Keep in mind that adding too many comments can make your code messier than it would be without them.

What's the difference between code comments and documentation?

| Type  |  Answers |  Stakeholder |
|---|---|---|
| Documentation  |  When and How | Users  |
| Code Comments  |  Why |  Developers |
|  Clean Code |  What |  Developers |

### 1. Don't comment bad code, rewrite it

Commenting bad code -- i.e., # TODO: RE-WRITE THIS TO BE BETTER -- only helps you in the short term. Sooner or later one of your colleagues will have to work with your code and they'll end up rewriting it after spending multiple hours trying to figure out what it does.

### 2. Readable code doesn't need comments

If your code is readable enough you don't need comments. Adding useless comments will only make your code less readable. Here's a bad example:

```python
# This checks if the user with the given ID doesn't exist.
if not User.objects.filter(id=user_id).exists():
    return Response({
        'detail': 'The user with this ID does not exist.',
    })
```

As a general rule, if you need to add comments, they should explain "why" you did something rather than "what" is happening.

### 3. Don't add noise comments

Don't add comments that do not add anything of value to the code. This is bad:

```python
numbers = [1, 2, 3, 4, 5]

# This variable stores the average of list of numbers.
average = sum(numbers) / len(numbers)
print(average)
```

### 4. Use the correct types of comments

Most programming languages have different comment types. Learn their differences and use them accordingly. You should also learn the comment documentation syntax. A good example:

```python
def model_to_dict(instance, fields=None, exclude=None):
    """
    Returns a dict containing the data in ``instance`` suitable for passing as
    a Form's ``initial`` keyword argument.
    ``fields`` is an optional list of field names. If provided, return only the
    named.
    ``exclude`` is an optional list of field names. If provided, exclude the
    named from the returned dict, even if they are listed in the ``fields``
    argument.
    """
    opts = instance._meta
    data = {}
    for f in chain(opts.concrete_fields, opts.private_fields, opts.many_to_many):
        if not getattr(f, 'editable', False):
            continue
        if fields is not None and f.name not in fields:
            continue
        if exclude and f.name in exclude:
            continue
        data[f.name] = f.value_from_object(instance)
    return data
```

### 5. Don't leave commented out code

The worst thing you can do is to leave code commented out in your programs. All the debug code or debug messages should be removed before pushing to a version control system, otherwise, your colleagues will be scared of deleting it and your commented code will stay there forever.

## Decorators, Context Managers, Iterators, and Generators

In this section, we'll look at some Python concepts and tricks, which we can use to write better code.

### Decorators

Decorators are an extremely powerful tool in Python, which allows us to add some custom functionality to a function. At its core, they are just functions called inside functions. By using them we take advantage of the SoC (Separation of concerns) principle and make our code more modular. Learn them and you'll be on your way to Pythonic code!

Let's say we have a server, which is protected with a password. We could either ask for the password in every server method or create a decorator and protect our server methods like so:

```python
def ask_for_passcode(func):
    def inner():
        print('What is the passcode?')
        passcode = input()

        if passcode != '1234':
            print('Wrong passcode.')
        else:
            print('Access granted.')
            func()

    return inner


@ask_for_passcode
def start():
    print("Server has been started.")


@ask_for_passcode
def end():
    print("Server has been stopped.")


start()  # decorator will ask for password
end()  # decorator will ask for password
```

Our server will now ask for a password every time `start()` or `end()` is called.

### Context Managers

Context managers simplify how we interact with external resources, like files and databases. The most common usage is the `with` statement. The good thing about them is that they automatically deallocate memory outside of their block.

Let's look at an example:

```python
with open('wisdom.txt', 'w') as opened_file:
    opened_file.write('Python is cool.')

# opened_file has been closed.
Without a context manager our code would look like this:

file = open('wisdom.txt', 'w')
try:
    file.write('Python is cool.')
finally:
    file.close()
```

### Iterators

An iterator is an object that contains a countable number of values. Iterators allow an object to be iterated upon, which means that you can traverse through all the values.

Let's say we have a list of names and we want to loop through it. We can loop through it using next(names):

```python
names = ["Mike", "John", "Steve"]
names_iterator = iter(names)

for i in range(len(names)):
    print(next(names_iterator))
Or use an enhanced loop:

names = ["Mike", "John", "Steve"]

for name in names:
    print(name)
```

Inside of enhanced loops avoid using variable names like item or value because it makes it way harder to tell what a variable stores, especially in nested enhanced loops.

### Generators

A generator is a function in Python which returns an iterator object instead of one single value. The main difference between normal functions and generators is that generators use the yield keyword instead of return. Each next value in the iterator is fetched using next(generator).

Let's say we want to generate the first n multiples of x. Our generator would look something like this:

```python
def multiple_generator(x, n):
    for i in range(1, n + 1):
        yield x * i

multiples_of_5 = multiple_generator(5, 3)
print(next(multiples_of_5))  # 5
print(next(multiples_of_5))  # 10
print(next(multiples_of_5))  # 15
```

### Modularity and Classes

In order to keep your code as organized as possible, you should split it into multiple files which are then split up into different directories. If you're writing code in an OOP-oriented language you should also follow basic OOP principles like encapsulation, abstraction, inheritance, and polymorphism.

Splitting code into multiple classes will make your code easier to understand and maintain. There is no fixed rule on how long a file or a class should be, but try your best to keep them small (preferably under 200 lines).

Django's default project structure is a good example of how your code should be structured:

```bash
awesomeproject/
├── main/
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── blog/
│   ├── migrations/
│   │   └── __init__.py
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
└── templates
```

Django is an MTV (Model - Template - View) framework, which is similar to an MVC framework that we discussed earlier. This pattern divides program logic into three interconnected parts. You can see that each app is in a separate directory and each file serves one specific thing. If your project is split into multiple apps, you should make sure that the apps don't depend too much on each other.

## Testing

Quality software doesn't come without tests. Testing software allows us to discover bugs and errors in the software before it is deployed. Tests are of the same importance as production code and you should spend a fair amount of time working on them.
