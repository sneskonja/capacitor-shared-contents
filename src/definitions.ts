export interface SharedContentsPlugin {
  writeContents(options: { value: string, key?: string}): Promise<{ value: string }>;
  removeContents(options: { key: string }): Promise<{ key: string }>;
  updateWidgets(options: {widgets: string[]}): Promise<{ widgets: string[] }>;
}
