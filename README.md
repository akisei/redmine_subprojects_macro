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
{{subprojects}} # same as {{subprojects(depth=0)}}
```
e.g.
* subproject_1
* subproject_2
* ...

Can you specify the depth in the argument. (from v0.0.2)

```
{{subprojects(depth=2)}}
```
e.g.
* subproject_1
  * subproject_1_1
    * subproject_1_1_1
    * subproject_1_1_2
  * subproject_1_2
    * subproject_2_1_1
* ...

# License

MIT
