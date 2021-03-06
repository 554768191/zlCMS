<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <#if article??>
            <title>编辑文章</title>
        <#else>
            <title>添加文章</title>
        </#if>

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link href="/css/admin/ace/font-awesome.min.css" rel="stylesheet">
        <link href="/css/admin/ace/ace.min.css" rel="stylesheet">
        <link href="/css/admin/ace/ace-skins.min.css" rel="stylesheet">
        <link href="/css/common.css" rel="stylesheet">
        <link href="/editor/css/wangEditor.min.css" rel="stylesheet" type="text/css" >
        <!--[if IE 7]>
        <link href="/css/admin/ace/font-awesome-ie7.min.css" rel="stylesheet" />
        <![endif]-->
        <script src="/js/admin/ace/ace-extra.min.js"></script>
        <script src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    </head>

    <body>
        <#include "assembly/navbar.ftl"><!-- area 1.1 -->
        <div class="main-container" id="main-container">
            <div class="main-container-inner">
                <#include "assembly/sidebar.ftl"><!-- area 1.2.1 -->
                <div class="main-content">

                    <div class="breadcrumbs" id="breadcrumbs"><!-- 面包屑导航 -->
                        <ul class="breadcrumb">
                            <li>
                                <i class="icon-home home-icon"></i>
                                <a href="#">首页</a>
                            </li>
                            <li>
                                <a href="#">文章</a>
                            </li>
                            <li class="active">添加文章</li>
                        </ul>
                    </div><!-- /.breadcrumbs --> <!-- area 1.2.2.1 -->

                    <div class="page-content">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <#if article??>
                                    <form class="form-horizontal" role="form" id="articleForm" action="/admin/article/saveEdit?id=${article.id}" method="post">
                                <#else>
                                    <form class="form-horizontal" role="form" id="articleForm" action="/admin/article" method="post">
                                </#if>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label no-padding-right" for="title">标题</label>
                                        <div class="col-sm-11">
                                            <#if article?? && article.title??>
                                                <input type="text" id="title" name="title" placeholder="文章标题" class="col-xs-6 col-sm-3" value="${article.title}"/>
                                            <#else>
                                                <input type="text" id="title" name="title" placeholder="文章标题" class="col-xs-6 col-sm-3" />
                                            </#if>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label no-padding-right" for="topic">专题</label>
                                        <div class="col-sm-11">
                                        <#if article?? && article.topic??>
                                            <input type="text" id="topic" name="topic" placeholder="文章专题" class="col-xs-6 col-sm-3" value="${article.topic}"/>
                                        <#else>
                                            <input type="text" id="topic" name="topic" placeholder="文章专题" class="col-xs-6 col-sm-3" />
                                        </#if>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label no-padding-right" for="kind">分类</label>
                                        <div class="col-xs-6 col-sm-3">
                                            <select class="form-control" id="kind" name="kind">
                                                <option value="">&nbsp;</option>
                                                <#if article?? && article.kind=="coding">
                                                    <option value="coding" selected="selected">编程</option>
                                                <#else>
                                                    <option value="coding">编程</option>
                                                </#if>
                                                <#if article?? && article.kind=="reading">
                                                    <option value="reading" selected="selected">读书</option>
                                                <#else>
                                                    <option value="reading">读书</option>
                                                </#if>
                                                <#if article?? && article.kind=="recording">
                                                    <option value="recording" selected="selected">随笔</option>
                                                <#else>
                                                    <option value="recording">随笔</option>
                                                </#if>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label no-padding-right" for="content">内容</label>
                                        <div class="col-sm-11">
                                            <#if article?? && article.content??>
                                                <textarea class="form-control" id="content" name="content" style="height: 350px;">${article.content}</textarea>
                                            <#else>
                                                <textarea class="form-control" id="content" name="content" style="height: 350px;"></textarea>
                                            </#if>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-1 col-sm-11">
                                            <#if article??>
                                                <#--<input type="hidden" name="id" value="${article.id}">-->
                                                <input class="btn btn-info " type="submit" value="保存">
                                            <#else>
                                                <input class="btn btn-info " type="submit" value="发布">
                                            </#if>
                                            </input>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div><!-- /.page-content --> <!-- area 1.2.2.2 -->
                </div><!-- /.main-content --> <!-- area 1.2.2 -->
                <#include "assembly/settings.ftl">
            </div><!-- /.main-container-inner -->
            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="icon-double-angle-up icon-only bigger-110"></i>
            </a>
        </div><!-- /.main-container --> <!-- area 1.2 -->

        <script type="text/javascript">
            window.jQuery || document.write("<script src='/js/admin/ace/jquery-2.0.3.min.js'>"+"<"+"script>");
        </script>

        <script type="text/javascript">
            if("ontouchend" in document) document.write("<script src='/js/admin/ace/jquery.mobile.custom.min.js'>"+"<"+"script>");
        </script>

        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="/js/jquery.validate.js"></script>
        <script src="/js/admin/ace/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="/js/admin/ace/ace-elements.min.js"></script>
        <script src="/js/admin/ace/ace.min.js"></script>
        <script type="text/javascript" src="/editor/js/wangEditor.min.js"></script>
        <script type="text/javascript">
            var editor = new wangEditor('content');
            editor.config.uploadImgUrl = '/file/uploadArticleImage';
            editor.config.uploadImgFileName = 'articleImageFile';
            editor.create();

            $().ready(function () {
                $("#articleForm").validate({
                    rules: {
                        title: {
                            required: true,
                            maxlength: 225
                        },
                        content: {
                            required: true,
                        }
                    },
                    messages: {
                        title: {
                            required: "文章标题必填",
                            maxlength: "最大长度225"
                        },
                        content: {
                            required: "文章内容必填",
                        }
                    }
                });
            });
        </script>
    </body><!-- area 1 -->
</html>