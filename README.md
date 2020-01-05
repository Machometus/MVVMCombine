<h3 align="center">
  <a href="https://github.com/Machometus/MVVMCombine" target="_blank">
    <img src="https://github.com/Machometus/MVVMCombine/blob/master/docs/img/header.png?raw=true" alt="MVVMCombine Logo" />
  </a>
</h3>

# MVVMCombine

Better apps. Less code. Get the most out of SwiftUI using MVVMCombine!

Build clean, pixel perfect, and declarative UIs, using the Model-View-ViewModel-Coordinator (MVVM-C) design pattern. MVVMCombine is a framework specifically developed for Apple’s newest framework Combine, alongside SwiftUI, that provides logical streams as the core of Functional Reactive Programming (FRP), with a declarative Swift syntax that’s easy to read and natural to write. 

Now with MVVMCombine, the view model is responsible for exposing the data objects from the model in such a way that objects are easily managed and presented. In this respect, the view model is more model than view, and handles most if not all of the view's display logic, and navigation behaviour via coordinators.

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [Features](#features)
* [Getting Started](#getting-started)
    * [Requirements](#requirements)
    * [Installation](#installation)
* [How It Works](#how-it-works)
    * [Architecture](#architecture)
    * [Advantages](#advantages)
* [Usage](#usage)
    * [Dependency Injection](#dependency-injection)
    * [MVVM Flow](#mvvm-flow)
    * [List Cells](#list-cells)
    * [Coordinators](#coordinators)
    * [Inputs](#inputs)
* [Demo](#demo)
    * [**BEFORE YOU RUN**](#before-you-run)
    * [Coordinator Hierarchy](#coordinator-hierarchy)
* [To Do](#to-do)
* [Credits](#credits)
* [License](#license)
* [Author](#author)

<!-- FEATURES -->
## Features

- Dependency Injection using property wrappers
- Dynamically register, resolve, or inject services
- Dynamically register and inject view models for each view
- Manage view's lifecycle within its corresponding view model
- Coordinate view's navigation by view model coordinators
- Coordinators for root views, links, sheets, and tab items
- Dynamic callable view model output factory
- Dynamic member lookup view model inputs
- Bind list custom cell views to view items
- [Complete Documentation](https://machometus.github.io/MVVMCombine)

<!-- GETTING STARTED -->
### Getting Started

<!-- REQUIREMENTS -->
### Requirements

- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+
- Xcode 11.0+
- Swift 5+

<!-- INSTALLATION -->
### Installation
#### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate MVVMCombine into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'MVVMCombine'
```

<!-- HOW IT WORKS -->
## How It Works

<!-- ARCHITECTURE -->
### Architecture

The following diagram illustrates the basic archtictecture of Model-View-ViewModel-Coordinator (MVVM-C) design pattern:

<h3 align="center">
    <img src="https://github.com/Machometus/MVVMCombine/blob/master/docs/img/architecture.png?raw=true" alt="MVVM-C Architecture" />
</h3>

- **Model:** refers either to a domain model, which represents real state content (an object-oriented approach), or to the data access layer, which represents content.
- **View:** a structure, layout, and appearance of what a user sees on the screen. It displays a representation of the model and receives the user's interaction with the view (clicks, keyboard, gestures, etc.), and it forwards the handling of these to the view model via the data binding (properties, event callbacks, etc.) that is defined to link the view and view model.
- **View model:** an abstraction of the view exposing public properties and commands. Instead of the controller of the MVC pattern, or the presenter of the MVP pattern, MVVM has a binder, which automates communication between the view and its bound properties in the view model. The view model has been described as a state of the data in the model.
- **Coordinator:** responsible for handling navigation flow, decides when and where to go based on events from ViewModel fired from its corresponding view.

For detailed information about MVVM-C iOS architecture. Please, refer to the following [tutorial](https://medium.com/sudo-by-icalia-labs/ios-architecture-mvvm-c-introduction-1-6-815204248518).

<!-- ADVANTAGES -->
### Advantages

Here are some advantages of using MVVM-C archtictecture:

- A clean separation of different kinds of code should make it easier to go into one or several of those more granular and focused parts and make changes without worrying.
- With MVVM each piece of code is more granular and if it is implemented right your external and internal dependences are in separate pieces of code from the parts with the core logic that you would like to test. That makes it a lot easier to write unit tests against a core logic.
- You have a better chance of making any of those parts more reusable.
- Coordinator simplifies the navigation logic and data sharing between view models.

<!-- USAGE -->
## Usage

<!-- DEPENDENCY INJECTION -->
### Dependency Injection

Register all services used in the project, by subclassing `MwxServices`, and overriding `registerServices()`.

Register each service as follows:

```swift
Mwx.register(BackendService.init).as(BackendProtocol.self).lifeCycle(.weakSingle)
```
Where `lifeCycle` could be either `single`, `prototype`, `weakSingle`, or `objectGraph`.

In order to resolve a service:

```swift
let backendService = Mwx.resolve(BackendProtocol.self)
```
And to inject it as instance property, use `@Service` as follows:

```swift
@Service var backendService: BackendProtocol
```

<!-- MVVM FLOW -->
### MVVM Flow

Let all views conform to `MwxView`, and declare `vm` property, to inject its corresponding view model, using `@ViewModel`, as follows:

```swift
struct HomeView: MwxView
```

```swift
@ViewModel var vm: HomeViewModel
```

Let the view model conform to `MwxObservableViewModel`, and determine its view as a generic type, as follows:

```swift
class HomeViewModel: MwxObservableViewModel<HomeView>
```

Let the body view always be wrapped by a `MwxNavigationBody` if navigation view should be used, `MwxTabBody` if tab view should be used, otherwise just `MwxBody`, and let be bound to its `vm` to synchronize the view and its view model lifecycle `didAppear`, and `didDisappear`, as follows:

```swift
var body: some View {
    MwxNavigationBody {
        Text("Hello World!")
    }
    .bind(to: vm)
}
```

Once this is done, you can now override view model lifecycle, as follows:

```swift
override func didLoad() {
}

override func didAppear() {
}

override func didDisappear() {
}
```

<!-- LIST CELLS -->
### List Cells

Let your list rows conform to `MwxCell`, and declare `item` property, to determine its corresponding view item, using `@ViewItem`, as follows:

```swift
struct ListCell: MwxCell
```

```swift
@ViewItem var item: ListViewItem
```

Let the view item conform to `MwxViewItem`, as follows:

```swift
class ListViewItem: MwxViewItem
```

<!-- COORDINATORS -->
### Coordinators

In order to create a new coordinator, determine its view model, and presentation style. Currently 4 presentations are supported, `root`, `tab`, `link`, or `sheet`. Declare `MwxCoordinator`, as follows:

```swift
let detail = DetailViewModel.link(self)
```

For tab coordinators, override `func tabs() -> [MwxTab]` in the view model, to determine which tab are to be coordinated, and to generate corresponding tab items, as follows:

```swift
let home = HomeViewModel.tab(self)
let contact = ContactViewModel.tab(self)

override func tabs() -> [MwxTab] {
    return [
        home,
        contact
    ]
}
```

For link and sheet coordinators, determine the view which is to be coordinated by this link or sheet, as follows:

```swift
Text("Link here!").coordinated(by: vm.detail)
```

In order to show link and sheet coordinators, use `show()` in the view model, use `pop()` to deactivate a link, and `dismiss()` to deactivate a sheet(), as follows:

```swift
func showDetail() {
    detail.show()
}
```

```swift
func save() {
    pop()
}
```

In order to declare a callback, when coordinator is deactivated, use `onDisappear: (() -> Void)` closure, as follows:

```swift
let detail = DetailViewModel
                    .sheet(self)
                    .onDisappear {
                        print("Sheet Dismissed!")
                    }
```

<!-- INPUTS -->
### Inputs

Build view model input using output property, `MwxOutput` is a dynamic callable, so you can dynamically declare input keys, as follows:

```swift
let input = output(name: "Mike",
                    job: "Engineer")
```

Pass inputs to view models, within its coordinator declaration, as follows:

```swift
let detail = DetailViewModel
                    .sheet(self)
                    .with(input)
                    .onDisappear {
                        print("Sheet Dismissed!")
                    }
```

Alternatively, you could pass it while showing link or sheet coordinators, as follows:

```swift
func showDetail() {
    detail.show(with: input)
}
```

Finally, resolve and get any input value for given key, using dynamic member lookup, inside the view model, as follows:

```swift
override func didAppear() {
    if let name = input.name {
    }
}
```

For tab coordinators, title and image keys are obligatory on their inputs, to render the title and image of its corresponding tab item, as follows:

```swift
var contactInput: MwxInput {
    output(title: "Contact",
           image: "contact")
}

ContactViewModel
            .tab(self)
            .with(contactInput)
```

<!-- DEMO -->
## Demo

Unicorn is a sample demo, summarizes MVVMCombine main features. Basically, you add, edit, and delete unicorns. Tabs, Link, sheet coordinators are used in the demo.

<p align="center">
<img src="https://github.com/Machometus/MVVMCombine/blob/master/docs/img/sample.gif?raw=true" alt="MyUnicornGiF" width="300"/>
</p>

<!-- BEFORE YOU RUN -->
### BEFORE YOU RUN

Before running this demo. Please, go to [crudcrud](https://crudcrud.com/), and copy your special API secret shown in your REST endpoint, then paste it in the `secret` getter property in `DataUrlService`.

**This is very important, so that backend API's work!**

<!-- COORDINATOR HIERARCHY -->
### Coordinator Hierarchy

The following diagram illustrates coordinators hierarchy managing view navigation within the sample demo:

<h3 align="center">
    <img src="https://github.com/Machometus/MVVMCombine/blob/master/docs/img/hierarchy.png?raw=true" alt="Coordinator Hierarchy" />
</h3>


<!-- TO DO -->
## To Do

- Automatic view model registry on runtime
- Automatic view to view model lookup on runtime
- Support custom coordinators
- Support view model publisher inputs
- Provide array to list/form adapters
- Provide dynamic styling engine
- Provide coordinators for iPad split views

<!-- Credits -->
## Credits

I would like to thank:

- [crudcrud](https://crudcrud.com/), for using their wonderful service, to build dynamic CRUD operations with no back-end code!
- [LiteCode](https://github.com/LiteCode), for their wonderful [SwiftDI](https://github.com/LiteCode/SwiftDI), for Dependency Injection using `@propertyWrapper`!

<!-- LICENSE -->
## License

MVVMCombine is released under the MIT license. [See LICENSE](https://github.com/Machometus/MVVMCombine/blob/master/LICENSE) for details.

<!-- AUTHOR -->
## Author

Mohamed Salem

- [LinkedIn](https://eg.linkedin.com/in/machometus)
- [Xing](https://www.xing.com/profile/Mohamed_Salem19/cv)
- [Twitter](https://twitter.com/MSalemsson)
