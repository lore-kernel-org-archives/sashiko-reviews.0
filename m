Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795170186;
	b=2RLk0Y0mDgmxemiJzRkYA+iee/lI8s1ENGLr4YgRjj6LbxCfPo5dF/x+V5pQYpJj0EsV
	 JX3qkpm4+CpITzpX0OXixD8XNdjbP00DmmujayIzLX7dR16+GxMu6OdjA7Wmxyg8bpi+u
	 bvy9Q088ACZtqpcEGl5mHUHBGL8LtMbtYaSuFzz9Im304nGcinPzszt2TfMU7M3wat2Cc
	 UERiMGo8m8P4PWCt7PbL3erhucU54fh5/Hcexopy3d73wgTelYiP99f6s1/OrAlxDpJfa
	 jWqhnL/bWZM8OfxqRjtUsaXQk4ZARL88rr1KvyTyD04g2lTV0Lv50i74G5EA88i69ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=FllpWYEjwfBO8vIm1oM39QJeHWMzURoXLmztQvQK/YU=;
	b=bjkoTaXIZUG+6jsm6cab/laWwmNnrd2ockKAyMCgLfXXw6Va1HEsTUykh1Q9ZPXAg5ap
	 0H2Aq2RNQeWWdyHRSD1iEmYqdwnCIBr799Nkqc0Ww1nIOdh35EoaAyReDktO8pe6v4O/6
	 1ehXn7etELwurAciEaG0BsLD5cQ+tSM7Ja60uWADiJ7FFvSa1hzDdqhHGnx0AKO8+SAia
	 mX6rlkq2lWoLVqRAdwHnaH7Q6FNptA7KHYkKhTTxiy+uJaNgw37O5BYblSFMQQIExYGvV
	 6ytLq1QQG0G26UzFzkHfH8iy5awe4+Yr2a9lG0eqFaLQ3JwNEXM/LakK28hDSQIg8Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f32Bu11d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0461606A336
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0461606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f32Bu11d
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso418698a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 02:23:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795170185; cv=none;
        d=google.com; s=arc-20260327;
        b=V7mYGiKvJQAx7cf52Wh6DKm2qCdfF5Z1jX6sEUxixqAKggHMlnEw3sCJB3DllPeErU
         NCVJdUBwCdghmXLYWUypvU3P7wNiXdXTpwXDIuJ+D6yLBKUVkMjsPpB5bWIA1RY2KhhT
         dA3NChKUy7Noxpz+4Tgnz5BP2Qp3/9fmzr3du6RusnDATxKXn4r5FV6MJGIkTW3kLmZD
         cNL4A2mF7GJvab9GxcMgwSQ4Ini+xwuKt3K+J5cxcXECaYvuuS2DVs0e7F5wBzmaJVPm
         oC0DE4k3w0yIRwSUbyuUwqE5TVqclaTdophD+XTldr/FKMJs/ZIBKR66xMicXG3v8Eml
         TYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FllpWYEjwfBO8vIm1oM39QJeHWMzURoXLmztQvQK/YU=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=qcCrNgwx9C67P12BKcSrwPcmD+NVI4EwvePdBkyRzgJqRr0zTNgguJgaDjkuIeearZ
         yklirHaJ91ESxI3h+5yf7IPfNcrmsml4QOTDFZZzK1vtu2vHXkkzJfe3ut0IefXE+C71
         kQxcXljd1tA54CozWpSJ6X9YU6tb+yMbYkT2FQWNNYe+k1uE/T5ILO0Ze024749BDLtW
         25TwieS9Zqg3zSntsWaKaliTgUveop7UGRk20gEhFMrRTmq3JXahvC8vd1xogaZ1oThl
         NO1n5hXqng4oKma/oZlaw36XKAblEwgrqs8syxMHZLTQ9u8saSSmhOvjGm7AY1IcbVfk
         8gXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170185; x=1795774985; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FllpWYEjwfBO8vIm1oM39QJeHWMzURoXLmztQvQK/YU=;
        b=f32Bu11dR0rbh+0EIEtTvzJY3ROhRuaE4e1OOYG3ShObms+WZvwG0AA8vGLD9wgnR0
         bgjxQ8OGcCS51G9jApp7tJ1ylrDFtMSyWweIf7MVpBi5nVpna15mfxn1betd8EQ0gKGa
         B2D57jDOWmsfNaobzkktTcSiaUx5e6eGuCvF7L4eXIc9LVG79/6CHRuGyBug6fgOBc50
         yqhPmJ9gLKLRyvFKtre0pJ2LbzEEtzvrhGNbuCyHpuNUkiNka+wX7s16EH0WEUWBqK2l
         VUecOHTGzvjCfk/ij5xCPjr6htSrZL97CZrZ31EJ54WI6n9gvPi13AuitQ/33isLdttO
         5Tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170185; x=1795774985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FllpWYEjwfBO8vIm1oM39QJeHWMzURoXLmztQvQK/YU=;
        b=RaoL3o0xEJQlITAMLilLBv9U3oPPDSmCMuSAbM79q1MX3EAn0ZI1cFq1I5bPi9H8Vx
         aD2SW0TMeevHQPSkKB8QqYY9uAfNX9vrOTDysfnDA/rr7doqWoZ79JhHeVBC0n53xjsk
         0pPjlp4k7aw8P0yhxAz16y1egGd1+CbGWM3Fb25ucJ4ZsMyiD1jjkXk9MiwX7Gj//Qco
         a3csjw2klX9bcNr+jdIGx74aUddSAV2x5mBrSBf4Bxdp09o/MBJSFv2aGjwFmqoig18J
         cONic3PUjuMNqomK74llZjoMM2zDSjDcjM1ZvDRVt673lCHNFPb+6CdbsTjZnbvNMGZX
         ffIQ==
X-Gm-Message-State: APuU4Z+aj0HQLDkVjxQL38+6buxqZMGIN6kQLTnSlLQ81b0EUw9RIJUm
	7CLApuae93i3fS/8dER2dzgK7effHSwn5LTCr9EDDRNaGdwhMu4/zsyDZjRhO3OHEJFFLMZCL06
	1J+Z9NtUhFthGlWCL9quK5tpjky16H4L60uKW
X-Gm-Gg: AZFdTZfmjRARhs0mtfKtIMvTl0hM2ETOmfUsLY6HPGaUjF48VsP6yvL1ZyQRimd96RP
	gxNqoGhLaOsT27Kr2vHx0Clzw+BiqIsXGU7Fq4ZlR82k6Qxb1c7/E/KvuMJCmZ8HaRpeAA+Ye/k
	q+bNrzUZaAZH5q5Ur2lXXm3mxV18Y+6QqwPFeGoa3nk4vX2ZnMf9hnr0uyz1AbLQ0ZwQqRIu8LD
	1hxbc/n+P92LFI6CVr95Y1x1qv/67noEAVxlKurYvaNpX73Tn8qM5Nzhrg5CKj9IUv/B3axrDDu
	roewTi38Sp8EyLiAyT8MSQSnrW3AvtXGVmbDqXynbrqplNuld/RwZdFSvIQhnAb5CPTTgs2IZj6
	AnssMsOGdsVs5ENjJns2toXmmi2rI/IdLFKaUzbMy8HF880B8czW0nzeVr0pu/jnTCcKjQwxkzG
	8Rfu21MLUE1EGKzafIDaLqFNk72hDDfmuZ3hqB3FE3zQBjK+tCXDwFC/RfnP7YaWSw0eBTRg==
X-Received: by 2002:a17:90b:3c11:b0:3a4:7195:ecba with SMTP id
 98e67ed59e1d1-3b41c907eb4mr1384723a91.20.1795170184998; Fri, 20 Nov 2026
 02:23:04 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120100408.8053-1-phucduc.bui@gmail.com> <20261120100408.8053-3-phucduc.bui@gmail.com>
 <sashiko-outbox-224911@kernel.org>
In-Reply-To: <sashiko-outbox-224911@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 20 Nov 2026 17:22:52 +0700
X-Gm-Features: AclHuK9UCmFMfooa63hk8VPfqyAB-zcUysW3gAim7LDAJQ8tCvRxpT_6QIwMMXE
Message-ID: <CAABR9nEJ3Jgva3iTo2GVacHXRp_FVrqVxQ-VCdGg41vLbh4htQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: atmel: mchp-spdiftx: Mark interrupt registers
 as volatile
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> In commit 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX
> Controller"), mchp_spdiftx_regmap_config left .cache_type unset
> (REGCACHE_NONE), so regmap_read() read SPDIFTX_ISR and SPDIFTX_IMR
> directly from hardware.  Regmap caching was enabled later in commit
> 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support"), which added
> .cache_type = REGCACHE_FLAT without a .volatile_reg callback.
>
> Should the Fixes tag reference that commit instead?
>
>   Fixes: 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support")

Commit 06ca24e98e6b already fixes 4bf54ca60f99, so I included both
commits in the Fixes tags.
I don't think this is a critical issue, so I'll wait for the
maintainer's opinion.
