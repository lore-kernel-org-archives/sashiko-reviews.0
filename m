Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3424772A1
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328089; cv=pass; b=Q6V7CnZMTC1r9TMrmf2rctDyO792f33OB/edZYvjeVzvdxfzmto/BYp9GgM+0OmpHHPSuPf87e8RFf3ZPal1ggTzl+JyuHUHhJuzvCV9kCxdrd4uyEV4bUV0JlaA6at807Q+c8P+gi3wHASCu5LH9MQtmoiiAH6QcGbWSpVMe4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328089; c=relaxed/simple;
	bh=NCueJ4dcU3NpqgGF7u84YtQGIxF+FQ97Y+VznPDBXYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9qeRdAGy2a/3H2liTcg4hOwuIzU5G9wTiH1muoK4WdX/rvy3fIJ5J6I2/A5uyTbq7GNlONpC/8kZ57wPp3fgjxHwOj/sEcMIPt+E+zdfqXC3cKfW+C4zCEFH6Kth4atjVI1aCb1HJXzaQwS2rPmdKZtfn6JD8qrlCYsVlnzITg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwsM3KXT; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwsM3KXT"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso364193f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 02:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790328083; cv=none;
        d=google.com; s=arc-20260327;
        b=fS2SAbuKRoHEG8yA2iMU/cyZr7+ePx6BD8HSb22AJWUsUU8l3mOoD9uzuqe98PIvEO
         5Pf4prYcBH5GgE2LWUwSqVWhfFoQh9k5GrzjlGCAMShfMODZgaeaFEEnyyIHATFMViqO
         k8WAhmT+LNcFkarX5Ev/Atq7PIj39D7mpJX9YQ6U4/onsVKs+yjgvKTzrCjPTp3S4nEw
         Sza/i4iYu3vEmq6vXZavIXmX5gl1MQ0xeIA0UNUF/2vCJRyLmrCaxhwRtFcioKQKIoiO
         5RqYiacwU5WFQEoh1PmBEuZLnXVyvVkIo4jLnoCywsNJuUGDTXGmeyuuCAgzo1v+ZiDh
         vYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZlooN9kx6gRrXmg2e0W2xusZ6bAGGvgElZ4hCzz0Zhs=;
        fh=CUjzafYHViQLrqJW4+DqWvVRVltnVbAIrIBRnHlCmmI=;
        b=ZGybadpEz59NAWn6hdVSNtSiDLtcndYt0V6IH0DiHVr4nAzNAIDWoJJ6ALcJtCvA3A
         9+TBP/HJTRuA735C4QmRerIK35QMaGlmg3CSpLy5refdyXYBf/5gXvpn/c12fVy+9fe3
         yrv9TH7RySqZg4YY1F30GZ/N7EtXXUN6RqOC6knnEnro9JEzwsmawymXteKJcX8lLlUz
         iKA11ywOHQYQfKh9HcQ7V+KRanW8eODWeaUie2QY8hqCyV2DhNy5SCpUciyOxzFj3XzK
         FdGn1uOKEvo5EL43iD4lmJokxtiqHWRKsxOKcf+GicFIEU6F+oTEI3OQW1w2+kMRCey4
         r8zA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790328083; x=1790932883; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZlooN9kx6gRrXmg2e0W2xusZ6bAGGvgElZ4hCzz0Zhs=;
        b=WwsM3KXTG8zvlvu9IBZBOMaqAPaJdLKeAz7MZArNpZ9ogje3k3485jySyuCJzeN1TM
         lq5ExeAuCvukgNdGyLfXO1SfRADzEyHF+NNB3jE26PX+KJiOYvxFFsdbuZctS7v9YlHQ
         P/xAz3uce32mQUArzTcxuLz3dmeNPCVxGTJqndVKhzOwdM+Yr85s/13KuycdgUn1OSUN
         0qCxjM0kWiHYNsgAyZWOxh/nc//hqx5en6k6oYJY17wj2Po9+2K4PdBSWVV+GUwo83k7
         mr0xBFZ+x5xtIGXaWyZEROHh0DL2eO7GG/6x7ZoCCJubyh1EHFjeBv9v98owctxSbIeP
         X/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328083; x=1790932883;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlooN9kx6gRrXmg2e0W2xusZ6bAGGvgElZ4hCzz0Zhs=;
        b=uqlgZ1pnRW+67qMiCDRHYKJICuP3rUaZNiDlNnMKkX5wz9ayjtOzKD0YKrES7z3KiF
         EHN3vwKJpS/yO/7mFwODjdKj7kd+fCxjnmYVNrxAkHVMF9DrPrrgzAJaMsYKHpMuCaQk
         xfutkfPB+Zi1e+yg39ooQj3+dyNLe/tztmyiIFpSqnDeNcwBzUHHYeHJSMiuDHgILDoB
         t1+iqXUp5/l6/UAQXpxUWt3iuSq6kqJHRMkwSJwukmkt16CFDpF3fqj2UVlA24V4yOMu
         54KHRI3YJ4bh2bKLBaY7Rv5rqeipP4u7zQ8LYS2n2GaT2gv7JRCssgVfjPf4RHa3iauO
         Unwg==
X-Forwarded-Encrypted: i=1; AKwUvBwgTSenmItb4SPFLGyIjxdILdAnIlA/jS5b1u+ltX6QmRUe9XjdZ+kOLXlCh3L1xbIU5+BPqtfvbZl+9M6HH4Q=@lists.linux.dev
X-Gm-Message-State: AFuF++miJGFR084bmAcz832R8hz/tCiiIyxEq1VeKVFUl/PGtIrGnDRb
	GvYLkvCpu3zdQ1yqyZc5HYk896vVPMkLgaU3gk1L0d4WNfWwvPnPSe7PUfLikGWtbMAsPl6cGHt
	y9Kd21hOityd0qkmOe43lFy09RMOZRg4=
X-Gm-Gg: AYBFou0z4RJ4Zu/cWbS6DsikGPsPK4Y0WN46vxmWLWA3L79hPpGZ1JWbU0JuNnIeGp/
	d0+/v2aABY0U7d9dNGbcScJqLQXNysbTahkShhujwL0pxCkpqZ5/HGTkPZPNtiQx3Zw87+nD/gt
	pU435vzy0eADLQLqxLnUuE9HVhQ/I9OdiHDGi0m1sM/XCkKl59aqsSoDEJT59UmcXXQ9LKk6VcW
	/OtnrfUWbf0UXQp3xxPdMXlyObiXs41chKcM3Q9VkC/9jzWd+uivdVUlPtunuoITks9WZU/6LIx
	83I56SG5ZrfsKM+xEAliypJsMM4Tx0Exntyh28ScdmSWqekMDu2EpAbzPtFz895pa4acnxN3cXW
	S8JBYKYOwzLlimBfh4IZoAS1zQsS+doNeugAwiUZO9K1lqZflxY71Mk3tMji7X3I9PiewCDf5
X-Received: by 2002:a05:6000:460f:b0:487:a46:a9cf with SMTP id
 ffacd0b85a97d-4887174c0famr8766945f8f.29.1790328083300; Fri, 25 Sep 2026
 02:21:23 -0700 (PDT)
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
 <CA+V-a8t3HKQ6D8jb_y-XM64BHkWm3vRw6JiTydSp3rqVr9nhdg@mail.gmail.com> <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com>
In-Reply-To: <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Sep 2026 10:20:56 +0100
X-Gm-Features: AclHuK--x_qeFFnhJWfBmO_fp3zwDw0cPGYw1M7_Cyl9HfxYZY4jYF_Kzh6z3Zs
Message-ID: <CA+V-a8tzLEScwpJ1Va-vpEHdJeOjo4v6K8_xTH=aAGZoxFHHbA@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Guenter Roeck <linux@roeck-us.net>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, "robh@kernel.org" <robh@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Sep 25, 2026 at 10:09=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 25 Sept 2026 at 11:06, Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, Sep 25, 2026 at 6:11=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > > > On Fri, Sep 25, 2026 at 04:13:24AM +0000, Biju Das wrote:
> > > > > Just a question,
> > > > > For automatic software upgrade, if the reboot using PSCI fails, w=
hat
> > > > > is the fallback for reboot, reset the board?
> > > >
> > > > That seems to be a bit theoretic. The reason for having the ability=
 to register multiple restart handlers
> > > > is not to have failure fallbacks, but to have fallbacks if preferre=
d restart handlers are not available.
> > > > If the PSCI restart handler is present, it is expected to work.
> > > > That is why it has higher priority. The idea is to use the highest =
priority restart handler, not to try
> > > > one after another.
> > > >
> > > > Sure, the failure fallback works as well, but that doesn't mean tha=
t fallbacks should be provided just to
> > > > provide fallbacks.
> > > >
> > > > If you claim that the PSCI restart handler does not work on this sy=
stem, provide evicence, and we can
> > > > discuss this further.
> > >
> > > I agree normal cases there won't be any failures
> > >
> > > I never heard about PSCI restart fails. But have seen a case due to a=
 bug in
>
> Oh yes, if PSCI is not really implemented ;-)
>
> > > serial driver that made the PSCI restart to fail as it hangs the syst=
ems.
> > >
> > > So, if this is the case, a memory corruption can cause the same.
> > >
> > > Long back I worked on femto based product(single core), where we have=
 normal restart
> > > and a fallback watchdog restart. But it does not have PSCI system han=
dlers.
> > > On some cases, we have seen automatic upgrade failed because of failu=
re in
> > > normal restart.
> > >
> > If you think the PSCI might fail and not restart the machine the other
> > alternative would be to export functions to configure WDTDCR using
> > readl/writel.
>
> Well, if PSCI resets fails: that's exactly why you have a watchdog
> (or two) in the system, right?
>
Agreed, To avoid taking the syscon lock from restart context, how
about exporting helpers from the CPG/MSSR driver to start/stop the
WDTDCR count using plain readl/writel? Each WDTDCR register belongs to
a single watchdog instance, so no locking is needed.

  /* include/linux/soc/renesas/renesas.h */
  int rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index);
  int rzt2h_cpg_wdtdcr_count_stop(unsigned int wdt_index);

Cheers,
Prabhakar
