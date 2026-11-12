Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502987;
	b=Vd+ctBLVgas6GIV1yNLxTlElIIEfYOh0ofYgwBiGbTMilmrLQWNsDOjZ8tKzMjllOz6+
	 b5Q2DRAVZQw74H4Vve5sCJnXPgPs5ZPdTRNMGu5WgzYP184ZCaZHF1lbo/6An/7sSYn4S
	 DmFPEsJH9TmtZuX2b3s6V4AYB/NSK2akz3X3sT4O9ZnXpm/b7BOqiBGqLZi/w8pLRPPoe
	 quwQXD1hOSwlhRQdcGBgpI/pS6NwrT+C7aogPRAB10c+107dApLetMfSUXDa8MrEXnJne
	 eTFFBClzMKrz010vTvEC7ZEifYvZrNehrMkzKLwY79VYWIyEl3MZYEvKgZcNAcTLMQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502987;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=3W1A4BQMOpN9nFxHb2rXE8WHciL/muN+wSYPGT+qRXs=;
	b=BTU3PBqr4TSngTzt0qoyYADQtEJz1hcyFvriTzY5nCPkdSclPLzzLpH8hWMHnwjippx7
	 AYIPe3YyZgKie3oRkYfLNHevm9yD7KD9IuYvaaaNB0+T5ZVPdbI07gB+6YwhuerGm2L5B
	 gr5CXj0DB6T5g/riKMIGzzlTZ803j9vG135VrdEkPBfWDM679yysCCFM+oBdX/jqABr4i
	 /Wogxz5sEOkvN1/eji5zK6cLePNcx3Iq7EdfOBzFQfMwaGkPRsIAKLnfn1C5ABRwKFkAr
	 fr8jMD/TGaNH5oGQ/0Stg5JG2aW3GUhcY0p7YD2vYmBTcvsjqSZcHsJMca1dvYCR7Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030FF606A323
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 17:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 030FF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so992893241.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 09:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502986; x=1795107786;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3W1A4BQMOpN9nFxHb2rXE8WHciL/muN+wSYPGT+qRXs=;
        b=YzGuD34xrVd9CIYFjkWpuMk4SSrbxDaPXVG0Zrk+BmFlRByPeXIKz5X4+0iFcniiWv
         TEZJEQRYfarbEtCe/EpDMPQIgei5PFCIKf/McCSHQ8eEdgaDDFzvLAtXaaqV5+lDUonc
         N4NSM/h5EFRGnmPGjwGGfK0GCOb9DXr6adPLIDnsGeXBlEWCwzpJpB4yWKADhZ/bA/XH
         qRW3gaFWhv+oC+TZ0VleLUSs1ky1EaJYJXY9MkCWifbpgYrkL+2pKLykDdItwQvZyaN9
         zwra5mrfhRWWBe+vByLlJwd5kwjwy4u9LyNPNlFYKkTLR4yW/qkclUURXp/MO5cm/R/S
         vB+Q==
X-Gm-Message-State: APuU4Z876HpEGqxojuK0WG3WayOuocwP6uP29pTYpjG4U/z1pXG49y4V
	lYM3f6Q9pLiMzAhbeSz6h9JSTAwF3C+MOrzA2I+4o273rRKUZ1CE5Xzrwte8zQlh928=
X-Gm-Gg: AYBFou30/n4xdo5r5F+hzfpTXjGQW7TxOD6KnWxu5AXbWw1I0VZCbKXKgcfnj/hm/IU
	MOuTn2u4hqTYQRAOnfekgowIK9J+jAxjpQ9UPPEXZq1fy53geJ0DhI4S5P3RZu9Y1PiAjF32izP
	gVglHJUqEFMbeRb7Fg1az8dH6RX20QASkccGFdxQd2iOCokOdKvTbm8mFhJiVmkig/8TLUTJMLB
	svaJ8HAHlVGyGh5iCI1V7/shUDIzFFluNqPGaG1VUUB6djA68bxCwsgfYhZrYs7Ct+vJw2fAWxA
	FHuFKcC4WKQTCrXc8LCkD4A6TATRSrz8HDpAjuoakQ4J2bcuUjvSOoGqeNsJPfI8M31xvn8vwQx
	7JB2I5xMAd1ELswwlMa87qIZg818LKr0djNL3+hISug3F280eFt0BLf5sVb1aYedlGH64Qz2Kp0
	jwrW2HwSbIIifi+nk1wTJoHBSgBS0B2Olj1SO3sISj7mmN6racbo9kiFs7pv2CoionnFUDd3dwn
	zk2alYBbkQ0KozQaNdq4dwuhq1naAtIQnOE0EDPa6GQEjD6ZdmVx99zNymWYOK4SkJV487kZAsl
	8c+hrhBosL8JphIlZTfdNK3kwhNcxptOf6xgW5KOAYXjHaq29w5Vo4PXMHLbRGrj9L/b7mD1
X-Received: by 2002:a05:6102:6894:b0:7c4:613b:2e22 with SMTP id ada2fe7eead31-7d63166a66cmr1006832137.10.1794502985895;
        Thu, 12 Nov 2026 09:03:05 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d64c50bf53sm19785137.10.2026.11.12.09.03.04
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:03:04 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eaf34452a9so43871e0c.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 09:03:04 -0800 (PST)
X-Received: by 2002:a05:6122:510a:b0:5ee:52a:f480 with SMTP id
 71dfb90a1353d-5ee27434e9cmr838741e0c.9.1794502984448; Thu, 12 Nov 2026
 09:03:04 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <e3b9d76d5b4a254d561b6e734423063e94225a28.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174603@kernel.org>
In-Reply-To: <sashiko-outbox-174603@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 18:02:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWb4UPKhcFnRG-dta5KvDUV_cZzWrWwaD2D-vGnh_qtSA@mail.gmail.com>
X-Gm-Features: AclHuK8ZV6Kxtk9Z6yJfLydeqQiC4mysO9PUPwmC0BbcDagci2s6Qg-Q4JhBB4c
Message-ID: <CAMuHMdWb4UPKhcFnRG-dta5KvDUV_cZzWrWwaD2D-vGnh_qtSA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] pmdomain: Make genpd_get_from_provider() public
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 18:08, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] pmdomain: UAF due to un-refcounted genpd pointer export
> --
>
> commit a7a3a37d2be118bab420ebff1f13629dfa676eb6
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> pmdomain: Make genpd_get_from_provider() public
>
> This commit makes genpd_get_from_provider() public as
> of_genpd_get_from_provider(), allowing PM Domain drivers to look up
> generic_pm_domain structures directly.
>
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 88c886814a5b9..4136368456d99 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -3018,8 +3018,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
> >   * Returns a valid pointer to struct generic_pm_domain on success or ERR_PTR()
> >   * on failure.
> >   */
> > -static struct generic_pm_domain *genpd_get_from_provider(
> > -                                     const struct of_phandle_args *genpdspec)
> > +struct generic_pm_domain *of_genpd_get_from_provider(const struct of_phandle_args *genpdspec)
> >  {
> >       struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
> >       struct of_genpd_provider *provider;
> > @@ -3041,6 +3040,7 @@ static struct generic_pm_domain *genpd_get_from_provider(
> >
> >       return genpd;
> >  }
> > +EXPORT_SYMBOL_GPL(of_genpd_get_from_provider);
>
> [Severity: High]
> Can exporting this API lead to a use-after-free regression?
>
> of_genpd_get_from_provider() returns an unpinned, un-refcounted pointer to
> struct generic_pm_domain whose lifetime is managed by the provider. While the
> commit message compares this to the clock subsystem, clock pointers are
> refcounted or uniquely allocated.
>
> The follow-up r8a78000-mdlc patch demonstrates caching these genpd pointers in
> its power_map without acquiring any locks (since gpd_list_lock is internal).
> Because the SCMI provider is looked up dynamically via
> of_find_compatible_node(), fw_devlink cannot automatically detect the
> dependency to create a device link.
>
> If the SCMI driver is unbound (via sysfs or module unload), pm_genpd_remove()
> will free the genpd structures, leaving dangling pointers. Furthermore,
> overwriting the attach_dev and detach_dev function pointers of the SCMI genpd
> objects will lead to invalid execution if the module is unloaded.

If the SCMI driver is unbound, the system is dead anyway.

> [Severity: High]
> This problem wasn't introduced by this patch, but does this internal caller
> have a time-of-check to time-of-use (TOCTOU) race?
>
> Fetching parent_genpd locklessly in of_genpd_add_child_ids() allows a
> concurrent pm_genpd_remove() to free the domain before gpd_list_lock is
> subsequently acquired.

Ignoring pre-existing issues.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
