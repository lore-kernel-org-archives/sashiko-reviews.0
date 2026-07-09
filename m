Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2310443933E
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 01:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783562355; cv=pass; b=De8kBkbQvb8EUA4wKsJu6UOwRj/col5IfzqkJT0ndcs2vY4m/FJfOyzHTfmhtbgx6414u4MYCl/g0MKH3pRMvvT33AUOBj7Gni7vbV3ECr7RbhHjshWrOMnvwXIDJhptPMaxydhL3j4tz5OVEe8O/rdzV/4DuF2j+K8v/r3lMUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783562355; c=relaxed/simple;
	bh=bZidKjtxL4+Dk7nsbUlia6m3IlfmzcQcCH9FUJEM3zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYjT7PwJZxm+5wT+H2LulgKSYSi/Yw1Bs6/bOcQp75PUAfGlhUjZnmfGCjbSKGuTOx2nWZsRGISGgBZXUPI2TwsHNo5WmJjcXMvtKig4UshbEYC1mxYahVhnnRflVRFtbtAbWajTQmgcyOUK75EX1JNyVb/7tF91OIcNCT1AqvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxF8564f; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxF8564f"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6989c0ec3c5so2422090a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 18:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783562352; cv=none;
        d=google.com; s=arc-20260327;
        b=jlc/eL3jqjzHwfoYF7N8QqjV+XLXs/nZMSG2IwsxJcPoG+Vh4UZmRvlfOhcnsAQRUI
         bSiJP/+eMkRjqKM+cqzYFbUAd90gMpsGmUPfCCwmuffL26wIRcms0oX2JeBUVSDmmCM9
         FdEBkzHQUjQFpW+cd3Su7XmGH+wCz35luEClA9Xla5ImfLHcyxkTp0bnZCIoFFmmZA1q
         YGmHWB42HahqV6v0d2cFRYj8BR866oABDC0Fa/8vdSCCGDNVfzxsen3gzt5TD3XJOMGs
         BYpb1BuW8rETKHwmSWlAVCW6/c8X48BaOvvlVRHqkdEPe42uHNAiqO+VPa0gpmhXbKdc
         rpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=opR+W6IiptwymG2eHcIlT5mq4Q9PG/6DwjJu8XQd8s0=;
        fh=pdw1w4I8RFrdd8EFrxO1f7NbYHinGgc2cmeqSZRwy0A=;
        b=R4sUbFih6IyUFjx6/aOiGrSekxQ2rr8+fCqn8/GuZVY+PcsUIftoKXdAbmU07yl14B
         m4aJ10M19KqjWNMlz8CncbYagsXrdaVSPydi7LWu12SVBNI0lkr1QyE0HxtIGZv88yM5
         qmi9eTK+eUWMXoV10pvQAlfqbaYbL/tFGjumLAEmRHYzAA6MwGMgGwk9mimD8UOGFa2N
         Zqs/hvHTApXWQbfylLF7iYcyT3+Wb/t+FbG4+Wm3ZoB+G/62ADxi07PxedA5+kUL/y40
         1b8zzHcLhZSiERWOEyCZ1FB9TZpxhYIIBGLSjiZYJ7wJGEp3H/n+DOx34/yv3hzBQELZ
         Twrg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783562352; x=1784167152; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=opR+W6IiptwymG2eHcIlT5mq4Q9PG/6DwjJu8XQd8s0=;
        b=VxF8564fpm4mNkYBTN0lXkMR9SoAvMS+0LJde0PYTFyyTpwdm1NWremP109raRFgHQ
         C9SUgqEnJG5+t/OPrvfvuueBuGxHgMGHHYze85feFFJERcZvQWQ4BgWgMaPidacP0ogl
         3LPgAhbHOg1QteFgw7KEi+l1VqHY7p02GwxnY+A7rUiAFodQI/3mKeL8+KV7Rmq7ZxkR
         jir2m8czv8UHtwfS9CQXKv2MnkFPEhcW9kt0+RzKf3Q99UTL7SYgbNSSNa2Kbs8WZAUu
         GxdezIX3q9pnvc9HMQgG/WG+zhKaq3+m22F7Kro+1VpNfLCZ77uPk8CwgkzEfSUQ8g9U
         TFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783562352; x=1784167152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opR+W6IiptwymG2eHcIlT5mq4Q9PG/6DwjJu8XQd8s0=;
        b=B1/OjfQRJOiHGBo7PVsex9lIyhaVSdeudNWosS5AVvKikfXdjqEJ78GmMtHnh8S+pI
         boX6yUvll9BAwGGjPyHGF0sOTat1tfrnDk+B0LHI/2u7HTdqAuxuo9meAcMgQKGb98wa
         3TKCfhbVlamuFIlfGzCwCjrVV0PDkW+hO4qkczIywXBAY1eJbNcBR996Aau0zg9yhT5w
         36Furx3pIhUJs1Y1ejPXbwgPUByjb1VNqx6RbrXWEKz3pfj5eRvWxjhpHzereJd2A1qw
         UdP3DkgjEa4eIFOkv0a2aYEGaSJjh4aYTcJ9RLMU6zAz/Utf8OylhYbwRqto4NedmVHN
         UMyQ==
X-Gm-Message-State: AOJu0YyJw7WzeOZPamQQlHo05dq7mWoBj98BUEC766bWD+Duyh1qazXC
	+kDYqSsk1mumMEn8T+nYqQec1SxykbTlF7QjifPeUu4nEVm0Ewm4l9YdIRHC8BQSYEKsvtFsHnU
	RLyCa52FsLCihjHP1jILmWYgVOoKZ4y+7Gg==
X-Gm-Gg: AfdE7cnkBTLURUay4Tp1SB1ESst71qgxYLUhYfyvMHui7EKU6pn0EhwsLELBV8FqbJl
	VuXkYKbRM6ntAWBvNICGqSlV9RmKz5R9qkITL90lB8bpPBIa/ps+dst/T0SRtI6gE/bG+gPLLxw
	MYprsxWYoCEQhVHBmmq9gjatoGPMWtMH3DmhazP9fgu4ld/s0KmfO35jTo739C9YlWjjnLyG7CQ
	aKpxr8jhSzg2p5S/oCbULJYue2n6b14iEqrwhU/cyI56oI9NchBNx1mYU/8t+tQl6Tiqbe8o+nx
	ODpOCvZjWhEyuLfLpoC7Mm4XXIt01Grd2Au4v5tIGnrgxVR7HDzJqYjv7/gj2k5VxgReyI4HN/S
	X93DAr63Cv82Om96qInBTz03n9uKEwSiV9qe/iPpiJ0cCo+iL13SIsUIWsCprs5zVEbFRETOA7x
	W5Ej2aCek=
X-Received: by 2002:a17:906:ee8c:b0:c12:516d:3ab4 with SMTP id
 a640c23a62f3a-c15cde7185bmr205785566b.7.1783562352464; Wed, 08 Jul 2026
 18:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709014230.1905756-1-rosenp@gmail.com> <20260709015021.BC6D91F000E9@smtp.kernel.org>
In-Reply-To: <20260709015021.BC6D91F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 8 Jul 2026 18:59:00 -0700
X-Gm-Features: AVVi8CfMoq7S46JmXr3i7UOgwTfBlWcPUZQHMulb3HkET17hbLYxiazlCxHP40U
Message-ID: <CAKxU2N9B6xndc8GT+KrRAPjtafGzrEBjJXFWguw61KmAjUzsKQ@mail.gmail.com>
Subject: Re: [PATCH] ata: libahci_platform: use of_platform_device_create()
 return value
To: sashiko-reviews@lists.linux.dev
Cc: cassel@kernel.org, linux-ide@vger.kernel.org, dlemoal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 6:50=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Using the return value of `of_platform_device_create()` breaks t=
arget regulator fetching during driver rebind or probe deferral, leading to=
 unpowered SATA ports.
> --
>
> --- Patch [1]: [PATCH] ata: libahci_platform: use of_platform_device_crea=
te() return value ---
> commit b10e7693c196a90e6a36f9889202414e7cb20fc9
> Author: Rosen Penev <rosenp@gmail.com>
>
> ata: libahci_platform: use of_platform_device_create() return value
>
> This commit updates ahci_platform_get_resources() to use the return value
> of of_platform_device_create() directly, removing the subsequent call to
> of_find_device_by_node() to avoid needing to free the reference.
>
> > --- a/drivers/ata/libahci_platform.c
> > +++ b/drivers/ata/libahci_platform.c
> > @@ -617,10 +617,7 @@ struct ahci_host_priv *ahci_platform_get_resources=
(struct platform_device *pdev,
> >                       mask_port_map |=3D BIT(port);
> >
> >  #ifdef CONFIG_OF_ADDRESS
> > -                     of_platform_device_create(child, NULL, NULL);
> > -
> > -                     port_dev =3D of_find_device_by_node(child);
> > -
> > +                     port_dev =3D of_platform_device_create(child, NUL=
L, NULL);
> >                       if (port_dev) {
> >                               rc =3D ahci_platform_get_regulator(hpriv,=
 port,
> >                                                               &port_dev=
->dev);
>
> [Severity: High]
> Does this change break regulator fetching during a probe deferral?
>
> When of_platform_device_create() successfully creates the device on the f=
irst
> probe attempt, it sets the OF_POPULATED flag on the child device node.
>
> If a subsequent initialization step triggers a probe deferral (for instan=
ce,
> returning -EPROBE_DEFER), the probe is aborted. However, the driver's cle=
anup
> path does not depopulate the platform device, so the OF_POPULATED flag re=
mains
> set on the child node.
>
> During the second probe attempt, of_platform_device_create() sees the
> OF_POPULATED flag and returns NULL.
>
> Because port_dev is now NULL, the block above is bypassed, and
> ahci_platform_get_regulator() is silently skipped. This leaves the SATA p=
ort
> without its required target power regulator.
Welp. So much for that.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709014230.19=
05756-1-rosenp@gmail.com?part=3D1
