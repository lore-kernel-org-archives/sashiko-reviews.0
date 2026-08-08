Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4F03191D6
	for <sashiko-reviews@lists.linux.dev>; Sat,  8 Aug 2026 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786188030; cv=pass; b=rzldHkSNygf1zSSgDItr7WN4FvtSppOflRjPsKNWfP8F6FEf0fUqiRW9E/hMimkdAYtS/jKfsaL0rVROBQXMfsDhnmBtu+fhWXh2uhuBS9S/tLuBBB8TqslzuttzHZSgSreeLKN4YjzrWb8URnrnhQ25F4gMS4qLFuzXk+rerKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786188030; c=relaxed/simple;
	bh=TWLphmIi2kimQzCJscprLxq2t1Tk6kjAiP54AgHPs9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVcCTVVxDCtQYP+boCHbgU36kcoQ8WKJ5Lac2DuvpdXk2qRRUrGppJu+EmDA0RxTLGxmMYva8qGB8CBizDVvxrMEZmGAjJADaYfluWH20wXGqKTCYLGws6yuCJqbgXVLq5vxaCFWUzQRd7a3Asx3VLMjrbKTyQvHMHeS0rMgueg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pWG3vIMz; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWG3vIMz"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-80bb41f7f3cso4024797b3.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 08 Aug 2026 04:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786188028; cv=none;
        d=google.com; s=arc-20260327;
        b=R65OGAgBpf/4hVhsuFhFXFPLCksZroRsM6vnnFYFM7wr2piKfEERCzI1x5qQn5Y+bc
         1ntCd4Zs/CbXjtuEQ+3Zu3+S1KLaxMIeSAH81Y5pRkwUvCUfmHG7BRz56/INBtROHvGB
         RP2FwVP80yMFG8OihQg2haVlKX0/FPRT2g2bWuGeCJk4oGUjmtX/jGEEVQ56Av7Lh6th
         pHEyUIB/QYvRtir2JfsycFRjU+50m5V0C95ezV2M9QHqCt3luiYADVT47WyXuaoP6LOS
         IBeYlt//UYoPzheVcbGEnN0CDpPUrdOp/bxWELtLxVpIIfODI01n8G9gwRvgXcfEe+YF
         wWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lMTBDnwIBEolYLfeXzMCEeMWNrHRiWHBpgIPWsoSmI=;
        fh=3HEnILFhrdVh+hHtdPC8bOVWQi7VkwWDlgNweflG/6k=;
        b=qRGMpEZb19x/rTguxczKmOnz9getU7lW8c2N3ctm4djT/zqCNxsywWGn55IvW8IuFG
         VEj4WlfUjM6GTgHkNg4kD/oakzYaKtKecskjyXxw2R/5R+VGvD0FzuM5Y7AkxSdrP6wD
         xAAP53pSZ5Z6GYyqQNAeAmGgQ35D4hBT93ZaNw7mYDocWWN+n3DRMWSJGlyiB9GQpZbT
         F6dw5pT5TURBYqlDHpwGEDFU7KFZHMb2vCZLWeofWqV0n+SrMEz8MUi8SEBiXok+WPmX
         InHDMV47uDERrTRdvdmj31dO7CDuIGPLEWFsVHwmx732AzqRyH5J9o3Pa5qFPcXD1pSi
         0bxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786188028; x=1786792828; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lMTBDnwIBEolYLfeXzMCEeMWNrHRiWHBpgIPWsoSmI=;
        b=pWG3vIMzlHD+8NdVTbULHuSXub+k5aLwgyP5hs4GpAOCzya8TBU83NIV1ved9byt3G
         xKWmn/VdyAVguHFtmDbk/16lwm5Kize5tf7LOQ4kSNjeCfzBmqY5p53z4GTfeO7ayaX/
         kFQ9eSwMAY+tIxy97ph7XFXgkFIF2TEmFNBBmnqaSDlS2bnL32m0gSMARxY5wdL6Z7y1
         +jYbSJ2NwAOY/6U28PlJlLwIGJFVooWxmWosymDhz9jAHlcu2QUPR/sKNfbDdlmTSsDk
         GP8Dh6Sir4TXXAOv7Ho9yz0Nnza1URAXZaSog7+OTIrsaFo+FnhrqVaVZ5SFeL9I99Hv
         Smtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786188028; x=1786792828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lMTBDnwIBEolYLfeXzMCEeMWNrHRiWHBpgIPWsoSmI=;
        b=jr2feUtybARn0JDcWxfCTHWgq9CjcalY2bv2O4nmKaINbwY7AIVEFim+mT9HfC/CyP
         H51r1MKsjiI/DG0pYtCVczLqIa3x+RQG5q+5NUJQWe9BRWlQSx6tYvIq2tLIYPTerxju
         ZBH5Wur1s3BheZXzjtbzHLaYqW1e0fLcKGwrXLYPhHj+h3GL1N1VePrsWsgF2jqhy05C
         bVgV32iHKbvLfDiiMg59KciockTxCj80p+QAsWc+bvS7X7MywB8fJfjpsHCfp1r2x/XN
         sAAvTQcAOlXFGTfxMsDH9WRotSfO0b/4wbbRdYFA6OptkxA2ItTr+4Sg1vWNWNmU0cD1
         gqhw==
X-Gm-Message-State: AOJu0Yxi5L35HZRQneRe67DeXOWAV2Bmf6gEiMdt6eKVLBjGILwbSZsP
	HGDhmiah/K8sbQoLkCAD4YQfWf2WBK6pLnXVPjuSYlehtjGTjnhhRQmycnqBtNdg8ukQcKOq3GM
	auy5vVvuWfdHbqS77zS2UEZf3RzO2ZWVLjoKlW4rJWw==
X-Gm-Gg: AR+sD11ZorPij4uBeyLH/bXtXbxwFmRIJw8HCn0oJNRVkG7WoJxgllTeIYetw2qheGh
	2iFC186Z/bXSjk3n/0LkY+HatUPfISyuCd+e85Xte4NjOjiPKc5qnNn3Q21UbRempO+wToE8WIW
	QLBSjacsixYYfsGxzTqrVbPuf4uXtu3dF4ZwjLqQRZAN2N5dh9uDeX5ZbzaW83DEga4m3+H6YMl
	dTODG3aXG3Ql7CPh0grCEqg6BaQrCrtCSQHS0YG4Dll6fBvSuavlY76Ny0f3ifYtv4DMHvCPuso
	x39oGd8DJgLlxY0uF0u8w9UaxFWZif79Sf7imBOLfa5y
X-Received: by 2002:a05:690c:4587:b0:81e:6c2e:f114 with SMTP id
 00721157ae682-8225d08d51bmr92640247b3.30.1786188027924; Sat, 08 Aug 2026
 04:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260808091151.2691482-1-congnt264@gmail.com> <20260808092336.B72451F000E9@smtp.kernel.org>
In-Reply-To: <20260808092336.B72451F000E9@smtp.kernel.org>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Sat, 8 Aug 2026 18:20:17 +0700
X-Gm-Features: AUfX_mwL9hQFTg60PgMNaG31rZwxLVbY7r_wH_4Q0kmBiIMOXsojo4RGbteIBU8
Message-ID: <CAJpJ=GuZhiU7NurhLqVgLzRd-pc2hD2OR4zP_gycMJ81KXrRcA@mail.gmail.com>
Subject: Re: [PATCH] media: sun4i-csi: fix async connection leak when notifier
 registration fails
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 4:23=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Missing cleanup of registered video and subdev devices in `sun4i=
_csi_notify_complete()` error paths leads to device leaks and potential Use=
-After-Free.
> - [High] The driver does not disable hardware interrupts or synchronize t=
he IRQ handler when stopping capture, allowing an interrupt to crash the sy=
stem after device suspension.
> - [High] Missing `.unbind` callback allows the video device to retain and=
 access a freed subdevice pointer (`csi->src_subdev`).
> --
>
> --- Patch [1]: [PATCH] media: sun4i-csi: fix async connection leak when n=
otifier registration fails ---
> commit d13febea573e64b9e585c2c1f9b472e41737683c
> Author: Cong Nguyen <congnt264@gmail.com>
>
> media: sun4i-csi: fix async connection leak when notifier registration fa=
ils
>
> sun4i_csi_notifier_init() adds a v4l2_async_connection to the notifier's
> waiting list with v4l2_async_nf_add_fwnode_remote(). If the subsequent
> v4l2_async_nf_register() then fails, probe jumps to err_unregister_media,
> which never calls v4l2_async_nf_cleanup(). The core does not free the
> waiting list on a failed registration, so the async connection is leaked.
>
> Add an err_clean_notifier label that cleans up the notifier on the
> registration-failure path, matching the teardown done in
> sun4i_csi_remove(). The notifier-init failure path adds nothing to the
> notifier and continues to skip the cleanup.
>
> > diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drive=
rs/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > index e53a07b770b7e..a8db851ab5a59 100644
> > --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > @@ -255,13 +255,15 @@ static int sun4i_csi_probe(struct platform_device=
 *pdev)
> >       ret =3D v4l2_async_nf_register(&csi->notifier);
> >       if (ret) {
> >               dev_err(csi->dev, "Couldn't register our notifier.\n");
> > -             goto err_unregister_media;
> > +             goto err_clean_notifier;
> >       }
> >
> >       pm_runtime_enable(&pdev->dev);
> >
> >       return 0;
> >
> > +err_clean_notifier:
> > +     v4l2_async_nf_cleanup(&csi->notifier);
> >  err_unregister_media:
> >       media_device_unregister(&csi->mdev);
> >       sun4i_csi_dma_unregister(csi);
>
> [Severity: High]
> This is a pre-existing issue, but does sun4i_csi_notify_complete() leak
> registered video and subdev devices in its error paths?
>
> If media_create_pad_link() or other subsequent operations fail, the error
> path err_clean_media only unregisters the media device:
>
> drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c:sun4i_csi_notify_compl=
ete() {
>     ...
> err_clean_media:
>         media_device_unregister(&csi->mdev);
>
>         return ret;
> }
>
> It doesn't seem to unregister the video device or the subdev. Because thi=
s
> failure propagates back to v4l2_async_nf_register(), the probe will fail
> and the driver's devm-managed memory is freed.
>
> Since the /dev/videoX node remains active but points to freed memory,
> could userspace access trigger a use-after-free?
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is the driver leaving
> hardware interrupts enabled when stopping capture?
>
> In sun4i_csi_stop_streaming(), the hardware capture is stopped, but the
> interrupt enable register doesn't appear to be cleared and there is no
> call to synchronize_irq():
>
> drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c:sun4i_csi_stop_streami=
ng() {
>     ...
>         v4l2_subdev_call(csi->src_subdev, video, s_stream, 0);
>         sun4i_csi_capture_stop(csi);
>
>         /* Release all active buffers */
>     ...
> }
>
> Because capture stops at the end of the current frame, a frame-done
> interrupt could fire shortly after this function returns. If userspace
> closes the device, sun4i_csi_release() invokes pm_runtime_put(), powering
> down the hardware block.
>
> When the delayed interrupt fires, could the interrupt handler attempt to =
read
> registers on powered-down hardware and cause a system crash?
>
> drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c:sun4i_csi_irq() {
>     ...
>         reg =3D readl(csi->regs + CSI_INT_STA_REG);
>
>         /* Acknowledge the interrupts */
>         writel(reg, csi->regs + CSI_INT_STA_REG);
>     ...
> }
>
> [Severity: High]
> This is a pre-existing issue, but is sun4i_csi_notify_ops missing an
> .unbind callback?
>
> drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c:
>     ...
> static const struct v4l2_async_notifier_operations sun4i_csi_notify_ops =
=3D {
>         .bound          =3D sun4i_csi_notify_bound,
>         .complete       =3D sun4i_csi_notify_complete,
> };
>     ...
>
> If the remote sensor module is unloaded, the V4L2 async core unbinds
> and frees the subdevice, but it appears csi->src_subdev is never cleared
> and the video node is never unregistered.
>
> If userspace calls VIDIOC_STREAMON afterward, does sun4i_csi_start_stream=
ing()
> dereference the freed csi->src_subdev pointer here?
>
> drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c:sun4i_csi_start_stream=
ing() {
>     ...
>         ret =3D v4l2_subdev_call(csi->src_subdev, video, s_stream, 1);
>         if (ret < 0 && ret !=3D -ENOIOCTLCMD)
>                 goto err_disable_device;
>     ...
> }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808091151.26=
91482-1-congnt264@gmail.com?part=3D1

Thanks for the review. I checked all three against the code =E2=80=94 they =
are
all real pre-existing bugs, independent of this async-notifier cleanup
patch. I've prepared a separate 3-patch series to address them:

1. Missing cleanup in sun4i_csi_notify_complete() error paths

   Confirmed. sun4i_csi_v4l2_register() calls video_register_device(), so
   /dev/videoX is live before the pad links and subdev nodes are set up.
   On failure err_clean_media only unregisters the media device, leaving
   the video device (and the bridge subdev) registered. Since the failure
   aborts probe, the devm-managed sun4i_csi (which embeds the video_device)
   is freed while the node is still registered -> UAF on open(). Fixed by
   unwinding the registrations in reverse order, matching sun4i_csi_remove(=
).

2. Interrupts left enabled in sun4i_csi_stop_streaming()

   Confirmed. start_streaming() enables CSI_INT_FRM_DONE in CSI_INT_EN_REG,
   but capture_stop() only clears CSI_CPT_CTRL_REG and stop_streaming() has
   no synchronize_irq(). A frame-done IRQ can fire after streaming stops;
   if userspace then closes the device, pm_runtime_put() gates the clocks
   and asserts reset, and a late handler touches registers on a dead block.
   Fixed by clearing CSI_INT_EN_REG and calling synchronize_irq() in
   stop_streaming() before the buffers/scratch are released.

3. Missing .unbind callback in sun4i_csi_notify_ops

   Confirmed. Without .unbind, csi->src_subdev is left dangling when the
   remote sensor is unbound/freed, and a later VIDIOC_STREAMON dereferences
   it in sun4i_csi_start_streaming() -> UAF. Fixed by adding an .unbind tha=
t
   unregisters the video device and clears csi->src_subdev.

I'll send these as a follow-up series ("media: sun4i-csi: fixes"). This
patch stands on its own; the series can be applied on top.

Thanks,
Cong
