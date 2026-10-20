Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792500740;
	b=nZ0AOTpOk0vSTYvW9Ssfo/9fQqROtm3uBwHdCGWuRGfr3iCFaxyvAgP9tlb6q30PvI9P
	 f8BPjrc+0BgTFHmjkJvOzdCgId3sNc+CN0mbLG7hH09bokgqDjHBkRfs/4ncEsoe/sDXV
	 vFs8faLPofm82ppM7c98C69Pa1zBDrYibL6JKCpCEO1jXx/nsANeN4f6ruYxf2fAvXhaE
	 9uHRpodJQdoeAm/o9T8SOrdfsrKCTKxM6hkyYZhwcWJRFmcfgx4fH+Ax2iqO5PN0+Jf5y
	 /cIeyUh+7NmVY153aBGhVXx+Zu5jmqXmcpYB5x76V4Ansv80YnHinoQ3MHJlRypGMpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=lXiyP0wNZ1kIP9wjFOW8bw/0sqZpYt/VLLdVFIN+DMM=;
	b=ddWOSanV5/MyoMKasUk0S6C2tnlpkndke+ZmoVWaOXa44iShRZSuQLBCaAS1TtdqhtN0
	 9mGXmB1X1jfqrgIk/zucaKVx4z1RaJbpEyIPFgBRHJDN7xg0RudcXgNA0GEL6kTlA4HFi
	 bcOZwnHdRS1Doe+ysrwoW2VcCLuurHuJHTWtmf3427MSsB2FUGiz4COMMwE468Bnl+YJ8
	 euWFMJdHqv8Pd165YgxFdkGNWd3PsAVMxqrt+bB+IEH+hSbxAEsKYvbiWXliM17avUxAt
	 MgqrHxjQsJmOUHu0fJJrX2moTZN7DBYyo+fknP7vsR2eieb1Lzia2rZF9n9T9dCPrOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h36WhpKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4455F606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 12:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4455F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h36WhpKs
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ac9d666d4eso24698837b3.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 05:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792500739; cv=none;
        d=google.com; s=arc-20260327;
        b=cecwTdm0j09ZrgCj/wIAK1UlcVvgjYE9VDSatBSnxJWfP5qcW17ozXcjjDH/gFmJGH
         vjDRbjsiLxMen7NfWwidoFvLrVA4/LnS9Xt9iqM0+othVk8/FbmgTxWWI4XYtjO5oKK9
         vGBQUpteA34r6CAZNdSjKD8VY0stdeyWo6k9u6ZJNix6stjQeWqNiHrZYSgb35zxglzU
         bVBQWu+azNMniozIjohTslKD99ult4HkckBwZDUQIXOe3dRDYPXlGpe+UIvbrVBFj9tF
         cQ7eBRZQTMcm1No87ow8J6JUn74n71wC0O4cfvvl0Xvxr42S7Cfbbr1Ht2Dr6IbbCnxo
         Ur4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lXiyP0wNZ1kIP9wjFOW8bw/0sqZpYt/VLLdVFIN+DMM=;
        fh=8s/m3WFbgYWSrFq8O6qnuwJh8MouRhxqinKYkPkfiw0=;
        b=rK/osl7+BRiGYwngQXIFnDBN7pHVsHlf1bYMeNqpfBh81Tm2YUymEz55olMljXJNM1
         I41SwXPoUuwhaZiVp++oNkEnLPNkr9D5boiUubNSIchN3os2+zwxFc5hczdJzFvtz69S
         8jXyQ0SFE/lUO9gWP2iErRtD/VvzBD6UkdbXicUNjkY46Fvo+UA5MWZD0q5uXM4Y7t4d
         XT3snsXMo6wjOEik4Zr8Iin+d8JDwWHm/cnY+dQi3C9d43oANpeUYDk2mDLRwExSp36X
         h25jdmOEE4AJs4HtKBuVN7kufEut2ti1pPhONJBR3gTIG82ZrNvJbmqguj+5L98Kb0cU
         JcOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500739; x=1793105539; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXiyP0wNZ1kIP9wjFOW8bw/0sqZpYt/VLLdVFIN+DMM=;
        b=h36WhpKs3gTXDMMa0CfCA4h4fZgR6bHf7blVh+SgEFDFWiUlzSzPHyHf3ge1sKNBd9
         fTFGgQF80Z/BhDeZWATfK2UjyWRojd/yMlSEXCSQjAc3PDa3nlDoOVM0Jgv1vMRHKjmT
         ZGVtmmg7t85sccEgM/W2Gb4+WAXH0hooYl4mZvd6JflIu5mGYOoLUIiXTsP11c8Fl1uQ
         eJaSqeKKlec5nFJfXZXsrMLogmmXnjnRStJD1hCc9b6FbdjaOjFF4pNomUmXhFGUItqH
         Tt0sDQ0eY/PiyZSbawreJfdc8JeJtHsX299Q94x7+mXnz1so0v+Of8rfDRLqPcDeAuaR
         2XEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500739; x=1793105539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXiyP0wNZ1kIP9wjFOW8bw/0sqZpYt/VLLdVFIN+DMM=;
        b=J7cteev01chcHk+G2LdbVVn7v8Z3ojcrwYeLtzoX1iuq2xI2kZf30BWLT9TIzu2m6o
         rGWo4c+fXb6sfMqhunX78Y5EJcijf8PE7w7jwdYdc1rBEr/kLHoEgPSk2WgNy0KpeIjx
         O7Pbd6Vi4TrhVAshdNLhlJWry/9Bffr3kEp/hVEhckcpF5lH8nAlKAhH8mm1xqVXqJsp
         MXKiC4A9H4WjcrN1LpZbmVkh1joJ9wgEeadzxsuujKctpMArZswKNOHv6Wt5YUNeJ3c5
         7vbtBGbXCAT/8m+FvGYxJV3PGDszhNoHu1gQLkm6ZhNlMrU3wYkrYC6+Po1qNtQFy7KZ
         iDbg==
X-Gm-Message-State: AFq9FYIE/HcEly5wCRU6Mg2D33ccTYYZBjE0Dsogw4gOyouOnXHQgjX/
	74BhyeWt5ht6io51/wjqHSdaByhUfnuZ+zl9hLylj4yJFkG7DfQ2vYofekmlQdmo18QJxRw1qzr
	b3Hot9pQwc40T5DlhaepQ9k0cSc8eNJXZMmaV
X-Gm-Gg: AYBFou17IBOq+PIWHE30I3nHj3e0YxkKG8CvC+8kkevaurD5zU3KECvHI5O+q9bXZqc
	A0m+zNWf+5pBWhH+c6fCRWPEwAHMiFXJYyXhcCSUqmwuXTTDi9al32AlciEt+cJSZtFVwkVX5Wq
	nJKhrkhKAbfsTn4G1BxfId3DoGp9K+Abysk+UK09KWXTImw2G4lzngx9o9dT5UoMuwEz4fDgLQb
	bjc+3wgtLjaP4+kAEJcj2HZ2E3lXK8t153EybXitx1fh04ZsQW3JyITyFQBL0K4IKR2UpOgnumA
	OBI3p48lqB9E14CCBCcSjYRxLuqu4q/fKMrACLW5v1cn1Zyw9b5GITRrJUra0LHu2ZI=
X-Received: by 2002:a05:690c:1c:b0:8b0:57b8:744 with SMTP id
 00721157ae682-8b0f218930cmr29898317b3.45.1792500738255; Tue, 20 Oct 2026
 05:52:18 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
 <sashiko-outbox-172228@kernel.org> <CAMFFDGgxiTMd01iU5JJebvTLBF9ku1F9Zq16LV+gYyqn+tBVmQ@mail.gmail.com>
In-Reply-To: <CAMFFDGgxiTMd01iU5JJebvTLBF9ku1F9Zq16LV+gYyqn+tBVmQ@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 20 Oct 2026 18:22:05 +0530
X-Gm-Features: AclHuK8XpbJAsfnLQaGbpyrlz8Y4TfMIQrF5MX7-1IbapaZu4M2nvVTS-zVaLtw
Message-ID: <CAMFFDGgpCM9+pAdL-HW2LFEkZVkdP+bz5xTq8uHAPhkzx3TPeg@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Further B650D4U testing shows that ordinary GPIO power control fails
with SCU4BC=3D0, SCU510=3D0 and SCU51C=3D0x1e80. With the candidate, SCU51C
is 0x1c80 and power-on succeeds. The captured power-control executable
and configuration hashes match between runs.

A separate candidate test also succeeded after complete AC removal and
CMOS-battery removal/reinsertion.

I understand that unconditionally clearing SCU51C[9] can disrupt the
other GPIOP passthrough pairs, so the current callback is not a
complete generic solution.

I am investigating whether shared-enable routing can first be
represented through the corresponding per-pin SCU4BC controls, then
the shared enable cleared, allowing the normal GPIO request path to
select GPIO on the requested pins while preserving the other pairs.

Does the hardware support this transfer without interrupting existing
passthrough signals, including when PWM has higher priority? If so,
would normalization during pinctrl initialization or coordinated
handling in the request path be the appropriate model?

This is a proposed direction, not a validated transition sequence.
Feedback on its hardware and ownership assumptions would help before
preparing a revision.

Regards,
Prasanth

On Thu, Oct 15, 2026 at 9:39=E2=80=AFAM Prasanth <prasanth.padarthi10@gmail=
.com> wrote:
>
> Thanks for the review. The shared SCU51C[9] control and SCU510[28]
> rejection are known limitations called out in this RFC. I agree that
> the post-mux error paths also require attention.
>
> The hardware result establishes that clearing SCU51C[9] permits
> ordinary GPIO power control on B650D4U; it does not establish that
> this callback implementation is suitable across AST2600 platforms. I
> will investigate coordinated handling of the shared strap and per-pair
> mux state before proposing a revision.
>
> On Thu, Oct 15, 2026 at 9:31=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> > - [High] pinctrl: aspeed: clobbering shared SCU51C[9] strap bit breaks =
pass-through
> > - [High] pinctrl: aspeed: unconditionally rejecting GPIO requests based=
 on SCU510[28]
> > - [Medium] pinctrl: aspeed: missing hardware mux rollback on error path
> > --
> >
> > commit fc751bac2dfdee809f65ba4da118ede6fdbe6aaf
> > Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> >
> > pinctrl: aspeed: Handle GPIOZ6 pass-through strap on GPIO requests
> >
> > This commit introduces an AST2600-specific GPIO request callback to han=
dle
> > the GPIOZ6 pass-through strap in SCU51C[9] for GPIOP0-P5. It clears thi=
s
> > shared strap bit to allow host power control on boards like the B650D4U=
,
> > while also explicitly rejecting requests when SCU510[28] is set.
> >
> > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pin=
ctrl/aspeed/pinctrl-aspeed-g6.c
> > > index 85d6640ff4c4e..6e58feb48bf59 100644
> > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> >
> > [ ... ]
> >
> > > @@ -2743,12 +2744,56 @@ static struct aspeed_pinctrl_data aspeed_g6_p=
inctrl_data =3D {
> > > +static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev=
,
> > > +                                      struct pinctrl_gpio_range *ran=
ge,
> > > +                                      unsigned int offset)
> > > +{
> > > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(p=
ctldev);
> > > +     struct regmap *scu =3D pdata->pinmux.maps[ASPEED_IP_SCU];
> > > +     unsigned int strap2, strap3;
> > > +     int ret;
> > > +
> > > +     if (offset < AB22 || offset > AB23)
> > > +             return aspeed_gpio_request_enable(pctldev, range, offse=
t);
> > > +
> > > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > > +     if (ret)
> > > +             return ret;
> > > +     if (strap2 & BIT(28))
> > > +             return -EOPNOTSUPP;
> >
> > [Severity: High]
> > Does this unconditionally reject standard GPIO requests based on an unh=
andled
> > strap condition?
> >
> > Systems where the SCU510[28] strap is set will no longer be able to req=
uest
> > GPIOP0-P5 as standard GPIOs. Any standard GPIO consumer on such hardwar=
e will
> > fail, breaking backwards compatibility.
> >
> > > +
> > > +     ret =3D aspeed_gpio_request_enable(pctldev, range, offset);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     /* In dedicated-strap mode, SCU51C[9] does not enable pass-thro=
ugh. */
> > > +     if (strap2 & BIT(30))
> > > +             return 0;
> > > +
> > > +     ret =3D regmap_update_bits(scu, SCU51C, BIT(9), 0);
> >
> > [Severity: High]
> > Does this clear a shared hardware enable bit for all three pairs withou=
t
> > refcounting?
> >
> > The SCU51C[9] bit globally controls the pass-through feature for three
> > distinct pin pairs (GPIOP0/P1, GPIOP2/P3, and GPIOP4/P5). Modifying it
> > unconditionally for a single pin request might destructively clobber
> > concurrent pass-through usage for the other unconnected pins.
> >
> > > +     if (ret)
> > > +             return ret;
> >
> > [Severity: Medium]
> > If regmap_update_bits() fails here, does this return an error without
> > unwinding the active pinmux modification made earlier by
> > aspeed_gpio_request_enable()?
> >
> > This could leave the pin's hardware multiplexer configured for GPIO, wh=
ile
> > the pinctrl subsystem considers the request failed and the pin unreserv=
ed,
> > creating a state mismatch between hardware and software.
> >
> > > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > > +     if (ret)
> > > +             return ret;
> >
> > [Severity: Medium]
> > Similarly, if this regmap_read() fails, does this also leak the hardwar=
e mux
> > state?
> >
> > > +     if (strap3 & BIT(9))
> > > +             return -EPERM;
> >
> > [Severity: Medium]
> > Could this error path also miss unwinding the hardware mux state from
> > aspeed_gpio_request_enable()?
> >
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static const struct pinmux_ops aspeed_g6_pinmux_ops =3D {
> > >       .get_functions_count =3D aspeed_pinmux_get_fn_count,
> > >       .get_function_name =3D aspeed_pinmux_get_fn_name,
> > >       .get_function_groups =3D aspeed_pinmux_get_fn_groups,
> > >       .set_mux =3D aspeed_pinmux_set_mux,
> > > -     .gpio_request_enable =3D aspeed_gpio_request_enable,
> > > +     .gpio_request_enable =3D aspeed_g6_gpio_request_enable,
> >
> > [Severity: High]
> > Since this structure lacks a .gpio_disable_free callback, is there any
> > mechanism to ensure the shared strap modification is reversed upon rele=
ase?
> >
> > Without it, the SCU51C[9] bit is never restored when the GPIO is freed,
> > which could cause a permanent system-wide functional loss for pass-thro=
ugh
> > features until a reboot.
> >
> > >       .strict =3D true,
> > >  };
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015035118.=
9495-1-prasanth.padarthi10@gmail.com?part=3D1
