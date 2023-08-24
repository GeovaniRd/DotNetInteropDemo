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
