[#assign classButtons = configuration.iconButton]
[#assign disabledButtons = configuration.disabledButton]
[#macro generateButton text size type icon disabledButtons iconAlight url target idLiferay idBtn ]
[#if idBtn?has_content]
[#assign idButton = "id='" + idBtn + "'"]
[#else]
[#assign idButton = ""]
[/#if]
[#if disabledButtons?string("true", "false") == "true"]
[#assign disabledButton = "s-t-button--disabled"]
[#assign hrefAttribute = ""]
[#else]
[#assign disabledButton = ""]
[#assign hrefAttribute = "href='" + url + "'"]
[/#if]
[#assign myTarget = (target)?then("target='_blank'", "")]
<a class="s-c-button s-o-button s-t-button__size-${size} s-t-button__${type} ${disabledButton}" ${idButton} ${hrefAttribute} ${myTarget}>
    [#if icon && iconAlight == "left"]
    <img src="" class="icon" alt="" aria-hidden="true" data-lfr-editable-id='${idLiferay}-left-${fragmentEntryLinkNamespace}' data-lfr-editable-type='image'>
    [/#if]
    ${stringUtil.shorten(htmlUtil.stripHtml(text), 32,"...")}
    [#if icon && iconAlight == "right"]
    <img src="" class="icon" alt="" aria-hidden="true" data-lfr-editable-id='${idLiferay}-right-${fragmentEntryLinkNamespace}' data-lfr-editable-type='image'>
    [/#if]
</a>
[/#macro]

<div class="main-card">
	<div class="card">
		<img src=""
          alt=""
				 data-lfr-editable-id="01-img-principal"
          data-lfr-editable-type="image"
				 class="card-image"/> 
    <div class="category"
				 data-lfr-editable-id="01-text-category" 
					data-lfr-editable-type="text"
				 > Illustration </div>
    <div class="heading"
				 data-lfr-editable-id="01-text-header" 
					data-lfr-editable-type="text"
				 > A heading that must span over two lines
        
    </div>
		<div>
			[#if configuration.useButton]
 [#assign idButtonFinal="btn-banner-imagen-" + "${fragmentElementId}"]
 [#-- start html --]
 [#if classButtons?string("true", "false") == "true"]
 [@generateButton configuration.textButton configuration.sizeButton configuration.typeButton+"-icon" configuration.iconButton configuration.disabledButton!false configuration.locationIcon configuration.urlButton configuration.typeOpenUrl 'btn-banner-imagen' idButtonFinal /]
 [#else]
 [@generateButton configuration.textButton configuration.sizeButton configuration.typeButton configuration.iconButton configuration.disabledButton!false configuration.locationIcon configuration.urlButton configuration.typeOpenUrl 'btn-banner-imagen' idButtonFinal /]
 [/#if]
[/#if]
		</div>
		<div class="author"> By <span class="name">Abi</span> 4 days ago</div>
</div>
</div>