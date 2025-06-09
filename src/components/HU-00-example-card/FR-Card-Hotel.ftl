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
<article class="property__card">
    <div class="property__content">
        <img class="property__image" data-lfr-editable-id="01-img-casa" data-lfr-editable-type="image" alt="">
        <div class="property__favorite-icon">
            <i class='bx bxs-heart bx-flip-horizontal'></i>
        </div>
    </div>
    <div class="property__details">
        <div class="property__header">
            [#assign textoDeTituloCH = configuration["titleCH"]
            /]
            [#assign verTituloCH = configuration["useTitleCH"]
            /]
            [#assign colorTituloCH = configuration["colorTitleCH"]
            /]
            [#assign etiquetaTituloCH = configuration["titleTagCH"]
            /]
            <h2 class="property__price" data-lfr-editable-id="02-text-valor" data-lfr-editable-type="text">350.000$</h2>
            [#if verTituloCH]
            <${etiquetaTituloCH} class="property__title" style="color: ${colorTituloCH};">
                ${stringUtil.shorten(htmlUtil.stripHtml(textoDeTituloCH), 25,"...")}
            </${etiquetaTituloCH}>
            [/#if]
        </div>
        [#if configuration.useButton]
        [#assign idButtonFinal="btn-sem-cards-" + "${fragmentElementId}"]
        [#-- start html --]
        [#if classButtons?string("true", "false") == "true"]
        [@generateButton configuration.textButton configuration.sizeButton configuration.typeButton+"-icon" configuration.iconButton configuration.disabledButton!false configuration.locationIcon configuration.urlButton configuration.typeOpenUrl 'btn-sem-cards' idButtonFinal /]
        [#else]
        [@generateButton configuration.textButton configuration.sizeButton configuration.typeButton configuration.iconButton configuration.disabledButton!false configuration.locationIcon configuration.urlButton configuration.typeOpenUrl 'btn-sem-card' idButtonFinal /]
        [/#if]
        [/#if]
        <div class="property__feature">
            [#assign textoDeDescCH = configuration["desciptionCH"]
            /]
            [#assign verDescCH = configuration["useDescCH"]
            /]
            [#assign colorDescCH = configuration["colorDescCH"]
            /]
            [#assign etiquetaDescCH = configuration["descTagCH"]
            /]
            [#if verDescCH]
            <i class='bx bx-target-lock bx-flip-horizontal'></i>
            <${etiquetaDescCH} class="property__description" style="color: ${colorDescCH};">
                ${stringUtil.shorten(htmlUtil.stripHtml(textoDeDescCH), 25,"...")}
            </${etiquetaDescCH}>
            [/#if]
        </div>
        [#assign verMtsCH = configuration["useMtsCH"]
        /]
        [#assign verHabCH = configuration["useHabCH"]
        /]
        [#assign VerBanCH = configuration["useBanCH"]
        /]
        <div class="property__features">
            [#if verMtsCH]
            <div class="property__feature">
                <i class='bx bx-ruler'></i>
                <span class="property__feature-value" data-lfr-editable-id="03-number-metros"
                    data-lfr-editable-type="text">320</span>
                <span class="property__feature-unit">m2</span>
            </div>
            [/#if]
            [#if verHabCH]
            <div class="property__feature">
                <i class='bx bx-cube-alt bx-flip-horizontal'></i>
                <span class="property__feature-value" data-lfr-editable-id="04-number-hab"
                    data-lfr-editable-type="text">6</span>
                <span class="property__feature-unit">hab</span>
            </div>
            [/#if]
            [#if VerBanCH]
            <div class="property__feature">
                <i class='bx bx-bath'></i>
                <span class="property__feature-value" data-lfr-editable-id="05-number-baños"
                    data-lfr-editable-type="text">3</span>
                <span class="property__feature-unit">Baños</span>
            </div>
            [/#if]
        </div>
    </div>
</article>