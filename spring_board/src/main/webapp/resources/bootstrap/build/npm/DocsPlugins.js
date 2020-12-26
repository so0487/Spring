const Plugins = [
  // AdminLTE Dist
  {
    from: 'dist/css/',
    to  : 'docs/<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/css/'
  },
  {
    from: 'dist/js/',
    to  : 'docs/<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/'
  },
  // jQuery
  {
    from: 'node_modules/jquery/dist/',
    to  : 'docs/<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/plugins/jquery/'
  },
  // Popper
  {
    from: 'node_modules/popper.js/dist/',
    to  : 'docs/<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/plugins/popper/'
  },
  // Bootstrap
  {
    from: 'node_modules/bootstrap/dist/js/',
    to  : 'docs/<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/plugins/bootstrap/js/'
  },
  // Font Awesome
  {
    from: 'node_modules/@fortawesome/fontawesome-free/css/',
    to  : 'docs/<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/plugins/fontawesome-free/css/'
  },
  {
    from: 'node_modules/@fortawesome/fontawesome-free/webfonts/',
    to  : 'docs/<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/plugins/fontawesome-free/webfonts/'
  },
  // overlayScrollbars
  {
    from: 'node_modules/overlayscrollbars/js/',
    to  : 'docs/<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/plugins/overlayScrollbars/js/'
  },
  {
    from: 'node_modules/overlayscrollbars/css/',
    to  : 'docs/<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/plugins/overlayScrollbars/css/'
  }
]

module.exports = Plugins
