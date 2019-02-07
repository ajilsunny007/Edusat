<%@ Control Language="C#" AutoEventWireup="true" CodeFile="recentfiles.ascx.cs" Inherits="Admin_recentfiles" %>
<div class="recent-posts">
    
     <script >
         function wopen() {
             var left = (screen.width) - (450 / 1.5);
             var top = (screen.height / 2) - (600 / 2);
             window.open('chatroom.aspx', "Chat window",
                 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=450, height=650, top=' + top + ', left=' + left);

         }
    </script>
     <input type="submit" class="btn btn-info" onclick="wopen()" value="Chat with Others"/>
    <hr />
        <br />
    <h4>Preferable Notes</h4>
    <div class="recent-posts-info" style="margin-bottom: 0px">
         
        <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("note_id") %>' Text='<%# Eval("topic") %>'></asp:LinkButton>
                <br />
                <hr />
            </ItemTemplate>
        </asp:DataList>
        <div class="clearfix"></div>
    </div>
    <hr />
     <h4>Recent Seminar Topics</h4>
    <div class="recent-posts-info" style="margin-bottom: 0px">
       <%-- <div class="posts-left sngl-img">
            <a href="single.html">
                <img src="../Design/images/img17.jpg" class="img-responsive zoom-img" alt="" /></a>
        </div>
        <div class="posts-right">
            <label>MARCH 1, 2015</label>
            <h5><a href="single.html">Finibus Bonorum</a></h5>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing incididunt.</p>
            <a href="single.html" class="btn btn-primary hvr-rectangle-in">Read More</a>
        </div>--%>
         <asp:DataList ID="DataList2" runat="server" OnItemCommand="DataList2_ItemCommand">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("seminarid") %>' Text='<%# Eval("topic") %>'></asp:LinkButton>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                <hr />
            </ItemTemplate>
        </asp:DataList>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
