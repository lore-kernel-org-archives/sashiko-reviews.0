Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0D30C63B
	for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 19:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786476275; cv=pass; b=Nl4s+0PCluweh6pKbm2NrliAA4cc4mfe4J3QtEbI1ikanWoGv/vtmldWuoFMuluUwf9k4aLike7ybC+o+vPVttQmL2Z/OnChOoYhlj6LQho+kUg3iL3cOzX532QvPT8KPlpAsIV76UxQz1zJvmkqG3crfipNK+fZRgNZ2jyk1PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786476275; c=relaxed/simple;
	bh=pvM++vc0HsYobIPkT5dR3rREFxAKr7kzE34v4Lzz8BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTkNK/AS6e3wXGSEUOi6KczOR802hIhSiaq2SQ2UotzFrewmFakkMkDGVd9M4DFErWBRjaCSlGheoQyv8gukuTAEvIq8v9jSXfV5Wp+Pq+UBpalIkyUUkbChEOsUApPX6Ou3Wnn20Tr0f3P6QKmAhoRwzPzDjknUW0tlLtCulkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuepTOR3; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuepTOR3"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so355127a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 12:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786476272; cv=none;
        d=google.com; s=arc-20260327;
        b=Z1HwxcT8KDrQZorTwBUIQJ3gzb9WSWkQYhlyJPX6izopt3N4tS5StV4Z812UWafjBv
         O9gxqy0OcZav3n7N8TmcQXR5JJeI0NFPKeLJAo68Ui6YBIJjMbaLAg5kYv6xVvlJkbhj
         ZJq38wF8Hgj6ULfq3WReB9yKkzy2mnNkPtHreQQn/eFuCmDAjX6GYY6CFJHGtNM/YRsa
         bsEQo8AW6JuNR7LcYCn+g49BZNkdXUd0CKuOdRks66Mdsaiq7s1gkTgMh4oEcp6fCPRd
         IasNqlRyHMsX0bq2YM5Gn1+7c7zs6eBqAiK69VKT5XTbabpOJsqhw89jsY3xeW3YPtXv
         3oNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=buQhdfRXPDhdGddRViZT6KrsBkyixNDeK7u3oyQgY5M=;
        fh=fM4ZI8+hWSv3Fnbj2b8tQ4LUMCJe/yK27MRsZNxqW0A=;
        b=WNd8tMD9MYbgFrU/2vmCavyzqFuNG8UOZjVI9SXCRRYhXM+PmLDrpQFI2/A1eTtIlo
         Xsyimb6EJH0y2XyoDhsfXQlzmATnaluWz771p0b5Hq9pFsUA8IVcYMYx9PDUzhHNR4FB
         cmUjBcMS5HM4YsHIe9jzKR9stRCxzRmywjZ74ZAo81HVGvS0uvb6uNGhxKBOcRdgGZ8w
         db8RX9hOn2JYgpwVYy8YAC6KdwYTQjR6X6a3WjgSlc/oitERVKoCTD1+LPlseIMgO4Ai
         D4rvOcI65k3fiddJX4hGCgPnBntBzh/Ryc7e2iFU+328iRvOvEJWz6PYL9HCTjpHe2PB
         Daiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786476272; x=1787081072; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=buQhdfRXPDhdGddRViZT6KrsBkyixNDeK7u3oyQgY5M=;
        b=HuepTOR3b65AcBhpwDU4FJFMtZgnNeiYfb9CC5uMNTr1Qdda4559RLhjrH5s8XIyMm
         +G5GM6RZO9AeC/KGpRIj+XWEbTkWkQGddBeFw0iAgXRvI8nm+VkYmyCrL56MHNqgNLHZ
         yqPe+pMKxJyLAyLHawJCi4ihUndfvgWrhuxAEn07ZHnbIbaKgrxlpyXlNsyAlxpdP5hS
         mNeTLf5H/rgLsWbGzHTxJw6WJK1HGTBJlaK1Tf5219clRrUBg8EDxBFYz69+5DqrRUg5
         bAApFSGssI/RKKWLTfi/b5iCtjCW4vge0143v8r8CVpL6KRdy3Q1iKF+r5gdBLn59t7q
         2C0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786476272; x=1787081072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=buQhdfRXPDhdGddRViZT6KrsBkyixNDeK7u3oyQgY5M=;
        b=UAkL60td5Ff5Q6VPIwBCNJXxza6fJJWBxGmOryimr2hEed4r0VSLK+6finzCSB+RF/
         Ithe798ax0uJoeYtwK/D589j3Fy+VW1VHdZxV2FOqUoeumS4YzQOYB0wIs7fweSQdjsV
         L2mjv3aFkKMyMtgf5e7fsS0GNFdkwg9/EwU0N2hzQ+dweGILo+rJ//vBt58Xc+lB/eZS
         IXStm/QD+s1gOdSn44T81k0gxVpznMRoulYVuPqR2+lIwNULTagiskDfhjbxkVibFQV/
         ah7rTSixRrDMpG1bPI83SNChB8kSkzmQ66nm5Im097ht0jfNEQqtypwCFPbD46XMb50w
         Zcbg==
X-Gm-Message-State: AOJu0Ywbzq91Pl7z9gZMdEkXYJ0loowd3OSj1IzGQtbMDgTsqyPTmfra
	MYAY2RC8obzydtSIKQtGuMUNrejJXQwdClgbPQDhOvyePNT4dsv0jQgYSvLE2wJujmNbD1I2kcK
	OXTlJagBLyg5a/S7RAV20XjaKrwJFTeRlVA==
X-Gm-Gg: AR+sD13a2/WeKxCXiJ4h2zQUZcTrtqMNHVKJWgoxsntSa1/rUwHD8E89NRcD67z5XPZ
	1k5vbPQiNTGYyYFb9j4/2O9Act4hoJxfRfBd9XCpOOR8ZFQ1wV4Q8zEdRFjsIpI9C6GgwUgUu/X
	CXBQYLuyk2zCnEbD/iHl9vy/d1+6osTENfqYwS57ulOs89lSYTHROcMg7J/JUSVfH89ghUofoLC
	5oopm9IJMOdlIESEHcGsloTI7wlpGrh985C25/Z6iKwgps0SE08ddDusU8ESNcAqIZHV649B0zG
	2EjZjCOjRPp9dZesGMYCtrHafi2KqcvtcMFfoMHJtsk+eAHT6H8gsxE6vmZ2fjV7PVHLuFwfFO3
	NQsF0MKtLzmybAIeYNyxDEdHdVJYeTl1nxH7eAW7ABWpXEquIjIRw+hiBay5xTM3JBqcDybDVmp
	mbbtKasX+ucIxqFSQkCYy8ftq90Bav5vRXhiylh0AnTbuaP2UOfxYC1/A=
X-Received: by 2002:a05:6402:44ca:b0:6a0:567c:c2fe with SMTP id
 4fb4d7f45d1cf-6a364526ec8mr2810499a12.20.1786476272208; Tue, 11 Aug 2026
 12:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811190821.117485-1-rosenp@gmail.com> <20260811191733.CF9141F000E9@smtp.kernel.org>
In-Reply-To: <20260811191733.CF9141F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 11 Aug 2026 12:24:19 -0700
X-Gm-Features: AUfX_mxr_vOfRAy0BAUB8fsvi9KMYklBxgQ1bG72ZHw3hguY1KNk8TLFrlo4fDQ
Message-ID: <CAKxU2N_NJZx3aWrmb3zGDWXVgULOvn4L606NwZJr_6AHpbYJ7Q@mail.gmail.com>
Subject: Re: [PATCH] clk: davinci: guard da850-specific init data references
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 12:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The patch uses a non-existent Kconfig macro `CONFIG_COMMON_CLK_D=
AVINCI_DA850` to guard DA850-specific clock definitions, which will uncondi=
tionally disable them.
> --
>
> --- Patch [1]: [PATCH] clk: davinci: guard da850-specific init data refer=
ences ---
> commit 8310fd74805280b1ea31726bf5935e313dcdb916
> Author: Rosen Penev <rosenp@gmail.com>
>
> clk: davinci: guard da850-specific init data references
>
> This commit attempts to fix undefined reference link errors in COMPILE_TE=
ST
> builds by wrapping DA850-specific clock data and declarations in a new
> preprocessor guard.
>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608111912.YS4Vg7Jh-lkp@i=
ntel.com/
>
> > diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
> > index f73b0ac5d8a08..af95dc27f840d 100644
> > --- a/drivers/clk/davinci/pll.c
> > +++ b/drivers/clk/davinci/pll.c
> > @@ -841,17 +841,23 @@ int of_davinci_pll_init(struct device *dev, struc=
t device_node *node,
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_COMMON_CLK_DAVINCI_DA850
>
> [Severity: High]
> Does the CONFIG_COMMON_CLK_DAVINCI_DA850 Kconfig option actually exist?
yes it does...
>
> It appears this should be checking CONFIG_ARCH_DAVINCI_DA850 instead. As
> currently written, this guard evaluates to false unconditionally. Will th=
is
> cause DA850 devices to fail to boot because their early clocks and match
> tables (in both pll.c and psc.c) are no longer compiled in?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811190821.11=
7485-1-rosenp@gmail.com?part=3D1
