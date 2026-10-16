Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162A94E73B0
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 16:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167483; cv=none; b=ZvWI1Y1Qxlx8UJhHL6b2/RhuxenrYjxcZm00Oy6a2+gf8/iiBGEBS/SOeiDsHQrvj106xQ6WqVLwhHShFWTLCvvRzEoXwftS1ZOH6O7ttwL2yb5Uz2pNwep0PY0eERO1YxcaKq4X+j8q5eNQ7FD/azngE1SGSJBbydB7pysnTbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167483; c=relaxed/simple;
	bh=xSr2ExXRN9R0UBBPp938gkkIvwZwXGmsDTqtVSQe06o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHwv5DJdl93B2804ihD1O1tuxKz3v7x7XhmpACwjpyPhXw6TWRfBFwpUL/WgiDqgXFzJkFbweYZQZrBqGe20y0rEZfHhnXqRFTgigSJEVHKzyzelKmQt4AW4lD9+Irim+4FIZmqo3SkF3C/xd9lz6J56sTLQ+gkOjuru2dwqCvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9905e692905so29576241.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 09:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167478; x=1792772278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AunDP67smfuPeJ58K112HEYEzg+svez7qfjrmc8SNz4=;
        b=yJs7DiDlz0VD2wcQ3tvAnxiqCkfCnqz1F6P4sP/UIRhvXFxsCVmfQ4nousSnmd6JGA
         shBq9Y888UO/vTcMwvqLiO+ytpqm/eJzBBlGksmDdxZ9+QbkXqIhJgZpGhdaVg5FyEEF
         GQBoXqe9jT+xH2OVfioL6Av9+seUzh2JwEvgY/lfRraBCveHlE3YH+btlN39iZ9sm9Gj
         Y53BRaK6ZjvftrfdH4Zbh2dD7QAIKhhx0bnSGiFZJHX5VZYS6c01U+J3CWfSxC5vdKeU
         OqDwjdcLn0SfSjGlaDeh9I5WOdeMNWyjc8furw6jccuqF485SIDCT0tjZELcmB4GwMUX
         cmJQ==
X-Gm-Message-State: AFq9FYJ786D90cJQRPQoyyzZSIzVLleWuJ3piinQU2CURnGPmLbM566n
	buplbH4fDy523XnLt28trqDG/oo2r65LEif4OWr8+W8UiEN9hOU/uYQS139UlTwF
X-Gm-Gg: AYBFou0/zlm2kaVfulqlA7WLVzbuBKnymHbPAzn+pCn88VIwuYCpBh9LZ0cH+y4o01J
	Bk/tWzGfZTxksnBQG1g7ddnaGdz3ls7zpqZD6SezDCKuQ9/F/XhNxzEQZgb5b0G52qJF38P4eCp
	dGTwyGP3zCmW1NjMaj3X9+vtsoQTF0aW/PHQNGFoacxUN3BQM8YWYJk5NfaZgOkYEWxSdeA4lGA
	ZJAy9UKZhJ+x/bkcYtJjBq1rFAlpc6EvxDvZ95tuVsjxKeHOh7InyVRl7mI2bZws1QDui/T8khk
	l2VnkWro+WaBii9q47ucrjDG2xWI3qAu3i7Hyeud/JkjGyBi1hmItbQy8b4nbuAIUeob4if3YgI
	JsyU/TnHWIuEOVjYfN2kd8ypYHqxV7gBFtxReZgYiO6tAreBsVgJf4Koc3MW+ETbVxL4bSaEmt+
	iio5KPguIrcZAPbE8LkAySJfKI/6lXlsO8oqF3NSPuFbtnujhN2+pjZnUnPD5PlcESXvS5JgnVz
	EL0aK6ITSUwTmEPcjewTLOiRFF8/ddvM5hQ
X-Received: by 2002:a05:6102:f0c:b0:7cc:26e4:1943 with SMTP id ada2fe7eead31-7cc36acba14mr1610137.28.1792167477664;
        Fri, 16 Oct 2026 09:17:57 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eaa42c2ab3sm920291e0c.9.2026.10.16.09.17.57
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:17:57 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-77bf892b496so14050137.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 09:17:57 -0700 (PDT)
X-Received: by 2002:a05:6102:91d:b0:7cc:25bc:3b20 with SMTP id
 ada2fe7eead31-7cc3697a80cmr4964137.7.1792167476872; Fri, 16 Oct 2026 09:17:56
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be>
 <sashiko-outbox-174611@kernel.org>
In-Reply-To: <sashiko-outbox-174611@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Oct 2026 18:17:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWG50U8V9wXBK_5-74o2bseEUbQMy1ZNn-E3aDukwXPKQ@mail.gmail.com>
X-Gm-Features: AclHuK9fqn3MalAwQj8tdGTinUXqmFBnbO7uqU1e8oT10jns_G1thPssa7yAsT4
Message-ID: <CAMuHMdWG50U8V9wXBK_5-74o2bseEUbQMy1ZNn-E3aDukwXPKQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: renesas: r8a78000: Add SCMI remapping support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 18:13, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] clk: memory leak of struct clk and module refcount on success and probe deferral
> - [High] clk: renesas: UAF on provider unbind and struct clk memory leak
> - [Medium] clk: memory and module refcount leak in fill_clk_map()
> --
>
> commit a959fac1d9976d318a861219d6e13c9fef99da15
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> clk: renesas: r8a78000: Add SCMI remapping support
>
> This commit extends the Clock Pulse Generator driver for R-Car X5H with SCMI
> support. It maps DT clock IDs to abstractions offered by the SCMI firmware,
> falling back to fixed-rate clocks if unavailable.
>
> > diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
> > index 5ffd7b89cb48e..758cfe78ae58e 100644
> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> [ ... ]
> > @@ -145,7 +184,46 @@ static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> >                       break;
> >
> >               map[i].fw_id = map_in[i].fw_id;
> > -             map[i].hw = fixed_hws[map[i].fw_id];
> > +             if (map[i].fw_id >= FIXED_CLK_OFFSET) {
> > +                     enum fixed_clk idx = map[i].fw_id - FIXED_CLK_OFFSET;
> > +
> > +                     map[i].hw = fixed_hws[idx];
> > +                     continue;
> > +             }
> > +
> > +             scmi_spec.np = scmi_clk_np;
> > +             scmi_spec.args_count = 1;
> > +             scmi_spec.args[0] = map[i].fw_id;
> > +
> > +             clk = of_clk_get_from_provider(&scmi_spec);
> > +             if (IS_ERR(clk))
> > +                     return dev_err_cast_probe(dev, clk,
> > +                             "Failed to get SCMI clock %u\n", map[i].fw_id);
> > +
> > +             hw = __clk_get_hw(clk);
>
> [Severity: High]
> Does this code leak the dynamically allocated struct clk and its module
> reference?
>
> of_clk_get_from_provider() returns a new struct clk and increments the
> provider's module refcount. The clk pointer is discarded after extracting
> the raw clk_hw pointer, so it is never passed to clk_put(). This causes a
> memory leak of struct clk objects and a module refcount leak for the SCMI
> provider.
>
> If a subsequent clock lookup in the loop fails and returns -EPROBE_DEFER,
> the function immediately aborts, and the previously allocated clk handles
> from earlier loop iterations are not cleaned up.

This cannot happen, as all of_clk_get_from_provider() calls use the
same clock provider: either the first call returns -EPROBE_DEFER,
or all calls do not return -EPROBE_DEFER.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
