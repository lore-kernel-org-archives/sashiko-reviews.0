Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F71477282
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327198; cv=pass; b=DrV+7eZ3cIhQ7vmHL7/pXXzvKk83kBfMq9D/tLfNENusYbLdzUrv2aRdfyE0bBcJMX7yyJTbbgKZVPYsTIFQCaPPhskNubbcJuCOH10pFJhbcVvNMx7DcJpyAGz0BIRw82YkKc3N2o06tAWgouQt3/weokeqPvhhPKp2udOYVkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327198; c=relaxed/simple;
	bh=vNfrt1r00h69iVK9kwlxNnrlpJK7TpbbLBmXJ3dGSlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4y1FoPclkZF0zKxX/D/IRfdmtYXwxgkAjUDv+goh4kgDiYei8Kx8BLcCLVrF9C7oAwbN91HYPkht6QC+SihS98pcGxa6ihTTce8tXvlEpkLdjIlB6LZdO7ge7FgswbW075TEyZhZ4CvFk6I6FxTPQ9N4GHieMQryhueL/eM5qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBLkrxof; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBLkrxof"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so358975f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 02:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790327194; cv=none;
        d=google.com; s=arc-20260327;
        b=fALJeZxN+HQHesG39ApjJz2r5FQNT/IKSDEvL9hhTPMM5Ff+2Dpb4eH5vuiEhU1+BJ
         nv7DlHFrnywVEjSbwied8l0e9N5RYf0zL2/LigZE8nwqyS6RIt18lqVxY4zHaf5cPstv
         EfE1bGOopHIfU7GF0Hc9E2bGEo9N59gQGbgWp+0fdD2iB3HG6ExKpjLfskgvFHPrxsIK
         n95PHgioRkTiMy/hXWgNJVTuaXad1Une1BxvKB8vbgjIccE7fbLZlIKvAtxPOrn9Gg/9
         zEl/goHFNfYdiBnZM4/22Bbz6lfju41FXSYAkb0ECSz1qfJbUMpO5WcCOh/yVq4vwFB+
         uXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vNfrt1r00h69iVK9kwlxNnrlpJK7TpbbLBmXJ3dGSlU=;
        fh=HcxpcNBqUcd8PMFMkD4TlXv5pQsf7S4vnxiJolkANeU=;
        b=eBAiE+zkLnXDjV6/4ZKttuhvlssJT7cFAc2xYEG832ZgorMdHR1q5j9Te8zZH2Zdyu
         CU5Z3aYTl7P5MI1KWrIj8R1hGpFm+EM8uKzXgWbWOcHS+FitiJ8GvzER2WXSV4ix0owq
         w/2KlmIsGk70N39GCbBn3xykEjVsRTEb1V0rfJbE5Zn+aXtOnjgR/7vgu7a8basLdttQ
         tm2TcfMkmb6gttZqLLsu+kd8Qw40G/wOXAM6VEkS6YGccVxpN91LFKwFncNTYOofpHnh
         wOLi3wBPJPscvFSepxGIfGIw/SmF7QPJVONx26+CBCWxgn8Z8pylksZ54SGfQcPgmtH+
         oROw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790327194; x=1790931994; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vNfrt1r00h69iVK9kwlxNnrlpJK7TpbbLBmXJ3dGSlU=;
        b=KBLkrxofswxZKzkugjtEJoWn7qHLNRNLbOLHqbPCsJ0ZtkH6JoTzBiuV0Ya6Y9gPUs
         YO/CKVJMizr5aRDQJJFqEKQDeOsQwfuiVjD3IO1jWVeaEoVblI22mnP5XBjNWMSuKtDq
         MUQYGyQ1eV5RmpcOT00plmT84Uos7TD5+I2ONENzJpYo/ETIVhqDd4+P59juK0C9ztMI
         l4yWNaax1PJUSop5QwuS0yqNvg+Mlye8Gx5uxvZf4Z/lwQ1aw2B5YGSiZCJPOHSZDv14
         Yyux9h3HtVzeMesQ9D76B8CzjlzLl7vh3aZRqCfmOzuOOhS3L8CT7GJa0/W1ODxzOQdg
         w5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327194; x=1790931994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNfrt1r00h69iVK9kwlxNnrlpJK7TpbbLBmXJ3dGSlU=;
        b=sZUooqUoQ2t2Tf4qPySWd2Q9vCiz4q4nEAW9+za1yDiiRvFVNaDAXCKQhx6H/BpjRp
         b4Xfu1Jg+JBbEmc18VZF0C2pPZrUMFEbhG4zYqKlwFRjUWKkWupAYYNyOKhC7evS3kiL
         hfHViDKvrEWa4LeLbKqqo20rR/K6+xvyNVQ9F2Jf3+u7f083HXt9M5xM2AqXQ56ZJJBP
         sfsWt85dhyWsUt2KiJla8lUm0tP9iz9Sl55MwJB7a4WrJdUHwa0vzLOthaKgeFmzXQDN
         35acCiTAAlYBzYmlTPAhLVscOjbt/bpMC91SuGTq5+6ptmTstVPACkl+Yvdp/ZK/03oo
         lI/w==
X-Forwarded-Encrypted: i=1; AKwUvBxHqXbvGiJjSaMZyY88VY3Vgawj3iLkTe5DIL91+J2zb9Jt8aeXoomv7mdei0TNE649af/garaBCWj1GJ7hvlM=@lists.linux.dev
X-Gm-Message-State: AFuF++lew116W//kHMZr9+JoF/uYJGYmswBlsFyX6QMH+8Z3Dyk5BRz8
	WoIlhm1D84L5QfsnOtDaLW3ARTbWkSXGw+LxEHpwGFb2P/GSd82Ule5FyBNH1CCX4tPLuQgqJJU
	UXNA8N0swZmCFhUcL5oXAU0Dmbxf8dlA=
X-Gm-Gg: AYBFou1JAmgBzbWspD+Dyo9HrLxf6Dyrpopa/mKjvTudkQHYoytHZnA9kMjxT3gp4GY
	pHAgMUb+XXdDF/d9P8axjsKXGHxGg3QgCzhRYn7R3Pt7h7XWl4sDTengjsgfI2qJFYI16klK5md
	QG6hPZMZwxE/ukh0ht95i55meorYMTgxd+tLKDTq/sL3dExaFsWvEa5z0s8wXA7nXxgcq8XEm4o
	Lo70L1i3+VbWnLloYVPHhMSiSyidEzWFoGq38XeikXmfB8utCigb8qKG9XNg1p8RZfn9/J0opVR
	LyIZzQDylBB/SevCDRtRLHoKb7PMx2L7o5oobgOKKUgwci0zBy5/gXGUB6RgKW5xIp3CIH/8zQe
	GwUuTC8U7YGYJ/ugNDTR0eNUCOaExk8s7JTapQ807Wq4AKwTOsooQl9bJSDLQOY8GtbY/3ZjM
X-Received: by 2002:a05:6000:40e1:b0:487:62d:37d9 with SMTP id
 ffacd0b85a97d-488716a5e3amr8597568f8f.27.1790327194104; Fri, 25 Sep 2026
 02:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923105237.7B87D1F00893@smtp.kernel.org> <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
 <4f5aadf0-8f23-4871-918f-430a0c99900d@roeck-us.net> <TY3PR01MB11346CC8B3C7374C293E0F3EB86802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2d32d7f1-f87b-45b3-9ccd-95e9773ca658@roeck-us.net> <TY3PR01MB113461EFFC2B9B39A53ED1D3386802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113461EFFC2B9B39A53ED1D3386802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Sep 2026 10:06:07 +0100
X-Gm-Features: AclHuK_cnyrPiFUC-mGji0jHGuw7oeqC1g44QAFCgRUUpyFQSgbBoQ_H6jT1WEc
Message-ID: <CA+V-a8t3HKQ6D8jb_y-XM64BHkWm3vRw6JiTydSp3rqVr9nhdg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, "robh@kernel.org" <robh@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Sep 25, 2026 at 6:11=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Guenter,
>
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > Sent: 25 September 2026 05:51
> > Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDT=
DCR
> >
> > On Fri, Sep 25, 2026 at 04:13:24AM +0000, Biju Das wrote:
> > > Hi Geunter/Prabhakar,
> > >
> > ...
> > > Just a question,
> > > For automatic software upgrade, if the reboot using PSCI fails, what
> > > is the fallback for reboot, reset the board?
> >
> > That seems to be a bit theoretic. The reason for having the ability to =
register multiple restart handlers
> > is not to have failure fallbacks, but to have fallbacks if preferred re=
start handlers are not available.
> > If the PSCI restart handler is present, it is expected to work.
> > That is why it has higher priority. The idea is to use the highest prio=
rity restart handler, not to try
> > one after another.
> >
> > Sure, the failure fallback works as well, but that doesn't mean that fa=
llbacks should be provided just to
> > provide fallbacks.
> >
> > If you claim that the PSCI restart handler does not work on this system=
, provide evicence, and we can
> > discuss this further.
>
> I agree normal cases there won't be any failures
>
> I never heard about PSCI restart fails. But have seen a case due to a bug=
 in
> serial driver that made the PSCI restart to fail as it hangs the systems.
>
> So, if this is the case, a memory corruption can cause the same.
>
> Long back I worked on femto based product(single core), where we have nor=
mal restart
> and a fallback watchdog restart. But it does not have PSCI system handler=
s.
> On some cases, we have seen automatic upgrade failed because of failure i=
n
> normal restart.
>
If you think the PSCI might fail and not restart the machine the other
alternative would be to export functions to configure WDTDCR using
readl/writel.

Geert/Guenter - are you OK with the above approach.

Cheers,
Prabhakar
