<%@ Page Title="All Soluções Interativa" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrincipalOS.aspx.cs" Inherits="ControleProjetoIPEA._Default" %>





<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">

        <div class="page-header">
            <h1>Stack Solution</h1>
            <p class="lead">Soluções em Tecnologia de Informação</p>
        </div>
        

        <asp:HiddenField runat="server" ID="hdn" />
        <div class="row">
            <div class="divi">
                <h2>Abrir OS Rapidamente</h2>

                <asp:FormView runat="server" ID="FormCadastro" DefaultMode="Insert" ItemType="Models.OS.OSModel" InsertMethod="FormCadastro_InsertItem"
                    ForeColor="#333333" DataKeyNames="Id">

                    <InsertItemTemplate>
                        Nível do problema
                    <br />
                        <asp:RadioButtonList ID="nivelProb" runat="server" Text='<%# BindItem.nivel %>'>
                            <asp:ListItem Text="Urgente" Value="urgente" />
                            <asp:ListItem Text="Médio" Value="medio" />
                            <asp:ListItem Text="Preventivo" Value="preventivo" />
                        </asp:RadioButtonList>
                        <br />
                        Serviço relacionado a:
                    <br />
                        <asp:CheckBoxList ID="servico" runat="server" AppendDataBoundItems="true" Text='<%# BindItem.servico %>'>

                            <asp:ListItem Text="Software" Value="software" />
                            <asp:ListItem Text="Hardware" Value="hardware" />
                            <asp:ListItem Text="Redes" Value="redes" />
                            <asp:ListItem Text="Instalações" Value="instala~ções" />
                            <asp:ListItem Text="Outros" Value="outros" />

                        </asp:CheckBoxList>

                        <br />
                        

                        Descrição do problema
                    <br />
                        <asp:TextBox ID="ProblemaTextBox" TextMode="multiline" Columns="20" Rows="5" runat="server" Text='<%# BindItem.problema %>' />
                        <asp:TextBox ID="usuario" value='<%# Context.User.Identity.GetUserId()  %>'  runat="server" Text='<%# BindItem.idUsuario %>' style="visibility:hidden"/>
                        
                        <br />

                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="true" CommandName="Insert" Text="Insert" />

                        <asp:Button Text="Salvar" runat="server" CausesValidation="true" CommandName="Insert" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel" />
                        
                    </InsertItemTemplate>
                    <FooterStyle BackColor="#990000" Font-Bold="true" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="true" ForeColor="White" />

                </asp:FormView>

            </div>
            <div class="divi">
                <div style="display: none;">
                    <asp:HyperLink ID="linkModal" runat="server">HyperLink</asp:HyperLink>
                </div>

                <asp:GridView ID="gridDados" runat="server" ItemType="Models.OS.OSModel" SelectMethod="CarregarGrid" DataKeyNames="Id" OnRowCommand="gridDados_RowCommand" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Width="455px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:TemplateField ShowHeader="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Editar" CommandArgument='<%#: Item.Id %>' Text="Editar"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Excluir" OnClientClick="return confirm('Deseja excluir ?')" CommandArgument='<%#: Item.Id %>' Text="Excluir"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </div>

        </div>



        <div style="display: none;">
            <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>
        </div>


        <asp:Panel ID="PainelModal" runat="server" Style="display: none" Width="450px" CssClass="modalPopup">
            <asp:Panel ID="PainelCabecalho" runat="server" Style="border-bottom: solid 1px Gray; height: 25px;">
                <div>
                    <h1 style="line-height: 25px; text-align: center; font-size: 14px; font-family: Verdana; background-color: #7AC0DA;">
                        <asp:Label ID="txtTitulo" Text="Atualizar Dados" runat="server"></asp:Label>
                    </h1>
                </div>
            </asp:Panel>
            <div>
                <br />
                <br />
                <table style="margin-left: 15px; width: 100%">
                    <tr>
                        <td>Nome:</td>
                        <td>
                            <asp:TextBox ID="txtNivelModal" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>
                            <asp:TextBox ID="txtServicoModal" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Data de Nascimento:</td>
                        <td>
                            <asp:TextBox ID="txtProblemaModal" runat="server" /></td>
                    </tr>
                </table>

                <div style="text-align: center;">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
                </div>

            </div>
        </asp:Panel>
    </div>


</asp:Content>
