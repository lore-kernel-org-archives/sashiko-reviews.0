Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9020013D8B1
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113866; cv=pass; b=VZUrA7TEaK6ukMafT3tZp2Hn6KyS/PNTn6yGvVvNXtDzSrBupStOWdvrBhHi1NEaDVG40dexbLvGkvESFUzQKJut+LupzS77JyD1tnPSnn5gho23yuosNYHPJEwiUViNYV+tbOL2PAH1cRppQOdawN2KGkkJHZsLryDI2IGNZNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113866; c=relaxed/simple;
	bh=m9vXK639duMrGCvxYu968cLO8RpsbdfFH6e0KuGkFCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sCFsK2ZgFXusQyEMeFolwKbsZoOkUPmrlq/n61WO9WPMY7vyX2bORXAtTapR6DOr6U2Rf4ngOSjEbCHZpdV0MJGJ9JAF5PCa7gDbYpd2J27A1A53ZydaTZ7Xbjlpq66G8YCeKXjO6iH2BfBsn31pwpFke7qcJh/4pSmS0JQiGCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuIqfJ0M; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuIqfJ0M"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-43aaeb6c96bso335583fac.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 07:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779113861; cv=none;
        d=google.com; s=arc-20240605;
        b=RHAOl9NexgwYJtSapkjUsAr0rHZ7DpED5MEL6qYsVjB4LPXHCOv77rgZbciufuZzy4
         7Op8sx78gHtgmwo7yCwde7e/L2U7F5VAWmaTWT0UnbGrO/+HDcswXq9cfOaRGyleVdEq
         XBpF6UZt41pay4fAm4DAL1vN8Cz25CSAW2VhXhKJLlpr0quNSSNDygJi8fHOwUCe0A1t
         bJDHG/XY9nFKLDF0tgQ77VOf+sU3xRGLSW4DZhti2FxGlJABdEWwk6Q1jW5jPLQgatZ3
         /K8zjyyyEIMpKpzTIP4K6hOoAo7z765uSQ7TV5ZPHFpZHkE+IzzBXakVmDiXE4Wv8vu8
         GGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pDKx3EeB+e+ODwyRdpNDzr6olUBON+DX/SSLXnx9QzU=;
        fh=+ykpOC5HbCyJhIibAubnV7Ig+XqtePvwQgLqMx/6w6U=;
        b=UJFJ0WyjTWbikfW1qSvmsOQ512RFtqQezRiYhNOCiQsHvgAv+Ktc74AaXuliwYMNlJ
         mnfulQfwVtQ7/pHFmmZAHypzG5ydGIBrm/B8AF+EYMtDh904cLqrAdk/ufXUCfILVxGP
         A4v7/6oeib2vpcpndmEDasMWFbV0+JNttGEk854nZuZAHH194hHmTYh2Aod1RO/d/6hZ
         Hwe2TPd4Rw0gZ3JqGMPUGLrxT/4QeEnGhxvnW+cm/meTDt3e4bxbX4KybcJTUciqflIr
         +fl02a1Oh0Fcr3D8FFhUHJ4vnYcHXtDtGE+4VeJwR/1QVmYwlr4ZpW+UGPmMD+YU73QV
         NvJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779113861; x=1779718661; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDKx3EeB+e+ODwyRdpNDzr6olUBON+DX/SSLXnx9QzU=;
        b=WuIqfJ0M3nha4aoT/IoK/jB5dCQ6zFFBVU68btryIiGPtJkseeCfLU8VT71c0h83am
         AoqLF8es3jN6yZJziJT7SwzpDocYmGuToQ9P0xbGE83fgnr+lSYZdje+0bE+SY9+uiBV
         3EUmwmTdano4dMo1Fn1NpWdoJ3wjF0nXqu6jHLQT6TC2PwE6Hsdr+Pwcwzf2ygK8VA/H
         soTz0GAO8mfLS5iqOkXpuhZsUsgwOXCi0cFyU8Hx+we60z4fJAgayUxQX/eSvshCYbkq
         kY5osSSHVPU4wBx11LUemBgITIL057jYptJWSGasVRTRQco5Xia5gpjFxOxTDL0oNC4x
         3b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113861; x=1779718661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pDKx3EeB+e+ODwyRdpNDzr6olUBON+DX/SSLXnx9QzU=;
        b=iMV0LlAbsLaZTMd5eltHPQ9Hgy0DUE0+TivrFS33XbTuIuQ9X2nirTi1Nbqiy8XeFJ
         bnt1m4r/tzZCgVj++ytkq8g6LmywTaSrAA+08AEvnrB4Wo7/SvYdsfn1VqQv8dCKgT3o
         qeATFnQmiTcsoXH0rgDkqIvnHXX09EGS6bty2C4WtgJ3NudKc7iiHGunl3cmhinvkqlE
         JcPMYv6lJNWdRgjh5WPcPhRAXG5ZPOE3AOMy75cHjulif6wwjCIosFyTjguifP48JoSM
         mFynHkqdyV3QxiVTwQbOQCMv+jDP9925Y1WBs09oeikujNP/qvQ0rVXnbzeTXfqIzOp3
         mH/Q==
X-Gm-Message-State: AOJu0YxRV56G49e+b9pXyp/y2YI20BSVyH1qD3LmIx/YQR0Cc4OuQLlm
	hmXVbV6KwMZsniXm6tdHBUcDG55J4/Sjs7dECuYvkJcNZgvPC68gy1Dcl7vC4hOHHdOeto6fn9T
	yEdq3qLvN/uNh3gt2RTpa1efRHcKubzFUMXrA
X-Gm-Gg: Acq92OFx4zCPD/X/GfbSPM4WrvseExf41V01FB07X3qw6VL645Eb84ukjYYsaiIxxTJ
	vXXKxQpN7q4MOqvV2UyuIxCfsh3yq9u6k/xI7blxQiX62DlQAiaW1H4RVnln+nIDjhPggMKOpxv
	9PzmLZ/lF1gBWs6YscHJsU2Y9VQRVK3bA+6cR4XZGQlYv5vA+AXZMkQepfYSUM+Hbh9RNenBU9w
	nyAI8va40LdIvi7CT90b2VXXp/yG2t3A7+wgUViwg2cG9qqNMHsgO2+Aaf+tSDDlezE3rTqS9V/
	eBGW3cBp
X-Received: by 2002:a05:6870:3346:b0:439:cd73:3864 with SMTP id
 586e51a60fabf-43a2d9d7e03mr9872675fac.13.1779113861493; Mon, 18 May 2026
 07:17:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-1-438f2e0513ff@gmail.com>
 <20260517143152.C3318C2BCB0@smtp.kernel.org> <20260517-aground-shadow-d4ac455623fe@spud>
In-Reply-To: <20260517-aground-shadow-d4ac455623fe@spud>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 22:17:29 +0800
X-Gm-Features: AVHnY4KG3bvfW6nL4igtsM3606_UnBal56cQai2nWjWSCWUL_A_EBt_yZCq-Ksw
Message-ID: <CAJsYDVKtfZCSNT0FgM1M5Wc-+MQ7eegT9+3T-DG=vRa4dMmKFA@mail.gmail.com>
Subject: Re: [PATCH 1/4] riscv: add Siflower RISC-V SoC family Kconfig support
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, May 18, 2026 at 4:46=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
> [...]
> > >       This enables support for SiFive SoC platform hardware.
> > >
> > > +config ARCH_SIFLOWER
> > > +   bool "Siflower RISC-V SoCs"
> > > +   select ARM_AMBA if TTY
> >
> > Should ARM_AMBA be selected conditionally based on TTY?
> >
> > ARM_AMBA models the presence of a physical hardware bus, which exists
> > regardless of whether the TTY software subsystem is enabled. Even if th=
e
>
> There's no point having the driver built if there's no driver built for
> devices on the bus, I think is the angle here.
>
> > PL011 UART is currently the only AMBA device on this platform, tying th=
e
> > hardware bus infrastructure to a software abstraction might cause issue=
s if
> > other AMBA devices are added later and TTY is disabled.

I copied this from the vendor tree. PL011 is the only peripheral on this ch=
ip
requiring this flag, and there's no more AMBA-driver compatible devices
on this SoC.
However I'll change this one in v2 since I don't want to add the only flag
in the kernel which conditionally select ARM_AMBA :P

--=20
Regards,
Chuanhong Guo
