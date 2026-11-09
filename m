Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794246356;
	b=LyPiFNLsFgyikHc/9/D0GvXgsQsM814p0G2ZaLJn0rnya7V/MgkVCQxF/f81IL4nPo2m
	 v4z0jsQ6fFUKb1y3sxJguhdc308BxDL6P8EyqvQC+vi09RW96x5CZbGwNHPjD3BgoopmF
	 VVIO81+6zqp+srDkYPcjAwx4uHDshmVI8eDhpwNcevDlbXl9XT1Kbztrlx1gpgt26Nlpm
	 21rCh+3Ui9gLYYJ8CLq6qR4bjhIVArhjAgX7tOYE9USKRJcnOXo9qTQyfoJ2RiTj4sFg/
	 DHtPgh8tjD7V8w34TKB0IXmvwogLRl/zWbqDSq/U3IcpMc9izW0oTVRsCu89YahTmJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=zKTigsyXM6PY0IrqDOSgEwuBaRmhXblPi3USwO50fuw=;
	b=aH7JO81jejSnHfVQCoHROHFZegfGG2WIJhqXX2cq/XICFOCCnJwdQgmWGmh3X1bGtn6y
	 49XwKAm5ucfcaNDHn1rTjO3JEMYyVg6VdANAh3PyuILHeCNvRqEsmTdAVPgM2Bey4Dd8O
	 m6mfERs4FfDB3OcUkzog9XqzaHcuWryToS5RyE5/VgP1r7H4CsKJYwKCMR8XQzOQiZYO2
	 P0zAKNtYaiVp0/6FEoZKx9v/x/3tS3pwwmoIrsrfXFX/aGc0UePRqm/RxtzeJFMdKb9zd
	 TizdrdZJTGJSPNVGorSz74U0otheRu3jlCWQ2Mi4eniQqtOOiv7KZJ2yfkYqhXOGyHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oq3zQaXI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45C9606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 17:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C45C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oq3zQaXI
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91ea5600c9cso14340196d6.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 09:45:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794246355; cv=none;
        d=google.com; s=arc-20260327;
        b=XUNf141wYO6X2nXOmI88VP618MTK++c+WShHsGffUBwWyUCBngStZJOEek1hfk1snX
         Iqa2WOUbNKXvhi3pH0eQtKOteeFq3mU0gOYu1bbgDfO0oJR6V1ttZ6cNzwRJqO54yF33
         EfI9JLfTFdWKABRAvZr1hFP4B+CvDY+/j/SFmgWWZ4WazJfqUMNFMJDgSVAXJrQ8L08m
         rMTQyPpPXYY/dVXfa1Xn3Ba0R5a5Dc5M0dH6cJ/SfhL5lGXgEhd0g3MKr3TtKuxQI4Mv
         mfPMtaYLHIUrojVzJ9JyHBOPBy6pKyq5roNieYVQoGXv6g9RrQf2Y4057+uRlRrwCTVi
         ghDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zKTigsyXM6PY0IrqDOSgEwuBaRmhXblPi3USwO50fuw=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=jcSl2Q+Lfd+YuT5y5h/VQubknad7LpQDuJ1Friw5ZFjnCIL7XxRsIbqDCWXm9j+mwg
         RxsgAWzF87DMMWNWThCdFV16VyGrsYxJ0RYTnLnHPm9G323mx7wxyAVatIJaItAeUagd
         qy4IQJFHb1VJV0zXT7mo+ZGO/QI2Sq48vezCt34iz94OFU4C7mQFtQ6HPiDHAqb7ufsH
         SysDj2efKvfBJZguhoH2nQbJkXEp4Xv0kqBKouIJQUgQX/E5dMI/Xdj87vWlzoDqhVEj
         6/G8G+GgB5YJdDvle/xeYFiebJpu/Zux57Ezg1VHMcky8dP8AsnwVCNV+48n6GjeHhh6
         oQYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246355; x=1794851155; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zKTigsyXM6PY0IrqDOSgEwuBaRmhXblPi3USwO50fuw=;
        b=oq3zQaXIdMoSrFPyyZ5d1EkPT2b+xnCXBd1TYuCZmQXTkFdYwU7I5/U/sw/7kDSs42
         3QLplhFIwW0xhCzt/Ji/R0DYVtiA3ydLDkGfTtQF5dkARa1TA63xC5A1VcOCo33gnfgO
         VuS8eSKvn4kY6D++tvGlYuygR5bC1mJgnQIETkBEvcPo9cACjHIQ1gsPWRtkaanM3Pb8
         jzt7rQ4G0Eu87c3kkP9BuTxkkEjM7G2+big3PRNct2ZRJC2G+gq4cOSm+TMIjL1m3fPb
         Pns9Aed0ylixDwGJ3lDuYvVQ3x4/TO3HIYXQfHlrrzDVuhtN3KCJ7MPaKPV33f6Vozai
         Vdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246355; x=1794851155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKTigsyXM6PY0IrqDOSgEwuBaRmhXblPi3USwO50fuw=;
        b=vsX9zxa4jxiUxLzUfUWXEg1rPLFVteb3HpGyCQFsLAcBNfy2QgtVyA90clTyBimes5
         H7dzGgrsEoqd1d5DFndLJ/5Mkj4MXPCUAAm+QMds9TGqferoU8Wde7HDA3wjpAq2lCrs
         bX0nt6In0NjNZRLJsSNhVGl8CN9yFzGh3wembJJVuPqF8Ik5twjs+O/TNwPYLsrrD36B
         rBc6e3O7rDKANJ+Q2vXvNUYkmqOQahCTE9Bz16N1sYtdArKwzpPoYW9cCgj97chxgnKa
         UZOue6ZZ/bioWHwAsM10TPZW0lFeH3Qw3r2yrJs13jdTL7eO3JMYBEL5b/HwiV2C73lm
         c0aA==
X-Gm-Message-State: APuU4Z/PmJskg2uOOPKAVqHMRIuM4LJWlS0twAboFkCVnySEZiik5byr
	fjYfzeBFeqHcpKa8vwoPiK7lA3d29KCr3QIPHX520thIzwcnJjklojf++5IgdtRF2PQhAzVc+6X
	43gORJqwoP++HBKgneVR0ETUIgRyBtBFwMAbNiwU=
X-Gm-Gg: AYBFou3i8pSToeiVcpqVxTmkLxL/EHIv7tRJUCZo1M4lrTR5++Ft9oNfnXqKwcZo6Gv
	vym3p07MElbDE5GpB8qQLkqzbYDf/smVktMB8cRJ8LW6gOMBGSPuLvos0Kgaa2OBrFa+ZRMmC73
	7u9KkbX2Lvh9GuScUtETi5hlreVVEgXd028c1yNLZmX8E3VkNIAzTJWIfonWNlNdqVN2vQTbcA9
	MS7+8m2T22Jk3JvqpokSHBViBDguDWysdcD+zqRIZWoNqGpoIvqWgbpmrqWuwiYD0jRaSxXW5Gm
	/7EJJiXYXvvJ+rHnlwNeBGMtzJJBeaGCWi9mFQQSqHSd34spzIj95tNl6FBdUbAIkSqq4/TtcjR
	55h/12weoamUBRK99CNH46k0STUharA3SzIHdCZZNZkAbj2kg+uXdIIwSRNdmoqzU4Ch7
X-Received: by 2002:a05:6214:598c:b0:91e:b57e:5426 with SMTP id
 6a1803df08f44-91ef03aa40emr2965136d6.12.1794246354571; Mon, 09 Nov 2026
 09:45:54 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109172134.1850973-1-hj351016@gmail.com> <sashiko-outbox-205322@kernel.org>
In-Reply-To: <sashiko-outbox-205322@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 02:45:42 +0900
X-Gm-Features: AclHuK9wMrzdjwSEcbLak8VBwH26J-EobC3IS0WRZ6HxSVSCpJQlGHcttTOvRV0
Message-ID: <CAGr5VtN-EZH9Hmn7vywihtdCRgtriF2p2rLLWOZWKO2=Mt18Kg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5668: cancel jack detect work on removal to avoid use-after-free
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review, and apologies for the noise.

You're right - this is already fixed by commit 965bad6195d0 ("ASoC:
rt5668: cancel delayed works on component removal"), which I missed as I
prepared this against an older tree. Please disregard this patch.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 2:41, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ASoC: rt5668: unbalanced disable_irq() in
>   rt5668_i2c_shutdown()
> --
>
> commit 7ffec355074a97397bd6323b0aff3802254c40bf
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> ASoC: rt5668: cancel jack detect work on removal to avoid use-after-free
>
> This commit disables the jack IRQ and cancels the jack detection delayed
> works in rt5668_i2c_shutdown(), and hooks that path into a new i2c
> .remove callback.
>
> > diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
> > index 29d70802a046a..c56bbe3fc7bea 100644
> > --- a/sound/soc/codecs/rt5668.c
> > +++ b/sound/soc/codecs/rt5668.c
> > @@ -2584,9 +2584,19 @@ static void rt5668_i2c_shutdown(struct i2c_clien=
t *client)
> >  {
> >       struct rt5668_priv *rt5668 =3D i2c_get_clientdata(client);
> >
> > +     if (client->irq)
> > +             disable_irq(client->irq);
> > +     cancel_delayed_work_sync(&rt5668->jack_detect_work);
> > +     cancel_delayed_work_sync(&rt5668->jd_check_work);
> > +
> >       rt5668_reset(rt5668->regmap);
> >  }
> >
> > +static void rt5668_i2c_remove(struct i2c_client *client)
> > +{
> > +     rt5668_i2c_shutdown(client);
> > +}
>
> [Severity: Medium]
> Does calling disable_irq(client->irq) unconditionally here conflict with
> 965bad6195d0 ("ASoC: rt5668: cancel delayed works on component removal")?
>
> That commit updated the component remove callback rt5668_remove() to trac=
k
> IRQ ownership and state via rt5668->irq_acquired and rt5668->irq_disabled=
,
> cancel both delayed works, and reset the codec:
>
> sound/soc/codecs/rt5668.c:rt5668_remove() {
>         struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(comp=
onent);
>         struct i2c_client *i2c =3D to_i2c_client(component->dev);
>
>         if (rt5668->irq_acquired) {
>                 disable_irq(i2c->irq);
>                 rt5668->irq_disabled =3D true;
>         }
>
>         cancel_delayed_work_sync(&rt5668->jack_detect_work);
>         cancel_delayed_work_sync(&rt5668->jd_check_work);
>
>         rt5668_reset(rt5668->regmap);
> }
>
> During i2c driver unbind, rt5668_i2c_remove() runs before devres
> unregisters the component, so it resets the chip while the sound card is
> still bound and then rt5668_remove() runs and calls disable_irq() and
> rt5668_reset() a second time. In addition, rt5668_i2c_probe() continues i=
f
> devm_request_threaded_irq() fails, leaving client->irq non-zero with
> rt5668->irq_acquired false, so unbind or shutdown disables an IRQ line th=
e
> driver never acquired.
>
> The commit message also says that the component .remove callback only
> resets the chip and neither disables the IRQ nor cancels the delayed work=
,
> which is no longer true after 965bad6195d0 ("ASoC: rt5668: cancel delayed
> works on component removal").
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109172134.18=
50973-1-hj351016@gmail.com?part=3D1
