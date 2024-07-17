<%--
  Created by IntelliJ IDEA.
  User: -MSI-
  Date: 7/16/2024
  Time: 2:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300);

    /*.frame {*/
    /*    position: absolute;*/
    /*    top: 50%;*/
    /*    left: 50%;*/
    /*    width: 800px;*/
    /*    height: 800px;*/
    /*    margin-top: -400px;*/
    /*    margin-left: -500px;*/
    /*    border-radius: 2px;*/
    /*    box-shadow: 1px 2px 10px 0px rgba(0,0,0,0.3);*/
    /*    overflow: hidden;*/
    /*    !*background: #3F3F3F;*!*/
    /*    color: #415868;*/
    /*    font-family: 'Open Sans', Helvetica, sans-serif;*/
    /*    -webkit-font-smoothing: antialiased;*/
    /*    -moz-osx-font-smoothing: grayscale;*/
    /*}*/

    .modal {
        position: absolute;
        width: 500px;
        height: 300px;
        top: 350px;
        left: 700px;
        background: #fff;
        border-radius: 3px;
        box-shadow: 4px 8px 12px 0 rgba(0,0,0,0.4);
        text-align: center;
        overflow: hidden;
        animation: show-modal .7s ease-in-out;
        font-family: 'Open Sans', Helvetica, sans-serif;

        &.hide {
            animation: hide-modal .6s ease-in-out both;
        }

        img {
            margin-top: 24px;
        }

        .title {
            display: block;
            font-size: 30px;
            line-height: 24px;
            font-weight: 400;
            margin: 14px 0 25px 0;
        }

        p {
            font-size: 20px;
            font-weight: 300;
            line-height: 19px;
            margin: 30px 0;
            padding: 0 30px;


        }
        .button {
            position: absolute;
            height: 40px;
            bottom: 0;
            left: 0;
            right: 0;
            background: #F65656;
            color: #fff;
            line-height: 40px;
            font-size: 14px;
            font-weight: 400;
            cursor: pointer;
            transition: background .3s ease-in-out;

            &:hover {
                background: #EC3434;
            }

        }

    }

    @keyframes show-modal {
        0% {
            transform: scale(0);
        }
        60% {
            transform: scale(1.1);
        }
        80% {
            transform: scale(.95);
        }
        100% {
            transform: scale(1);
        }
    }

    @keyframes hide-modal {
        0% {
            transform: scale(1);
        }
        20% {
            transform: scale(1.1);
        }
        100% {
            transform: scale(0);
        }
    }
</style>
<body>
<div class="frame">
    <div class="modal">
        <img src="https://100dayscss.com/codepen/alert.png" width="44" height="38" />
        <span class="title">During time create groups</span>
        <p>You need to get to layering as soon as possible</p>
        <a style="text-decoration: none" href="createGroup">Go create group</a>
        <div class="button">Dismiss</div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $('.button').bind('click', function() {
        $('.modal').addClass('hide');
    });
</script>
</body>
</html>
