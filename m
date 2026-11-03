Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.99.148.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743322;
	b=UUd3Ga2EJ0rtklF67brbPz51pHFnuPlA25/IRK6JNSUBSxYYr/O+RmOMjyMs+jtrbSrZ
	 QLf0xw/nIJU/giD8/II+Yn+P1cwJ+dGbOTa3kl33FTXLNb6WD63iOUS69CyuQazaqzRyE
	 bm86BBKaeLsuXFAMzxADX3sly/PGOp04fk74a3iPsX3+yemffO104vDuyoHWVJlhHt6kk
	 WgcasLIkPVH3pahidwTbVqorGIqHyNrvnuMuTAhEZHLZw6Gyq5H3DuNkS1pM1Fx0KkeVx
	 2Si4CmwkLou8Cb0/PxE8OuS1htd7lOMahPC734fGzAnL2V1je6vV2ADNcThfKW3R0Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743322;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=1+ljwUcRqPa1I8PKwk28jT3BsaQMof3yBXjCBJacyK0=;
	b=gFPYFOdauipTaV3XyDIIqG4ZtKLp6VHqJVUVbc8jrLZerPay8+ixBSH/HLN2agTYOcoH
	 ywnqwuspHbAmGbVBPF8syZjevBQzTKxnIyY/noiwDTsAI4KeGL95Vw2AjkcCURXvaQOxQ
	 zIz2UrG27CXwmp/H1Lsmt39mHhazIX8GAhTa4OexAE9oJOcgMQjYWZZNSNleCGZqKsPdP
	 hHwb5Tw0DevilLoLQjHRPGtcExnTz2Et5q0hQLG7HZrojaQakChFYIbggSKW4e69h8jP5
	 aaM/GG0UyPUJfoHUMPkwEbpnqEA1wyBF/l3pCFS2gl9pqONHpFaBaj+NXPQHJzUrefg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thelittleman.net;
	spf=pass smtp.mailfrom=thelittleman.net;
	dkim=pass header.d=thelittleman.net header.i=@thelittleman.net header.a=rsa-sha256 header.s=20140415-thelittleman header.b=cABqwdBx;
	arc=none smtp.remote-ip=91.99.148.243
Received: from mail.thelittleman.net (mail.thelittleman.net [91.99.148.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B5A606A31B
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 22:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B5A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thelittleman.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thelittleman.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=thelittleman.net header.i=@thelittleman.net header.a=rsa-sha256 header.s=20140415-thelittleman header.b=cABqwdBx
Received: from mail.thelittleman.net (localhost [127.0.0.1])
	by mail.thelittleman.net (Postfix) with ESMTPSA id B7EB75F491;
	Tue, 03 Nov 2026 22:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thelittleman.net;
	s=20140415-thelittleman; t=1793743318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+ljwUcRqPa1I8PKwk28jT3BsaQMof3yBXjCBJacyK0=;
	b=cABqwdBxjs1lavtCsxwE2XmJSpQSX2LyLMLILD+JTQ3S71NcJYV5h9VHXfPoTlnjHNqOQ+
	gEL914uu7mTRig4MKDpVEMd4kuZj1a1rrkvH0dSmkw5D+U/eTLsW4JfHHY30DdsWjvC1pg
	jEscpYzHOTYxJxmXRIuzDMCJ+BuzohQ=
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 16:01:58 -0600
From: "David R. Hedges" <linuxdev844@thelittleman.net>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 2/5] drm/nouveau/kms/nv50-: don't enable a DP output with
 no trained link
In-Reply-To: <sashiko-outbox-195991@kernel.org>
References: <20261103-nouveau-dp-relink-v1-0-7ee88c7f1e8a@thelittleman.net>
 <20261103-nouveau-dp-relink-v1-2-7ee88c7f1e8a@thelittleman.net>
 <sashiko-outbox-195991@kernel.org>
Message-ID: <9c007e977c249af5064bf34a37694e76@thelittleman.net>
X-Sender: linuxdev844@thelittleman.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-03 14:27 -0600, sashiko-bot@kernel.org wrote:
> When nv50_sor_atomic_enable() returns early here on -EINVAL, does this 
> still
> end up enabling DP audio on the untrained and detached SOR?

[...]

Yeah, nv50_disp_atomic_commit_tail() marks the output enabled whatever
nv50_sor_atomic_enable() did, and nv50_disp_atomic_commit_core() then
enables audio on it.  In v2, I'll have nouveau_dp_train() clear dp.lt.nr
before it starts, so an output left detached has no trained link, and
nv50_audio_enable() skips a DP output without one.
