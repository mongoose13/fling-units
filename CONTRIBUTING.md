# Contributing to Fling

First off, thanks for taking the time to contribute! 

All types of contributions are encouraged and valued. See the [Table of Contents](#table-of-contents) for different ways to help and details about how this project handles them. Please make sure to read the relevant section before making your contribution. It will make it a lot easier for us maintainers and smooth out the experience for all involved. The community looks forward to your contributions. 

And if you like the project, but just don't have time to contribute, that's fine. There are other easy ways to support the project and show your appreciation, which we would also be very happy about:

> - Star the project
> - Refer this project in your project's readme
> - Mention the project on social media, at local meetups, and with your friends/colleagues

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [I Have a Question](#i-have-a-question)
- [I Want To Contribute](#i-want-to-contribute)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Enhancements](#suggesting-enhancements)
- [Your First Code Contribution](#your-first-code-contribution)
- [Improving The Documentation](#improving-the-documentation)

## Code of Conduct

This project and everyone participating in it is governed by the
[Code of Conduct].
By participating, you are expected to uphold this code. Please report unacceptable behavior
to the [Project Lead].

## I Have a Question

> If you want to ask a question, we assume that you have read the available [Documentation].

Before you ask a question, it is best to search for existing [Issues] that might help you. In case you have found a suitable issue and still need clarification, you can write your question in this issue. It is also advisable to search the internet for answers first.

If you then still feel the need to ask a question and need clarification, we recommend the following:

- [Open an Issue].
- Provide as much context as you can about what you're running into.
- Provide project and platform versions (Dart, OS, target platform), depending on what seems relevant.

We will then take care of the issue as soon as possible.

## I Want To Contribute

> ### Legal Notice

> When contributing to this project, you must agree that you have authored 100% of the content, that you have the necessary rights to the content and that the content you contribute may be provided under the [Project License].

### Reporting Bugs

#### Before Submitting a Bug Report

A good bug report shouldn't leave others needing to chase you up for more information. Therefore, we ask you to investigate carefully, collect information and describe the issue in detail in your report. Please complete the following steps in advance to help us fix any potential bug as fast as possible.

- Make sure that you are using the latest version.
- Determine if your bug is really a bug and not an error on your side e.g. using incompatible environment components/versions (Make sure that you have read the [documentation]. If you are looking for support, you might want to check [this section](#i-have-a-question)).
- To see if other users have experienced (and potentially already solved) the same issue you are having, check if there is not already a bug report existing for your bug or error in the [bug tracker].
- Also make sure to search the internet (including Stack Overflow) to see if users outside of the GitHub community have discussed the issue.
- Collect information about the bug:
- Stack trace (Traceback)
- OS, Platform and Version (Windows, Linux, macOS, x86, ARM)
- Version of the interpreter, compiler, SDK, runtime environment, package manager, depending on what seems relevant.
- Possibly your input and the output
- Can you reliably reproduce the issue? And can you also reproduce it with older versions?

#### How Do I Submit a Good Bug Report?

> You must never report security related issues, vulnerabilities or bugs including sensitive information to the issue tracker, or elsewhere in public. Instead sensitive bugs must be sent by email to the [Project Lead].

We use GitHub issues to track bugs and errors. If you run into an issue with the project:

- [Open an Issue]. (Since we can't be sure at this point whether it is a bug or not, we ask you not to talk about a bug yet and not to label the issue.)
- Explain the behavior you would expect and the actual behavior.
- Please provide as much context as possible and describe the *reproduction steps* that someone else can follow to recreate the issue on their own. This usually includes your code. For good bug reports you should isolate the problem and create a reduced test case.
- Provide the information you collected in the previous section.

Once it's filed:

- The project team will label the issue accordingly.
- A team member will try to reproduce the issue with your provided steps. If there are no reproduction steps or no obvious way to reproduce the issue, the team will ask you for those steps and mark the issue as `needs-repro`. Bugs with the `needs-repro` tag will not be addressed until they are reproduced.
- If the team is able to reproduce the issue, it will be marked `needs-fix`, as well as possibly other tags (such as `critical`), and the issue will be left to be [implemented by someone](#your-first-code-contribution).

### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion for the project, **including completely new features and minor improvements to existing functionality**. Following these guidelines will help maintainers and the community to understand your suggestion and find related suggestions.

#### Before Submitting an Enhancement

- Make sure that you are using the latest version.
- Read the [Documentation] carefully and find out if the functionality is already covered, maybe by an individual configuration.
- Perform a search of the existing [Issues] to see if the enhancement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one.
- Find out whether your idea fits with the scope and aims of the project. It's up to you to make a strong case to convince the project's developers of the merits of this feature. Keep in mind that we want features that will be useful to the majority of our users and not just a small subset. If you're just targeting a minority of users, consider writing an add-on/plugin library.

#### How Do I Submit a Good Enhancement Suggestion?

Enhancement suggestions are tracked as GitHub [Issues].

- Use a **clear and descriptive title** for the issue to identify the suggestion.
- Provide a **step-by-step description of the suggested enhancement** in as many details as possible.
- **Describe the current behavior** and **explain which behavior you expected to see instead** and why. At this point you can also tell which alternatives do not work for you.
- You may want to **include screenshots and animated GIFs** which help you demonstrate the steps or point out the part which the suggestion is related to. You can use [this tool](https://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [this tool](https://github.com/colinkeenan/silentcast) or [this tool](https://github.com/GNOME/byzanz) on Linux. 
- **Explain why this enhancement would be useful** to most users. You may also want to point out the other projects that solved it better and which could serve as inspiration.

### Code Contributions

#### Your First Code Contribution

Please let the [Project Lead] know you are interested in contributing code *before* starting on something. This gives the lead a chance to discuss your approach to solving the problem and ensures your work will be accepted quickly. The relevant issue should be assigned to you before you begin to make sure nobody else is working on the same thing unknowingly.

Existing issues that should not require too deep of an understanding of the project are tagged with **[good first issue]**. If you're looking to get a feel for the project's code base, this is a good place to start. If you have an issue you'd like to work on, feel free to ask about it instead.

#### Code Quality and Security

Automated tests will evaluate the project's code base with each commit. To maintain the trust of our consumers, we need to respect these results.

When submitting a Pull Request, the tests will run and let you know if your commit reveals any issues. Please correct any issues before requesting a review.

In general, the automation will ensure:

- the tests all pass
- the example runs successfully
- [pub.dev](https://pub.dev) grants full points

You can run these tests yourself as you are working:

> $> make test
> $> make example
> $> make pana

### Improving the Documentation

Documentation improvements are tracked the same way as code contributions. You can find open documentation gaps by searching [documentation issues].

## Attribution

This guide is based on the **contributing.md**. [Make your own](https://contributing.md/)!

[Project Lead]: https://github.com/mongoose13 "Bruce Santier's GitHub profile"
[Code of Conduct]: https://www.contributor-covenant.org/version/2/1/code_of_conduct/ "Contributor Covenant 2.1"
[Documentation]: https://github.com/mongoose13/fling-units/wiki "Fling Units wiki"
[documentation issues]: https://github.com/mongoose13/fling-units/labels/documentation "Issues tagged with 'documentation'"
[Issues]: https://github.com/mongoose13/fling-units/issues "All open issues"
[bug tracker]: https://github.com/mongoose13/fling-units/labels/bug "Issues tagged with 'bug'"
[Open an Issue]: https://github.com/mongoose13/fling-units/issues/new "Create a new issue"
[good first issue]: https://github.com/mongoose13/fling-units/labels/good%20first%20issue "Issues tagged with 'good first issue'"
[Project License]: https://github.com/mongoose13/fling-units/blob/master/LICENSE "The project's license"
