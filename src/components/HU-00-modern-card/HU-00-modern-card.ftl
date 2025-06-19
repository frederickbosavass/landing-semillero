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
<a class="s-o-button s-t-button__size-${size} s-t-button__${type} ${disabledButton}" ${idButton} ${hrefAttribute} ${myTarget}>
    [#if icon && iconAlight == "left"]
    <img src="" class="icon" alt="" aria-hidden="true" data-lfr-editable-id='${idLiferay}-left-${fragmentEntryLinkNamespace}' data-lfr-editable-type='image'>
    [/#if]
    ${stringUtil.shorten(htmlUtil.stripHtml(text), 32,"...")}
    [#if icon && iconAlight == "right"]
    <img src="" class="icon" alt="" aria-hidden="true" data-lfr-editable-id='${idLiferay}-right-${fragmentEntryLinkNamespace}' data-lfr-editable-type='image'>
    [/#if]
</a>
[/#macro]

<div class="simple-card-sj">
  <article class="card-sj">
    <img src="https://placehold.co/400x240/667eea/ffffff?text=Fragmento+LF" alt="Imagen sobre fragmento LF"
      loading="lazy" class="card-sj__image" data-lfr-editable-id="img-card-image" data-lfr-editable-type="image">
    <div class="card-sj__content">
      <span class="card-sj__category" data-lfr-editable-id="category-card-text"
        data-lfr-editable-type="text">Tecnología</span>
      <h2 class="card-sj__title" data-lfr-editable-id="title-card-text" data-lfr-editable-type="text">Diseño Moderno y
        Funcional</h2>
      <p class="card-sj__description" data-lfr-editable-id="description-card-text" data-lfr-editable-type="rich-text">
        Una tarjeta elegante que combina simplicidad con funcionalidad.
        Perfecta para mostrar contenido de manera atractiva y responsive.
      </p>
      <footer class="card-sj__footer">
        <time class="card-sj__date" data-lfr-editable-id="date-card-text" data-lfr-editable-type="text">15 Mar 2024</time>
        [#if configuration.useButton]
        [#assign idButtonFinal="btn-sem-cards-" + "${fragmentElementId}"]
        [#-- start html --]
        [#if classButtons?string("true", "false") == "true"]
        [@generateButton configuration.textButton configuration.sizeButton configuration.typeButton+"-icon" configuration.iconButton configuration.disabledButton!false configuration.locationIcon configuration.urlButton configuration.typeOpenUrl 'btn-sem-cards' idButtonFinal /]
        [#else]
        [@generateButton configuration.textButton configuration.sizeButton configuration.typeButton configuration.iconButton configuration.disabledButton!false configuration.locationIcon configuration.urlButton configuration.typeOpenUrl 'btn-sem-card' idButtonFinal /]
        [/#if]
        [/#if]
      </footer>
    </div>
  </article>
</div>