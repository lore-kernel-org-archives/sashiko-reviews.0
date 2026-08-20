Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662F03C109D
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211650; cv=none; b=bjprF2lWQqNclGxtnwBvgwiKWU2iPpIkIpO+DN5/3qZNg1GH4LeE4ktGb9w0NsaknpGotOoPnSmcsHpHeJNuxYb7MNe3QHFJFOq6FcaLIq3CY5Ai94eSYSui+btl38tK2pzqbHHRbHKEtAqzJCb8/IMY6tl9nHufUi/BpWJ3wtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211650; c=relaxed/simple;
	bh=MapOTuwbJCCiUZFtCGgs2M9xTj7+mwKoeNjEtUvxTk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+Y9pl136TM70e1ghlIDu73bJbOdjp1JJu4iB5xkquGP9uF15F+JotdCqExE8CkEXx9Ah7Q9qZ5ivM2x5nPwiY32LdJXVFhSv0bgz6V7TfERo6+7hMptiQ4H/uYY1AEJ1FADPGJ3lvn/Xh79Kc1HMcTPRpxrZ8+t1tIhIzpIPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso826192e0c.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 00:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787211647; x=1787816447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdPpwGypGBUsvrsSvDXIguPPL189yxwSySBc8xM9coA=;
        b=Rolb2mCqVDuaZfCeiMaE0aWlbKTyOs8Z5++2GHrco1r9ii+Dhnnrcgm7Lsf5f0gFAf
         7AXNwGEBQ8oUyNAfHQtyv6mokxqBv1DV35BZa8eKKV5qN8lPcM6Bbm1dPcG0OB75MwB+
         F2ktCHH5HMhCnJsb1FowIjSXi040+nMWz75e9WeL7EAIOgJhUxSkp1qz7A34g7evvRcm
         v8nu6f1AB+Uwz7DKnMnmX7jzYbSYOK5/UdEeVqSQmfvJZs2Yuyr9ANpDY6DhZxqAEN8R
         tgei9YXG4yA0QZ8zaOnwjuN/QAtWzKK30N85q6M5+zEJNLb7URrsYp1tjF0CJO3po9tk
         AcgA==
X-Gm-Message-State: AOJu0YyX+RHugEQblrGbkIZH6nROkarmMTIlTjnzljOwM5qYChSU4Yr4
	VImdKsJrc9vLWsZZGdANDpoc/PGmpkX3/hPlkWI63wlX6SlBiNgfLkItprLwJMOB
X-Gm-Gg: AR+sD13REeyXAE7zSqmDP9P4Nj4JKioQapZromMjW16jFQdx/xvDV2CmJmlpdQHYQts
	dpEZjpGUsr+DRRhNtP2B9egpsaen6oTo244miDsox5mawBQyxFxLmlL2Yuakko0Hg2UVtnlhhXr
	/uTBEhdK8/yZw52pTmhRt7wuwc6GTs0bRM3+GwCrE2ZB0eS5wdc4juZo7JPFZ6+MganNHSkmCf1
	HCWUC9Cm6jN9aNTP3syYcwywZzMjVPSXFqgcwIR22O7KqkBRRH1cq3My2RohIRcpBqM/bx5XIsS
	ghNuhJdH1yro7Gg+xIpfMuI4NFqlq85xcwQRxL5le2Bi3AbL6aTTA/TZTmmnOJwaTUjy+eTDtOx
	xGzpYIXzEdxvF8A6MPl6JgzhVZwTnezHQW0WkxI0M9hbHGNodA186FKOcyLpc11+qI0M4Ckxbrg
	5mqm9LwyIJCt3FdIJR/gbE1CFxI0NhYQw+CrIomU4I853gh7pUud6bZntLnpiqVtMZAEArLw4gx
	Ynke+rtsH6o/hzFGbwuIFdJEmNXeNNzYJMOzTVx
X-Received: by 2002:a05:6122:882:b0:5bd:86ac:a847 with SMTP id 71dfb90a1353d-5c5e3df88c4mr4331261e0c.6.1787211647020;
        Thu, 20 Aug 2026 00:40:47 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e276d7ebsm4833605e0c.10.2026.08.20.00.40.46
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 00:40:46 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf9506704fso886061e0c.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 00:40:46 -0700 (PDT)
X-Received: by 2002:a05:6122:882:b0:5bd:86ac:a847 with SMTP id
 71dfb90a1353d-5c5e3df88c4mr4331225e0c.6.1787211646157; Thu, 20 Aug 2026
 00:40:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1787165329.git.geert+renesas@glider.be> <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
 <20260819191316.8F2F21F000E9@smtp.kernel.org>
In-Reply-To: <20260819191316.8F2F21F000E9@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Aug 2026 09:40:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpHicDvj7tvKJB7SCnVJ2gRmidUeTwA+hHxnhsXs7h=w@mail.gmail.com>
X-Gm-Features: AcwNN1Xf-k2z34g_6wcrswrRilyDIcooOAsIPdAyo4-A___PZ7FNnn6TGkqYEkE
Message-ID: <CAMuHMdWpHicDvj7tvKJB7SCnVJ2gRmidUeTwA+hHxnhsXs7h=w@mail.gmail.com>
Subject: Re: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure
 clk_init_data is fully initialized
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	neil.armstrong@linaro.org, linux-hwmon@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Wed, 19 Aug 2026 at 21:13, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Incomplete fix for uninitialized stack variables: `struct clk_pa=
rent_data parent_data` remains uninitialized on the stack, leading to a ker=
nel crash during clock registration.
> --
>
> --- Patch [4]: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure cl=
k_init_data is fully initialized ---
> commit 99e024a77f5bce5921d3c6b46054263aa450610d
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
>
> iio: frequency: adf4377: Make sure clk_init_data is fully initialized
>
> This commit initializes the clk_init_data structure in
> adf4377_clk_register() to zero. This prevents crashes caused by
> uninitialized fields like parent_names when CONFIG_INIT_STACK_ALL_PATTERN
> or CONFIG_INIT_STACK_NONE is enabled.
>
> > diff --git a/drivers/iio/frequency/adf4377.c b/drivers/iio/frequency/ad=
f4377.c
> > --- a/drivers/iio/frequency/adf4377.c
> > +++ b/drivers/iio/frequency/adf4377.c
> > @@ -999,7 +999,7 @@ static int adf4377_clk_register(struct adf4377_stat=
e *st)
> >  {
> >       struct spi_device *spi =3D st->spi;
> >       struct device *dev =3D &spi->dev;
> > -     struct clk_init_data init;
> > +     struct clk_init_data init =3D {};
> >       struct clk_parent_data parent_data;
>
> [Severity: High]
> This is a pre-existing issue, but does this struct clk_parent_data also
> need to be zero-initialized?
>
> Only fw_name is explicitly assigned below, leaving name, hw, and index
> populated with stack garbage. When adf4377_clk_register() passes this to
> the clock framework, clk_core_populate_parent_map() will read
> parent_data.name and pass it to clk_cpy_name(), which ultimately calls
> strlen() and can cause a page fault during probe.

Yes, parent_data has the same issue.
As Jonathan will rebase against rc1 anyway, I will send a v2.
Thanks!

>
> [ ... ]
>
> >       parent_data.fw_name =3D "ref_in";
> >
> >       init.ops =3D &adf4377_clk_ops;
> >       init.parent_data =3D &parent_data;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787165329.=
git.geert+renesas@glider.be?part=3D4

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
