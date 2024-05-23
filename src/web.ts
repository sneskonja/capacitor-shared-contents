import { WebPlugin } from '@capacitor/core';

import type { SharedContentsPlugin } from './definitions';

export class SharedContentsWeb
  extends WebPlugin
  implements SharedContentsPlugin
{
  async writeContents(options: { value: string, key: string }): Promise<{ value: string }> {
    return options;
  }

  async removeContents(options: { key: string }): Promise<{ key: string }> {
    return options;
  }

  async updateWidgets(options: { widgets: string[] }): Promise<{ widgets: string[] }> {
    return options;
  }
}
