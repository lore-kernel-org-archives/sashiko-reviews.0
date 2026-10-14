Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF77C545D84
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993341; cv=pass; b=QlrNItsbmmtNOGAP2bhbfGs+RC4+5aY7mE1VPQOxn+FIf+jl/E3RPOth8xMvzfySkiCRBl4gAUusDcyTqv6LG29pksjq+i9bU1c6RZQplFEmv3N1MvVmMqt4nM7+SZo8rW/Mf2+3WURD9o37yiPgBi90ZIAZHAGeZmoQQmgNZ5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993341; c=relaxed/simple;
	bh=pO8eBqulEtsIxpsdqylnOb0tDeTGErz5axKG+0FKMCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVP/A7AP4B9gSTeHwb+2rAaaT3oAZWzfc4q+unTfi1j1c5Mw0RT10FL/SDnTQisFA5pCHDO194iNd18o9vEnd6RRHguairaIDfZr9VtIObkb5sUmeKqR2+tmXsgUVELRIb0MbKl+iwnlOO6fHuMYCI3COoNzY7e88IPQN/imOL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o84trl3r; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o84trl3r"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30b6dad2382so9918914eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 08:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791993339; cv=none;
        d=google.com; s=arc-20260327;
        b=ElNGdS9TGq+vPE9xne1dXHv8BtFx4wsXr9PcSgczL9hU00Cx+jdyEqSAZXvhG3mnhw
         BLWSS0T1UM79phnpqf6K2fEbZHbeQpgza3+Ei20bibiAzkX/WKbU6uf/wEGF/QQBTk21
         dVO1ssp9YUFDnkQ+RpTYzdGTQNtZtyxcUDxg6V+04CLEoQNCb9X4e3e7WIgOA55hc+m7
         /cNRsX3VUSuX98IATl5irNRL9ExxJmanmO+89y4Ow+f/HHaVFig4WhtfuntNIbhw0UtM
         FDEmCQxIYzaKzwcz0QFr8FPgd3hnID+xC5D1Wer9sQTyDT9RNdpp/NTw3gn5+LDoORcl
         rvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2XXdOgd3LhsMPgu7e26Zyz/aXhCrCbllsm1LzmgfNuM=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=gUFco6AvGBnFmv3B9sNNJ6FE2Q7dAVU8y/k5NQBj5TFX3X63wT9079/twJHgmNQ8wx
         tTBvg3D98MIUD5owbwdId57j+rgNQ3/XSJElEWa/rkfsbbrIgF9dMH52uEfixYWeZX3Z
         Rjj6LipfiBzDhEKMVrr/OAaJrhZJkb++5L6Qjgmy3tFk/WJ/dJoV7eFVWVlzoEHAETx2
         6Ix4dZv46oeX2oSdcSTt/YQVRnPdViTmUdSWYKL2iN6zW+3xz7qEZ2kWEweNfJ86pS7i
         mf7oOPAd1YkWUgFgzoATO4dh3FMsGgpTYw4pJ3oA+Oyel06Y8WxyWX0t+v3zWUYP6xCX
         0+3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791993339; x=1792598139; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2XXdOgd3LhsMPgu7e26Zyz/aXhCrCbllsm1LzmgfNuM=;
        b=o84trl3r30Ha7EhIm1QApko/WV93EmVCo1WBZp/r2VjrXR0mR+gZUzaqLIf10f3EsA
         zW7t/oM5BqFcPF314QyvtDOEt7fSa4j61cDpAE8KltH+JSN/cQdO9k783uzUowySxzJV
         879NUWO4GKJKGJ7cDK+bfC4pGYAksqXV526bx9XHgzN9UlNFpZi2yP1/C79MXZHlaxYq
         hooCd7kxlFmRJYjHDeAHHTWvb1DbSvyWcGcKLlJPAT+KCM2Dk5stwy/yIkhLNTQpomGV
         T+KdR+uDBCpTtYH5Ux7MDYqbBruyCe+GhFkCl0i9/iJU/NN6pkzQ6HosR0t6lfv3o9Vg
         ipYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993339; x=1792598139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2XXdOgd3LhsMPgu7e26Zyz/aXhCrCbllsm1LzmgfNuM=;
        b=xaq+KUFl7jJG85egNcfIV7N+HlOmnXd7QY0nc1dTaaulP7mtImlqiF+g39QzBlfmId
         W3cH6X2zkewWQGBDYFkC6CN9yBroyzg4rk1S4n9PElUW2miPucK8a96ZI6q724vLkTZK
         fkfrZjV3b1AoGfjxLZd5ICHW3J1I0AfJXa5jXZ/ueTrm9CVp+Vb2KpHAtUUL7/vYQyN6
         47IDbo4jUhwpGvvbeI5hNbZFgXRrAulGdDW4HyVYP6LOypGMt26pi6Vv2yTpOX3B4xHb
         C3fLE7lhhN/amBBr3IJl+aFXf41Vr4zQzs6oXpDi0Ta1vKWdYvUvHTiNdtryNvT8GsGg
         Sv4w==
X-Gm-Message-State: AFq9FYKKB8xXTvAPDKOYx+cI3H24FgFvEUw9iYOzEawmL255YEPyPVCs
	5eXkddngvZgOj2YchB6U4nq9R3wuzlRFt0pxMufvbsgqt/S+UxWDcgUmpoSiO1vrjRmeJ2ZWEWZ
	8WDEm1fW9AR0dn1TuL3CFHiXMBji2zrkRKjPs
X-Gm-Gg: AYBFou3Xw+PCkjwCH5YtItKzxpTCfmNgF62us0ipX4cW9d2iHiIUC87tG5T2uN8t1I2
	JdOa9JfMdfAfF2b3u2AbOeJtHzaMyCtjeU6m8SLo+2PA8H4OR/yCFLNyk4CmagbD7rnfwXQ3yUY
	Vz/NSvWtuwVlcRISv8ruqDqWFf76nl6nCY6Q0Y1BRrTLs8YxMZbmDMl/WleICF6Rh95JEEg//R1
	gFzbR4gXVHAEFSTDEPgnoW56XJAeJ/0q+D4+SlMgdU5er91ccbjfqULP6DOVJRauaVLCyuqP0j4
	KQp0Fij25CqIPqMGp6VBaUlDCH0aQYDbJxfiUj+qnphfoAx+SB170m1cog==
X-Received: by 2002:a05:7300:f582:b0:353:5ae1:b0f5 with SMTP id
 5a478bee46e88-3537e101bf0mr22008049eec.26.1791993338445; Wed, 14 Oct 2026
 08:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012190249.3167-1-henryzhang62@gmail.com> <20261012190249.3167-3-henryzhang62@gmail.com>
 <sashiko-outbox-168575@kernel.org>
In-Reply-To: <sashiko-outbox-168575@kernel.org>
From: Henry Zhang <henryzhang62@gmail.com>
Date: Wed, 14 Oct 2026 08:55:27 -0700
X-Gm-Features: AclHuK_eh9bczZI4ebGr5UhWIqsDinkzAv7SQWdD090e4uC4ltYZQMFfxCEVzUk
Message-ID: <CANTW0yoUt9v5xgMQxRWdOGyWVxTW0x_o1=qwuLPjSCDq_DkkUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/vc4: dsi: Recover from a timed-out transfer
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:16=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] drm/vc4: dsi: premature controller enable during timeout reset c=
auses hardware instability
> - [High] drm/vc4: dsi: spurious completion due to IRQ handler TOCTOU race
> - [Medium] drm/vc4: missing mutex serialization in DSI host transfer
> --
Thanks for the review.

1. Agreed. Mainline's pre_enable ungates the block only after the PHY
   timings, timeouts and DISP1 are programmed; the restore must follow
   the same order. Will fix in v2.
2. Agreed. The race predates this patch, but the timeout path is the
   right place to close it; v2 will call synchronize_irq() before the
   reset.
3. vc4_dsi_host_transfer() has never serialized transfers. I'll add a
   separate patch in v2 that takes a mutex around host transfers.

Henry

> commit b73bc40cfc01c81e251315be152ff0c2c6aa9361
> Author: Henry Zhang <henryzhang62@gmail.com>
>
> drm/vc4: dsi: Recover from a timed-out transfer
>
> When a transfer times out, vc4_dsi_host_transfer() disables the command,
> resets the FIFOs and returns -ETIMEDOUT. This commit adds a recovery
> mechanism that resets the DSI block and its analog front end after a
> timeout and restores the configuration so DSI keeps working without a
> modeset.
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.=
c
> index c092a1aaf700a..3783ff3eeac97 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> [ ... ]
> @@ -1359,6 +1358,93 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_d=
si_host *host,
>         return ret;
>  }
>
> +/*
> + * Reset the DSI block and its analog front end, then restore the
> + * configuration done in pre_enable. Resetting the FIFOs alone does not
> + * clear the state the block can be left in after a transfer timed out
> + * (e.g. on an LP receive timeout): every following transfer then times
> + * out as well, until the next modeset.
> + */
> +static void vc4_dsi_reset_and_restore(struct vc4_dsi *dsi)
> +{
> +       u32 ctrl =3D DSI_PORT_READ(CTRL);
> +       u32 afec0 =3D DSI_PORT_READ(PHY_AFEC0);
> [ ... ]
> +       DSI_PORT_WRITE(DISP0_CTRL, disp0);
> +       DSI_PORT_WRITE(TXPKT1C, 0);
> +       DSI_PORT_WRITE(CTRL, DSI_CTRL_SOFT_RESET_CFG |
> +                      DSI_PORT_BIT(CTRL_RESET_FIFOS));
> +       DSI_PORT_WRITE(PHY_AFEC0, afec0 | DSI_PORT_BIT(PHY_AFEC0_RESET));
> +       /* AFEC reset hold time */
> +       mdelay(1);
> +
> +       DSI_PORT_WRITE(CTRL, ctrl & ~DSI_CTRL_CAL_BYTE);
> +       DSI_PORT_WRITE(HSTX_TO_CNT, hstx_to);
> +       DSI_PORT_WRITE(LPRX_TO_CNT, lprx_to);
>
> [Severity: High]
> Can writing ctrl & ~DSI_CTRL_CAL_BYTE back to CTRL prematurely un-gate an=
d
> enable the controller before the subsequent writes to timing and PHY
> configuration registers?
>
> Since ctrl was read while a transfer was in progress, it contains the ena=
ble
> bit (DSI0_CTRL_CTRL0 or DSI1_CTRL_EN).
>
> Writing it back here enables the hardware block before its timings
> (HSTX_TO_CNT, HS_CLT0, PHYC, etc.) are restored, which could cause errati=
c bus
> behavior and unrecoverable hardware states.
>
> > +     DSI_PORT_WRITE(TA_TO_CNT, ta_to);
> [ ... ]
> +static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
> +                                    const struct mipi_dsi_msg *msg)
> +{
> +       struct vc4_dsi *dsi =3D host_to_dsi(host);
> +       u32 disp0_ctrl;
> +       ssize_t ret;
> +
> +       ret =3D vc4_dsi_transfer(dsi, msg);
>
> [Severity: Medium]
> Does this entry point need a mutex to serialize concurrent transfers?
>
> If user-space concurrently triggers DCS commands (e.g., via sysfs backlig=
ht
> updates and DRM KMS modesets), they can race because vc4_dsi_transfer()
> modifies shared variables like dsi->xfer_completion without a lock.
>
> With this patch, a timeout caused by such a race now triggers a full bloc=
k
> reset in vc4_dsi_reset_and_restore(), disrupting any interleaved concurre=
nt
> transfer.
>
> +       if (ret !=3D -ETIMEDOUT)
> +               return ret;
> +
> +       /*
> +        * Leave the block usable for the next transfer. The message is n=
ot
> +        * resent: it may already have reached the peripheral, and only t=
he
> +        * caller knows whether it is safe to repeat.
> +        */
> +       disp0_ctrl =3D DSI_PORT_READ(DISP0_CTRL);
> +       dev_warn(&dsi->pdev->dev,
> +                "transfer timed out (stat 0x%08x), resetting DSI\n",
> +                DSI_PORT_READ(STAT));
> +       vc4_dsi_reset_and_restore(dsi);
> +       DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
> +
> +       return ret;
> +}
>
> [Severity: High]
> Can a timed-out transfer cause a spurious completion of a subsequent tran=
sfer?
>
> If vc4_dsi_transfer() times out, wait_for_completion_timeout() returns.
> However, if the hardware interrupt had fired and the threaded IRQ handler
> (vc4_dsi_irq_handler) was preempted before calling
> complete(&dsi->xfer_completion), it could still be pending.
>
> Since there is no synchronization (like synchronize_irq()) in this timeou=
t
> recovery path to wait for the IRQ handler to finish, it returns immediate=
ly.
>
> The caller might retry the transfer, reinitializing dsi->xfer_completion.=
 The
> preempted IRQ thread could then resume, calling complete() and falsely wa=
king up
> the new transfer prematurely while the hardware is still busy.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012190249.31=
67-1-henryzhang62@gmail.com?part=3D2
