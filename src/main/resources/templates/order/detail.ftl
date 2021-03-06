<html>
<#include "../common/header.ftl">
<body>

<div id="wrapper" class="toggled">
    <#--边栏sidebar-->
    <#include "../common/nav.ftl">

    <#--注意内容区-->
     <div id="page-content-wrapper">
         <div class="container">
             <div class="row clearfix">
             <#--订单金额表数据-->
                <#--bootstrap按照格数来确定表格宽度 通过class="col-md-4 column" 设置表格的宽度为4个格数-->
                 <div class="col-md-4 column">
                     <table class="table table-bordered">
                         <thead>
                         <tr>
                             <th>订单id</th>
                             <th>订单总金额</th>
                         </tr>
                         </thead>
                         <tbody>
                         <tr>
                             <td>${orderDTO.orderId}</td>
                             <td>${orderDTO.orderAmount}</td>
                         </tr>
                         </tbody>
                     </table>
                 </div>
             <#--订单详情表数据-->
                 <div class="col-md-12 column">
                     <table class="table table-bordered">
                         <thead>
                         <tr>
                             <th>商品id</th>
                             <th>商品名称</th>
                             <th>价格</th>
                             <th>数量</th>
                             <th>总额</th>
                         </tr>
                         </thead>
                         <tbody>
                         <#list orderDTO.orderDetailList as orderDetail>
                         <tr>
                             <td>${orderDetail.productId}</td>
                             <td>${orderDetail.productName}</td>
                             <td>${orderDetail.productPrice}</td>
                             <td>${orderDetail.productQuantity}</td>
                             <td>${orderDetail.productQuantity * orderDetail.productPrice}</td>
                             <#--为什么这里可以对bigdecimal类型的“单价”直接乘，后台创建订单的时候不行？？？？-->
                         </tr>
                         </#list>
                         </tbody>
                     </table>
                 </div>

             <#--操作按钮-->
                 <div class="col-md-12 column">
                 <#if orderDTO.getOrderStatusEnum().message == "新订单">
                     <a href="/sell/seller/order/finish?orderId=${orderDTO.orderId}" type="button" class="btn btn-default btn-primary">完结订单</a>
                     <a href="/sell/seller/order/cancel?orderId=${orderDTO.orderId}" type="button" class="btn btn-default btn-danger">取消订单</a>
                 </#if>
                 </div>
             </div>
         </div>
     </div>
</div>

</body>
</html>