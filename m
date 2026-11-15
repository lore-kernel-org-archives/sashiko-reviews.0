Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794756714;
	b=Baoo/jS7VzZp4wOmpJ3YXjjOWdtW3dFbX00Z7Ri0ZmPrskVP4Oi4UzVxvMXTWgScPmLY
	 mBuGM4nqMzLBmcB3OuE6qRZxj272d5+QmEmQHWXxaXECX2yXJsbUwu3MsbF7FXIy3SDpj
	 PrYcyuEMS31RbNPGbty/QcwDkKSiKv6+i6sIAhwE1TeUouSwe1c7z+1R+xjvLAM8tSKBC
	 +D+KmjUkwv10Pigk/bOVyilfAPpA52DHu0LB8TQPWICO8xIUBZzn7Ju7xk9HXQhW0ZBeO
	 EAp7UDqTxUudFCLO8un0/zky4jBjOiczyWrx9QvTQtOqrDfG3iv1gU1LD7dWpPwWkkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756714;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Priority:Importance:X-Mailer:
	 X-Originating-Client:X-Rspamd-Queue-Id;
	bh=Dz6MG60gYh1oeLl0y4lf8u/H7dQYN/8DWkBKEQ6CwTc=;
	b=pSoDaVadJvKLlaViIbHpyuVPJkmrzjhFG3BYc5Eic6adig7uWsRbzvCJjl5eC98ULQfe
	 uLTveXP5fI8xJWckX2sskUj9XfC4eblu2tK2S2qib7TMqFg1u9EB+eWgVPeWjsHbTezx3
	 naq4W5PHHeARMTGU2M6Su8zDvvZ8Te/pVO+YVmAMxwR1NKdWuPNYaVGMbXndAUBjCwm40
	 gOQBs+ahZYve53zhNpxHk5iqxyNQ12v4mvRjUPN76dneQfEPsfhl5VguKVG9vAGEtJOEh
	 hbiGLqhJB8JBLbPpsX7DOvKxz405xlMC8svZ0Kc/65ADBYE8ZePw/8UmOatJlnjsZFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=sqQTSvh+;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9645F606A31D
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 15:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9645F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=sqQTSvh+
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jSFN12TSMzMlwG;
	Sun, 15 Nov 2026 16:31:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1794756705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dz6MG60gYh1oeLl0y4lf8u/H7dQYN/8DWkBKEQ6CwTc=;
	b=sqQTSvh+xAjRqlex0bxOFYXJwzfxtpHvu1ebKWi17PaMpoEKBjksjyUchfyzV2bNTGSpmX
	ccK/Q4vPsK8FzxxB6J0p9fjcfNjrIjLSJtXXhHZSzx/phwuuBEjlCbSKKlahpS2bcdYhtC
	a6qmUWQyJUViEwYnNQD6A2cg51eTLVIp1P3wXna5juITUy2Obq1MJJ1DBJ2ZGKvER8Yq12
	LgZqlMlVaeVMATvil9ZxoND8EXrNMU39vAlXxAiSD5HH0e79PPAF/ECaxQNaCWI4rmGxj+
	WUQhyWdw95eUp+Bz33lMUvQNq5qTVxxSYjXhHLypPi1qvJtyVeo9Oqgsdd8AWA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
Date: Sun, 15 Nov 2026 15:31:44 +0000 (WET)
From: Hugo Sales <hugo@hsal.es>
To: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <159623420.13271.1794756704576@app.mailbox.org>
In-Reply-To: <sashiko-outbox-213691@kernel.org>
References: <20261113-abm-sysfs-commit-v2-0-5808d17a7e89@hsal.es>
 <20261113-abm-sysfs-commit-v2-2-5808d17a7e89@hsal.es>
 <sashiko-outbox-213691@kernel.org>
Subject: Re: [PATCH v2 2/5] drm/amd/display: Don't force a modeset when the
 ABM level changes
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.53.348
X-Originating-Client: open-xchange-appsuite
X-Rspamd-Queue-Id: 4jSFN12TSMzMlwG

> On 11/13/2026 9:07 PM WET sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Can a connector-only abm_level commit on a VRR-active CRTC drop active
> overlay planes from DC?

I think his is real. Before this patch, connectors_changed forced 
a modeset, and the modeset added every plane on the CRTC. Without 
it, an ABM-only commit on a CRTC with VRR active carries only the 
primary plane that amdgpu_dm_crtc_helper_atomic_check() pulls in, 
and DC's full update drops an active overlay until the next flip. 
The -EINVAL doesn't happen, since DM's private context still holds 
the overlay

v3 adds the CRTC's planes when the level changes, similar to how
amdgpu_dm_atomic_check() already does for color management and VRR
changes:

		if (dm_old_con_state->abm_level != dm_new_con_state->abm_level) {
			ret = drm_atomic_add_affected_planes(state, new_con_state->crtc);
			if (ret) {
				drm_dbg_atomic(dev,
					       "drm_atomic_add_affected_planes() failed: %pe\n",
					       ERR_PTR(ret));
				goto fail;
			}
		}

I'll wait a bit longer for other feedback on v2 before sending v3

Hugo
