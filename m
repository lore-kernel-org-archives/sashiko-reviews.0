Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A10647F76B
	for <sashiko-reviews@lists.linux.dev>; Sun,  4 Oct 2026 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141697; cv=pass; b=B0O9Dn6c5P8mutWCyJ2G2VCpP3v00LaFYO8lSwgLcQIE7vlEB1j3x9abOF6pCG9s+E3vbUr8Gg4NOvgYs1ji1YpqX8Ytn2UCvu64+/Pq5F5dZZF8g0QpFmjBWvRTmtH+AMsllMbFI2aONu6SovIor61GgRfUw1F1/JEEzJ0KrdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141697; c=relaxed/simple;
	bh=anqUzSCvMyf6ofquk9+HHp9dh9/UXqbFF9xnCdBnaC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIytgVcSbHSWD7b9hjI5Zo0V+i+RI8PRzc0WojlbXMqzGUiRcarMY4WfZ33UHuG1McjGak9tTRw9qTlA8l4H006zlpkpmascYSZQ3GwYabdzof4+V4IOfMO6wFMyGAsOfrsBSgbWzpO3xNOVOACYSlTRkp9ZHY+HDEN1srBiXxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcEiGQo1; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcEiGQo1"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1868324a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 04 Oct 2026 12:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791141693; cv=none;
        d=google.com; s=arc-20260327;
        b=HOrT9T8mLhOTCi1KYub6uyXtb4WMCcJDjPnn4gQ7WeYHFjdaAzzAmI3XwNo5A+vRW8
         0FUO8adWbI92bYyVOQ32KaEfYkaGJCOiJL5r1UVbe+a6iq59hQvql9/dAElH14I0oyAX
         GTRMaTFpCN+SuH6QpHq1YN62VFAbzEZwOgnoaMEGiC7e55mzgkGYYPkq9P3I7j0ULE1w
         3yokPsocUuWJvsmVZlrin/CUXFehq3+mKhP3ESyZUea/UPuvl8rGFU4c4MeGQsuRh2gc
         4oVo/wHCZpwQWF9FKCmirHa/5nHvtmvONnT2EQzAXeRNCFioPe4TdBNgV3wWidqomhm4
         GmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F0NMA3u5MDg6GtkZkDHPBKXcFteg2lEcZn/vhtwGh+k=;
        fh=X8kFhCRvD1ZAnt2QFmhGdJsTtxTmhd/tlfZ1ON8bsvs=;
        b=ii8spx2fHB3aou9fLk3Sg/RzopOGA+lIHiMN+XI2Md3UxA7HRwzWKwSjmWRLpbUff9
         y4LMn821ZdIz39/zE6B8/kmpOFU+8Gby3crsPaclAKHY6dL+Kl2sUb6v+bxSh6gPiU6q
         jzZpSOWEL4BlWYLeV/213ZrZHZpnMxEK8pSpQQ7FDT7z/rxUutpsOXQzqVEEszz2xKHr
         VAYeAHDT0A+37BwdQHP8lHTOgF6ExwiZVbARtXiE0as+JVa2kVsowqm/xqw65womUoOl
         +gKHlxlUvdHNMPOEaMiT5921p9vCBzi00u9lab62Qrn+mdM7Ucjw8peiKKee91VNeTYd
         aRzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791141693; x=1791746493; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0NMA3u5MDg6GtkZkDHPBKXcFteg2lEcZn/vhtwGh+k=;
        b=EcEiGQo13WwMk3L5fYvasgQ7GEVxR53TVz88ZC6d48EUNOhurUtKQXgV0T9tlkgenl
         J+XeJMfhndvfqK8jTVBCh1jsx0G3SmJnsNZK5AJnUWpD0o1wSOS0OHuSUTr33mcHIY3G
         D/ptTfEGu18W5c4R7NIUa14LC/tqUEPjyuALRSZtnXpU4mdTb6M4KHJKRMbA/MTIJMab
         PR/SWCTrhU3Kbn4w7lejrEJcnr6KwvZONviuAFXfwCicGpbIzUZRKjjml+MuHYN8kO9x
         2xfCUiJqezFciMnBVv2k9gl3MOlTfStT87iYiMKnE4x546oYzjoQdfXrtFjCDi7Yx5h4
         uVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141693; x=1791746493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0NMA3u5MDg6GtkZkDHPBKXcFteg2lEcZn/vhtwGh+k=;
        b=uzq+SJJZxsIlR5u0o+kj2p2v+21qySCCMpBHZw2X7ml+s84vL1fuCIXUcbVrPqckxT
         TzNEP1Cvq4rtJHIH/d2dipRiQp6E99MwtKnDMoUkWBiWMleHmDFFfE32R4vZ1qTbb+U1
         0bR8XFDUyDg+SoxrCZGUy9nb+evCIJzKjTQwBoIhb8lzOChMFCWDogYSuG1jZbfjjic3
         D+letz8uxl2n6LIb4qbJ3FSjLtaqKZ1f4X7MxQZcVdJ/nKVkwo+Lr5RLmL87BuqZfFSA
         61I2FagF2qzi954wejjMjn1LMs55bxKknFNdzL11IRG1OWlVf7v8G/0Py1N0plXQiLm+
         lnsA==
X-Gm-Message-State: AFq9FYJpywoZ6ff4fynRiXJeQc7DZ9h4X7q2Cz03wZ3fkW/Uoxvq28qk
	MiXCb7nxjJpreIUoZDgkyWDHev7kNi/iSg3Le9eE/uqQctd8xJyxh8tbuBAx1PoaLx5uJOmfdpX
	x3eYfwyuN+c9nWlhSJwDkbUHpG2IGfhFYtWWouH8=
X-Gm-Gg: AYBFou1LQSFfHLKvbSy8oc+y/Ir+hnlUjkNZmLKp2YPj97gxzr+iB60M4hKCR064jmV
	IB/OzRGeDS99FV6mhTwJBqFCXjo3qfx4kbmY14IMvYcs5azuuhztEPH2IO7V8iliWI9gwFK44pp
	KrsXbcq0cMcE6Mp7z3Yw4ies04YH6Z0PQfrkXCMcya2bsJu5ikHCjg/G8pYIwvBhSXyVhtnwOPQ
	GSHQ7t6utK1+IhvsI5ZRQmWepf/Y0cIlBQ3DklNz+mODa/XrGyGouKPpuYyE6Rwy3s9vffeut1n
	Ucy2omIunpX/HzIV4QKOJrvzub9MqNDRCEzOa+Xr3c0kkmhTs8Y6IiDSXdWir+mvrDym3WDFkMf
	4ihg5Rc5HlAGtJWKO0/UIBlLnkjQkj8mKlkUM1ZjwtGYC5a7odlF51vUuN+c8KvC0itVa3s7fLi
	4eWOh5dVQRc3ULCtKJMV6eJXUkUHVVeZ3PjW48Th8oxgeBREk22d9Oh0HBKSvdWraFrg==
X-Received: by 2002:a17:907:3d05:b0:c29:ab1d:b5be with SMTP id
 a640c23a62f3a-c2e6ed68587mr418879466b.27.1791141693253; Sun, 04 Oct 2026
 12:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004191042.143713-1-rosenp@gmail.com> <20261004191730.247471F000FF@smtp.kernel.org>
In-Reply-To: <20261004191730.247471F000FF@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 4 Oct 2026 12:21:21 -0700
X-Gm-Features: AclHuK-r6TZQaG6dalsSO0XzDLOu9FRKbJFkKWkwYe1BsjdoeuJOTYI5Pv6Cjc0
Message-ID: <CAKxU2N8D4y+MC_S8qnho2xYJNQ3Ft83qpBo_vKQe-yY=UXC+_A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 12:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: commit message falsely claims in-tree DTS usage
> --
>
> commit 7b4c1f570780f70afdcc949de9998c051c2323e5
> Author: Rosen Penev <rosenp@gmail.com>
>
> dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
>
> This commit documents the onnn,pca9655 compatible string for the On Semi
> variant of the pca9555 16-bit I2C GPIO expander. It adds the string along=
side
> other standalone entries without a fallback.
>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610021617.AlVUa9No-lkp@i=
ntel.com/
>
> > The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
> > expander. "onnn,pca9655" is already used standalone by in-tree DTS
> > (armada-388-clearfog, armada-388-helios4) and has a dedicated entry in
> > the pca953x driver's OF match table, but was never documented, causing
> > dtbs_check failures.
>
> [Severity: Medium]
> Is this claim about in-tree DTS usage accurate?
>
> Looking at the armada-388-clearfog.dtsi file, the compatible string appea=
rs
> to be only used within a comment:
>
>         /*
>          * This is how it should be:
>          * compatible =3D "onnn,pca9655", "nxp,pca9555";
>          * but you can't do this because of the way I2C works.
>          */
>         compatible =3D "nxp,pca9555";
>
> Because the string is only present in a comment and the active property i=
s
> nxp,pca9555, it would not trigger dtbs_check failures. Could the commit
> message be updated to reflect why the binding actually needs to be added?
This is outdated. 6dfda79476538a9aad1d2dac45453e62c6939522 in
linux-next fixes this.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004191042.14=
3713-1-rosenp@gmail.com?part=3D1
