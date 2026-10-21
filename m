Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565174;
	b=BC4EnkoQ0J8SVZwU6wkmVeROt8mCDHaDvZoWSh6Ak5an5AmTgwtS2Y99O2yR9FheISKY
	 y5hEPcUSr18CMfJXLCI6/2gScehgfHnsVa9jMkR7KemSsp1FXAcQeFGKhWv0E257mngXk
	 w7kfCQRn4f+qhXg8XFx/a0F1GSB5w0NdXExc1ZL4TbbE9D0I/1o1juC+gt0dUXTCl1Q2h
	 DpQ2yhfMHxgcQ3qijzDRiMBcLK4v9tkuc+lXcfu6hyGJl8WIMXgTc+XFx3uMeahZxIt9+
	 4bJ1tqK4g4/lggZXygx7HFGBBgqPNOofr+uEv8pLyXKEhr7ASJsiLaGn4XmTPi2O6wA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
	b=gGiGM5nEtLUwE+mzw0Nrb0AZh0hSl0jBDbX+1PDA9PI4p8Hd/znR77/hdDFvcwqCTMOt
	 RLrJexyPHSArSOHaI6Qn6MYjfzJ1vYwVdfu3Hwop0VELUAiOm7omt330jyHVgFu0DCAta
	 WMWtAewLibJP8cRKRcLunjEd6z/b072h/XNvfCjH9PtEvumKoB0aPAhc0LkTLXzN2kqFP
	 4i0X6j0n8r43KeTj4JTIARU5T9P1AxPJm7KwzDqJVSYHmhJsK8rGzBypFB+lksdXnlhNZ
	 O5ctPeZJ3Lvn8R92fOTDWzXVd8KKTlDqNsCOU6tBlZ+l8HhBjFRcPh4Sxt/OOKdre/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hcD5S+mc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9D2606A319
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 06:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE9D2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hcD5S+mc
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ba702cceaso5074486d6.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 23:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565173; cv=none;
        d=google.com; s=arc-20260327;
        b=JtBOo+MVZl2hldzAT3dUX+56sMEKe8lFEtItfJuGCVai5axcUeBqH7qOPR9Lq9P2Wi
         Dh6a+c2Bx27KJq/n6rubDtoq+4732mKvQ3hMJ9pVjBXLdyhzECrBrhJ5I5VTvqEW6hkd
         g/WnivpCsMktMcKf/c7/oUOw+7aDUvucqKpzBMyuGFEOgvwchq4HLTorls/He/NrDZCG
         +ch0o2MS1mCw5Hv6ggQOdyRaxrdOzTOOr524cshEyTeRpeQqMIJdSkk9aTwmXKgcDt4p
         xnzdjF2oLBL3pF8jjeW167dsgW70UTCz/q5AlHAE4AGBf5i84/SzFrIwLLTzg8HowO8h
         x1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        fh=/AdlCMJF6qUuLsczI7ru1wBLS4H93RtTxxx96z7H2I4=;
        b=p1+wOjPvPBvh+J1g1fBrl8QiOwflj9iGf8SHnuGo+JMRbKpfaMqmu3DIQ9Ta5oPXgC
         Cli6xmLyrL2iN2dPeOyfsmZ6MJeaMrR6ktBJz+el9hS8rCYkDOLteubnkhi2nUuZ9n4Y
         HxLvlWJpWxPq/9yJ41Emt65/x8Q6+vCGtFSpn2LjZPub+vGY7oFzmV1m+z5AA3lNnsnQ
         76PlAc/p0btcGLo2YVHMX1Ms5A2WvZW/F+HGQkEnECX7xqimGiAk5g5AG3HxbbCb8TzO
         6JSes2Ipj5nebpWUdWvcXZfoCQhVDu7zpWrbbMBAKqzbqtusud2KYthPVOWpo0eR4qWw
         FWow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565173; x=1793169973; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        b=hcD5S+mcjzIaNpHygz2s62Q8CPfsqyja/9KAs1KGzjDyvTUXb4RapIC3utxKuB4YR2
         +9KCuL9U3BjnKZ82ZyCB6eY5QorW250D6lraRWuoQMMSK0j4arGqGUrQI4OFST77zkyM
         QVnbTP1tyh/E+IgUiDYt+tnGIhJytpAe9KqZwlkpByC1YAPA9QBVWiwTntGhbA3v1aag
         51RYakGMKJPoLbzPkwffHrRbmPtqjOq4BiIK20+FDLUUJOeW6mx8d/0xjZBn3WkOiX2X
         rvSaggL0jQ2fr/9dOO77SQItTSX5OHBqu4ETl+570S97B71HjNrYFes5cUIv0bJ9GPNt
         3FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565173; x=1793169973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        b=ugFUYP7N1BLkZijfC1D9wKjpKhgq07hBerEE1V72hTwaOKn/wZeh8L8UtEufRKikTQ
         s1VwQsg/Bm85aC9Q+aOVXIqmAJKjJ7PfdmE6SkhteO5ooWb5KkFIxKXbYu15PXQDFoH4
         OoJXtXEhlvk5iaowdYtQiuxexCtqHLItf3n7wX2C4fMcSah1zi6D/gx16QYNSgtfDD+i
         Ee2ay45qS8cRNU5HgrWZMDieRwU1Z5kZ5J8xoik16WErRtmJtJUyZVJaMvU/TBj8+WV6
         wNmWvSeysyTlTJlgpDoiscYGTTNpZyQm6ZTzCUqGQcPwwUyb0uFKWxtQQsTbU38Ha/Kf
         ky4Q==
X-Gm-Message-State: AFq9FYLFLHwM/9guacVnJT5GqPv/aowgCM3g2/mQwYg+Y+vRrVn3kLGr
	7caIaLHyt8CcQPF9ZKBeBpgZy4LBs7rJK4+ITzrPqszKT8dtiG7dH+imJnHotKMduQ0q0J/FnLW
	wDOwBufzajW9JnlhAuLRqHET3WImFJ6YjcsYA
X-Gm-Gg: AYBFou1KRfvGxAWputczdj2SAQ522OMlwlNaiA3sFAA+Dx4bi+lxVD3mVKQFfPznJs2
	rTiE42m4FLN0bENgghy7cOkZ39c3nq8kRgYx9F0dGEVLk2u2gJSk1M/IJRGeuYrefLamqjxcvPN
	YzgtokAM8J7eab5zoIhEQpNVn/SU30o0SLdoLYzLBwfh//FxWAZvPnNGMPWvDEVRhuNx53xUdsw
	GV3sWbImID0AzSkTA0/3yPKY5VBCVwD+ZIKib75PnohgrJDSHY4V5hB5QjoPvduH3+tcaIBJ/RC
	QM5SkmxMRIWMnScUumTWAVD6Hn3er9S54C/XbK5Jp0M9DGEzEjhrtN8C/yV1HP1PSFRGUWnQgo4
	7Xbcfkcj1Bm46xaAZ98OeAhqALgAzBs5oZjyfGXwpVRuc7bqyPnMk322qk58=
X-Received: by 2002:a05:6214:487:b0:91b:cafe:58e2 with SMTP id
 6a1803df08f44-91c12eb7b30mr18765456d6.14.1792565172936; Tue, 20 Oct 2026
 23:46:12 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-6-a0282524688@gmail.com> <sashiko-outbox-169117@kernel.org>
In-Reply-To: <sashiko-outbox-169117@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:46:01 +0800
X-Gm-Features: AclHuK_sk3N3reGEV1vFqkhXmWhSRT0CO9e7SvF9FhuKig6lX9RUqvijqALmuJY
Message-ID: <CAOoeyxWNsBt6nDn82bCv0DUpar3c_K19su87UEbjm4CfCJbbHA@mail.gmail.com>
Subject: Re: [PATCH v9 05/12] mfd: nct6694: Move module type macros to shared header
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, mfd@lists.linux.dev, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Vincent Mailhol <mailhol@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] mfd: driver-specific header modified in global include/linux/mfd/
> --
...
> > --- a/include/linux/mfd/nct6694.h
> > +++ b/include/linux/mfd/nct6694.h
> > @@ -8,6 +8,15 @@
> >  #ifndef __MFD_NCT6694_H
> >  #define __MFD_NCT6694_H
> >
> > +#define NCT6694_HWMON_MOD    0x00
> > +#define NCT6694_PWM_MOD              0x01
> > +#define NCT6694_I2C_MOD              0x03
> > +#define NCT6694_CANFD_MOD    0x05
> > +#define NCT6694_WDT_MOD              0x07
> > +#define NCT6694_RTC_MOD              0x08
> > +#define NCT6694_RPT_MOD              0xFF
> > +#define NCT6694_GPIO_MOD     NCT6694_RPT_MOD
> > +
>
> [Severity: Low]
> Are these driver-specific module type macros only used by the parent and =
its
> immediate children?
>
> According to MFD subsystem guidelines, driver-specific header files shoul=
d not
> be placed in the global include/linux/mfd/ directory if they are only use=
d
> by the parent and its immediate children. They should be kept local to
> drivers/mfd/ instead.
>
> Does this addition of driver-specific macros to the global header violate
> the subsystem architecture guidelines?
>

The sub-device drivers under gpio, i2c, can, hwmon, rtc, watchdog and
pwm also use these definitions, so the header needs to stay in
include/linux/mfd/.
