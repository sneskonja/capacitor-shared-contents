# capacitor-shared-contents

It allows you app to share data with other apps.

## Install

```bash
npm install capacitor-shared-contents
npx cap sync
```

## API

<docgen-index>

* [`writeContents(...)`](#writecontents)
* [`removeContents(...)`](#removecontents)
* [`updateWidgets(...)`](#updatewidgets)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### writeContents(...)

```typescript
writeContents(options: { value: string; key?: string; }) => Promise<{ value: string; }>
```

| Param         | Type                                                          |
| ------------- | ------------------------------------------------------------- |
| **`options`** | <code>{ value: string; key?: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------

</docgen-api>

### removeContents(...)
```typescript
removeContents(options: {key: string;}) => Promise<{key: string}>
```

| Param         | Type                                          |
| ------------- |-----------------------------------------------|
| **`options`** | <code>{ key: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

### updateWidgets(...)
```typescript
updateWidgets(options: {widgets:string[];}) => Promise<{widgets: string[]}>
```

| Param         | Type                                |
| ------------- |-------------------------------------|
| **`options`** | <code>{ widgets: string[]; }</code> |

**Returns:** <code>Promise&lt;{ widgets: string[]; }&gt;</code>
