$(document).ready(function () {
  let currentChapter = 0
  let $currentSidebarChapter = null
  if (Object.keys($('.sidebar-li')).length > 2) {
    // We are in a book chapter
    currentChapter = window.location.href.split('book/')[1].substring(0, 1)
    $currentSidebarChapter = $('#sidebar-nav-sublist-' + currentChapter)
    $currentSidebarChapter.show()
  }

  // Bars dropdown
  $('.bars-icon').on('click', function () {
    $('.nav-bars-dropdown').toggle()
    $('article').css('opacity', '1')

    const $nav = $('.sidebar-nav')
    // Toggle sidebar with bars click (mobile media query)
    if (window.matchMedia('(max-width: 1081px)').matches) {
      if ($nav.is(':visible')) {
        $('article').css('opacity', '1')
      } else {
        $('article').css('opacity', '0.5')
      }

      $nav.toggle()
    }
  })

  // Site-wide darkmode
  $('#dark-mode-btn').on('click', function () {
    if ($('body').hasClass('dark')) {
      $('body').removeClass('dark')
      $('h2, h3').removeClass('dark')
      $('header').removeClass('dark-accent')
      $('.nav-bars-dropdown').removeClass('dark-accent')
    } else {
      $('body').addClass('dark')
      $('h2, h3').addClass('dark')
      $('header').addClass('dark-accent')
      $('.nav-bars-dropdown').addClass('dark-accent')
    }
  })

  // Dynamic sidebar nav in section.ejs
  $('.sidebar-li').on('click', function () {
    const $selected = $(this).find('.section-sublist')
    const id = $selected[0].id

    // Keep current chapter open at all times
    if (id !== $currentSidebarChapter[0].id) {
      $selected.toggle()
    }

    // Hide any previously selected section sublists
    $('.section-sublist').each(function () {
      if ($(this)[0].id !== id && $currentSidebarChapter[0].id !== $(this)[0].id) {
        $(this).hide()
      }
    })
  })
})
