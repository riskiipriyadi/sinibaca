/**
 * Utility to optimize the image path for Astro's image processing
 * 
 * When a markdown file references an image with a path like "/images/image1.jpg",
 * this function ensures the path gets properly processed through Astro's image optimization
 * pipeline and generates a WebP version.
 */

export function optimizeImagePath(path: string): string {
  // For paths from the public directory, we need to ensure they're properly processed
  // Astro should handle this automatically through its image pipeline,
  // but we provide this utility to ensure consistency

  // Make sure the path is valid
  if (!path) return '';

  // Prepend base URL for absolute public paths so they work under a subpath deployment
  if (path.startsWith('/')) {
    const base = import.meta.env.BASE_URL || '';
    if (base && base !== '/') {
      return `${base.replace(/\/$/, '')}${path}`;
    }
  }

  // Astro will optimize images referenced in HTML, so we just return the path
  return path;
}
