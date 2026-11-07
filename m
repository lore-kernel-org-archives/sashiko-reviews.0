Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044712;
	b=DCqKxviB4+U9BwfY72D5NvaYmVac/gbVwMcnW6hLUCQfQ00B2QaB41jwgT+LS58Jrn/P
	 UTd7wqcfTkIHogRDEpoJd1yt+3n3xUltGhKADOJUOORTjK6zOh2RZaHkIwdtSRQfaV2ID
	 3I1LziWF2IWkTAkFytl8OMfn3IoM4KAMeZD/L1sco0AwMwEFJHs9civYmwgYMfL6puTdO
	 bC2Q9XEPh2ifbOThjYLFAe+N8dRhO87czbwsA9y9OAXsqYwcteHnG+7zaFL4mi3FsR6Uj
	 uoyuC/07U0x7FEpmQw3nJbl65jd88mr/e7U9n2tqo4f6iROIt9yukT9hSyb4GKxZF7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BlmA8eYzmWyrO0gOdWezWdA8rgwwfEDu++sldJMdKd4=;
	b=2O4pAC2ulMSgjhy4RGHUJFIiv/JA5dROuqM3bUjPxqtRdCNJYk+bXaKK0q8B05mqJnzz
	 NShfzx9934nMIvwnEghBS6gST60mGCBjAFAw+2aNIfnvATyxwX/tWD0edgMFx25FFV3F6
	 4xDWKUFKV+BNBVRlUBRbKmh19dnvT+fEFSKmq/fXJpwD8VlhNAZiTPB+5ASNv2VMwHch8
	 H6Y88NZRP+4fCGA//7UfFKAK8eXlpwLAJx5r3Tiuqv7OBdkdVC4yWNqmHFjxelv2Mc7ZL
	 ssdZBErYw4Jka9KyrAEYkjLopZ3dsrm8w/U4n8M9jU3/EYyREgQ/YYCVl3pRDluNbVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwip1cuK;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D814C606A330
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 09:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D814C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwip1cuK
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso814201a91.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 01:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044711; x=1794649511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BlmA8eYzmWyrO0gOdWezWdA8rgwwfEDu++sldJMdKd4=;
        b=xwip1cuKZxqSYKBLtLgXygLptqZUejNhnU6qukKAwJ6PvVcgDOgRmxV2WXQoMjWh+b
         /DPcjD5bQRsgH6VUBb0DJCvbTaIwVRlw+oFhJbTVlyCYqPck3O1tbIV3TENc+BwXOq4l
         6Bl8OdsiRfJDKp9tFhynmLIsoIqy3mu2DoYLQGmfOMzMTOJ+YBE6uyQeqCDZzd6UbB1O
         rBQFA8uJnHKOATwIJukA9eDY9MIhZh6RuwDxqlzLSTVZfgfDvGdCxysj8grw7ZMU4uwB
         9vh0apzZ/7gSc/utmay/gSVAqsznnNwhJ+NQZ1aTdkzUzNiVXAJXEmKMNArBPS/ooOrV
         vSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044711; x=1794649511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BlmA8eYzmWyrO0gOdWezWdA8rgwwfEDu++sldJMdKd4=;
        b=coHzJuNvIpGr8DMuy0oSzH63g5R69D3dG1RLlu84ojUygcdg8ZxgsfGD3y+TjqBVyc
         POZcDxAy0dVdX4+MT9AefdYGTWUkmmvZarjgG9THU02KE/EVG2CrVOmR3Gl2gxANFmY5
         T26fErC/UweQeH62XnOS23YdKQoJs1H3DX3ZIVmcAJl9gK9GhH3zih8y02/JxPlFQ6i6
         uhZ/FWjM2x2eajYy6yHEJA0UvDA9By9/9x8LfU8o6nNuesH5Pm0GtKPlPUUa/kKwjLFJ
         f0lfPFqtWYARD978lEwYDvgAiFJNatOieno+EHHY93z+98IoZ+Za3ylu3rwU8/Ej1qEa
         RSRg==
X-Gm-Message-State: APuU4Z8yTrUN1O5FZv6xstUbAL8+xdMQ96S/AwaJby6F8MiF5Gj3IEh6
	jnMtXfuXJnWsfcMK9rkOXohmJvu+hDLsnN/LJkV3ialrbMM+UEVM8H9vosIvWg==
X-Gm-Gg: AYBFou2sM6wybnb7Af2NpIm7ePxFdEMHYKsbKK4LWNqPiFquABS4KDKl5wWTE/Shgs8
	CvG2QpaKr7TvfWta41zQbdql40mClP8iwl29f8HmMzQnntRP97i/ovWVbRLqlPF29BG8AetUOwm
	mFo3YiJfSIO9aeew7y99U5ehzqI5xujyY2BTcJIckWwgSWhY3CGw9yRyJNRJ6v9hscs0K6ymgrF
	RpUnDdSUUyAi0zsGBXCeJjnWoXqpgSZLyfBfAHTFpPc9sjqsNUwhTl518NC97lXYO7HIVN2DbQb
	jl8WG0VN2TtywhGFIOtaq5Yd7Q9DpAenvO7ScOEiTyxClPixNTbn2U2cFy2tLkEsSBs1Mw4WyOn
	h9PK5HUB/LW1/07/BiDigvl0UOi58ve1rrzB1p5dkryhvwdE6RhmkZp2iLdZ6MH6nRcnmnnda24
	2n/8T9EouzY7BWqvnv54Rrce7REX3c+yfx8c+HcGg8FxpGfpQ23wgIElFZb+D0QsUAvBN7cjXeA
	psVG/0Zq8+wlSEyvmuDGP1mlzc6FvjZh7XHVwNuiD3hAkJD4P/TWxaKQo+bpQt7vMSOWr+bczHr
	OBfbJs2vUwcywFU2aw8+F8RjZuLY8kzczIEbC7CggLV5pc1AjAUsIVnMr1uh2IIIL/eREg==
X-Received: by 2002:a17:90b:2f4c:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b0db5f176bmr5147749a91.6.1794044710961;
        Sat, 07 Nov 2026 01:45:10 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105817ce1sm2910093a91.9.2026.11.07.01.45.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 01:45:09 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org
Subject: Re: [RFC PATCH v3 05/18] mm/swap: change the swapon lock into a percpu rwsem
Date: Sat,  7 Nov 2026 17:44:26 +0800
Message-ID: <20261107094447.37093-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-188134@kernel.org>
References: <cover.1793106426.git.lianux.mm@gmail.com>	<d7120017ded998ca722ed78e1995f0d1af82e88c.1793106426.git.lianux.mm@gmail.com>	<sashiko-outbox-188134@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 28 Oct 2026 16:14:56 +0000 sashiko-bot@kernel.org wrote:

> cause a concurrent order-0 swap
> allocation to enter an infinite loop in cluster_alloc_swap_entry()?

Yes. Clearing SWP_WRITEOK while leaving the device selectable opens the
same availability window reported on patch 03. I will restore the atomic
flag/off-list/list-removal transition in patch 03 and preserve it through
this lock conversion.

The device-selection and cluster-allocation paths do not yet hold
swapon_rwsem here, so merely moving the separate operations inside the
writer is insufficient. The transition must stay within one
swap_avail_lock critical section. The synchronous-discard fallback already
takes a short reader, but it does not protect this earlier selection and
scan. Once patch 10 protects allocation walks with a reader, the queue
mask must also be complete before the writer is released.

I am keeping the underlying scan-liveness guard separate, since an
allocator selected before disable can encounter that problem on the base
tree as well.

The final revised tree passes the targeted KUnit scan cases, including
the disabled fragment scan that does not complete on v3. The earlier
availability-lock boundary has been checked in code; this guest comparison
does not execute each intermediate commit or the syscall race.

Thanks for the report.

Lian
