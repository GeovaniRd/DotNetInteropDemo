   M S B A M L   `   `   `  ����  CalculatorApp    CalculatorApp.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  Simple Calculator��5   	   $	��250��6#   $	��400��60   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5	      $
��Auto �6   �� 5
      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6    � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��2* �6   .+�5   
   �� $��0��6   $��0��6!   $��Right=�61   $��Center=�6M   $��5q�6h   	Number 1:6~   �� 5   
   -   5         ��Name$ Number1TextBox��5      $��0��6*   $��1��67   $��5q�6G   �� 5   
   $��1��6   $��0��6!   $��Right=�61   $��Center=�6M   $��5q�6h   	Number 2:6~   �� 5   
   -   5        $ Number2TextBox��5      $��1��6*   $��1��67   $��5q�6G   �� 5!   
   $��2��6   $��0��6!   $��Right=�61   $��Center=�6M   $��5q�6h   
Operation:6   �� 5"   
   -   5         ��Name$ OperationComboBox��5"      $��2��6.   $��1��6;   $��5q�6K   .@�5#      �� .��6   Add6    �� 5$      .��6   
Subtract6%   �� 5%      .��6   
Multiply6%   �� 5&      .��6   Divide6#   5'      �� 5*   
   -   5        $��	Calculate��5*      $��3��6%   $��2��62   $��5q�6F   6Q   �� 5-   
   $��4��6   $��2��6!   $��Center=�65   $
��Bold"�6R   $��5q�6d   	Result:6x   �� 50   
   -   5         ��Name$ ResultTextBlock��50      $��5��6-   $��2��6:   $��Center=�6N   $��18(�6k   $��5q�6y   52      53      