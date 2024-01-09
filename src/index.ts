import { registerPlugin } from '@capacitor/core';

import type { SharedContentsPlugin } from './definitions';

const SharedContents = registerPlugin<SharedContentsPlugin>('SharedContents', {
  web: () => import('./web').then(m => new m.SharedContentsWeb()),
});

export * from './definitions';
export { SharedContents };
