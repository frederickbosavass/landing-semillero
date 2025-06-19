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
<section class="card-container">
	<article class="card">
		<header>
			<h2 data-lfr-editable-id="text1" data-lfr-editable-type="text"></h2>
		</header>
		<div class="precio">
			<h1 data-lfr-editable-id="text2" data-lfr-editable-type="text"></h1>
		</div>
		<div class="descripcion">
			<p data-lfr-editable-id="text3" data-lfr-editable-type="text"></p>
		</div>
		<footer class="footer">
			<a class="s-c-button s-o-button s-t-button__size-${size} s-t-button__${type} ${disabledButton} boton" ${idButton} ${hrefAttribute} ${myTarget}>
				[#if icon && iconAlight == "left"]
				<img src="" class="icon" alt="" aria-hidden="true" data-lfr-editable-id='${idLiferay}-left-${fragmentEntryLinkNamespace}' data-lfr-editable-type='image'>
				[/#if]
				${stringUtil.shorten(htmlUtil.stripHtml(text), 32,"...")}
				[#if icon && iconAlight == "right"]
				<img src="" class="icon" alt="" aria-hidden="true" data-lfr-editable-id='${idLiferay}-right-${fragmentEntryLinkNamespace}' data-lfr-editable-type='image'>
				[/#if]
		</a>
		</footer>
	</article>
</section>
[/#macro]

[#if configuration.useButton]
 [#assign idButtonFinal="btn-banner-imagen-" + "${fragmentElementId}"]
 [#-- start html --]
 [#if classButtons?string("true", "false") == "true"]
 [@generateButton configuration.textButton configuration.sizeButton configuration.typeButton+"-icon" configuration.iconButton configuration.disabledButton!false configuration.locationIcon configuration.urlButton configuration.typeOpenUrl 'btn-banner-imagen' idButtonFinal /]
 [#else]
 [@generateButton configuration.textButton configuration.sizeButton configuration.typeButton configuration.iconButton configuration.disabledButton!false configuration.locationIcon configuration.urlButton configuration.typeOpenUrl 'btn-banner-imagen' idButtonFinal /]
 [/#if]
[/#if]