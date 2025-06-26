<#assign layoutURL = themeDisplay.getPortalURL() />

<style>
.d-none {
  display: none !important;
}
</style>

<div class="category-filter-container container">
    <label for="categoryFilter" class="filter-label">Filtrar por categoría:</label>
    <select id="categoryFilter" class="form-control">
      <option value="all">Todas las categorías</option>
      <option value="">Cargando categorías...</option>
    </select>
  </div>
	<section class="s-c-news-card blog-carousel container">
        <h2 class="s-c-news-card__head">Lo último en noticias</h2>
        <div class="s-c-news-card--carousel owl-carousel owl-theme">
  <#list entries as blog>
		
		<#assign assetEntry = blogsEntryAssetEntryUtil.getAssetEntry(request, blog) />
    <#assign categories = assetEntry.getCategories()![] />
		<#assign categoryIds = categories?map(c -> c.getCategoryId())?join(",") />
			
            <!-- Card 1 -->
            <article class="s-c-news-card__item" data-category-ids="${categoryIds}">
							   <#if blog.getCoverImageURL(themeDisplay)?has_content>
                  <img class="s-c-news-card__image" src="${blog.getCoverImageURL(themeDisplay)}" alt="${htmlUtil.escape(blog.getTitle())}" />
								 </#if>
                <div class="s-c-news-card__content">
                    <header class="s-c-news-card__header">
                        <p class="s-c-news-card__date"> ${blog.getCreateDate()?string("dd/MM/yyyy")}</p>
											  <#list categories as category>
                         <p class="s-c-news-card__editorial">${category.getName()}</p>
												</#list>
                    </header>
                    <h3 class="s-c-news-card__title">
                        ${blog.getTitle()}</h3>
                    <p class="s-c-news-card__description">
                        ${stringUtil.shorten(htmlUtil.stripHtml(blog.getContent()), 150, "...")}
                    </p>
                    <a class="s-c-news-card__button s-o-button s-t-button__size-s s-t-button__primary" href="${layoutURL}/${blog.getUrlTitle()}">
                        Leer Más
                    </a>
                </div>
            </article>
			 
    </#list>
	</div>
</section>


<script>
Liferay.on('allPortletsReady', function () {
  var vocabularyId = 35875;
  var $select = jQuery('#categoryFilter');
  var $carousel = jQuery('.s-c-news-card--carousel');
  var $originalCards = $carousel.find('.s-c-news-card__item').clone(); // ✅ guardar copia original

  // Estado de carga inicial
  $select.empty().append('<option value="">Cargando categorías...</option>');

  Liferay.Service(
    '/assetcategory/search-categories-display',
    {
      groupIds: null,
      title: '',
      vocabularyIds: [vocabularyId],
      start: 0,
      end: 100
    },
    function (response) {
      try {
        $select.empty().append('<option value="all">Todas las categorías</option>');

        if (response?.categories?.length > 0) {
          jQuery.each(response.categories, function (index, category) {
            if (category?.categoryId && category?.titleCurrentValue) {
              $select.append(
                '<option value="' + category.categoryId + '">' + category.titleCurrentValue + '</option>'
              );
            }
          });
        } else {
          $select.append('<option value="">No se encontraron categorías</option>');
        }

        $select.on('change', function () {
          const selectedCategoryId = $(this).val();

          // Filtrar desde la copia original
          const filteredCards = $originalCards.filter(function () {
            const raw = $(this).attr('data-category-ids') || '';
            const ids = raw.split(',').map(s => s.trim());
            return selectedCategoryId === 'all' || ids.includes(selectedCategoryId);
          });

          // Reemplazar el contenido del carrusel
          $carousel.trigger('replace.owl.carousel', [filteredCards]).trigger('refresh.owl.carousel');
        });

      } catch (e) {
        console.error('Error procesando categorías:', e);
        $select.empty().append('<option value="">Error al cargar categorías</option>');
      }
    }
  );
});

// Inicialización del carrusel
$(document).ready(function () {
  $(".s-c-news-card--carousel").owlCarousel({
    loop: true,
    margin: 25,
    nav: false,
    dots: true,
    dotsEach: 3,
    responsive: {
      0: { items: 1.04, dotsEach: 1 },
      650: { items: 2.30, dotsEach: 2 },
      1024: { items: 3.30, dotsEach: 3 },
      1550: { items: 4.30, dotsEach: 4 }
    }
  });
});

</script>