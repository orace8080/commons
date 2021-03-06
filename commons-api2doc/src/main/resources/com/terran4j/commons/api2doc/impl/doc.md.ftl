**API标识**
- ${folder.id}-${doc.id}

<#if doc.comment?? && doc.comment!="">
**API简介** 
- ${doc.comment}
</#if>

<br/>

<#--**客户端API类**-->
<#--- ${folderClasses}-->

<#--**客户端API方法**-->
<#--- ${doc.id}-->

<#--<br/>-->

**请求URI**
<#list doc.paths as path>
- `${path}`
</#list>

**请求方法**
<#list doc.methods as method>
- `${method}`
</#list>

<#if doc.params?? && (doc.params?size > 0) >
**请求参数**

| 参数名 | 是否必须 | 类型   | 说明 | 示例值 |
|:----  |-----  |-----   |-----    |-----   |
<#list doc.params as param>
| ${param.id} | ${param.requiredName} | ${param.typeName} | ${param.comment.html()!} | ${param.sample.html()!} |
</#list>
</#if>

<#if docURL??>
**URL示例**
 - [${docURL}](${docURL})
</#if>

<br/>

<#if doc.results?? && (doc.results?size > 0) >

**返回结果**
- [${doc.returnTypeDesc}](#${doc.results[0].groupId}) （参见下面的类型说明）

<#list doc.results as result>
<#if result.groupId??><span id="${result.groupId}"><br /></span></#if>
**${result.groupName!}类型说明：**

| 参数名 | 类型   | 说明 | 示例值 |
|:---- |----- |-----  |----- |
<#list result.children as item>
| ${item.id} | <#if item.refGroupId??>[${item.typeName}](#${item.refGroupId})<#else>${item.typeName}</#if> | ${item.comment.html()!} | ${item.sample.html()!} |
</#list>

</#list>
</#if>

<br/>

<#if doc.errors?? && (doc.errors?size > 0) >
**错误码**

| 错误码    | 说明 |
|:----    |-----   |
<#list doc.errors as error>
| ${error.id} | ${error.comment.html()!} |
</#list>
</#if>
