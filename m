Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9542868B4
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 04:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779770634; cv=pass; b=gVn+zvXhbsmQeMMOZ18FRsmL49IfOdcxCfjxS2MWTVxS/aw4U0tAzcwd3fzLZlV/L+hv7zzPrOilkctQWhwNJPrUEYJFSn82PwpDMW9zNbjYNpUPxLqKNMB00AXixmnLrgYUpZdAPAiq8k+btXx/Ndzl/O3xdPFvbPrDIM5DQOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779770634; c=relaxed/simple;
	bh=if1b69KHATq0gJwTrfVpPLJ5q1oj3I/Hy53zknCCbWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUpNntS5pkxs57dXsaD+tyspHlQtzwB3dIMNOU+iM5qv4tTLn9NqoUbPQXtwz89EhJGfQA28UhAzkGI658QZhOSBkNYFIGRLBBf6nkzOCSLIaaFox2tjmCoyPcT1F6Nm63D+FtcxTvffN3TZBe5hjosswG7JrMxN85E8MSd9Fhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gb2K0x18; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb2K0x18"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6896c54a7easo3070936a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 21:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779770632; cv=none;
        d=google.com; s=arc-20240605;
        b=WKmcOmLGsQZIamiIEV1st/e5X6d6Dckw6SZ0AkxS5CK8Ro38pk6AwT+t9/6a3RhHzb
         nfmfqA53+85arhk3LZlJJJpIFWL6z/lCPZW5kHwskojgg80hP8vEyiVUgjnohUFHnmeh
         LN5d1fN+EcNZ7El84UhpjJOAsSinSK/dxF/U8AN4X1h5toYWZvVmKKw5taVNR3SWEQnv
         Dw1gJgUY/BhBDXXXhvIDzqvKPuu4Bv+YOshGHl6VKgK0DHnjL0sw92pzSOipLT4+CPBK
         ezL9VWXXKdZpx7k7GBGNNBfMp4nGaRyAw11AiWj2Gju8RRWJ9AopIYjLowYWVQ7kolwI
         p6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M/shEe3xqBpt5QuLR5/kC78Z1EP7DMk/aIHBbFQF1Fg=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=fxvNmyIdyXgXrQkTVabmUXa/papEWm2YkgKgIJk3ehDZ6724MpDdRJElPodRP6oxd2
         euVpuAhE7HZ2k9a4su3/I+Rk+bNx0TpJhd++YFeV+qyqZb84jkCTr0baUIuPL8htlc7o
         Y5AtHqlYbXT8NuLhoKQm5FoQgLEQgf/Jem9ykYXF/6tzn9GGO7L2tNraDpvQQzba8Q0G
         kQfVBZ3cMWdR4V/GN76yxalUHS6wnSU6DA0psyLysiUUrxgqEznahxdAX4i/vqRdu5aO
         DsoYgZKRkhRkmBGIgtsEUa3iM0zvzdDsU7UDX5VeiCqXXEgKEZZhdyou3+KYFZj2S6+O
         zt0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779770632; x=1780375432; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/shEe3xqBpt5QuLR5/kC78Z1EP7DMk/aIHBbFQF1Fg=;
        b=Gb2K0x18DaWtfcq5/2FZRpG/s7Yvs5Ikfr8/jkzhnJx0kng8EuqUizm8yayjy0k1zH
         FfJewAfiOrw+Z3TB3/qmgTqO/A4XDBTPEMYBqp+zzmI2BT1SZ1uDXUI/xmski2B/duSo
         G/qpGu4hd+GYZctKtgomfU/E27Kikl3hXQm4Tc9Vy9zUZWxjC0Uj+2BJaAR4XZAIfJZE
         Eifq6P2xbfipo/nk362DluJm4ZQ0bOzz+oS2lqY2gqNPmjs4j4gf/opkOn0MNr5Rb+Pu
         SOINBb+06pQL2BhOwr1yfJB72hLXaKH1vpRXHyDw9BBUNf+16XObKtCBujfUJHiW2/S5
         klXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779770632; x=1780375432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M/shEe3xqBpt5QuLR5/kC78Z1EP7DMk/aIHBbFQF1Fg=;
        b=rC7+mZBfSxvHf2cEvj0BIHkHR214ZXaMKh/ZS+cQ8BBAl4w3tsL/5B+NbKmf9DNxju
         6mZPdXu1BvLFLfUTGuC5BFyKXib7tB9wrWYKjHCOgRWXU3WSsC61/GMM5itylN8Rwe7t
         sUzDKezO1+B7zwTz9x207V2Cv5j350bNElFoiBy9hajfv8hWOkUH/532ADzaGaqxDJKA
         Z/H0tQ67NmoNgmzpIU1cROjU7uNgRGnphDRVhTuJLE2mQZcYWmZ9MH8lNCTqgRB+1wLU
         Tkg6oIieBNJjgpaifn2c2ar7u++OzW8JR2ZHpAHMAQl05umY1COfH8EIW0DRy94jls8C
         /iRA==
X-Gm-Message-State: AOJu0Yx4QYn5bcf3ZQdcfvBYj8NihkVRfe+D8fhke6woLg5wHi0AtXRa
	z81678EkoeWKQ9TfyCRj736rrdNincEqBHl8j3Cul9mm/B/n4y4cWKzZPfsU83TXQRBu1nIcMWP
	HYCa8WJB0rsTwVQhJ/+fdnbbWOdEKh0dnTQ==
X-Gm-Gg: Acq92OFMLk7FoefTI3Jyhm2gOMM2cu3IELATcNYPiQc/Pp1M1bQ5ap5SdSeEhoKmujd
	NOBC3xoCZGP7Uk6uWwXQvO3Y9fkFM0rvOejcbVzgyQ+2rAi9E7Sb/LQEAuwi2WHXPV9TKFFnuso
	wQ+a/+Q5Xu0p2jrAMJHZzcrUtYDPfiZQTjwNZ6sxFCGZ0JdIi7h9TMEXG1a/cDcfWa5c1G9NE7c
	RaIDvQmQvosynGFkTCB+vyxjFAVOhuzdVMw5XywXcd1vMHLfN8lWOChp4Fmzc4nMAgNxuSqT65J
	98+KPtz6JsDAOSk6McJGS49+EwasQYJg8ythLItiNQt0X7gLYel/nAobzlNcKfbTJLeKESXYmRG
	nf6DaDCTc0KRTRrkguEqNrVfooepImSjXz1m/RxLAZGScnWummGGIQjzx7w==
X-Received: by 2002:a05:6402:4348:b0:67f:9124:8815 with SMTP id
 4fb4d7f45d1cf-6889cc4857emr8386542a12.17.1779770631555; Mon, 25 May 2026
 21:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526042614.1013867-1-rosenp@gmail.com> <20260526044110.29B821F000E9@smtp.kernel.org>
In-Reply-To: <20260526044110.29B821F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 25 May 2026 21:43:40 -0700
X-Gm-Features: AVHnY4ITFCqWA77JZlqnmYcLNceVp4DKffune1OQTdWsfPcNqSegblQoB11lwv0
Message-ID: <CAKxU2N82jB9F_rArLtE5-xRVVZ8F5jYmbih=8cB9dsJUXuorZA@mail.gmail.com>
Subject: Re: [PATCHv2] PCI: hotplug: compaq: fix X86 dependency
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 9:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The commit introduces a redundant X86_32 dependency and the co=
mmit message falsely claims it fixes an x86_64 compilation failure.
Which is accurate. This should not build on x86_64.
> --
>
> commit 2f32c0aa3739414d8be655780c2734e155b45ea8
> Author: Rosen Penev <rosenp@gmail.com>
> PCI: hotplug: compaq: fix X86 dependency
>
> This commit restricts the HOTPLUG_PCI_COMPAQ Kconfig dependency from X86
> to X86_32. The commit message indicates this is to prevent x86_64 build
> failures caused by invalid assembly.
>
> > This driver needs X86_32, not X86. It does not compile on x86_64 becaus=
e
> > of invalid assembly there.
>
> [Severity: Medium]
> Is this description accurate?
>
> HOTPLUG_PCI_COMPAQ already depends on PCI_BIOS. In arch/x86/Kconfig,
> config PCI_BIOS is defined with depends on X86_32.
>
> Because of this dependency, the driver could not be selected or compiled
> on x86_64 even before this patch. Could the commit message be updated to
> reflect this?
>
> > diff --git a/drivers/pci/hotplug/Kconfig b/drivers/pci/hotplug/Kconfig
> > index 3207860b52e42..5074c0ac4ce18 100644
> > --- a/drivers/pci/hotplug/Kconfig
> > +++ b/drivers/pci/hotplug/Kconfig
> > @@ -20,7 +20,7 @@ if HOTPLUG_PCI
> >
> >  config HOTPLUG_PCI_COMPAQ
> >       tristate "Compaq PCI Hotplug driver"
> > -     depends on X86 && PCI_BIOS
> > +     depends on X86_32 && PCI_BIOS
>
> [Severity: Medium]
> Does this introduce a redundant check?
>
> Since PCI_BIOS already restricts the build to X86_32, changing X86 to
> X86_32 appears to provide no functional difference.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526042614.10=
13867-1-rosenp@gmail.com?part=3D1
