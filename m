Received: from mta1.migadu.com (out-101.mta1.migadu.com [95.215.58.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B0E38AC65
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 19:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787601337; cv=none; b=h09pBJs9yU+XdY7juJDA0inKVgcJgQdLgsgc95xzxebKKIaGwYUIOH4o4VI4rMOQIZZHeFuRGh3S7prC1q1I8D9Im44Zn9a3CtODdh7WyySA5l5GkmXO4fE6td5w7FbBQuSqfAAP87y3/aEje8pUPPidAd9Xq1zYiklbsPLbKek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787601337; c=relaxed/simple;
	bh=yBRa5sNvYfkJiN7kbKYmGk/5fSD1acbqnute6Lnf95s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CH6v7AbN+TOZJtWKJWJELn0XXMa0tKQg9NlyTbhWGvNubYIWJzImjsMe26m7uRG7Xhep5p4IvAHUxjVKVYrOxBFZZGrNxw4Y4Ukeq5+9VQsFyBnarfiVZVQCnIo8N4cSaIPe8HR77OsB0swzSKD6TumtCMmTj0qQGkvI7bMuw8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WMXDC2n6; arc=none smtp.client-ip=95.215.58.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WMXDC2n6"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=yBRa5sNvYfkJiN7kbKYmGk/5fSD1acbqnute6Lnf95s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787601332; v=1; x=1788206132;
 b=WMXDC2n6jK19uCaxM+dx31l4y2Di13AeFTwaPs9R4opSeCIsdm92ZKvBcqOtB1igE/fOnKfv
 BNeHeQ7c2gl9aoX23UlC8pkcEWClyxB9FoFKJKpreuHeknYi8s5u/XZWef02JisqQZIKlZCPIZS
 tt3FvqwyTxPGHhxD1CpDOY+g=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from mail-lf1-f54.google.com (209.85.167.54)
	by smtp.migadu.com with ESMTPS id 58859dc5d3a6983a;
	Mon, 24 Aug 2026 19:55:32 +0000
X-Mizu-Trace-ID: 58859dc5d3a6983a
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so2241e87.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 12:55:28 -0700 (PDT)
X-Gm-Message-State: AFuF++mtUp1xKOTAoqk5EsnJT5zJAUK/2Az+WqlWkr83zzOK5cxvOIJ5
	fPUfUe8mggUnDUiM729coG5VXbftz/lGqBAfDOi/BDuJGFy5NbHea6vo+YL+T8/2Zr5JKS8NznA
	RNF8wKdX47UhkLTbamhSA+T5zPgJDzEW7u4zbLvXd
X-Received: by 2002:a05:6512:3e2a:b0:5ae:a4e8:47be with SMTP id
 2adb3069b0e04-5b49cfc3e9cmr26444e87.7.1787601327230; Mon, 24 Aug 2026
 12:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824184155.2644646-1-fuad.tabba@linux.dev> <20260824185617.EEC5F1F000E9@smtp.kernel.org>
In-Reply-To: <20260824185617.EEC5F1F000E9@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 24 Aug 2026 20:54:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwOtzA3i1DXjCZAsW-W_FuK3gcTkNHb0LpUq9EW8Aqy9g@mail.gmail.com>
X-Gm-Features: AcwNN1W9J8PrK_J7c4Tt8Y0PDrj0lfOZ2OEKyknHRYcXM9CAr39v1OEceBdDN8w
Message-ID: <CA+EHjTwOtzA3i1DXjCZAsW-W_FuK3gcTkNHb0LpUq9EW8Aqy9g@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: Don't read GMID_EL1 when MTE is disabled
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sashiko, I managed to elude you in V1 and V2, but you got me...

On Mon, 24 Aug 2026 at 19:56, <sashiko-bot@kernel.org> wrote:
...

> [Severity: High]
> Does this manual application of the command-line override bypass the stan=
dard
> feature sanitization?

I'm afraid so, sashiko... Guarding on the unmodified register should avoid =
it:

        if (!IS_ENABLED(CONFIG_ARM64_MTE))
            return false;
        if (!id_aa64pfr1_mte(pfr1))
            return false;
        pfr1 &=3D ~id_aa64pfr1_override.mask;
        pfr1 |=3D id_aa64pfr1_override.val;
        return id_aa64pfr1_mte(pfr1);

Let's first see what the others think before I respin anything...

Cheers,
/fuad




>
> If a user specifies a command-line override to explicitly enable MTE on
> hardware that does not natively support it (e.g., id_aa64pfr1.mte=3D1), t=
his
> code applies the raw id_aa64pfr1_override directly.
>
> Normally, the cpufeature framework uses arm64_ftr_safe_value() to drop un=
safe
> overrides that attempt to enable unimplemented hardware features. Because=
 this
> function skips that sanitization, it will return true for an invalid over=
ride,
> leading to an UNDEF exception and kernel panic when __cpuinfo_store_cpu()
> subsequently attempts to read the unallocated GMID_EL1 register.
>
> Could this check be adjusted to use a sanitized value or ensure unsafe
> overrides are safely ignored?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824184155.26=
44646-1-fuad.tabba@linux.dev?part=3D1
