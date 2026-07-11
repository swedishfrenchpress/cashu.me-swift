package com.cashu.me.ui.components

import androidx.compose.foundation.layout.size
import androidx.compose.material3.Icon
import androidx.compose.material3.LocalContentColor
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import com.cashu.me.ui.theme.CashuTheme

/**
 * Top-bar / chrome glyph at the shared [CashuTheme.iconSizes.toolbar] size.
 * Use inside `IconButton` for settings, scan, search, filter, share, close —
 * keeps every tab's trailing/leading affordances on one scale.
 */
@Composable
fun ToolbarIcon(
    imageVector: ImageVector,
    contentDescription: String?,
    modifier: Modifier = Modifier,
    tint: Color = LocalContentColor.current,
) {
    Icon(
        imageVector = imageVector,
        contentDescription = contentDescription,
        modifier = modifier.size(CashuTheme.iconSizes.toolbar),
        tint = tint,
    )
}
