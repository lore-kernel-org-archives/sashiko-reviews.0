Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074551;
	b=MJ5zr5EaiJL9rqo61wGq6M0Z5xf1evyJ5oEV3SdbKJQAQoZLBUH2B4FaXp5OCYTu+igs
	 9ZxYB59jL+zMOLGiVQqsoh4pxjSQqJsyhKcMU39xuUmgKIKK6yIayKSL1YX6PLQ8j5qfw
	 q9dITtC1hbe5TPdH0U42Z30oxUTjMESAq8hk6Ls9uxDmKFCFTnG78+p0DOgnyqPX/MxLZ
	 4xlLtAEdEFG0vj81flUCOaMwSfjGCcH1Lp9c+r5yNjCse672a79/CP+JbOLaH9vrvDGl8
	 oRo7wfc2/8n4WnTHncM/q0qKzWJrFFlCrtmWfpkeFXYggcSi9fe0GwMiaLiFpn5U9Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074551;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=AlwETNNCgQuoL3olEu8hotUVCo0wqZYULOda47vcNrw=;
	b=PzixAD8poOJ6GFIL7BbitHI/EHXSjeG3LRDEAvFOt3Pp6w12wIwhroZbbUqFZgCIKVuk
	 obGGJhQMlwXde/DyZnw/Ro3s4+Yb8PI/KcbvHv4M1OPN6XQQyOMktc9nZPaM/r/yISh/t
	 5VwxHLP4/Jhmx2jz50yHM3UkCjzjPwTiYvHHmfRTN/wjD6EZRgWmSFqIb+9MxcG7LQ5h0
	 v/DDGPm2smi8KhAvFDrHHLpOj8RfcSIwHvxL4al+yh19UN+JpKxwodbq1g9ez3AL1ZFr0
	 4zr2Dk5pSIov6C7CFfvPDqLdZSoSsKOzHTDho+puZaNNBQ4C347NcQ5+rnOofPJSaUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6B606A326
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 07:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC6B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5edf97136aaso1109361e0c.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 23:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074550; x=1795679350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AlwETNNCgQuoL3olEu8hotUVCo0wqZYULOda47vcNrw=;
        b=evHIW6QHO7XsUEfwgo5muagIsBf+H2LzGy2IswbThzZ1kab5eN5rEWdZ9OpnW6jMAj
         aJOnP5Ar0HvqMHVeQkMc6tpKljWCvXMWNNCzIhZNNTIa1FtpIeWrwmsUZ9qHusbOqBL9
         QDXBWtacDsRSc88Xi9Td8AR347CdnOmndmuqWbhoyPRk8Fn/xmI9gF3mHIL13d96BRt8
         cOTHK0yRJjWSaKui/VSdW7T19rs4KUoW/KfNfS+2h3BdKALQRUcsqek+bJCcEDgZcxcM
         GKvvy1nVpqUUL3rzMpObNU7mvTLETKstoJwZJnKmrnbKiJ6xduklMrSAwhTQvcMUMH1M
         tLPA==
X-Gm-Message-State: APuU4Z8WNzCbukQ5MZVc8Lkz41NpyFl2tSm0+00k37Ui8K8nT+W+Tjh7
	kGH0tn5hm74H0rgGUCyzscf+wIzv7aIHZTflULhEZ9air6sa8qewlfr3ZqAfrkak
X-Gm-Gg: AYBFou1TAzCv7gGPq5qSoir6nlQh5baDOQSESH5IBXlLdJ2aPC6P7Eqzcw/lPdAQqVg
	Byu31lX8XOpTNbNguY43MpD+MPuzfiJ7c+DGoFobPFsg0Plv6E8ZSBmZh/z6yL5G85ce8Cy3JAH
	h0ibW4FUXHgQrMoFxjqq6pUgPJH0cTcqkyCh4MwLw2ffamftjalWI+dCqaPnnA4oZFE2mbQk6+t
	jg/1dLa91nH0x6K5tcQcmcZKjwzVefwXmFNZvaomuYqFh/BvwPSNZ+vTMmOm/351Jo0x+MQEEqT
	uYBW9qGpL8kAfKKZ1h1+8LxWHF6DH73LZ2MCmTiZz1CPeUfbAC5qmQarnllNY/Ijr1CYhxonL93
	/ZWFaIw55FqlzFsYFC5dObrR/4xa/p9Su6glYhGF8MNQR+F1lMbdWkDTO0jCLBlDtLrbJa0Txqr
	wDu/ad9tgKOYTqzg5vArpOUPyp28xVZQ1z2bd7KUJE8CKmqZgqbW+ThoMz0utjiNi+1uWkyklq0
	gvMDbFl01hqC4SHJBPrF3ieugLOWw9LT+guQc5aaRWPDJeR8fkkFl52+jypLLOyTvqTQqqKyktz
	W6FX8+SKrVf1Y4SA0AFIhwypRN3Dc08tgCRFiZo7G1ZKK+cdRE2LBFGWfkNg1aVHs0w=
X-Received: by 2002:a05:6122:1904:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ee647862d9mr2528957e0c.21.1795074550002;
        Wed, 18 Nov 2026 23:49:10 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64ed7adesm3505961e0c.15.2026.11.18.23.49.09
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:49:09 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d2da166818so1083366137.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 23:49:09 -0800 (PST)
X-Received: by 2002:a05:6102:370c:b0:7d2:c903:515d with SMTP id
 ada2fe7eead31-7d6ba3e8cc5mr2280659137.7.1795074549276; Wed, 18 Nov 2026
 23:49:09 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <e6816327da51f9fbeef67f13aac723b891e5042f.1795029012.git.geert+renesas@glider.be>
 <sashiko-outbox-221928@kernel.org>
In-Reply-To: <sashiko-outbox-221928@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 08:48:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgOvdAAJEEydip_-Aakf8j3ORXnZAS-=NqCMBxHwrfZA@mail.gmail.com>
X-Gm-Features: Aa3M54qMY9KEs6Xlpwbmw0a9TWCYDcZMChPHFmIneFq8gUbTr8Q3_1H7DUbenEE
Message-ID: <CAMuHMdXgOvdAAJEEydip_-Aakf8j3ORXnZAS-=NqCMBxHwrfZA@mail.gmail.com>
Subject: Re: [PATCH v5 14/15] pmdomain: renesas: r8a78000: Add SCMI remapping support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Wed, 18 Nov 2026 at 21:22, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] pmdomain: renesas: leak of exclusive reset controls in
>   r8a78000_mdlc_probe()
> - [Medium] pmdomain: renesas: leak of scmi_clk_np reference in
>   r8a78000_mdlc_probe()
> - [Low] pmdomain: renesas: mixed scoped_guard() and goto in
>   r8a78000_mdlc_attach_dev()
> --
>
> commit 35d53b7b58584e545d3609ea7bb1ae4726d2bdc8
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> pmdomain: renesas: r8a78000: Add SCMI remapping support
>
> This commit extends the R-Car X5H Module Controller driver to remap
> hardware power domain, module clock, and reset IDs to SCMI power domains,
> clocks, and resets when SCMI firmware support is available.

Thanks for your review!

> > --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> [ ... ]
> > @@ -178,8 +280,148 @@ static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> >               return -ENOENT;
> >       }
> >
> > -     dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> > +     if (!priv->scmi_clk_np) {
> > +             dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> > +             return 0;
> > +     }
> > +
> > +     entry = &priv->mod_map->entries[idx];
> > +     dev_dbg(dev, "Mapping HW module 0x%x to SCMI clock %d fck parent %d\n",
> > +             id, entry->fw_id, entry->fw_fck_parent);
> > +
> > +     clk = scmi_get_clk(dev, priv->scmi_clk_np, entry->fw_id);
> > +     if (IS_ERR(clk))
> > +             return PTR_ERR(clk);
> > +
> > +     parent = scmi_get_clk(dev, priv->scmi_clk_np, entry->fw_fck_parent);
> > +     if (IS_ERR(parent)) {
> > +             ret = PTR_ERR(parent);
> > +             goto fail_put_clk;
> > +     }
> > +
> > +     if (!clk && !parent) {
> > +             /* Ignore missing SCMI clocks */
> > +             return 0;
> > +     }
> > +
> > +     ret = pm_clk_create(dev);
> > +     if (ret)
> > +             goto fail_put_parent;
> > +
> > +     if (parent) {
> > +             ret = pm_clk_add_clk(dev, parent);
> > +             if (ret) {
> > +                     pm_clk_destroy(dev);
> > +                     goto fail_put_parent;
> > +             }
> > +     }
> > +     if (clk) {
> > +             ret = pm_clk_add_clk(dev, clk);
> > +             if (ret) {
> > +                     pm_clk_destroy(dev);
> > +                     goto fail_put_clk;
> > +             }
> > +     }
> >       return 0;
> > +
> > +fail_put_parent:
> > +     clk_put(parent);
> > +fail_put_clk:
> > +     clk_put(clk);
> > +     return ret;
> > +}
>
> [Severity: Low]
> This isn't a bug, but r8a78000_mdlc_attach_dev() already uses
> scoped_guard(mutex, &r8a78000_mdlc_lock), and adding goto-based error
> unwinding in the same function mixes cleanup.h helpers with goto labels.
> Factoring either the list lookup or the PM clock setup into a helper
> would keep them separate.

Not a bug, will see if I get to it...

> > +static struct reset_control **get_rstcs(struct r8a78000_mdlc_priv *priv,
> > +                                     struct fwnode_handle *scmi_reset_fwnode)
> > +{
> > +     const struct mod_id_map *map = priv->mod_map;
> > +     struct fwnode_reference_args scmi_spec;
> > +     struct reset_control **rstcs, *rstc;
> > +     struct device *dev = priv->dev;
> > +     s16 fw_id;
> > +
> > +     if (!map)
> > +             return NULL;
> > +
> > +     rstcs = devm_kzalloc_objs(dev, *rstcs, map->size);
> > +     if (!rstcs)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (unsigned int i = 0; i < map->size; i++) {
> > +             fw_id = map->entries[i].fw_id;
> > +             if (!scmi_reset_fwnode || fw_id < 0)
> > +                     continue;
> > +
> > +             scmi_spec.fwnode = scmi_reset_fwnode;
> > +             scmi_spec.nargs = 1;
> > +             scmi_spec.args[0] = fw_id;
> > +
> > +             rstc = reset_control_get_from_provider_exclusive(&scmi_spec);
> > +             if (IS_ERR(rstc)) {
> > +                     while (i--)
> > +                             reset_control_put(rstcs[i]);
> > +
> > +                     return dev_err_cast_probe(dev, rstc,
> > +                                     "Failed to get SCMI reset %u\n", fw_id);
> > +             }
> > +
> > +             rstcs[i] = rstc;
> > +     }
> > +
> > +     return rstcs;
> >  }
>
> [Severity: Medium]
> Does r8a78000_mdlc_probe() leak the exclusive reset_control objects in
> priv->rstcs if a later registration step fails?
>
> reset_control_get_from_provider_exclusive() returns unmanaged references,
> and get_rstcs() only calls reset_control_put() when its own loop fails.
> If a subsequent call in r8a78000_mdlc_probe() such as
> of_genpd_add_provider_onecell() or devm_reset_controller_register() fails,
> the reset controls are leaked and remain marked exclusively acquired, so a
> later probe retry will fail with -EBUSY.  Registering a
> devm_add_action_or_reset() callback in get_rstcs() would release them on
> probe failure.

Thanks, will do.

> > @@ -249,6 +500,47 @@ static int r8a78000_mdlc_probe(struct platform_device *pdev)
> >       priv->dev = dev;
> >       priv->np = np;
> >
> > +     if (!IS_ENABLED(CONFIG_ARM_SCMI_POWER_DOMAIN) ||
> > +         !IS_ENABLED(CONFIG_COMMON_CLK_SCMI) ||
> > +         !IS_ENABLED(CONFIG_RESET_SCMI)) {
> > +             dev_dbg(dev, "SCMI pmdomain/clock/reset support is disabled\n");
> > +             goto fallback;
> > +     }
> > +
> > +     scmi = of_find_compatible_node(NULL, NULL, "arm,scmi");
> > +     if (!scmi) {
> > +             dev_dbg(dev, "Cannot find SCMI firmware node\n");
> > +             goto fallback;
> > +     }
> > +
> > +     if (!of_device_is_available(scmi)) {
> > +             dev_dbg(dev, "SCMI firmware node is not available\n");
> > +             goto fallback;
> > +     }
> > +
> > +     scmi_power_np = scmi_find_proto(scmi, SCMI_PROTOCOL_POWER);
> > +     if (!scmi_power_np) {
> > +             dev_dbg(dev,
> > +                     "Cannot find SCMI power domain management protocol\n");
> > +             goto fallback;
> > +     }
> > +
> > +     scmi_clk_np = scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK);
> > +     if (!scmi_clk_np) {
> > +             dev_dbg(dev, "Cannot find SCMI clock management protocol\n");
> > +             goto fallback;
> > +     }
> > +
> > +     scmi_reset_np = scmi_find_proto(scmi, SCMI_PROTOCOL_RESET);
> > +     if (!scmi_reset_np) {
> > +             dev_dbg(dev, "Cannot find SCMI reset management protocol\n");
> > +             goto fallback;
> > +     }
> > +
> > +     priv->scmi_clk_np = scmi_clk_np;
> > +     info = mdlc_data->fw_info;
> > +
> > +fallback:
>
> [ ... ]
>
> > @@ -295,11 +604,14 @@ static int r8a78000_mdlc_probe(struct platform_device *pdev)
> >               return dev_err_probe(dev, ret,
> >                                    "Failed to register reset controller\n");
> >
> > +     /* Retained in priv->scmi_clk_np */
> > +     retain_and_null_ptr(scmi_clk_np);
> > +
> >       return 0;
> >  }
>
> [Severity: Medium]
> Does retain_and_null_ptr(scmi_clk_np) leak the scmi_clk_np device_node
> reference when the fallback path is taken after scmi_clk_np has been
> found?
>
> If scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK) succeeds but
> scmi_find_proto(scmi, SCMI_PROTOCOL_RESET) returns NULL, probe jumps to
> fallback before setting priv->scmi_clk_np = scmi_clk_np, and then
> unconditionally clears scmi_clk_np via retain_and_null_ptr(scmi_clk_np)
> at the end of r8a78000_mdlc_probe().

That is correct behavior, as scmi_clk_np won't be handed to
priv->scmi_clk_np in the fallback case.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
