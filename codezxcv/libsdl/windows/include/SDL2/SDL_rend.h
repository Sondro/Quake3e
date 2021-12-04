/*
  Simple DirectMedia Layer
  Copyright(C) 1997-2019 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

/**
 *  \file SDL_draw.h
 *
 *  Header file for SDL 2D drawing functions.
 *
 *  This API supports the following features:
 *      * single pixel points
 *      * single pixel lines
 *      * filled rectangles
 *      * texture images
 *
 *  The primitives may be drawn in opaque, blended, or additive modes.
 *
 *  The texture images may be drawn in opaque, blended, or additive modes.
 *  They can have an additional color tint or alpha modulation applied to
 *  them, and may also be stretched with linear interpolation.
 *
 *  This API is designed to accelerate simple 2D operations. You may
 *  want more functionality such as polygons and particle effects and
 *  in that case you should use SDL's OpenGL/Direct3D support or one
 *  of the many good 3D engines.
 *
 *  These functions must be called from the main thread.
 *  See this bug for details: http://bugzilla.libsdl.org/show_bug.cgi?id=1995
 */

#ifndef SDL_draw_h_
#define SDL_draw_h_

#include "SDL_stdinc.h"
#include "SDL_rect.h"
#include "SDL_video.h"

#include "begin_code.h"
/* Set up for C function definitions, even when using C++ */
#ifdef __cplusplus
extern "C" {
#endif

/**
 *  \brief Flags used when creating a drawing context
 */
typedef enum
{
    SDL_GFXER_SOFTWARE = 0x00000001,         /**< The gfxer is a software fallback */
    SDL_GFXER_ACCELERATED = 0x00000002,      /**< The gfxer uses hardware
                                                     acceleration */
    SDL_GFXER_PRESENTVSYNC = 0x00000004,     /**< Present is synchronized
                                                     with the refresh rate */
    SDL_GFXER_TARGETTEXTURE = 0x00000008     /**< The gfxer supports
                                                     drawing to texture */
} SDL_DrawFlags;

/**
 *  \brief Information on the capabilities of a draw driver or context.
 */
typedef struct SDL_DrawInfo
{
    const char *name;           /**< The name of the gfxer */
    Uint32 flags;               /**< Supported ::SDL_DrawFlags */
    Uint32 num_texture_formats; /**< The number of available texture formats */
    Uint32 texture_formats[16]; /**< The available texture formats */
    int max_texture_width;      /**< The maximum texture width */
    int max_texture_height;     /**< The maximum texture height */
} SDL_DrawInfo;

/**
 *  \brief The access pattern allowed for a texture.
 */
typedef enum
{
    SDL_TEXTUREACCESS_STATIC,    /**< Changes rarely, not lockable */
    SDL_TEXTUREACCESS_STREAMING, /**< Changes frequently, lockable */
    SDL_TEXTUREACCESS_TARGET     /**< Texture can be used as a draw target */
} SDL_TextureAccess;

/**
 *  \brief The texture channel modulation used in SDL_DrawCopy().
 */
typedef enum
{
    SDL_TEXTUREMODULATE_NONE = 0x00000000,     /**< No modulation */
    SDL_TEXTUREMODULATE_COLOR = 0x00000001,    /**< srcC = srcC * color */
    SDL_TEXTUREMODULATE_ALPHA = 0x00000002     /**< srcA = srcA * alpha */
} SDL_TextureModulate;

/**
 *  \brief Flip constants for SDL_DrawCopyEx
 */
typedef enum
{
    SDL_FLIP_NONE = 0x00000000,     /**< Do not flip */
    SDL_FLIP_HORIZONTAL = 0x00000001,    /**< flip horizontally */
    SDL_FLIP_VERTICAL = 0x00000002     /**< flip vertically */
} SDL_DrawFlip;

/**
 *  \brief A structure representing drawing state
 */
struct SDL_Draw;
typedef struct SDL_Draw SDL_Draw;

/**
 *  \brief An efficient driver-specific representation of pixel data
 */
struct SDL_Texture;
typedef struct SDL_Texture SDL_Texture;


/* Function prototypes */

/**
 *  \brief Get the number of 2D drawing drivers available for the current
 *         display.
 *
 *  A draw driver is a set of code that handles drawing and texture
 *  management on a particular display.  Normally there is only one, but
 *  some drivers may have several available with different capabilities.
 *
 *  \sa SDL_GetDrawDriverInfo()
 *  \sa SDL_CreateDraw()
 */
extern DECLSPEC int SDLCALL SDL_GetNumDrawDrivers(void);

/**
 *  \brief Get information about a specific 2D drawing driver for the current
 *         display.
 *
 *  \param index The index of the driver to query information about.
 *  \param info  A pointer to an SDL_DrawInfo struct to be filled with
 *               information on the drawing driver.
 *
 *  \return 0 on success, -1 if the index was out of range.
 *
 *  \sa SDL_CreateDraw()
 */
extern DECLSPEC int SDLCALL SDL_GetDrawDriverInfo(int index,
                                                    SDL_DrawInfo * info);

/**
 *  \brief Create a window and default gfxer
 *
 *  \param width    The width of the window
 *  \param height   The height of the window
 *  \param window_flags The flags used to create the window
 *  \param window   A pointer filled with the window, or NULL on error
 *  \param gfxer A pointer filled with the gfxer, or NULL on error
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_CreateWindowAndDraw(
                                int width, int height, Uint32 window_flags,
                                SDL_Window **window, SDL_Draw **gfxer);


/**
 *  \brief Create a 2D drawing context for a window.
 *
 *  \param window The window where drawing is displayed.
 *  \param index    The index of the drawing driver to initialize, or -1 to
 *                  initialize the first one supporting the requested flags.
 *  \param flags    ::SDL_DrawFlags.
 *
 *  \return A valid drawing context or NULL if there was an error.
 *
 *  \sa SDL_CreateSoftwareDraw()
 *  \sa SDL_GetDrawInfo()
 *  \sa SDL_DestroyDraw()
 */
extern DECLSPEC SDL_Draw * SDLCALL SDL_CreateDraw(SDL_Window * window,
                                               int index, Uint32 flags);

/**
 *  \brief Create a 2D software drawing context for a surface.
 *
 *  \param surface The surface where drawing is done.
 *
 *  \return A valid drawing context or NULL if there was an error.
 *
 *  \sa SDL_CreateDraw()
 *  \sa SDL_DestroyDraw()
 */
extern DECLSPEC SDL_Draw * SDLCALL SDL_CreateSoftwareDraw(SDL_Surface * surface);

/**
 *  \brief Get the gfxer associated with a window.
 */
extern DECLSPEC SDL_Draw * SDLCALL SDL_GetDraw(SDL_Window * window);

/**
 *  \brief Get information about a drawing context.
 */
extern DECLSPEC int SDLCALL SDL_GetDrawInfo(SDL_Draw * gfxer,
                                                SDL_DrawInfo * info);

/**
 *  \brief Get the output size in pixels of a drawing context.
 */
extern DECLSPEC int SDLCALL SDL_GetDrawOutputSize(SDL_Draw * gfxer,
                                                      int *w, int *h);

/**
 *  \brief Create a texture for a drawing context.
 *
 *  \param gfxer The gfxer.
 *  \param format The format of the texture.
 *  \param access One of the enumerated values in ::SDL_TextureAccess.
 *  \param w      The width of the texture in pixels.
 *  \param h      The height of the texture in pixels.
 *
 *  \return The created texture is returned, or NULL if no drawing context was
 *          active,  the format was unsupported, or the width or height were out
 *          of range.
 *
 *  \note The contents of the texture are not defined at creation.
 *
 *  \sa SDL_QueryTexture()
 *  \sa SDL_UpdateTexture()
 *  \sa SDL_DestroyTexture()
 */
extern DECLSPEC SDL_Texture * SDLCALL SDL_CreateTexture(SDL_Draw * gfxer,
                                                        Uint32 format,
                                                        int access, int w,
                                                        int h);

/**
 *  \brief Create a texture from an existing surface.
 *
 *  \param gfxer The gfxer.
 *  \param surface The surface containing pixel data used to fill the texture.
 *
 *  \return The created texture is returned, or NULL on error.
 *
 *  \note The surface is not modified or freed by this function.
 *
 *  \sa SDL_QueryTexture()
 *  \sa SDL_DestroyTexture()
 */
extern DECLSPEC SDL_Texture * SDLCALL SDL_CreateTextureFromSurface(SDL_Draw * gfxer, SDL_Surface * surface);

/**
 *  \brief Query the attributes of a texture
 *
 *  \param texture A texture to be queried.
 *  \param format  A pointer filled in with the raw format of the texture.  The
 *                 actual format may differ, but pixel transfers will use this
 *                 format.
 *  \param access  A pointer filled in with the actual access to the texture.
 *  \param w       A pointer filled in with the width of the texture in pixels.
 *  \param h       A pointer filled in with the height of the texture in pixels.
 *
 *  \return 0 on success, or -1 if the texture is not valid.
 */
extern DECLSPEC int SDLCALL SDL_QueryTexture(SDL_Texture * texture,
                                             Uint32 * format, int *access,
                                             int *w, int *h);

/**
 *  \brief Set an additional color value used in draw copy operations.
 *
 *  \param texture The texture to update.
 *  \param r       The red color value multiplied into copy operations.
 *  \param g       The green color value multiplied into copy operations.
 *  \param b       The blue color value multiplied into copy operations.
 *
 *  \return 0 on success, or -1 if the texture is not valid or color modulation
 *          is not supported.
 *
 *  \sa SDL_GetTextureColorMod()
 */
extern DECLSPEC int SDLCALL SDL_SetTextureColorMod(SDL_Texture * texture,
                                                   Uint8 r, Uint8 g, Uint8 b);


/**
 *  \brief Get the additional color value used in draw copy operations.
 *
 *  \param texture The texture to query.
 *  \param r         A pointer filled in with the current red color value.
 *  \param g         A pointer filled in with the current green color value.
 *  \param b         A pointer filled in with the current blue color value.
 *
 *  \return 0 on success, or -1 if the texture is not valid.
 *
 *  \sa SDL_SetTextureColorMod()
 */
extern DECLSPEC int SDLCALL SDL_GetTextureColorMod(SDL_Texture * texture,
                                                   Uint8 * r, Uint8 * g,
                                                   Uint8 * b);

/**
 *  \brief Set an additional alpha value used in draw copy operations.
 *
 *  \param texture The texture to update.
 *  \param alpha     The alpha value multiplied into copy operations.
 *
 *  \return 0 on success, or -1 if the texture is not valid or alpha modulation
 *          is not supported.
 *
 *  \sa SDL_GetTextureAlphaMod()
 */
extern DECLSPEC int SDLCALL SDL_SetTextureAlphaMod(SDL_Texture * texture,
                                                   Uint8 alpha);

/**
 *  \brief Get the additional alpha value used in draw copy operations.
 *
 *  \param texture The texture to query.
 *  \param alpha     A pointer filled in with the current alpha value.
 *
 *  \return 0 on success, or -1 if the texture is not valid.
 *
 *  \sa SDL_SetTextureAlphaMod()
 */
extern DECLSPEC int SDLCALL SDL_GetTextureAlphaMod(SDL_Texture * texture,
                                                   Uint8 * alpha);

/**
 *  \brief Set the blend mode used for texture copy operations.
 *
 *  \param texture The texture to update.
 *  \param blendMode ::SDL_BlendMode to use for texture blending.
 *
 *  \return 0 on success, or -1 if the texture is not valid or the blend mode is
 *          not supported.
 *
 *  \note If the blend mode is not supported, the closest supported mode is
 *        chosen.
 *
 *  \sa SDL_GetTextureBlendMode()
 */
extern DECLSPEC int SDLCALL SDL_SetTextureBlendMode(SDL_Texture * texture,
                                                    SDL_BlendMode blendMode);

/**
 *  \brief Get the blend mode used for texture copy operations.
 *
 *  \param texture   The texture to query.
 *  \param blendMode A pointer filled in with the current blend mode.
 *
 *  \return 0 on success, or -1 if the texture is not valid.
 *
 *  \sa SDL_SetTextureBlendMode()
 */
extern DECLSPEC int SDLCALL SDL_GetTextureBlendMode(SDL_Texture * texture,
                                                    SDL_BlendMode *blendMode);

/**
 *  \brief Update the given texture rectangle with new pixel data.
 *
 *  \param texture   The texture to update
 *  \param rect      A pointer to the rectangle of pixels to update, or NULL to
 *                   update the entire texture.
 *  \param pixels    The raw pixel data in the format of the texture.
 *  \param pitch     The number of bytes in a row of pixel data, including padding between lines.
 *
 *  The pixel data must be in the format of the texture. The pixel format can be
 *  queried with SDL_QueryTexture.
 *
 *  \return 0 on success, or -1 if the texture is not valid.
 *
 *  \note This is a fairly slow function.
 */
extern DECLSPEC int SDLCALL SDL_UpdateTexture(SDL_Texture * texture,
                                              const SDL_Rect * rect,
                                              const void *pixels, int pitch);

/**
 *  \brief Update a rectangle within a planar YV12 or IYUV texture with new pixel data.
 *
 *  \param texture   The texture to update
 *  \param rect      A pointer to the rectangle of pixels to update, or NULL to
 *                   update the entire texture.
 *  \param Yplane    The raw pixel data for the Y plane.
 *  \param Ypitch    The number of bytes between rows of pixel data for the Y plane.
 *  \param Uplane    The raw pixel data for the U plane.
 *  \param Upitch    The number of bytes between rows of pixel data for the U plane.
 *  \param Vplane    The raw pixel data for the V plane.
 *  \param Vpitch    The number of bytes between rows of pixel data for the V plane.
 *
 *  \return 0 on success, or -1 if the texture is not valid.
 *
 *  \note You can use SDL_UpdateTexture() as long as your pixel data is
 *        a contiguous block of Y and U/V planes in the proper order, but
 *        this function is available if your pixel data is not contiguous.
 */
extern DECLSPEC int SDLCALL SDL_UpdateYUVTexture(SDL_Texture * texture,
                                                 const SDL_Rect * rect,
                                                 const Uint8 *Yplane, int Ypitch,
                                                 const Uint8 *Uplane, int Upitch,
                                                 const Uint8 *Vplane, int Vpitch);

/**
 *  \brief Lock a portion of the texture for write-only pixel access.
 *
 *  \param texture   The texture to lock for access, which was created with
 *                   ::SDL_TEXTUREACCESS_STREAMING.
 *  \param rect      A pointer to the rectangle to lock for access. If the rect
 *                   is NULL, the entire texture will be locked.
 *  \param pixels    This is filled in with a pointer to the locked pixels,
 *                   appropriately offset by the locked area.
 *  \param pitch     This is filled in with the pitch of the locked pixels.
 *
 *  \return 0 on success, or -1 if the texture is not valid or was not created with ::SDL_TEXTUREACCESS_STREAMING.
 *
 *  \sa SDL_UnlockTexture()
 */
extern DECLSPEC int SDLCALL SDL_LockTexture(SDL_Texture * texture,
                                            const SDL_Rect * rect,
                                            void **pixels, int *pitch);

/**
 *  \brief Unlock a texture, uploading the changes to video memory, if needed.
 *
 *  \sa SDL_LockTexture()
 */
extern DECLSPEC void SDLCALL SDL_UnlockTexture(SDL_Texture * texture);

/**
 * \brief Determines whether a window supports the use of draw targets
 *
 * \param gfxer The gfxer that will be checked
 *
 * \return SDL_TRUE if supported, SDL_FALSE if not.
 */
extern DECLSPEC SDL_bool SDLCALL SDL_DrawTargetSupported(SDL_Draw *gfxer);

/**
 * \brief Set a texture as the current drawing target.
 *
 * \param gfxer The gfxer.
 * \param texture The targeted texture, which must be created with the SDL_TEXTUREACCESS_TARGET flag, or NULL for the default draw target
 *
 * \return 0 on success, or -1 on error
 *
 *  \sa SDL_GetDrawTarget()
 */
extern DECLSPEC int SDLCALL SDL_SetDrawTarget(SDL_Draw *gfxer,
                                                SDL_Texture *texture);

/**
 * \brief Get the current draw target or NULL for the default draw target.
 *
 * \return The current draw target
 *
 *  \sa SDL_SetDrawTarget()
 */
extern DECLSPEC SDL_Texture * SDLCALL SDL_GetDrawTarget(SDL_Draw *gfxer);

/**
 *  \brief Set device independent resolution for drawing
 *
 *  \param gfxer The gfxer for which resolution should be set.
 *  \param w      The width of the logical resolution
 *  \param h      The height of the logical resolution
 *
 *  This function uses the viewport and scaling functionality to allow a fixed logical
 *  resolution for drawing, regardless of the actual output resolution.  If the actual
 *  output resolution doesn't have the same aspect ratio the output drawing will be
 *  centered within the output display.
 *
 *  If the output display is a window, mouse events in the window will be filtered
 *  and scaled so they seem to arrive within the logical resolution.
 *
 *  \note If this function results in scaling or subpixel drawing by the
 *        drawing backend, it will be handled using the appropriate
 *        quality hints.
 *
 *  \sa SDL_DrawGetLogicalSize()
 *  \sa SDL_DrawSetScale()
 *  \sa SDL_DrawSetViewport()
 */
extern DECLSPEC int SDLCALL SDL_DrawSetLogicalSize(SDL_Draw * gfxer, int w, int h);

/**
 *  \brief Get device independent resolution for drawing
 *
 *  \param gfxer The gfxer from which resolution should be queried.
 *  \param w      A pointer filled with the width of the logical resolution
 *  \param h      A pointer filled with the height of the logical resolution
 *
 *  \sa SDL_DrawSetLogicalSize()
 */
extern DECLSPEC void SDLCALL SDL_DrawGetLogicalSize(SDL_Draw * gfxer, int *w, int *h);

/**
 *  \brief Set whether to force integer scales for resolution-independent drawing
 *
 *  \param gfxer The gfxer for which integer scaling should be set.
 *  \param enable   Enable or disable integer scaling
 *
 *  This function restricts the logical viewport to integer values - that is, when
 *  a resolution is between two multiples of a logical size, the viewport size is
 *  rounded down to the lower multiple.
 *
 *  \sa SDL_DrawSetLogicalSize()
 */
extern DECLSPEC int SDLCALL SDL_DrawSetIntegerScale(SDL_Draw * gfxer,
                                                      SDL_bool enable);

/**
 *  \brief Get whether integer scales are forced for resolution-independent drawing
 *
 *  \param gfxer The gfxer from which integer scaling should be queried.
 *
 *  \sa SDL_DrawSetIntegerScale()
 */
extern DECLSPEC SDL_bool SDLCALL SDL_DrawGetIntegerScale(SDL_Draw * gfxer);

/**
 *  \brief Set the drawing area for drawing on the current target.
 *
 *  \param gfxer The gfxer for which the drawing area should be set.
 *  \param rect The rectangle representing the drawing area, or NULL to set the viewport to the entire target.
 *
 *  The x,y of the viewport rect represents the origin for drawing.
 *
 *  \return 0 on success, or -1 on error
 *
 *  \note If the window associated with the gfxer is resized, the viewport is automatically reset.
 *
 *  \sa SDL_DrawGetViewport()
 *  \sa SDL_DrawSetLogicalSize()
 */
extern DECLSPEC int SDLCALL SDL_DrawSetViewport(SDL_Draw * gfxer,
                                                  const SDL_Rect * rect);

/**
 *  \brief Get the drawing area for the current target.
 *
 *  \sa SDL_DrawSetViewport()
 */
extern DECLSPEC void SDLCALL SDL_DrawGetViewport(SDL_Draw * gfxer,
                                                   SDL_Rect * rect);

/**
 *  \brief Set the clip rectangle for the current target.
 *
 *  \param gfxer The gfxer for which clip rectangle should be set.
 *  \param rect   A pointer to the rectangle to set as the clip rectangle, or
 *                NULL to disable clipping.
 *
 *  \return 0 on success, or -1 on error
 *
 *  \sa SDL_DrawGetClipRect()
 */
extern DECLSPEC int SDLCALL SDL_DrawSetClipRect(SDL_Draw * gfxer,
                                                  const SDL_Rect * rect);

/**
 *  \brief Get the clip rectangle for the current target.
 *
 *  \param gfxer The gfxer from which clip rectangle should be queried.
 *  \param rect   A pointer filled in with the current clip rectangle, or
 *                an empty rectangle if clipping is disabled.
 *
 *  \sa SDL_DrawSetClipRect()
 */
extern DECLSPEC void SDLCALL SDL_DrawGetClipRect(SDL_Draw * gfxer,
                                                   SDL_Rect * rect);

/**
 *  \brief Get whether clipping is enabled on the given gfxer.
 *
 *  \param gfxer The gfxer from which clip state should be queried.
 *
 *  \sa SDL_DrawGetClipRect()
 */
extern DECLSPEC SDL_bool SDLCALL SDL_DrawIsClipEnabled(SDL_Draw * gfxer);


/**
 *  \brief Set the drawing scale for drawing on the current target.
 *
 *  \param gfxer The gfxer for which the drawing scale should be set.
 *  \param scaleX The horizontal scaling factor
 *  \param scaleY The vertical scaling factor
 *
 *  The drawing coordinates are scaled by the x/y scaling factors
 *  before they are used by the gfxer.  This allows resolution
 *  independent drawing with a single coordinate system.
 *
 *  \note If this results in scaling or subpixel drawing by the
 *        drawing backend, it will be handled using the appropriate
 *        quality hints.  For best results use integer scaling factors.
 *
 *  \sa SDL_DrawGetScale()
 *  \sa SDL_DrawSetLogicalSize()
 */
extern DECLSPEC int SDLCALL SDL_DrawSetScale(SDL_Draw * gfxer,
                                               float scaleX, float scaleY);

/**
 *  \brief Get the drawing scale for the current target.
 *
 *  \param gfxer The gfxer from which drawing scale should be queried.
 *  \param scaleX A pointer filled in with the horizontal scaling factor
 *  \param scaleY A pointer filled in with the vertical scaling factor
 *
 *  \sa SDL_DrawSetScale()
 */
extern DECLSPEC void SDLCALL SDL_DrawGetScale(SDL_Draw * gfxer,
                                               float *scaleX, float *scaleY);

/**
 *  \brief Set the color used for drawing operations(Rect, Line and Clear).
 *
 *  \param gfxer The gfxer for which drawing color should be set.
 *  \param r The red value used to draw on the drawing target.
 *  \param g The green value used to draw on the drawing target.
 *  \param b The blue value used to draw on the drawing target.
 *  \param a The alpha value used to draw on the drawing target, usually
 *           ::SDL_ALPHA_OPAQUE(255).
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_SetDrawDrawColor(SDL_Draw * gfxer,
                                           Uint8 r, Uint8 g, Uint8 b,
                                           Uint8 a);

/**
 *  \brief Get the color used for drawing operations(Rect, Line and Clear).
 *
 *  \param gfxer The gfxer from which drawing color should be queried.
 *  \param r A pointer to the red value used to draw on the drawing target.
 *  \param g A pointer to the green value used to draw on the drawing target.
 *  \param b A pointer to the blue value used to draw on the drawing target.
 *  \param a A pointer to the alpha value used to draw on the drawing target,
 *           usually ::SDL_ALPHA_OPAQUE(255).
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_GetDrawDrawColor(SDL_Draw * gfxer,
                                           Uint8 * r, Uint8 * g, Uint8 * b,
                                           Uint8 * a);

/**
 *  \brief Set the blend mode used for drawing operations(Fill and Line).
 *
 *  \param gfxer The gfxer for which blend mode should be set.
 *  \param blendMode ::SDL_BlendMode to use for blending.
 *
 *  \return 0 on success, or -1 on error
 *
 *  \note If the blend mode is not supported, the closest supported mode is
 *        chosen.
 *
 *  \sa SDL_GetDrawDrawBlendMode()
 */
extern DECLSPEC int SDLCALL SDL_SetDrawDrawBlendMode(SDL_Draw * gfxer,
                                                       SDL_BlendMode blendMode);

/**
 *  \brief Get the blend mode used for drawing operations.
 *
 *  \param gfxer The gfxer from which blend mode should be queried.
 *  \param blendMode A pointer filled in with the current blend mode.
 *
 *  \return 0 on success, or -1 on error
 *
 *  \sa SDL_SetDrawDrawBlendMode()
 */
extern DECLSPEC int SDLCALL SDL_GetDrawDrawBlendMode(SDL_Draw * gfxer,
                                                       SDL_BlendMode *blendMode);

/**
 *  \brief Clear the current drawing target with the drawing color
 *
 *  This function clears the entire drawing target, ignoring the viewport and
 *  the clip rectangle.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawClear(SDL_Draw * gfxer);

/**
 *  \brief Draw a point on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw a point.
 *  \param x The x coordinate of the point.
 *  \param y The y coordinate of the point.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawPoint(SDL_Draw * gfxer,
                                                int x, int y);

/**
 *  \brief Draw multiple points on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw multiple points.
 *  \param points The points to draw
 *  \param count The number of points to draw
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawPoints(SDL_Draw * gfxer,
                                                 const SDL_Point * points,
                                                 int count);

/**
 *  \brief Draw a line on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw a line.
 *  \param x1 The x coordinate of the start point.
 *  \param y1 The y coordinate of the start point.
 *  \param x2 The x coordinate of the end point.
 *  \param y2 The y coordinate of the end point.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawLine(SDL_Draw * gfxer,
                                               int x1, int y1, int x2, int y2);

/**
 *  \brief Draw a series of connected lines on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw multiple lines.
 *  \param points The points along the lines
 *  \param count The number of points, drawing count-1 lines
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawLines(SDL_Draw * gfxer,
                                                const SDL_Point * points,
                                                int count);

/**
 *  \brief Draw a rectangle on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw a rectangle.
 *  \param rect A pointer to the destination rectangle, or NULL to outline the entire drawing target.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawRect(SDL_Draw * gfxer,
                                               const SDL_Rect * rect);

/**
 *  \brief Draw some number of rectangles on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw multiple rectangles.
 *  \param rects A pointer to an array of destination rectangles.
 *  \param count The number of rectangles.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawRects(SDL_Draw * gfxer,
                                                const SDL_Rect * rects,
                                                int count);

/**
 *  \brief Fill a rectangle on the current drawing target with the drawing color.
 *
 *  \param gfxer The gfxer which should fill a rectangle.
 *  \param rect A pointer to the destination rectangle, or NULL for the entire
 *              drawing target.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawFillRect(SDL_Draw * gfxer,
                                               const SDL_Rect * rect);

/**
 *  \brief Fill some number of rectangles on the current drawing target with the drawing color.
 *
 *  \param gfxer The gfxer which should fill multiple rectangles.
 *  \param rects A pointer to an array of destination rectangles.
 *  \param count The number of rectangles.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawFillRects(SDL_Draw * gfxer,
                                                const SDL_Rect * rects,
                                                int count);

/**
 *  \brief Copy a portion of the texture to the current drawing target.
 *
 *  \param gfxer The gfxer which should copy parts of a texture.
 *  \param texture The source texture.
 *  \param srcrect   A pointer to the source rectangle, or NULL for the entire
 *                   texture.
 *  \param dstrect   A pointer to the destination rectangle, or NULL for the
 *                   entire drawing target.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawCopy(SDL_Draw * gfxer,
                                           SDL_Texture * texture,
                                           const SDL_Rect * srcrect,
                                           const SDL_Rect * dstrect);

/**
 *  \brief Copy a portion of the source texture to the current drawing target, rotating it by angle around the given center
 *
 *  \param gfxer The gfxer which should copy parts of a texture.
 *  \param texture The source texture.
 *  \param srcrect   A pointer to the source rectangle, or NULL for the entire
 *                   texture.
 *  \param dstrect   A pointer to the destination rectangle, or NULL for the
 *                   entire drawing target.
 *  \param angle    An angle in degrees that indicates the rotation that will be applied to dstrect, rotating it in a clockwise direction
 *  \param center   A pointer to a point indicating the point around which dstrect will be rotated(if NULL, rotation will be done around dstrect.w/2, dstrect.h/2).
 *  \param flip     An SDL_DrawFlip value stating which flipping actions should be performed on the texture
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawCopyEx(SDL_Draw * gfxer,
                                           SDL_Texture * texture,
                                           const SDL_Rect * srcrect,
                                           const SDL_Rect * dstrect,
                                           const double angle,
                                           const SDL_Point *center,
                                           const SDL_DrawFlip flip);


/**
 *  \brief Draw a point on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw a point.
 *  \param x The x coordinate of the point.
 *  \param y The y coordinate of the point.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawPointF(SDL_Draw * gfxer,
                                                 float x, float y);

/**
 *  \brief Draw multiple points on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw multiple points.
 *  \param points The points to draw
 *  \param count The number of points to draw
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawPointsF(SDL_Draw * gfxer,
                                                  const SDL_FPoint * points,
                                                  int count);

/**
 *  \brief Draw a line on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw a line.
 *  \param x1 The x coordinate of the start point.
 *  \param y1 The y coordinate of the start point.
 *  \param x2 The x coordinate of the end point.
 *  \param y2 The y coordinate of the end point.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawLineF(SDL_Draw * gfxer,
                                                float x1, float y1, float x2, float y2);

/**
 *  \brief Draw a series of connected lines on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw multiple lines.
 *  \param points The points along the lines
 *  \param count The number of points, drawing count-1 lines
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawLinesF(SDL_Draw * gfxer,
                                                const SDL_FPoint * points,
                                                int count);

/**
 *  \brief Draw a rectangle on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw a rectangle.
 *  \param rect A pointer to the destination rectangle, or NULL to outline the entire drawing target.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawRectF(SDL_Draw * gfxer,
                                               const SDL_FRect * rect);

/**
 *  \brief Draw some number of rectangles on the current drawing target.
 *
 *  \param gfxer The gfxer which should draw multiple rectangles.
 *  \param rects A pointer to an array of destination rectangles.
 *  \param count The number of rectangles.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawDrawRectsF(SDL_Draw * gfxer,
                                                 const SDL_FRect * rects,
                                                 int count);

/**
 *  \brief Fill a rectangle on the current drawing target with the drawing color.
 *
 *  \param gfxer The gfxer which should fill a rectangle.
 *  \param rect A pointer to the destination rectangle, or NULL for the entire
 *              drawing target.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawFillRectF(SDL_Draw * gfxer,
                                                const SDL_FRect * rect);

/**
 *  \brief Fill some number of rectangles on the current drawing target with the drawing color.
 *
 *  \param gfxer The gfxer which should fill multiple rectangles.
 *  \param rects A pointer to an array of destination rectangles.
 *  \param count The number of rectangles.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawFillRectsF(SDL_Draw * gfxer,
                                                 const SDL_FRect * rects,
                                                 int count);

/**
 *  \brief Copy a portion of the texture to the current drawing target.
 *
 *  \param gfxer The gfxer which should copy parts of a texture.
 *  \param texture The source texture.
 *  \param srcrect   A pointer to the source rectangle, or NULL for the entire
 *                   texture.
 *  \param dstrect   A pointer to the destination rectangle, or NULL for the
 *                   entire drawing target.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawCopyF(SDL_Draw * gfxer,
                                            SDL_Texture * texture,
                                            const SDL_Rect * srcrect,
                                            const SDL_FRect * dstrect);

/**
 *  \brief Copy a portion of the source texture to the current drawing target, rotating it by angle around the given center
 *
 *  \param gfxer The gfxer which should copy parts of a texture.
 *  \param texture The source texture.
 *  \param srcrect   A pointer to the source rectangle, or NULL for the entire
 *                   texture.
 *  \param dstrect   A pointer to the destination rectangle, or NULL for the
 *                   entire drawing target.
 *  \param angle    An angle in degrees that indicates the rotation that will be applied to dstrect, rotating it in a clockwise direction
 *  \param center   A pointer to a point indicating the point around which dstrect will be rotated(if NULL, rotation will be done around dstrect.w/2, dstrect.h/2).
 *  \param flip     An SDL_DrawFlip value stating which flipping actions should be performed on the texture
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_DrawCopyExF(SDL_Draw * gfxer,
                                            SDL_Texture * texture,
                                            const SDL_Rect * srcrect,
                                            const SDL_FRect * dstrect,
                                            const double angle,
                                            const SDL_FPoint *center,
                                            const SDL_DrawFlip flip);

/**
 *  \brief Read pixels from the current drawing target.
 *
 *  \param gfxer The gfxer from which pixels should be read.
 *  \param rect   A pointer to the rectangle to read, or NULL for the entire
 *                draw target.
 *  \param format The desired format of the pixel data, or 0 to use the format
 *                of the drawing target
 *  \param pixels A pointer to be filled in with the pixel data
 *  \param pitch  The pitch of the pixels parameter.
 *
 *  \return 0 on success, or -1 if pixel reading is not supported.
 *
 *  \warning This is a very slow operation, and should not be used frequently.
 */
extern DECLSPEC int SDLCALL SDL_DrawReadPixels(SDL_Draw * gfxer,
                                                 const SDL_Rect * rect,
                                                 Uint32 format,
                                                 void *pixels, int pitch);

/**
 *  \brief Update the screen with drawing performed.
 */
extern DECLSPEC void SDLCALL SDL_DrawPresent(SDL_Draw * gfxer);

/**
 *  \brief Destroy the specified texture.
 *
 *  \sa SDL_CreateTexture()
 *  \sa SDL_CreateTextureFromSurface()
 */
extern DECLSPEC void SDLCALL SDL_DestroyTexture(SDL_Texture * texture);

/**
 *  \brief Destroy the drawing context for a window and free associated
 *         textures.
 *
 *  \sa SDL_CreateDraw()
 */
extern DECLSPEC void SDLCALL SDL_DestroyDraw(SDL_Draw * gfxer);

/**
 *  \brief Force the drawing context to flush any pending commands to the
 *         underlying drawing API.
 *
 *  You do not need to(and in fact, shouldn't) call this function unless
 *  you are planning to call into OpenGL/Direct3D/Metal/whatever directly
 *  in addition to using an SDL_Draw.
 *
 *  This is for a very-specific case: if you are using SDL's draw API,
 *  you asked for a specific gfxer backend(OpenGL, Direct3D, etc),
 *  you set SDL_HINT_DRAW_BATCHING to "1", and you plan to make
 *  OpenGL/D3D/whatever calls in addition to SDL draw API calls. If all of
 *  this applies, you should call SDL_DrawFlush() between calls to SDL's
 *  draw API and the low-level API you're using in cooperation.
 *
 *  In all other cases, you can ignore this function. This is only here to
 *  get maximum performance out of a specific situation. In all other cases,
 *  SDL will do the right thing, perhaps at a performance loss.
 *
 *  This function is first available in SDL 2.0.10, and is not needed in
 *  2.0.9 and earlier, as earlier versions did not queue drawing commands
 *  at all, instead flushing them to the OS immediately.
 */
extern DECLSPEC int SDLCALL SDL_DrawFlush(SDL_Draw * gfxer);


/**
 *  \brief Bind the texture to the current OpenGL/ES/ES2 context for use with
 *         OpenGL instructions.
 *
 *  \param texture  The SDL texture to bind
 *  \param texw     A pointer to a float that will be filled with the texture width
 *  \param texh     A pointer to a float that will be filled with the texture height
 *
 *  \return 0 on success, or -1 if the operation is not supported
 */
extern DECLSPEC int SDLCALL SDL_GL_BindTexture(SDL_Texture *texture, float *texw, float *texh);

/**
 *  \brief Unbind a texture from the current OpenGL/ES/ES2 context.
 *
 *  \param texture  The SDL texture to unbind
 *
 *  \return 0 on success, or -1 if the operation is not supported
 */
extern DECLSPEC int SDLCALL SDL_GL_UnbindTexture(SDL_Texture *texture);

/**
 *  \brief Get the CAMetalLayer associated with the given Metal gfxer
 *
 *  \param gfxer The gfxer to query
 *
 *  \return CAMetalLayer* on success, or NULL if the gfxer isn't a Metal gfxer
 *
 *  \sa SDL_DrawGetMetalCommandEncoder()
 */
extern DECLSPEC void *SDLCALL SDL_DrawGetMetalLayer(SDL_Draw * gfxer);

/**
 *  \brief Get the Metal command encoder for the current frame
 *
 *  \param gfxer The gfxer to query
 *
 *  \return id<MTLDrawCommandEncoder> on success, or NULL if the gfxer isn't a Metal gfxer
 *
 *  \sa SDL_DrawGetMetalLayer()
 */
extern DECLSPEC void *SDLCALL SDL_DrawGetMetalCommandEncoder(SDL_Draw * gfxer);

/* Ends C function definitions when using C++ */
#ifdef __cplusplus
}
#endif
#include "close_code.h"

#endif /* SDL_draw_h_ */

/* vi: set ts=4 sw=4 expandtab: */
