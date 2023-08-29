
# Step by step how to replicate it:

# Step 1: Setting Up a New Solution and Projects in Visual Studio

Objective:

We're going to create a new Visual Studio solution with two projects:

1 . A .NET Standard 2.0 Class Library for our calculator logic.

2 . A WPF App targeting .NET Framework 4.8 which will consume the class library.

Actions:

1 . ***Open Visual Studio:*** Start Visual Studio on your machine.

2 . ***Create a New Project:***
* Click on Create a new project.
* In the "Search for templates" box, type Class Library.
* From the results, choose **'Class Library (.NET Standard)'.** Click Next.
* Name the project **'SimpleCalculatorLib'** and set a suitable location. Click **'Create'**.

3 . ***Target .NET Standard 2.0:***
* In the Solution Explorer, right-click on **'SimpleCalculatorLib'** project, and choose **'Properties'**.
* In the opened tab, find the dropdown for "Target framework" and select **'.NET Standard 2.0'**
* Save and close the properties tab.

4 . ***Add WPF App Project:***
* In the Solution Explorer, right-click on the solution (it should be at the top and might be named after your class library by default).
* Choose **'Add'** and then **'New Project'**.
* In the "Search for templates" box, type **'WPF App'**.
* Choose **'WPF App (.NET Framework)'**. Click **'Next'**.
* Name this project **'CalculatorApp'**. Click **'Create'**.

5 . ***Reference Class Library in WPF App:***
* In Solution Explorer, right-click on the **'CalculatorApp'** project.
* Select **'Add'** and then **'Reference'**.
* Under **'Projects'**, you should see **'SimpleCalculatorLib'**. Check the checkbox next to it and click **'OK'**.

By the end of this step:
* You will have a solution with two projects.
* SimpleCalculatorLib is your .NET Standard 2.0 class library.
* CalculatorApp is your WPF app that references the class library.

# Step 2: Implementing the Calculator Logic in the .NET Standard Library

Objective:

We will create simple mathematical functions in the SimpleCalculatorLib class library. This will serve as the backend logic that the WPF application will utilize.

Actions:

1 . ***Creating the Calculator Class:***
* In the Solution Explorer, under the **'SimpleCalculatorLib'** project, right-click on the **'Class1.cs'** file, choose Rename, and rename it to **'Calculator.cs'**.

2 . Implementing the Calculator Logic:
* Open the **'Calculator.cs** file.
* Replace its contents with the following code:
```
namespace SimpleCalculatorLib
{
    public static class Calculator
    {
        public static double Add(double a, double b)
        {
            return a + b;
        }

        public static double Subtract(double a, double b)
        {
            return a - b;
        }

        public static double Multiply(double a, double b)
        {
            return a * b;
        }

        public static double Divide(double a, double b)
        {
            if (b == 0)
                throw new System.DivideByZeroException();
            
            return a / b;
        }
    }
}
```

This code defines a static **'Calculator'** class with four methods: **'Add'**, **'Subtract'**, **'Multiply'**, and **'Divide'**. The Divide method also includes a check to prevent division by zero.

Build the Library:
* In the Solution Explorer, right-click on the **'SimpleCalculatorLib'** project and select **'Build'** to ensure that the project compiles without errors.

By the end of this step:

* You'll have a class library **('SimpleCalculatorLib')** that provides basic arithmetic operations.
* The class library can be utilized by any .NET project that references it, including our upcoming WPF application.

#
***Little addition:***

In my file once that I tried to build, I got an 2 error. To fix it go to:
* CalculatorApp - Properties - AssemblyInfo.cs
The following lines where the reason of my error: 
```
[assembly: AssemblyCompany("CIO\G6")]
[assembly: AssemblyCopyright("Copyright © CIO\G6 2023")]
```
To fix it just change the character \ to &. 
#


# Step 3: Designing the WPF Application's User Interface

Objective:

We're going to design a basic interface for the **'CalculatorApp'** WPF project. This interface will allow users to enter two numbers, choose an operation, and view the result.

Actions:
1 . ***Open MainWindow.xaml:***
* In the Solution Explorer, under the **'CalculatorApp'** project, double-click on **'MainWindow.xaml'**. This file is where we'll design our user interface.

2 . ***Designing the User Interface:***
* Replace the content of the **'MainWindow.xaml'** file with the following XAML code:
```
<Window x:Class="CalculatorApp.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Simple Calculator" Height="250" Width="400">
    <Grid>
        <!-- Define rows for our layout -->
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/> <!-- This is for the "Result" label -->
            <RowDefinition Height="Auto"/> <!-- This is for the actual result value -->
        </Grid.RowDefinitions>

        <!-- Define columns for our layout -->
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="*"/>
            <ColumnDefinition Width="2*"/>
        </Grid.ColumnDefinitions>

        <!-- Number 1 TextBox -->
        <TextBlock Grid.Row="0" Grid.Column="0" HorizontalAlignment="Right" VerticalAlignment="Center" Margin="5">Number 1:</TextBlock>
        <TextBox x:Name="Number1TextBox" Grid.Row="0" Grid.Column="1" Margin="5"/>

        <!-- Number 2 TextBox -->
        <TextBlock Grid.Row="1" Grid.Column="0" HorizontalAlignment="Right" VerticalAlignment="Center" Margin="5">Number 2:</TextBlock>
        <TextBox x:Name="Number2TextBox" Grid.Row="1" Grid.Column="1" Margin="5"/>

        <!-- Operation ComboBox -->
        <TextBlock Grid.Row="2" Grid.Column="0" HorizontalAlignment="Right" VerticalAlignment="Center" Margin="5">Operation:</TextBlock>
        <ComboBox x:Name="OperationComboBox" Grid.Row="2" Grid.Column="1" Margin="5">
            <ComboBoxItem>Add</ComboBoxItem>
            <ComboBoxItem>Subtract</ComboBoxItem>
            <ComboBoxItem>Multiply</ComboBoxItem>
            <ComboBoxItem>Divide</ComboBoxItem>
        </ComboBox>

        <!-- Calculate Button -->
        <Button Content="Calculate" Grid.Row="3" Grid.ColumnSpan="2" Margin="5" Click="CalculateButton_Click"/>

        <!-- Result Label -->
        <TextBlock Grid.Row="4" Grid.ColumnSpan="2" HorizontalAlignment="Center" FontWeight="Bold" Margin="5">Result:</TextBlock>

        <!-- Result Value -->
        <TextBlock x:Name="ResultTextBlock" Grid.Row="5" Grid.ColumnSpan="2" HorizontalAlignment="Center" FontSize="18" Margin="5"/>

    </Grid>
</Window>
```

This XAML code sets up the following interface elements:

* Two **'TextBox'** controls for inputting numbers.
* A **'ComboBox'** for choosing an arithmetic operation.
* A **'Button'** that will trigger the calculation.
* Two **'TextBlock'** controls: one for the "Result" label and another to display the result.

Setting Up Event Handler:

* You might notice the **'Click="CalculateButton_Click"'** attribute on the **'Button'** element. This denotes an event handler that will be triggered when the button is clicked. We will define the logic for this event in the next step.

By the end of this step:
You'll have a simple WPF user interface ready to accept inputs and perform calculations using the **'SimpleCalculatorLib'**.

# Step 4: Implementing Calculation Logic in WPF Application

Objective:

Connect the WPF interface to the **'SimpleCalculatorLib'** so that when the "Calculate" button is clicked, the chosen arithmetic operation is executed using the provided input numbers.

Actions:

1 . ***Open MainWindow.xaml.cs:***
* In the Solution Explorer, under the **'CalculatorApp'** project, double-click on **'MainWindow.xaml.cs'**. This is where we'll be writing our C# code for the logic.

2 . ***Add Using Directive:***
* At the top of the file, right below the existing **'using'** statements, add the following line to reference our class library:
```
using SimpleCalculatorLib;
```
3 . ***Implement the CalculateButton_Click Event:***
* In the **'MainWindow.xaml.cs'** file, implement the **'CalculateButton_Click'** event handler like this:
```
private void CalculateButton_Click(object sender, RoutedEventArgs e)
{
    try
    {
        double number1 = double.Parse(Number1TextBox.Text);
        double number2 = double.Parse(Number2TextBox.Text);
        double result;

        switch (OperationComboBox.SelectedItem)
        {
            case ComboBoxItem item when item.Content.ToString() == "Add":
                result = Calculator.Add(number1, number2);
                break;
            case ComboBoxItem item when item.Content.ToString() == "Subtract":
                result = Calculator.Subtract(number1, number2);
                break;
            case ComboBoxItem item when item.Content.ToString() == "Multiply":
                result = Calculator.Multiply(number1, number2);
                break;
            case ComboBoxItem item when item.Content.ToString() == "Divide":
                result = Calculator.Divide(number1, number2);
                break;
            default:
                throw new InvalidOperationException("Unknown operation selected.");
        }

        ResultTextBlock.Text = result.ToString();
    }
    catch (Exception ex)
    {
        MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
    }
}
```
Here's the full **'MainWindow.xaml.cs'** file: 
```
using System;
using System.Windows;
using System.Windows.Controls;
using SimpleCalculatorLib;  // Added this reference to utilize our library

namespace CalculatorApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void CalculateButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Parse the values from the TextBoxes
                double number1 = double.Parse(Number1TextBox.Text);
                double number2 = double.Parse(Number2TextBox.Text);
                double result;

                // Determine the operation from the ComboBox and calculate the result
                switch (OperationComboBox.SelectedItem)
                {
                    case ComboBoxItem item when item.Content.ToString() == "Add":
                        result = Calculator.Add(number1, number2);
                        break;
                    case ComboBoxItem item when item.Content.ToString() == "Subtract":
                        result = Calculator.Subtract(number1, number2);
                        break;
                    case ComboBoxItem item when item.Content.ToString() == "Multiply":
                        result = Calculator.Multiply(number1, number2);
                        break;
                    case ComboBoxItem item when item.Content.ToString() == "Divide":
                        result = Calculator.Divide(number1, number2);
                        break;
                    default:
                        throw new InvalidOperationException("Unknown operation selected.");
                }

                // Display the result
                ResultTextBlock.Text = result.ToString();
            }
            catch (Exception ex)
            {
                // Show an error message for any exceptions
                MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
```

This event handler performs the following actions:

* Parses the values from the **'TextBox'** controls.
* Determines the selected operation from the **'ComboBox'**.
* Calls the respective calculation method from the **'SimpleCalculatorLib'** based on the chosen operation.
* Displays the result in the **'ResultTextBlock'**.
* If any error occurs (like a divide by zero or invalid input), it will show an error message.

4 . Build and Run the Application:
* Save the changes.
* In the Solution Explorer, right-click on the **'CalculatorApp'** project and select Build.
* Once built successfully, press **'F5'** or click on the green "Start" arrow at the top to run the application.

#
If you get errors on this step make sure that **'SimpleCalculatorLib'** its referenced on **'CalculatorApp'**, to make sure that it's, go to ***'CalculatorApp'**, rigth click, go to **'Add'** and then to **'Reference'**. Then click on **'Projects'**, select **'SimpleCalculatorLib'**, and click ok. 
#
Another issue that we may encounter its that the programm can run because most likelly we attempted to run the class library instead of the WPF application. We cannot run a class library directly since it does not have an entry point to execute. Instead, we need to ensure we're running the WPF application that references the library.

***Set WPF Project as Startup:***
* In the Solution Explorer, right-click on the **'CalculatorApp'** project (not the **'SimpleCalculatorLib'** library).
* From the context menu, select Set as Startup Project.

***Run the Application:***
* Now, press **'F5'** or click on the green "Start" arrow at the top to run the **'CalculatorApp'** WPF application.
#
By the end of this step:
* Your WPF application will be able to accept two numbers, let the user select an arithmetic operation, and when the "Calculate" button is clicked, it will show the result using the **'SimpleCalculatorLib'**.

# Summarize and Implications:
What we've achieved:

1 . ***Library Conversion to .NET 6.0:*** We've successfully converted a class library to .NET 6.0, making it cross-platform compatible.

2 . ***WPF App Interoperability:*** The WPF application targeting .NET Framework 4.8 can effectively communicate with the .NET 6.0 class library. This was achieved through the use of .NET Standard 2.0 as a bridge between the two.

3 . ***User-Friendly Demo:*** Created a simple calculator UI that performs basic arithmetic operations, demonstrating the functionality of the .NET 6.0 library.

Implications for Larger Projects:

1 . ***Migration Complexity:*** For more complex applications, moving to .NET 6.0 (or later versions) may be challenging, especially if they heavily rely on libraries or APIs that don't have direct equivalents in .NET 6.0 or are not compliant with .NET Standard.

2 . ***Performance:*** Testing is vital when migrating. While .NET 6.0 offers performance improvements in many areas, it's essential to ensure that these changes don't negatively affect your application's performance.

3 . ***Maintainability:*** Mixing .NET Framework and .NET 6.0 components can make the codebase harder to maintain. If possible, consider gradually migrating the entire application to .NET 6.0, especially if you aim to leverage cross-platform capabilities.

4 . ***UI Components:*** If you're considering moving the entire application, remember that WPF is Windows-specific. If you wish to go cross-platform with your UI, consider looking into technologies like MAUI, which is intended for building cross-platform apps with .NET.

5 . ***Dependencies:*** When transitioning more significant parts of an application, always audit third-party dependencies to ensure they're compatible with .NET 6.0 or have suitable replacements.

6 . ***Continuous Integration & Deployment:*** Ensure that CI/CD pipelines can handle projects with mixed frameworks or are updated appropriately if the entire project shifts to .NET 6.0.

Geovani Rodriguez
