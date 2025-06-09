<section class="s-c-property">
	[#assign numeroDeCardsCH = configuration.numberCardsCH /]
  [#if numeroDeCardsCH?has_content]
	[#list 1..numeroDeCardsCH as index]
		<lfr-drop-zone></lfr-drop-zone>
	[/#list]
	[/#if]
</section>