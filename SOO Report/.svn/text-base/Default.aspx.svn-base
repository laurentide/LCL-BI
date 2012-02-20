<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title> LCL Number of employees per group for SOO report</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<asp:Label ID="Label1" runat="server" Text="LCL Number of employees per group for SOO report" Font-Bold="True"></asp:Label>
        <br /><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="GroupID">
            <Columns>
                <asp:BoundField DataField="GroupID" HeaderText="GroupID" InsertVisible="False" ReadOnly="True"
                    SortExpression="GroupID" />
                <asp:BoundField DataField="GroupName" HeaderText="Group Name" ReadOnly="True" SortExpression="GroupName" />
                <asp:BoundField DataField="Number_Of_Employees" HeaderText="Number Of Employees"
                    SortExpression="Number_Of_Employees" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Nomis_WarehouseConnectionString2 %>"
            SelectCommand="SELECT * FROM [tblGroupEmployees]" 
            UpdateCommand="UPDATE tblGroupEmployees SET Number_Of_Employees = @number_of_employees WHERE (GroupID = @groupid)" InsertCommand="INSERT INTO [tblGroupEmployees] ([GroupName], [Number_Of_Employees]) VALUES (@GroupName, @Number_Of_Employees)" ProviderName="<%$ ConnectionStrings:Nomis_WarehouseConnectionString.ProviderName %>">
            <UpdateParameters>
                <asp:Parameter Name="number_of_employees" />
                <asp:Parameter Name="groupid" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="GroupName" Type="String" />
                <asp:Parameter Name="Number_Of_Employees" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
