Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F4D3BBFD8
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 23:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997774; cv=pass; b=pC1G8SH1SvzDscBcIiN9edLaFLaGygJlGFqQMkp9A6C5rwHD6ljTWfDbiwNDQTFr1AHtC5tD789cpMGOhH55r/Xp9Up28mEHudUtO8LPJQEV0jtlt26X64dUQdOaV7JhuXVDqJb3YfTlNceCI321PvSgw/ghhB4I9rcjSStGHhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997774; c=relaxed/simple;
	bh=aIWytb9URnMQVfyMlYUEh0bfqxr8LFOLIuxQ9h1oQu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rw2KplBI2kMuL+Q+uQLDK7T606B1qdQRMXp8TManqqirnLvWuhwqB+dVvh96B79NRouiwHLZXJZSSOUQvV7zkeEkIl29HSTnzcRcAWfqZa6VA99QXhVwGbyWznuxDFTbz1FwuZ2tK3haFKMgdLRhtayfMIcYXOpNiOifBiD2uuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNBdpv4V; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNBdpv4V"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso5666815e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 16:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788997771; cv=none;
        d=google.com; s=arc-20260327;
        b=qS1cIsQNnkPpXnIvPRVP+HJGXUoqqQbxuBKh0hk0nXTqzINAjQaetMrcm/ax8PP4lM
         rVoAS5Yx3HtYi5tbEJ6mFmj7fzXQBlIDD9QkxiuG8Jq762dgdF1RQVx3HzhLQBihNhiJ
         pYLudPUJyMTLJ1UVH3idMQyazo3VibEXUoVUqscm2L9JiwUBByV6ES++e1viDnLyOJw3
         wga03e1NRUgDLWx3Mp6/JjuUlIKp9Q8yigRs1ZcUKjcaNGh84ZczEpTjMwagy1umDyaM
         a/4pHc3IP1Fc68f7Yasu83pwTH/0Dos2u/pKdu5O4jy7qSSDrUDhJz08sy7+rxjGhnGn
         0FTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aIWytb9URnMQVfyMlYUEh0bfqxr8LFOLIuxQ9h1oQu4=;
        fh=DNx1FfSKiJzpbCWTPREqtmNQO8/XKjoVIXh3KW8KvhI=;
        b=LKQSkpa+Y7cN5h67AM+d0e6WmubIWjhQ65aQQLjG6hQ5xbrLt5yQ1HjZ0vplg5sxZf
         RnSkZGzEEJn1CDkEVdZL2XGOc83BNNhV1rpe/SY0BVwIzO7En4hdUYs/djxpALoBTQQU
         r/IohfBcnYcf3J3j2VYxrxhrQK9fJm0bzFV9OByxUy7rNTy3qQLjYqocYKcfeU6/YEC+
         DUAUg+bpDypPhXzrPtJ/dcc5a6f46QjC/3mhLFvQTcl4cImt86q02llOdTQalmlTl55p
         SLvnDngeo+GFiOp2RCMggJlLVIo0BTb+agnSQqCoWyBXfsCkIoYdWE/sWTGv6eBWbKC2
         WrHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997771; x=1789602571; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aIWytb9URnMQVfyMlYUEh0bfqxr8LFOLIuxQ9h1oQu4=;
        b=lNBdpv4VfynKNguIQjhp/X0FUIcgCGZE4cmHo/fFL5wD+FnLeseY+YXFINxU2RN+iT
         5JF+wy1iVZB+Pf4v64Vb6eXShnfQR03RJ/91fvCRtK3l/4wNGe8m1HFYU35euW2rmalQ
         J91ZGqXv2aDYQN4cbSJ5BirM/Szheqp8I1Dzocle35UdH6yXFMwW6YuTxiUP4MDYeuLd
         oZOIQ4TOHCZNsBd7ZDkfuDOh8ym1f5sdXyfATZ8sV1et+VRR86fWE2MgxxhmcRqdQBMa
         D6sQ32XyXG+PO3HbD4C3G0Fu7zEdZj9gqDfLT3yUxR3QfkIJkAzHeLnVUazRZoRmGZri
         f0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997771; x=1789602571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIWytb9URnMQVfyMlYUEh0bfqxr8LFOLIuxQ9h1oQu4=;
        b=cby6gEJOG7cCf9GAX3Ni6gv+JiuXK7GVcP05tVhofGCREj7GJlKL9VwrSCPBszwrQl
         RbbyWVv3jhEZj4AY11mbnGr0MDOcqPtEtLq5NqDrEgIaiul/jJG28ewA4xsHj1Z2G0c5
         TKv+sbvARgFgpIcgUKvWkt+VBAEypDfYdS6lUqi4IaAtWPoovS0JY4pL2w4EUkqmQTjW
         c2NOVMyvzR9PsXKcUuP0LcVUWBwcb8dsX9lFXZ0MgZibXrTkRcGN+BJzsuFpnOMBJhsb
         5hoekYcUZMFEgj7st95/SAelpDSO2/K0wdWlomLhWh+RrUwI4j84VuTZHktTsCL6CWGF
         3jBA==
X-Gm-Message-State: AFuF++nkjDO1fLjdXRmRA07p125G3RnhyQwesT3jCnH0JvENeCCmcblB
	NRiMHNPBUw862vxqBDN6pEojaeHlB8GlXLedODsH8z/c+rFKaYFLqdSVgvK1Rdp3g2vpUQ3MOPQ
	Q9d1sgaoCts4rh038SPDkh9pP2GJJabQ=
X-Gm-Gg: AYBFou1VOxOaB0+mzM7aHPKeExRs2A5nxhX/fTGGARoaX+keYsW14duPIQ3jQuh8syQ
	TYyiUurhrkxvv0F/LPwJOgqRZh7Wmfwsv3dCjSmzRYMGK6AASoToL/i31aOgXo7xEJO9ZNDocVm
	9XAAkh5d6pz8zx3fOSweb9JELv2SWEQl5DcG1P5Mf+K/YKqVuzk3vbsdvhi6vlGxg0vj8Aktw8m
	aetN8zj1GLvhfGduHHJnMCd+n5LA6cPYvA+ToZZ5gCOv6hm7/awOqnU2DsvYslhUWsk63dl5WcF
	B3ByJ2dAO4mNbMvV9ZBRaih18iOnBamMsXPflGNgjJgOyPX5G+JHpzBQar5cfMhqpdALCyC7vsM
	tUf8fz5siCGA=
X-Received: by 2002:a05:600c:5647:b0:499:b65e:49c9 with SMTP id
 5b1f17b1804b1-49d259138bamr57643145e9.10.1788997771230; Wed, 09 Sep 2026
 16:49:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com>
 <20260908193358.E8D4D1F00A3A@smtp.kernel.org> <20260909160123.GD2133376@google.com>
In-Reply-To: <20260909160123.GD2133376@google.com>
From: Eric Anderson <ejona86@gmail.com>
Date: Wed, 9 Sep 2026 16:49:19 -0700
X-Gm-Features: AcwNN1VJoV3v1Odah8Fe7ZJ7tAJmsAS7QKdDGq3DirsVmWFAI2U8jnmFZUFXl5M
Message-ID: <CAFyMnzYZrJDvkk80LrjN+K+goZXroejY=rtkQTbx2eUNqVgueQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: rk8xx: Register poweroff handler in atomic phase
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:01=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
> On Tue, 08 Sep 2026, sashiko-bot@kernel.org wrote:
> > New issues:
> > - [High] The patch moves the power-off handler to `SYS_OFF_MODE_POWER_O=
FF`, which executes in an atomic context (local interrupts disabled and sec=
ondary CPUs halted). The handler calls `regmap_update_bits()`, which uncond=
itionally attempts to acquire a sleepable regmap mutex, leading to a system=
 deadlock if the mutex is held by a stopped CPU.
>
> Please review, explain or fix the Sashiko review(s).

From my perspctive, my change is a limited revert for a regression,
and the findings were prexisting (before the regression, and still
today with reset). Also, my change is fixing a guaranteed hang, so
even if this could cause a deadlock with non-zero probability, that is
still an improvement over the current code.

Looking into the actual report, without me knowing anything about
anything, it is either not an issue or a widespread problem.
as3722_pm_power_off, atc2603c_do_poweroff/atc2609a_do_poweroff,
syscon_poweroff, max77620_pm_power_off look to have the same pattern
(best as I can tell). The counter examples are rk808_power_off and
odroid_go_ultra_poweroff_prepare which register as _PREPARE, with
odroid_go_ultra also having an explicit comment about the lock.

This is happening in the final acts of shutting down, so it seems the
system should be pretty quiet at this point. If there's a better
approach, I could look into it, but someone would need to provide a
hint as my ability to provide this patch was "make it work like it
used to." Alternatively, the patch could be viewed as a regression
report.
