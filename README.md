# Cucumber + Ruby Automation Portfolio

UI automation project using **Cucumber**, **Ruby**, **Capybara** and **Selenium**, demonstrating BDD testing practices against the [SauceDemo](https://www.saucedemo.com) e-commerce application.

## Tech Stack

| Tool | Purpose |
|------|---------|
| [Cucumber](https://cucumber.io/) | BDD framework — tests written in Gherkin |
| [Ruby](https://www.ruby-lang.org/) | Programming language |
| [Capybara](https://teamcapybara.github.io/capybara/) | Browser interaction DSL |
| [Selenium WebDriver](https://www.selenium.dev/) | Browser automation |
| [RSpec](https://rspec.info/) | Assertions and matchers |
| [GitHub Actions](https://github.com/features/actions) | CI/CD pipeline |

## Project Structure

```
cucumber-ruby-saucedemo/
├── features/
│   ├── pages/                    # Page Object Model classes
│   │   ├── login_page.rb
│   │   ├── inventory_page.rb
│   │   ├── cart_page.rb
│   │   └── checkout_page.rb
│   ├── step_definitions/         # Gherkin step implementations
│   │   ├── login_steps.rb
│   │   ├── inventory_steps.rb
│   │   ├── cart_steps.rb
│   │   └── checkout_steps.rb
│   ├── support/
│   │   ├── env.rb                # Environment configuration
│   │   └── hooks.rb              # Before/After hooks
│   ├── login.feature
│   ├── inventory.feature
│   ├── cart.feature
│   └── checkout.feature
├── .github/workflows/
│   └── cucumber.yml              # CI/CD pipeline
├── Gemfile                       # Ruby dependencies
└── cucumber.yml                  # Cucumber profiles
```

## Environment Setup

### 1. Install Ruby

**Windows:**
- Go to [rubyinstaller.org](https://rubyinstaller.org/downloads/)
- Download **Ruby+Devkit 3.2.x (x64)**
- Run the installer — check all options including MSYS2
- At the end, run `ridk install` and choose option 3

**Mac:**
```bash
brew install ruby
```

**Linux:**
```bash
sudo apt-get install ruby-full
```

Verify installation:
```bash
ruby -v    # Should show 3.x.x
gem -v     # Should show gem version
```

### 2. Install Google Chrome

Make sure Google Chrome is installed on your machine. Download from [google.com/chrome](https://www.google.com/chrome/).

### 3. Clone and install dependencies

```bash
git https://github.com/gugamartinho/saucedemo_cucumber_ruby.git
cd cucumber-ruby-saucedemo

gem install bundler
bundle install
```

### 4. Create screenshots folder

```bash
mkdir screenshots
```

---

## Running Tests

### Run all tests
```bash
bundle exec cucumber
```

### Run in headless mode (no browser window)
```bash
bundle exec cucumber --profile headless
```

### Run a specific feature file
```bash
bundle exec cucumber features/login.feature
bundle exec cucumber features/inventory.feature
bundle exec cucumber features/cart.feature
bundle exec cucumber features/checkout.feature
```

### Run a specific scenario by name
```bash
bundle exec cucumber --name "Login with valid credentials"
```

### Run scenarios by tag
```bash
bundle exec cucumber --tags @smoke
bundle exec cucumber --tags @regression
```

---

## Test Coverage

| Feature | Scenarios |
|---------|-----------|
| Login | Valid login, locked user, invalid credentials, empty username, empty password |
| Inventory | Product count, add to cart, multiple items, sorting (4 options), logout |
| Cart | Empty cart, show added items, remove item, proceed to checkout |
| Checkout | Full E2E flow, missing fields (3), cancel, order summary |

**Total: 23 scenarios**
