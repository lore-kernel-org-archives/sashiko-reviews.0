Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925037BE93
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947053; cv=none; b=IQLrMqhU3V/1fTDM0LLu920ViYxpg6qiXcDcP1m554vMqCfBNIgz6iFdNaE4O6TjdjtsKfhWClW7XduMi6JvReD9AW2zxDtLzt8AELhg1zhYtZ7k5QyFz1mLMarjrjJWq+fJ70L8bhK7s+rY8ogpWNklvsj9fHmAgTG/5/4vHug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947053; c=relaxed/simple;
	bh=31MQfY9NvRLjYTMlGrp+H9KNMPnbdIhFc33jeP6gZqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKn1IKJOXiU1erJMfkLVhmQgQoKx9ovAy2gTRweOKGVCjqykMw0zNt5mOVrdprEao3MPDKxHWfEgNLQaP1LPlor1XGu149uxVgGTzx7vBbG4RzwbwJQeFN1WU/IE4UwIIyNot5qdV2w2s1PMMofYCdSIBBsjai+x/BIEM5G6Zuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fz7aST+D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fz7aST+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783947051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y5514gjBH+tEva2wlfuCJ1QoRwC/nd/W+ENw0Fx/t/Q=;
	b=fz7aST+D13vv6iE4rXEb6LdVKwmtt99HlbQwf5o5eiuZwkXt8Ufmqud/UZGNS1Md9gBkoP
	PCLK/DBgM3UJ7Hwmmfqkio0C7TGnLUpB31IcsvFFQi1R03enUiMgkXV2VwcUkG/7pgKf5e
	zwRgFfwlDo1NffihpCd7lh/SvWb0kCQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-NhSYm15XM8Kj85reVbRpZw-1; Mon, 13 Jul 2026 08:50:49 -0400
X-MC-Unique: NhSYm15XM8Kj85reVbRpZw-1
X-Mimecast-MFC-AGG-ID: NhSYm15XM8Kj85reVbRpZw_1783947048
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e92ddc199so52964487b3.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 05:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947048; x=1784551848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5514gjBH+tEva2wlfuCJ1QoRwC/nd/W+ENw0Fx/t/Q=;
        b=NXUjLr7QKqpzZ1MRxsdfSLF9yEwkKTKo41TFQXSINv7bekD4xYoLjooa/ejDQrdho7
         xOZizq+8qEAGB70KzZK9wwI9XdGbox11uqtYVFOjitfMZEYhZpuspDSpq43YVVnwOpmJ
         HNim20rGRQZAQteKJXRcimhcMUsOzgrTxrPmnFG+yzFykPi4OKtjJTw1m0dgMDgvZLFF
         OerpmWalwsd3NrWmYhJickBrHqfOdoGVjlt9Dx1s95H5tQWAJTIRHtrQg39d3avz2kGp
         WmYXRP3bn6FiAOb5h4vcAT9sGeTv09RpnNuA3WNFBiyOn4OaY0wITXchXukAGAqdSuwm
         XmWg==
X-Gm-Message-State: AOJu0Yz/+/UZKcRf8Ii8ZKNOb3aTGtmkmeoZhXsDD2sOUslf+haFJZ4B
	p8aXa5LWaZUmLEGQsxgD+knVWn4ZGxtbCDTw/8Ykh/tMb5v5gii3Wubt5Uock4riyeUQkYtYUTO
	hRAxgRRHFnOQZxsvIR+Z5JoNN6kE10ZD64eMorkukbZM8D3ZqYUwCJF6Z4tsaplZWCCjIPixwjM
	IPEUPvD0egEUjG1iEq62M+vtRQx4a+cPTUwoF3DdvrFhlAxyJ+SzzIzw8=
X-Gm-Gg: AfdE7cnGqid/NDDpjkgr3P3oo27AxIyL2TvFxfM5EwGgh1zl8LWpqsvJlsi/8aWJkb0
	ydUMx/yqota3F1yaJ4oJKzIn5Bsd8bcxk/lDeUQftgQ84pZh2w89zUU6xEPfeNMhvQWPkNpXIDz
	TMyL9Kkr7BpMD+jQwrvymbRDSPBHkblGqdcMP1b1hnRhEzQ8Vh66NUMSzeobY8NqZ165o=
X-Received: by 2002:a05:690c:688a:b0:81e:8988:a76e with SMTP id 00721157ae682-81e9013f452mr69897647b3.50.1783947048357;
        Mon, 13 Jul 2026 05:50:48 -0700 (PDT)
X-Received: by 2002:a05:690c:688a:b0:81e:8988:a76e with SMTP id
 00721157ae682-81e9013f452mr69897527b3.50.1783947047964; Mon, 13 Jul 2026
 05:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
 <20260713-drm_refcount_wiring-v2-4-d3bb61f4bd4d@redhat.com> <20260713120850.50A971F000E9@smtp.kernel.org>
In-Reply-To: <20260713120850.50A971F000E9@smtp.kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 13 Jul 2026 14:50:36 +0200
X-Gm-Features: AUfX_mxIjyD9JT7DCnH8TLnCNyM1WFtSvLQWD-3yymdZrL3l4dLm3EqYUh3A3BM
Message-ID: <CADSE00KCw_dA89NcKg-9zLf-HLhy=ASZyDrAk+15ko_eyowOUg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/panel: find_panel_by_fwnode() return a counted reference
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev, 
	wsa+renesas@sang-engineering.com, dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 45s98ZiDthw5p4FSYvuKnDvpuLdQwTRCPDcuTyd8bF0_1783947048
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 2:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] Drivers calling of_drm_find_panel() directly leak the returned=
 panel reference.
>
> Pre-existing issues:
> - [High] TOCTOU race in drm_panel_add_follower() when acquiring the panel=
's underlying device, leading to a potential Use-After-Free of panel->dev.
> --
>
> --- Patch [4]: [PATCH v2 4/5] drm/panel: find_panel_by_fwnode() return a =
counted reference ---
> commit 5cd4c479944cf29f6f5aa4a3e31207bf48dc0567
> Author: Albert Esteve <aesteve@redhat.com>
>
> drm/panel: find_panel_by_fwnode() return a counted reference
>
> This commit updates find_panel_by_fwnode() to return a refcounted pointer
> to the panel, mirroring a similar fix made to of_drm_find_panel(). It cal=
ls
> drm_panel_get() under the panel_lock before returning, ensuring the memor=
y
> is not freed prematurely. Callers are now responsible for balancing this
> with drm_panel_put(), which is added to drm_panel_remove_follower().
>
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index 72cf86253c0cd..a00ae98ed0956 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -542,7 +542,13 @@ int of_drm_get_panel_orientation(const struct devi=
ce_node *np,
> >  EXPORT_SYMBOL(of_drm_get_panel_orientation);
> >  #endif
> >
> > -/* Find panel by fwnode. This should be identical to of_drm_find_panel=
(). */
> > +/*
> > + * Find panel by fwnode, returning a counted reference.
> > + *
> > + * Behaves identically to of_drm_find_panel(). On success the returned
> > + * pointer has been passed through drm_panel_get(); the caller must ca=
ll
> > + * drm_panel_put() when done with it.
> > + */
>
> [Severity: Medium]
> Since the earlier patch in this series updated of_drm_find_panel() to
> also return a counted reference, do drivers that call it directly need
> to drop their reference to prevent a memory leak?
>
> For example, in bridge drivers like lvds-codec.c:
>
> drivers/gpu/drm/bridge/lvds-codec.c:lvds_codec_probe() {
>     panel =3D of_drm_find_panel(panel_node);
>     of_node_put(panel_node);
>     ...
>     lvds_codec->panel_bridge =3D devm_drm_panel_bridge_add_typed(dev, pan=
el,
>                                                 lvds_codec->connector_typ=
e);
> }
>
> Because devm_drm_panel_bridge_add_typed() takes its own reference to the
> panel via drm_panel_get(), does this code leak the initial reference
> returned by of_drm_find_panel() since drm_panel_put() is never called?
>
> This same leak pattern appears to exist in other callers as well, such as
> samsung-dsim.c:samsung_dsim_host_attach() and
> rcar_du_encoder.c:rcar_du_encoder_init().

Uh this is a real issue that I missed in several callers. I will add
drm_panel_put() after the bridge creation where needed in the next
version.

BR,
Albert.

>
> >  static struct drm_panel *find_panel_by_fwnode(const struct fwnode_hand=
le *fwnode)
> >  {
> >       struct drm_panel *panel;
> > @@ -554,6 +560,7 @@ static struct drm_panel *find_panel_by_fwnode(const=
 struct fwnode_handle *fwnode
> >
> >       list_for_each_entry(panel, &panel_list, list) {
> >               if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> > +                     drm_panel_get(panel);
> >                       mutex_unlock(&panel_lock);
>
> [Severity: High]
> This is a pre-existing issue, but is there a time-of-check to time-of-use
> race condition when callers attempt to pin the underlying device?
>
> When find_panel_by_fwnode() (or find_panel_by_dev()) returns, the panel's
> internal refcount is incremented under panel_lock, but the underlying
> struct device (panel->dev) is not pinned.
>
> If a concurrent unbind occurs before the caller pins the device, the devi=
ce
> memory could be freed. For example, looking at drm_panel_add_follower():
>
> drivers/gpu/drm/drm_panel.c:drm_panel_add_follower() {
>     panel =3D find_panel_by_dev(follower_dev);
>     if (IS_ERR(panel))
>         return PTR_ERR(panel);
>
>     get_device(panel->dev);
> }
>
> If the panel device driver unbinds immediately after panel_lock is droppe=
d,
> could get_device(panel->dev) trigger a use-after-free on the destroyed
> device?
>
> >                       return panel;
> >               }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-drm_refc=
ount_wiring-v2-0-d3bb61f4bd4d@redhat.com?part=3D4
>

