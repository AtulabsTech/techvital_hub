let MobileNavHooks = {}

MobileNavHooks.MobileNav = {
  mounted() {
    const copyContainer = this.el
    const showMobileNav = document.getElementById('show-nav')
    const hideMobileNav = document.getElementById('hide-nav')
    const mobileNav = document.getElementById(
      'mobile_navigation_modal-container'
    )
    copyContainer.addEventListener('click', (event) => {
      event.preventDefault()
      event.stopPropagation()

      if (showMobileNav.classList.contains('hidden')) {
        showMobileNav.classList.remove('hidden')
        hideMobileNav.classList.add('hidden')
        mobileNav.classList.add('hidden')
      } else {
        showMobileNav.classList.add('hidden')
        hideMobileNav.classList.remove('hidden')
        mobileNav.classList.remove('hidden')
      }
    })
  },
}

export default MobileNavHooks
