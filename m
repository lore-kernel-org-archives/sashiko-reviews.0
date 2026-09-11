Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCDA369206
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126817; cv=pass; b=R7LOY6hZLoRjwXOww/TuH7+99AitHdFTxEUl7/5USDRReOyJ43Fn4EIOVY/X9BPxtLc6b2CYyi39tbGR3prD1HUY4gV4r7Tu9Wv+udhQqnnXjwLyP9I5qn3/YabZmsbyW5MO01Ldi2nH2SON6pdKijpFatew+AofkpG5z/nZ1gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126817; c=relaxed/simple;
	bh=jXGJ1+Cv6nGnyJj2lXAv0ULWiPCyAn1DaGrDuuzFGiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srumg28TyOhA+TaOpNF2WReyu5V43//tQkeW/Ond2ETVyVg3f9FZrS1i2lYxorcU6eoiJAEk9KaOYZndm/BcGE9sOilhZHfCpJJ0r0x9UAcTjhcWlE6RP8iKq53nGeHHl7XWD3BUT2fzVHX90RsRO+7wsMvAQjfDmST5LHD5u+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExsxkwHP; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExsxkwHP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so417071f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 04:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789126814; cv=none;
        d=google.com; s=arc-20260327;
        b=T9nFTvrEnsEQ6IBjy3zT+MMuuKKOOaVqFk1/1MyK/EX+L29qnRzc58ATHU2kvSy/7r
         cFTiN2yDYtJ/FqFdUvmKjpta0rIzJbbJK9E5rJR5sIhVVKU3nZ5SY2pu/yeSOqlve+CG
         Up/KfeBn6VIDmlPb/26ddgge8IqhRDy04FTi7bWHeT6ipHetnVhBMfVc1T+AF2qet3ib
         bpKpql/lpJlbM3f4gWRmZA0WvR+Yf6BhbfKCyqi4Wewqi9AM2LyYBrhxtMWgf7NcEPwp
         R995a4p4XK39Jbk3lgrXwe/hOEi4XBFX06Oe4ME2/+n/P3EYDsB83O448aWYn2reQzIG
         35/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VG+qeXnRBa8SMBywMNzx/mbp44ozs4FNe3yNR5x/cvA=;
        fh=iZqn1gEXB7z4qcle2f03eMs9b1YE7rzYl6DIpKOJ6R8=;
        b=kcOiLTv3F7/KctH8KBJEbXLjTRrN1+ayAGwumFiefYYXahinOeMfbuii6j/M4CgR04
         FlrLSYH1QaC2HuNGAfng2tbmq2hX7xYuL8Z8q7MuE5zCoG/b+RQca81Atd8SsWZ1e2Zd
         uQqkHpN/AJmmwFfU3CkQRr0lkJjRmMIOGNCBExFsYiCsFS+an1qVDv+CuCUvetlTaPES
         JqslTo6+uxZ0KA3EafyAeI9hJESr2g6yQZ+v0fqk2K3n+DaL5aq61hSbi0A1P8zxG1B4
         rj77u1nABe0kv+ZLQvyixUbGHa736VYgmV9PLHd9TtxKbfJrIKKGd33PmyJPxBH+9fEE
         Kk2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789126814; x=1789731614; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VG+qeXnRBa8SMBywMNzx/mbp44ozs4FNe3yNR5x/cvA=;
        b=ExsxkwHPys7tPu0H41no08RylT2i8yHza9KIfuNfpwsWyGcIrbHrDcQhP7krlYNaAp
         GlIpmvgWec2Tqyk3NnB6eoKhIjMqn4mPo0IKrBMIqr2p0F6XBpHQuavbDThLLLsLiU6x
         oIZqKpFVNfZx5sDAL4U0D9blc0UgKfJgmkSunDxRkOXdPwMXc4OEFOpUkzniwoYYQys6
         EjeoQq8Uy2gQbOiIjSdH5FGVudFj/4SlZeNIQC5/tAfeCW05PSDiFQKmo1Rokchbgr1F
         U5ZfzLe4YUImvZjSQBAGQ1m3jbeBmRtinj1lHnQhMuXB1nD+qSR8b8Egg462MsWKRhi1
         Hw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126814; x=1789731614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VG+qeXnRBa8SMBywMNzx/mbp44ozs4FNe3yNR5x/cvA=;
        b=A2sqPwYelBdPGeZmm1A0jxw7LW87W5Q3YFhFu7A17pbbEBZrjEVrMHjsnOeogectxg
         sU457Ir5+ipLDIQK1dnnEni8sEc4Iibn6E+eV2nMEEpXe63nDDPs9S4P7UZSs/HZzAL/
         j6d7tY0sgYmtIg1r48M+5xphiu54oDrH5b4LqLsUXVqQjoW16oDpP0+32xDBmyNKDRvv
         50/p6dq0nftqt8popmObguyOnwo0ZRhKeQnifTD/0gbKOu3w9UVqHteXPlah7OFsbRfV
         2h8zK1+LQZbYDp8O6SI8HgUQ5GIM/d0+yu+HPTEBVRJhTC8wGZjnl1kUR06BcQsG+Pmk
         HMaQ==
X-Gm-Message-State: AFuF++ln6YEaRpA1kX0hjshGSaPhBpc1I3cmCeKHJsWnUsaLMRoO/Uum
	qyiz3FeSgClUxQmCKWEH+vDHuwObmXHAw11euqG2Emys37pOLnm7oMUlewuiMBDkInoBU3MqbSx
	asPeLmN7//uzhatxPZCkP203VxQhp2IVbp0B7jgtTWg==
X-Gm-Gg: AYBFou28obHWsDUTUj2frbhlwtL85SYBG4fJxPy7r85bMDqMGW9lmXgCJmwAytkuvi3
	j5QK75r8cZtk2Y3ebJ+IPpn6qlfyVFOabB3xd/5mQ7MLqEBL4foIssEw2pEcQSmEtjyV+3h5nvZ
	BIndfgr8XPK2z9yjRLF8mQqH+zWJvtEK4nY9GD6wzY5SR074PwcwrycP9KFtz7I19E+wYTjw7LT
	lEZ84RCjc0Jj1ABBgI7enCe5zGEY3aIjDjjUiQIXf+CM56bBpg/N78hfOgZE67Ft0C2pVanaM5j
	dh/7TDxBxpGtdPXlHhZ6MVLqfK8Zp77pp6fK9Mpcj0aRoYqPhAJtrqW5PULvOB9VKkNbuZu1way
	oWICiQIIfZ78pKrQs57HtRCWp1Rg7D2Q3f8lSf7CGXbd+0vJv4y774Z1EFjk9h5Pxu1PSnXo1wg
	==
X-Received: by 2002:a5d:630b:0:b0:484:3604:c7bd with SMTP id
 ffacd0b85a97d-486eb31c4d4mr6627074f8f.17.1789126813565; Fri, 11 Sep 2026
 04:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911112804.39EA91F000FF@smtp.kernel.org>
In-Reply-To: <20260911112804.39EA91F000FF@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 12:39:47 +0100
X-Gm-Features: AcwNN1WJ8okh1HOUuJE3ueC1NR-zA8LxQ9g_9pvoKKyvz8W9CWr4L1YVLC5FhrQ
Message-ID: <CA+V-a8sQZv-NbarMqTHiH4C3TaanEJF-pAb56tpZpN9M-xWBzg@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: sashiko-reviews@lists.linux.dev, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, linux-watchdog@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Fri, Sep 11, 2026 at 12:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Watchdog restart handler may deadlock during system panic becaus=
e it executes a locked regmap operation on a syscon regmap.
> --
>
> commit a3a7e98fdd4da0cb2994accaf697498b31aba4d4
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Add syscon support for WDTDCR
>
> This commit introduces syscon regmap support for the WDTDCR (WDT Debug Co=
ntrol
> Register) on RZ/T2H and RZ/N2H SoCs. It retrieves the SYSC regmap using t=
he
> "renesas,sysc" property and derives the WDTDCR offset from the watchdog
> instance index, while preserving MMIO compatibility when the property is =
absent.
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 550112446db49..9dee410ab7f31 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> [ ... ]
>
> >  static inline int rzt2h_wdt_wdtdcr_count_start_nolock(struct rzv2h_wdt=
_priv *priv)
> >  {
> > -     return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTS=
TOPCTRL);
> > +     struct rzv2h_sysc_wdtdcr *sysc =3D &priv->sysc;
> > +
> > +     return regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTST=
OPCTRL);
> >  }
>
> [Severity: High]
> Does this introduce a deadlock risk during a system panic?
>
> The watchdog restart handler, rzv2h_wdt_restart(), expects an unlocked
> execution path to avoid deadlocks and specifically calls this nolock vari=
ant:
>
>         if (priv->of_data->wdtdcr) {
>                 /*
>                  * Best effort, ignore return value and use the unlocked
>                  * variant of the function to avoid potential deadlocks.
>                  */
>                 rzt2h_wdt_wdtdcr_count_start_nolock(priv);
>         }
>
> Previously, the driver used a dedicated MMIO regmap with
> .disable_locking =3D true. Now that sysc->regmap can be a syscon regmap,
> which is shared and uses internal spinlocks, regmap_clear_bits() will att=
empt
> to acquire the syscon lock.
>
Agreed, I will update the syscon regmap in the CPG to drop the locking
and let consumers handle locking.

@Geert, would this approach of consumers handling the locking be OK?

Cheers,
Prabhakar

> If the system panics while another CPU holds this shared syscon spinlock,
> will attempting to acquire it here cause the panic handler to hang instea=
d of
> resetting the system?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911111731.34=
04308-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D6
