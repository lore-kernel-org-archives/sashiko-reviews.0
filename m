Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793471699;
	b=oJM61xaV2war0V4KkJ38Bbrn3MqkkCLSF5iCcYJ4HJMgr3LDJFJR2GjE9rt35BqNv+Wn
	 ExnZ5Qkf2xCc+aYggocDPbarKW5HhO9a3rK/rF6XROHG+FSmvXXkUcs169Rn9TPjBAZN6
	 Tkp/Vy4JsyffEqUhoBg+msfE14o9Bdf2fsZXMtdwiW7j+PtA14QRYcNXjVNYgk1aidIoH
	 wJ1q9gTNJEpeyeIpLMskhaHFc/PtiBBoBWBw+NFUP2SL1SdbqBoZ+5c2dA2/0jy7y6lo4
	 NLF793EQBrWFkylIYQEox3ggjRyox+AdPYkiiG7Nm/Cm1AmwnRc80PaU4f7CE1yqrMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471699;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=Mr9ICfX9GZSmJoYtnOLDM1PJyuX2i4qLwBDyTMhSy+I=;
	b=S80RdruR1dWe5rxT/eTYVJGxgnzxLFImlgeFQAhZvgPcXn9TmQwX1eqppPojlIULzw+j
	 RX2kYc3HwafwNBjIGP481YL6MUKV1ZJ36HoTbsp+LfmduGX5Eg/oPpiALSnSUIJ2EjDvC
	 pbJJcUGzs5Jj/g4rmCT7qYCgLUeM0RUPy92lULHrURxP+PsSHDLqR/Da9mWs4ba9qf56H
	 uEqe4T9w4UBd3tL93E7plwICmIlawpf1v6+jgWJni2T+JLxMPkQQwqkLytfeMOlGDhN4D
	 P+OUhwM7DrUH8qY2UMVJtDAryEGRgH6RXiAvvfVcFXVtBXt+3giiZwULgkTN4xX5aRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=WTvjPV5J;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A80606A31A
	for <sashiko-reviews@lists.linux.dev>; Sat, 31 Oct 2026 18:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A80606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=WTvjPV5J
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jH68B0Cmcz8v2f;
	Sat, 31 Oct 2026 19:34:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793471690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mr9ICfX9GZSmJoYtnOLDM1PJyuX2i4qLwBDyTMhSy+I=;
	b=WTvjPV5JDGDKXsIs6PsfNRdz2Lw7LYuQVwwN+AAX5W7Tqs3dldtz2krSiwHeQNqAk9VY7t
	sAQr3f/+b9ULnexgX3nMl6cRauJMWgUmwUHiWGwgusyZviagNin8vFlL5tNQyMcAR3L2/L
	2VeP3KNh+7tCpmutB8idLss2bkOkgzB/o/CdteGYPgex8G5thUV9TqHNeml1haAwbD2xWe
	qw4PDiBmKnb751+qyfSk7xEoeYu9LVd+s4IQOJRkI1n9EXkG6CJqP5bfwD9x4EeiuGLuQ4
	4ZRn0wNk62hrAYsoHnim6eR1VJIlSD5knZNXDyr18eoRYXijIQob3Tu7Eg3d/Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/amd/display: Hold the VRR vblank reference only on active CRTCs
Date: Sat, 31 Oct 2026 18:34:48 +0000
Message-ID: <20261031183448.2400535-1-hugo@hsal.es>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-192001@kernel.org>
References: <sashiko-outbox-192001@kernel.org>
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
X-Rspamd-Queue-Id: 4jH68B0Cmcz8v2f

> Should the dc_lock block and dc_exit_ips_for_hw_access() in that branch
> be skipped when new_state->stream is NULL?

Thanks. I can't test this, since my laptop is DCN 2.1 and has no IPS.
Reading the code, though, I agree: with this patch, disabling a CRTC that
has VRR on goes through the VRR-off branch, and that branch calls
dc_exit_ips_for_hw_access(). When it was the last display, that undoes
the IPS allow that amdgpu_dm_commit_streams() made just before.

v2 will skip the PSR, Replay and IPS step when the CRTC has no stream,
with a KUnit test that counts the IPS calls. I'll wait a few days for
other comments before sending it. A Tested-by from anyone with DCN 3.5
hardware would be welcome.
