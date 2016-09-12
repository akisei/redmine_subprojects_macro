# Subprojects macro plugin for Redmine

This plugin adds the macro to indicate a subprojects list.

# Installation

From your Redmine plugins directory, clone this repository.

```
git clone https://github.com/akisei/redmine_subprojects_macro.git
```

Restart Redmine.

# Usage

Please type the following on wiki.

```
{{subprojects}} # same as {{subprojects(0)}}
```
e.g.
* subproject_1
* subproject_2
* ...

Can you specify the depth of the hierarchy in the argument. (from 0.0.2)

```
{{subprojects(1)}}
```
e.g.
* subproject_1
  * subproject_1_1
  * subproject_1_2
* ...

# License

MIT
