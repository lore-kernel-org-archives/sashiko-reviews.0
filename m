Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582822;
	b=FtdYFa7RDruwHMk5YLuL0GBKK5c5hLO+xmodh1+baAPOKSt+KDpJJEnlV6Fp23DuKON2
	 4yxyNEqzTc+xV6Of71Yvn3LGQTOwT1dhGvZe5yBeDjTqjqrdSHpXB0ZHJV/Wi+u9voYFc
	 SuNUFI7/tLYM1qavDDhCA6oEO1O+0KpA7PFX3DKWb/gEH8qINLa/XjJPW4jQiGNWZudu1
	 e8wBYaaVHcv3G5BgdJld4AgQy+O0gFc3uN+cc8qUdBKD0dnOQTxUGb4xun4J7ni+HgHl9
	 ovjW+JjQeG/Rs6CibG1kx6Y8qxbq1cGfP1hDNBKDjdRVBG6vghlTDe6gqPgSOxy3YcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582822;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=cVOOq3RPpxrIdRrjnzQ+Oq5IwAudXg3maodPAIwZDdk=;
	b=Z1sAvtBF9eHegYaOu1o0GOKO82LIBWy1KI0+RMwZ3zazZwNmJgo8Tri1J6f/U6zs9W7W
	 pCNWaCIFZIie61fzE75nW8yeU9Xq8HjNIJN3M9MGsHNIblPI1+4cpDSJvq37mS2mUrJN3
	 znfj02l9mCf8eqm4nLxAQrTx/PeFH5wh8onS2eStRlr40yCEVRxl//3bFsGbHapZ343GF
	 CGQJMUwTvTIVZgObZWQfNmr9zh1oq3vTfMCfs8vqVF+h0OJQH8LeeiGMGWSIewwCXlkqy
	 52vFy9ff4YpGKrrmJhamZBzibmW2uys6rVGYTLABlgc+wKB2QC/TirJ8bYkXTAT0Hsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4D5606A330
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 15:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA4D5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso1492536a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582820; x=1795187620;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cVOOq3RPpxrIdRrjnzQ+Oq5IwAudXg3maodPAIwZDdk=;
        b=zLdumdeIbDeQgymi2B/NzXuNUkGA4igkthmJ6X+uItz2hHq1OqE8VoRDRkzJ/XzLsv
         vdJMxqTlqaWaB+qRwk8PkD/sZFCTL6WRUyq+EcZyeX0X3l9RLSPV4VHHn5xyWpf/UyaD
         HmOWnCy1uOKKThHIRc8u+BDjGmNWTKyyWrp8OxAdJDDEOZsHzBiydaHkQLDbzFs4CCz1
         FsU7S1LEa9glSvVLzE4qV2H+brvsE2OWipgGEPkEQV2fxIsMzJsuZtq8aly1MbxLXC6O
         b5xVYJSnP+N/B7MQhOJNAGOa0CrN1NP4eIUTpd7s/qGIi0aG2oTvgMJs/qT4ZjmE8qen
         BNww==
X-Gm-Message-State: APuU4Z9Owyx1O3B/tZt4pNfZiTE3YkfoV4ZXXNSj7dIiGm2MNUU0KZ60
	rkNC066Nf3v0atJuhFvYe1C8QtW51d1NhYSirxQCaNuNEgTjin0gFcC9+ZZOYkRsGEU=
X-Gm-Gg: AYBFou1rMKtDRusXSt3NG+CDQVRn132/N6yfkGuw3sRiAIGPY53CdPdrboDuIyihD3r
	9cLYP4iYRyOkapuPwZ1Z9CWigAO73oDsjYdk11tCXM6+eIbTfV6u2wdgAmWcex56jUz0SQ/bkk6
	RyHkefW9XwaexPky3IUWvTRM3WrVDqyOwir/eFdeK7El3KPy2YKKZQV1nKGOM5SCBY46hS8do/E
	H1CM19isbFiu0Ez9iSWGQIcTIzFEjbIa7bBS+Q/jyq9yDzlv5+jreW737tIAVX+6TQRaX2/b24z
	FnBU66hNY21HeC6dE6NAdzD+bpLaED+kXbVKRNRm36cGAdbyc6uY/DdfONorBpXzmGywdwK791G
	CvSOaiMM4/5ke6mPH2x/gnA7MUoiUJprhkF8HKhEUCK4vxc5aNsdqcyRF1vezLP4LSYERxUfBcL
	KC+0KzPobuvXDzxve3y1umLckEKdzW6G5//kzJIiVGu9p3rbzQjujc2x3FOtu4lv8Li4339rM9v
	uZiwaVMHUMbe5gOCmEMO5inozqUxKlq7G9/o5fqMAth1DMUcnJGdDyXZYgrceiR2PtatsfeEHuT
	urSaE+cz/IT+kTLzlo+HjtDmbPhyV1fkoYyt0bYRAM1uIrHm5yj+8lRLoWSdo+lt5b5JePkvpSw
	oBdM8n4LyoFW/
X-Received: by 2002:a05:6402:c4c5:20b0:6b7:a5a4:721a with SMTP id 4fb4d7f45d1cf-6b7c0bb9c07mr1672570a12.11.1794582819869;
        Fri, 13 Nov 2026 07:13:39 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm1143575a12.17.2026.11.13.07.13.34
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:13:38 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso2084969a12.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:13:34 -0800 (PST)
X-Received: by 2002:a17:907:3f23:b0:c50:93b6:52fa with SMTP id
 a640c23a62f3a-c509614e782mr243931466b.2.1794582814183; Fri, 13 Nov 2026
 07:13:34 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <2895c8f3cbe718dc597ad25e16c2461f0d681ab6.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174618@kernel.org>
In-Reply-To: <sashiko-outbox-174618@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Nov 2026 16:13:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWRmqp_4GhyMjNBMFZULiF1ihKSCmiiVzLFG9L9aC=EMA@mail.gmail.com>
X-Gm-Features: AclHuK-rhaY3W-iKou3OxdeSeto8XUZuAfuEblsDGz7eRhtlFv6Qzoq4TAhS1Jo
Message-ID: <CAMuHMdWRmqp_4GhyMjNBMFZULiF1ihKSCmiiVzLFG9L9aC=EMA@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] pmdomain: renesas: r8a78000: Add SCMI remapping support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Fri, 16 Oct 2026 at 18:15, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] clk: double free of parent clock reference in error path
> - [High] pmdomain: renesas: mutation of SCMI genpd and hardcoded index 0 in attach_dev
> - [Medium] of: memory leak of scmi_clk_np reference
> - [Medium] reset: memory leak of exclusive reset controls on error and unbind
> - [Medium] pmdomain: renesas: out-of-bounds stack read in r8a78000_mdlc_attach_dev()
> - [Low] cleanup: mixed goto and scope-based cleanups in attach_dev
> --
>
> commit a125fd15fada610e74f2b15cf0cafd68482a5100
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> pmdomain: renesas: r8a78000: Add SCMI remapping support
>
> Extend the Module Controller driver for R-Car X5H with SCMI support, to
> remap hardware power domain, module, and reset IDs to abstractions
> offered by the SCMI firmware. This avoids putting SCMI IDs in DT and
> supports fallback to non-SCMI defaults when needed.

Thanks for your comments!

> > --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> [ ... ]
> > +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> > +                                 struct device *dev)
> > +{
> > +     struct device_node *np = dev->of_node;
> > +     struct r8a78000_mdlc_priv *priv;
> > +     struct clk *clk, *parent = NULL;
> > +     struct of_phandle_args pd_spec;
>
> [Severity: Medium]
> Is pd_spec guaranteed to be fully initialized?
>
> If the device tree node has a malformed #power-domain-cells < 2, could we
> end up with uninitialized stack memory in pd_spec.args[1] that is later
> used as a module ID?

The provider is matched against r8a78000_mdlc_list[] below.
If it is not found, pd_spec.args[1] is never used.
If it is found, it must have been looked up through
r8a78000_genpd_xlate(), which did verify that spec->args_count == 2.

> > +     const struct mod_map *map;
> > +     unsigned int id;
> > +     int ret;
> > +
> > +     ret = of_parse_phandle_with_args(np, "power-domains",
> > +                                      "#power-domain-cells", 0, &pd_spec);
>
> [Severity: High]
> Is it intended to unconditionally parse index 0 here, even if the domain
> being attached is at a higher index?
>
> If a non-MDLC device uses multiple domains and the MDLC domain is not at
> index 0, could this look up the wrong provider or silently fail to attach
> the correct clocks?

Non-MDLC devices must not have power-domains pointing to an MDLC domain.
In case of a wrong DTS, using multiple domains with the MDLC domain not
at index 0, the matching against r8a78000_mdlc_list[] below would fail,
and no harm is done.

>
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     scoped_guard(mutex, &r8a78000_mdlc_lock) {
>
> [Severity: Low]
> Does this mix of scope-based cleanup and goto violate the cleanup subsystem
> guidelines?
>
> This function uses scoped_guard() here, but also manually manages cleanup
> using goto-based error handling labels later in the function (e.g.,
> goto fail_put_parent). The guidelines suggest converting either all or none
> of the resources in a given routine to avoid LIFO ordering bugs.

scoped_guard() only applies to the block inside the curly braces.
There are no gotos from within this block, or gotos skipping this block.
This function also has no other instanced of __free().

> > +             hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> > +                     if (priv->np == pd_spec.np)
> > +                             break;
> > +             }
> > +     }
> [ ... ]
> > +     if (parent)
> > +             ret = pm_clk_add_clk(dev, parent);
> > +     if (!ret)
> > +             ret = pm_clk_add_clk(dev, clk);
> > +     if (ret)
> > +             goto fail_destroy;
> > +
> > +     return 0;
> > +
> > +fail_destroy:
> > +     pm_clk_destroy(dev);
> > +fail_put_parent:
> > +     clk_put(parent);
>
> [Severity: High]
> Will this result in a double free of the parent clock?
>
> pm_clk_destroy() destroys all clocks attached to the device, which includes
> cleanly removing the successfully added parent clock (and internally calling
> clk_put() on it). Falling through to fail_put_parent seems to call
> clk_put(parent) a second time.

True, will fix in v5.

> > +fail_put_clk:
> > +     clk_put(clk);
> > +     return ret;
> > +}

> > +static const struct power_map *fill_power_map(struct r8a78000_mdlc_priv *priv,
> > +                                           const struct power_map_in *map_in,
> > +                                           struct device_node *scmi_power_np)
> > +{
> [ ... ]
> > +             genpd = of_genpd_get_from_provider(&scmi_spec);
> > +             if (IS_ERR(genpd))
> > +                     return dev_err_cast_probe(dev, genpd,
> > +                                     "Failed to get SCMI power domain %u\n",
> > +                                     map[i].fw_id);
> > +
> > +             dev_dbg(dev, "SCMI power domain %u is %s\n", map[i].fw_id,
> > +                     genpd->name);
> > +
> > +             map[i].genpd = genpd;
> > +
> > +             /* Hook up clock domain support */
> > +             genpd->attach_dev = r8a78000_mdlc_attach_dev;
> > +             genpd->detach_dev = r8a78000_mdlc_detach_dev;
> > +             /* Setting flags this late has no impact, but does not hurt */
> > +             genpd->flags |= GENPD_FLAG_PM_CLK;
> > +             genpd->dev_ops.stop = pm_clk_suspend;
> > +             genpd->dev_ops.start = pm_clk_resume;
>
> [Severity: High]
> Is it safe to mutate the genpd struct of the SCMI provider directly?
>
> Modifying genpd->attach_dev and genpd->dev_ops here changes the behavior
> for all consumers of the shared SCMI domain. Could this cause
> cross-subsystem state corruption or spurious warnings when non-MDLC devices
> use this SCMI domain?

This should be safe on R-Car X5H:
  1. There is only a single SCMI provider,
  2. If there would be multiple SCMI providers, the safeguards in
     r8a78000_mdlc_attach_dev() would still protect against bad
     behavior,
  3. pm_clk_{resume,suspend}() are no-ops when no PM clocks were
     registered.

> > +     }
> > +
> > +     return map;
> > +}
> > +
> > +static const struct mod_map *fill_mod_map(struct r8a78000_mdlc_priv *priv,
> > +                                       const struct mod_map_in *map_in,
> > +                                       struct fwnode_handle *scmi_reset_fwnode)
> > +{
> [ ... ]
> > +             scmi_spec.args[0] = map[i].fw_id;
> > +
> > +             rstc = reset_control_get_from_provider_exclusive(&scmi_spec);
> > +             if (IS_ERR(rstc))
> > +                     return dev_err_cast_probe(dev, rstc,
> > +                                     "Failed to get SCMI reset %u\n",
> > +                                     map[i].fw_id);
> > +
> > +             map[i].rstc = rstc;
>
> [Severity: Medium]
> Does this error path leak the previously acquired exclusive reset controls?
>
> If an allocation fails mid-loop, IS_ERR(rstc) evaluates to true and the
> function immediately returns an error pointer, leaving no mechanism to free
> map entries from earlier iterations.

True, will fix in v5.

> Furthermore, the driver does not appear to iterate through this map and
> release these controls during driver unbind or teardown.

r8a78000_mdlc_driver cannot be unbound:

    platform_driver.driver.suppress_bind_attrs = true;

> >  static void r8a78000_mdlc_unlink(void *data)
> >  {
> >       struct r8a78000_mdlc_priv *priv = data;
> >
> >       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> >               hlist_del(&priv->link);
> >       }
> >  }
>
> [Severity: Medium]
> Does this teardown sequence leak the priv->scmi_clk_np reference?
>
> The reference was previously acquired using scmi_find_proto() with
> SCMI_PROTOCOL_CLOCK, which returns an incremented reference count, but
> of_node_put() does not appear to be called during unbind.

The driver cannot be unbound.

> >  static int r8a78000_mdlc_probe(struct platform_device *pdev)
> >  {
> > +     struct device_node *scmi_reset_np __free(device_node) = NULL;
> > +     struct device_node *scmi_power_np __free(device_node) = NULL;
> > +     struct device_node *scmi __free(device_node) = NULL;
> [ ... ]
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
> [Severity: Medium]
> If the jump to the fallback label occurs after successfully assigning
> scmi_clk_np (e.g., when scmi_reset_np is missing), does this leak the
> scmi_clk_np reference?
>
> Since scmi_clk_np is not annotated with __free(device_node) like
> scmi_power_np and scmi_reset_np, it requires explicit cleanup on error
> paths.

True, will fix in v5.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
