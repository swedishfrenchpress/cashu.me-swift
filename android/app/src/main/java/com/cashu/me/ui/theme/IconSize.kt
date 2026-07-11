package com.cashu.me.ui.theme

import androidx.compose.runtime.Immutable
import androidx.compose.runtime.compositionLocalOf
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp

/**
 * Shared glyph sizes so chrome icons read at one scale across tabs.
 * Default Material [Icon] is 24dp — toolbar chrome sits a step larger.
 */
@Immutable
data class CashuIconSizes(
    /** Top-bar affordances: settings, scan, search, filter, share, close. */
    val toolbar: Dp = 28.dp,
    /** Bottom navigation tab glyphs. */
    val navigation: Dp = 26.dp,
)

val LocalCashuIconSizes = compositionLocalOf { CashuIconSizes() }
