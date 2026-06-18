Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4C3B6354
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772821; cv=pass; b=azoy84/NUTfmkULJvXljBz8DmvLyq1edjxvSWmkJNl611I5J5P78wlgriFpJKA+JaulS3R2pj8zry0iAA3/T95TIW9seUlmdEwmey+2rhImLOwozrHM8xO+kzVl6FM0Epj2oX3vGQrlhAKEsufUmO+9WUA9hPI5EmE/4pljf/b4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772821; c=relaxed/simple;
	bh=Z1YJp/HqfQ6hf6uFiAiDrxi+ZDsMGhSZke+8x869FEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecJjUKfOxOSoZ8XCa1qJU1Uz9BX/mwYU572fZHB6MvNlgZC9vMVUY3dCW7qWN+bYkDv7zB7brgNGWbWRl9gxyghquzAJGtmqeyOqHXhXZBIECT3adgcARmGQL1PQ2bTOf8bzFT71VEtEHiB4o6pD/hWXQQe0kr49Vaqwi3w/x0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ghSPXyM6; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ghSPXyM6"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-446f87b6de1so31642fac.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 01:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781772819; cv=none;
        d=google.com; s=arc-20240605;
        b=WU677MIQZO863AfSHWrfisNkC49AN/f4DEG+dL31DmZVj3dDmz1JfVxkmfbzoMyRF4
         jpNkfsS8mV5s6ALyEiJBRfnYV5j2zzlrbuP31M6FDGqCIUs2Bq85En1Pt+paN7CjqmZn
         RME+2a2JVLo3l61bU8UiumyPJHOP3omBLfw0B/1iMxLt/EivWVGXM2gAXpfAcDVjbYSB
         Lc151dvNfRNKKbGcJF62WkjjXnvoea7HTuQgk0P5MBZRPPRvn79G6tyWdpS7fiBapZd9
         8r38PX/RwAEuSANy1aMo6CUtwxP8b8rbIgrQsreHfXhxSZ2d1d1IDs672weLQnMAgqbx
         o2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oUQ+0xSBpfvF1Od2o3ssM+WJLtkna5s39YaO37zuJWQ=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=bFEM/IOhrHkO5s/eR4+xG8IFTjZsnKqPRh7/nmcS6CzXFvkDNmcoPTGy2/Fc/zWqP4
         rPwZ0EPT/iE1ztWHW7X9Ur0q4bNKAlMPNDJ0ZkkyFCN2p5jSzYi7+SsRgnOLgDyGwM8d
         UIaGvZ7TGSwdp+LRuaLQWE4VPKmbb2ea/pr+aoECj41puPfcsJHWIuC+zv8AAFIYuPMo
         dO58SARLi+ucFnlajsJlFKwdp3wtZHpqESby/AHLmEqu00M4kKNMBF6cK7vnYich0gu0
         CEUrTpsZLv8xneOET14Xp/vG+6C7OHSjOq7lEa+3DHRhOj/DVrea8vv4M2nGqAzzTBrt
         zi0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781772819; x=1782377619; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUQ+0xSBpfvF1Od2o3ssM+WJLtkna5s39YaO37zuJWQ=;
        b=ghSPXyM6Dlv2STcUKiKBbOebXfzs/52VtuNYszubDixfddIzYbepHTaxGUPGGtf5fG
         A6/LtQ2jiDAZBMHvxcdNhCqCRgxEUFXICs/H8i456uPYOOoLqsspMFI7jVXb0fDlxKz3
         jVRGNQ1e88YyMDlZwbM2c9NLpvHS7yH6kxzGxs8SMYeeL+mNov6JEx4OeG3TsdXAuDti
         2j+1HRJjPeZh4A9ZZRbsXpv5aFshX1EHEU36fjLmDFUtULQTWmcWcatzIfd+XTZUyuuz
         5fYgDbpJhXWL0Tq9NmkqbVhR4CUwxK/s25wDpiu3fWBJSjsTDTp/XpPAJP7ysOJVo3hV
         Zx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772819; x=1782377619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oUQ+0xSBpfvF1Od2o3ssM+WJLtkna5s39YaO37zuJWQ=;
        b=qcHUcS3lTBr0yj3V22tVlvBzOvn33gcW4C/N5Jjc8IsqybCkMGErl5FK3eMQqD0Gw5
         htSecmGYhcMXXXZRxOwEOnVWjBI381cPpez91+9sJe1KmMitmQaViezmNCifTfh5NruM
         +Dsggo6UnFRjV3OXowaJzF4t5enzMopByBIal76lhLLzenrtY0hCSe92stOCmTRPDAqA
         uf4brrs5jgAIkJF6LMuW4geDIQf66fa3vw4N1OoQdcSUF5zHSuN1RgAyjHBLhOLznTg6
         fXLBpz4PzMP2Tvh6Ytn7q02+DV2PPzlSvSUWT4WqCxgGuNz7Sa6xijGOARqM7UMWni7i
         qjJA==
X-Gm-Message-State: AOJu0Yziu0PWOKeHgtOUkqmfG/BEoB3s4BbP3CYyIURPPuXCGdlrDH5K
	5V4dZrW5gxwTEIhuHdc0j6YUTcFO6ZXaSKuDalCyGo73RkrV7CM9grZCkXgsPbJklgDZ8qbxxOD
	A+0n+0LatiIr4V9/J39wAXV6c8gb6qHyWhZnTKcom0zoRbP+OHq8J2/6FRw==
X-Gm-Gg: Acq92OFRyHbUBb9flT0m+jnOEaNjKYBLv9pTupyjCkWSP//4mpeC9Tc/g5ni3YIZtGR
	uMBij9D4mFt5fEDDOH7EGvXGdG0O4DD8KP6ddhOJu5RA+Btvv6k9sSSZmtT3c22nCTgmonDUcJH
	SUyQ0TQZFde1dziZiK106SGdFfWmZD2r+KqrVb/tV++E0KcnqKeRUXkCODIM4nvzUZcxByYIGid
	4mLKSb/G5I1PMCjPkYevow8u80Ce3IYdoOUanKDEdcQinv/qlxjwEe9yvcfpkwC1k+8vgbFfgHy
	j/c=
X-Received: by 2002:a05:6870:48f:b0:43c:3678:1541 with SMTP id
 586e51a60fabf-4469045cf99mr5249080fac.28.1781772818570; Thu, 18 Jun 2026
 01:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618064406.14508-1-cuiyunhui@bytedance.com>
 <20260618064406.14508-3-cuiyunhui@bytedance.com> <20260618070215.268ED1F000E9@smtp.kernel.org>
In-Reply-To: <20260618070215.268ED1F000E9@smtp.kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 18 Jun 2026 16:53:27 +0800
X-Gm-Features: AVVi8Cc1wsk8OHCml6nVyEvFINMaXLaYsBrkjDDvdX7s6ie08eRbA-euJM6qaHA
Message-ID: <CAEEQ3wkD+qYWSzZ=5VGCzvHDmeiaaeJexNokGgbv7zAqccD5sg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 2/3] riscv: track effective hardware PTE
 A/D updating
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Thu, Jun 18, 2026 at 3:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] A hotplugged CPU lacking the Svadu extension is incorrectly allo=
wed to come online when hardware PTE A/D updating is globally enabled but F=
WFT is not required, leading to silent data corruption.
> --
>
> commit e238566a69f2ecd235872518a759dd75d54f71af
> Author: Yunhui Cui <cuiyunhui@bytedance.com>
>
> riscv: track effective hardware PTE A/D updating
>
> This commit tracks the runtime state of hardware PTE A/D updating using a
> static key. It attempts to enable FWFT for all online harts, falling back
> to software A/D if that fails, and ensures hotplugged CPUs match the glob=
al
> state before coming online.
>
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
>
> [ ... ]
>
> > +int riscv_enable_hw_pte_ad_updating(void)
> > +{
> > +     unsigned int cpu;
> > +     int ret;
> > +
> > +     if (!riscv_has_hw_pte_ad_updating() ||
> > +         !riscv_hw_pte_ad_updating_requires_fwft)
> > +             return 0;
>
> [Severity: High]
> Does this code allow a hotplugged CPU to come online without the Svadu
> extension when hardware A/D updating is globally enabled?
>
> If the boot CPUs have Svadu but lack Svade, the flag
> riscv_hw_pte_ad_updating_requires_fwft is set to false and the global
> static key riscv_hw_pte_ad_updating is enabled.

No, a hotplugged CPU should not be able to bypass this in the normal
RISC-V hotplug path. A CPU reaching smp_callin() must already be in
cpu_possible_mask, and the
global Svadu state is computed from the ISA intersection of all
possible CPUs. Therefore, if any possible hotplug CPU lacks Svadu,
riscv_has_extension_unlikely(SVADU)
is false and the HW A/D static key is never enabled.

>
> When a new CPU is later hotplugged, it calls this function via
> smp_callin(). Since riscv_hw_pte_ad_updating_requires_fwft is false, it
> returns 0 and bypasses any capability checks for the local CPU.
>
> If the hotplugged CPU does not actually support Svadu (e.g., in an
> asymmetric SoC or due to firmware misconfiguration), it successfully
> comes online. Because the kernel globally assumes hardware A/D updating
> is active, it skips software A/D fault handling.
>
> Could this lead to the hotplugged CPU silently failing to update
> accessed/dirty bits, causing data corruption when dirty data is dropped
> during reclaim?
>
> > +
> > +     cpu =3D smp_processor_id();
> > +     ret =3D riscv_enable_local_hw_pte_ad_updating();
> > +     if (ret)
> > +             pr_err("CPU%u failed to enable hardware PTE A/D updating:=
 %d\n",
> > +                    cpu, ret);
> > +
> > +     return ret;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618064406.14=
508-1-cuiyunhui@bytedance.com?part=3D2

Thanks,
Yunhui
