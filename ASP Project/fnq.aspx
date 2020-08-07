<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="fnq.aspx.cs" Inherits="fnq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="container">
      <h2>자주 묻는 질문</h2><p></p><br /><br />

      <div id="accordian">

         <div class="card">
               <div class="card-header">
                    <a class="card-link" data-toggle="collapse" data-parent="#accordian" href="#collapseOne">                        
                        찾는 책이 없어요
                    </a>
              </div>
             <div id="collapseOne" class="collapse">
                <div class="card-body">
                    찾고자 하는 책이 없는 경우, 요청게시판을 통해 원하는 책을 요청할 수 있습니다.
                    <br />그 후 알림을 통해 답변을 확인하시면 됩니다.
                </div>
            </div>
        </div>

        <div class="card my-3">
               <div class="card-header">
                    <a class="card-link" data-toggle="collapse" data-parent="#accordian" href="#collapseTwo">                        
                        이용절차를 알고 싶어요
                    </a>
              </div>
             <div id="collapseTwo" class="collapse">
                <div class="card-body">
                    회원 가입 후 판매자는 '판매하기' 기능을 통해 책을 판매하는 글을 작성합니다.
                    <br />그 후 구매자가 답변을 달면, 판매자의 계정에 알람이 갑니다. 그 후 연락을 통해 거래를 진행 하면 됩니다.
                </div>
            </div>
        </div>

        <div class="card my-3">
               <div class="card-header">
                    <a class="card-link" data-toggle="collapse" data-parent="#accordian" href="#collapseThree">                        
                        판매글을 올릴 때 어느정도 손상까지 판매 가능한가요?
                    </a>
              </div>
             <div id="collapseThree" class="collapse">
                <div class="card-body">
                    젖은 흔적이 있는 책, 2cm이상 찢어진 도서, 심한 낙서가 있는 책
                    <br />5쪽 초과 메모, 제본 탈착, 구성품 누락인 책은 판매글에 올리시면 안됩니다.
                </div>
            </div>
        </div>

        <div class="card my-3">
               <div class="card-header">
                    <a class="card-link" data-toggle="collapse" data-parent="#accordian" href="#collapseFour">                        
                        아이디, 비밀번호를 잊어버렸습니다.
                    </a>
              </div>
             <div id="collapseFour" class="collapse">
                <div class="card-body">
                    ☎010-3190-5928 로 연락을 해주시면 빠른 시일내에 조치하도록 하겠습니다.
                </div>
            </div>
        </div>

        <div class="card my-3">
               <div class="card-header">
                    <a class="card-link" data-toggle="collapse" data-parent="#accordian" href="#collapseFive">                        
                        상품 배송비는 판매자 부담입니까?
                    </a>
              </div>
             <div id="collapseFive" class="collapse">
                <div class="card-body">
                    기본적으론 판매자께서 부담하셔야 합니다.
                    <br />하지만 서로 대화를 진행해 착불로 진행하여도 무관합니다.
                </div>
            </div>
        </div>

      </div>
    </div>

                                        <%-- 테스트 해봤으나 후보에서 탈락된 기능 %>

        <%--<div class="accordion" id="accordion2">
            <div class="accordion-group">

                <div class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2"
                        href="#collapseOne">
                        아코디언 메뉴1
                    </a>
                </div>

                <div id="collapseOne" class="accordion-body collapse in">
                    <div class="accordion-inner">
                        아코디언 메뉴1 내용 부분
                    </div>
                </div>
            </div>


        </div>
        </div>--%>


        <%--<asp:Button ID="Button1" CssClass="btn btn-primary" data-toggle="collapse"
            data-target="#One" runat="server" Text="첫번째 버튼 테스트" />

        <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#One">
        첫번째 버튼 테스트
        </button>

        <div id="One" class="collapse">
            테스트입니다!
        </div>
    </div>--%>


    <%--<div class="accordi">
        <asp:CheckBox ID="answer01" runat="server" />
        <asp:Label for="answer01" id="label_answer" runat="server" Text="1. 테스트는 잘 되나요?"><em></em></asp:Label>
        <div><p>네! 이 글이 잘 보인다면 잘 된거 같네요!</p></div>
    </div>--%>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

