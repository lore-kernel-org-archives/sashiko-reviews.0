Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BBB3B8920
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 20:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785358551; cv=pass; b=N+Mon8E+4G3BUHutsB1gjxFgNIjZbZW7jKtmznMR5cGzg11U9ri+bz710vBg7GhkN4cuUKThU0PXZk1gLsu7AynVR4444git8qxgWQBuD5GdIxGoshzsX8dTLwG0Zt4GTUqav3QoX16BZN+4eCEwaOthiLJYgQ2VPfeICZecJR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785358551; c=relaxed/simple;
	bh=xBpt95yUlNB7dyXPnHP9dkIEkat70y18dIkv2UoDPBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uRUkYi3aePvSxLt8yCDgSL7YKV669P40euYBlIDLLKv+w3QUffSTeg92WJjgcEG10dRBhI2TiMtDmWmYnKmv0tpEcPIswvRV8zym6g7Durl6m4O3p78fzheIh/l3MqPdtBCqAmNVY/WM9JaGbfFJTjz1o2nvOUWMAE0YCKHbdAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHTNORte; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHTNORte"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so2264859a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 13:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785358547; cv=none;
        d=google.com; s=arc-20260327;
        b=DgbyB4jtB+a7LNvVw6HmjX9xPjFfklXY0Stiw7IkMWrTmkeC9lCaPlw0HcgmgDJ0Yt
         zPt2WIudAv2YPcFsX5uuRAZEXE4jlcM6S2RRIjGczcEx/KExcic/ijnLlBQTUqqevlDx
         m2UTARL1S8NYKw2TvgX+0tIlDp2xLIdZIcXdogbTuL1bhkkjnWj+e+aL45rSLZGYdI5Z
         +2DAup0qgru4j9E8t+Ptzv7MlMjlsWC3EYPFpyqFMwJpWt72xQ6ECDOYpHM6BiZN7SBR
         dyKX21SutJBGlxjoOiEGAiLtncyQARgirb5XrKkuAhptolHYH2xqqQPW4T8MbMdxKPyh
         NGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XtS0TcGK8hDmQEF83nP4TpYXyV/msuo8Td/PCQGmVwo=;
        fh=09d0alT2vWugDAMCzpgQpl3/7WoRUt39xgQGbwqyPYU=;
        b=MGKBgVlDbu2U8zcq/+7N7HFGrH3T6HEPcsAZtuiTtSv33j331FPKZEq6kj0sJXmWgM
         xsRBgxcUs1V7XFO7yddDebcF12xpbQB35/rJIo4op4btwt5/WMuBjUKXOZ0CwKIalwPu
         Z+IDtK73Yul9f4do78vOLbegeS711wYkPQKC3U72GDrCozgkTMm6P71oWdZBU56kc5U9
         0YQ7KYrS9hjOy5eTqBHV79B4HSVHfSdeYJ9nFx7i6SHWLNvCsSdRoaLVxVuW8FvDI+VD
         bzUY5MyfxgUGrv/5ft5npF7cC4QGFmVWa+33F0oabKeKHIrJd8pLKNkNq8FDcVmZ7e5F
         EblA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785358547; x=1785963347; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtS0TcGK8hDmQEF83nP4TpYXyV/msuo8Td/PCQGmVwo=;
        b=BHTNORte2JKt4Ymxu9RbmNUA8b3SOUaSP9RzoEznARED/CJ55hYOsNZNykPRGHmeoA
         CrxhwJQeBhMAc+2DhtlhsjfVssImuYnOzA+dmPVkDtDI2wcXgevcTphxrPtJOjX7j3Jc
         yipFHg0jbaeABpJGg8R6HFpoerr2ABJo/L1xd/8+JCNKlC9J2NNuSh/2zCOZRpwNSr7O
         pQEqoct/YQBi6+/0KjuuFqBAw1vuoGYgA1gpz9aU8GXPdvIx+pcqCwApCwm06xYTQPFM
         LfxCCMgYo5wD5nR1evwhBcqaAzOY+eE8vx16HiSkhe1EZqf6IZCJO4Xn38usfAtbs71Y
         pLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785358547; x=1785963347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtS0TcGK8hDmQEF83nP4TpYXyV/msuo8Td/PCQGmVwo=;
        b=QP3/NUxeyybVtoWEdeT1VpieH8aKL0uKohfr59cSs9QRr7mGEBFtS/kxIEo0Y5clH8
         mciqLhfyXp+1e3K94zjHNUzFhxnhxSCTTEYMEB8vLEF3dw4zur11jCDzgJKY2WknNrdN
         471n8HGh/C3dcJZymKnejH+FuoIax+xcL5HvuAmKjVuzAweCa5pNuq49ubM1k8Nych9m
         E2wot/2tbvSoAJQMH4tFoQwL0JsqmLAOeEQW/4hHzxXOhGr6Jro2YweKByWXOjnCXIBG
         Wul3qORPg4BrtkQjE8oxi/sVPoVJpzTC+uYrRI2jhRFmXxnm4bbuxaYQ54n+RQkxo6Id
         eQIA==
X-Gm-Message-State: AOJu0YzYRm31n4+DvA5InowbnSfyTBBK05yRNqpAYyz7HN+VKH7dtIc5
	J+LdQIzWbSoaV181Rtv3VQ6jMQbxJRptvtqB3zyGZ2sws3c1o31X6opUvlx068bdny9pnFHPczp
	bFhyIRMohMEJlRM6dO3pq6RalluS/vZM=
X-Gm-Gg: AR+sD12vqm2Y3XQzqT3NJ6vVuZMZVV5kTqvPTjUZEkdPi2AhPSXw8Vba6VdMTcmcAYU
	9Uo8m+udPsyQqYRAkzLwYAHQWQ/+jrfZg10FevSSgoCR9MT+1ctnKcCweRmLYF26Hwrv+SPmwYe
	a9FLOJmmPqpSmudITEtjEvophE7JGHOF+02zs/G2uIeflBgvyjN9WlLvCI5+yvBQxwa2HWzN2Bu
	WHYUQcNrYE/jNc/yvJiZThk42OBYzdlYUP6SQ0VwIBoTenuAEeWns4t0IELU1koym2qNscknP6N
	+g3aQDXkeVnT90UqEZSw06qFj8Ly6UokBpXn7MV44IboW7hHnYqZzxwsogJL7Z62FPpqNDkS++a
	GVPLbsSaKoA5qA4Y0MET2I6TWMvHKWBXX5aEfGgHM2bO9Xba3rfUVk7l6m6Zcj86bssJH46mpc0
	woBT/KJSc6FSxr0qBcg9TrNnDyKHA17h01Yc2Ixi4X99/wnOT7F51h5K8=
X-Received: by 2002:a05:6402:3997:b0:698:5610:76e5 with SMTP id
 4fb4d7f45d1cf-6a07b7bf461mr16049a12.6.1785358547498; Wed, 29 Jul 2026
 13:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628231156.1254012-1-rosenp@gmail.com> <20260628232714.BD9581F000E9@smtp.kernel.org>
 <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com>
 <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com> <CAKxU2N9Nt+HF-4TzB3+_5ta=28wb0xCCLuUVO6Bm=LW3ZnNmHw@mail.gmail.com>
 <d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com> <CAKxU2N8Akw0+dc=wHUmLrqJe6d6rrk2O-BqeRB7D55iU-S_uLA@mail.gmail.com>
 <3e4eb418-d574-4516-8c5a-1488c87baf91@app.fastmail.com>
In-Reply-To: <3e4eb418-d574-4516-8c5a-1488c87baf91@app.fastmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 13:55:35 -0700
X-Gm-Features: AUfX_mwLSIqOBTty3Zb1F3fX3ESUnz-9OwUqeGd-wOI408xy4GFiNYJS_MluqII
Message-ID: <CAKxU2N8LUpmj6ihYrZKN-+8KuQ6zz-XThWWWg9O3KDe3AnfL8g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
To: Arnd Bergmann <arnd@arndb.de>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 1:43=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Jul 29, 2026, at 22:26, Rosen Penev wrote:
> > On Wed, Jul 29, 2026 at 12:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
> >> On Wed, Jul 29, 2026, at 20:13, Rosen Penev wrote:
> >> > On Wed, Jul 29, 2026 at 8:40=E2=80=AFAM Arnd Bergmann <arnd@arndb.de=
> wrote:
> >> >> >> commit 4f061464281d4964ce46dab60d36a09328f14862
> >> >> >> Author: Rosen Penev <rosenp@gmail.com>
> >> >> >>
> >> >> >> ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
> >> > This patch can be dropped.
> >> >
> >> > https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/
> >> >
> >> > is the proper solution to the problem.
> >>
> >> Right, that looks a lot better, at least as a hotfix. Could you
> >> respin that one to print a warning in the loop for every bridge
> >> window that is not bdev->addr_s[0]? That way we can also fix
> >> up the DT to have the correct data, which at the minimum helps
> >> avoid nonsense but may also be needed to avoid future problems.
> > Not my patch.
>
> Ah, my mistake
>
> > That patch effectively ignores values in dts. Needed because of bcm dri=
vers.
>
> Sure, but my point is that it fixes a regression introduced by
> 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully"),
> which tried to address a warning about missing ranges in dts.
>
> As far as I can tell, the patch worked correctly on the
> platforms that had the right windows set (presumably bcm47094/ac56u)
> but failed when the information was wrong.
Not quite. Full information here: https://github.com/openwrt/openwrt/pull/2=
4415

TL;DR: fails on both platforms for different reasons.

I have no idea how 767012397976 was tested. Maybe without a broadcom wifi c=
ard.
>
> Having addressed the build time warning of course is an improvement,
> but I would argue that actually having incorrect information is
> worse here, even if the information is ignored in the end.
>
>        Arnd
