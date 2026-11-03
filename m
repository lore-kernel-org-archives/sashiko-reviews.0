Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.99.148.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739401;
	b=o4eJp/hZUpstozQP9CAlqerSz5O+gceQB+/vLn6Zc0UKCU/RYI94tq868tuaie7jVnVB
	 7X2uajdYd+gQAPzK5q4usXoHZ0NR2cdL/nh/M2hKiNClvgU3iJOnYToXiDcXRLP+OAj9k
	 ZLiwTE2hdgYSbb1siyi9EJFDAL7MZaciIdFofOOhDnhHnwSI7Y6cBm6R87wFFAtwLgjcG
	 PCLu7pYi6MIc9xCNSggqgxCa6ljnadXz7u38XsZaEemspQRYC7eJxOCQxCAsHX6PmAGQY
	 22uv2jW97EQkn9fauq1yVMSzg5yVxAsexIkdDFPDlF3rjJ2P2wR1OjdykRngEbrOhGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739401;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=ExnzUTE0DG5TrCl1w+XLfuekZrkRHbiJ/wFV76Oir+w=;
	b=dHhS59BRds4Yw0QLxfSeBN+6jZsDZsEeoLjW/p/r1U9+uadaPlhjen9r6AS2vpEd+2QU
	 NWBq/4oPlkxciXTJUlOqdgVXhPLyN3EcefsDwyuDr/I+N8EmyzfutMnSu5jgB6knK8xZ6
	 Y0BcPvgRtZk5k7klMKNenWqHOjknfUUX4sRnrPOyIY8l8stIkZFyWNulhklDOLCPu/9ws
	 4WkcAEJKi3V1jaLXR3YJF7kw+6NMEJJFqJ/AxMgfPSxEuv7rXSaT6cT55FNy2C9kYcmFT
	 5zqOzvCywt41t1lcwZMEb0+uuzNepvpdKxIVNgm1IhQJDq0d7ECn8g0dwBJpt42jiZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thelittleman.net;
	spf=pass smtp.mailfrom=thelittleman.net;
	dkim=pass header.d=thelittleman.net header.i=@thelittleman.net header.a=rsa-sha256 header.s=20140415-thelittleman header.b=kXdgrsbh;
	arc=none smtp.remote-ip=91.99.148.243
Received: from mail.thelittleman.net (mail.thelittleman.net [91.99.148.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C7606A31B
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 20:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E5C7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thelittleman.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thelittleman.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=thelittleman.net header.i=@thelittleman.net header.a=rsa-sha256 header.s=20140415-thelittleman header.b=kXdgrsbh
Received: from mail.thelittleman.net (localhost [127.0.0.1])
	by mail.thelittleman.net (Postfix) with ESMTPSA id B10755F92D;
	Tue, 03 Nov 2026 20:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thelittleman.net;
	s=20140415-thelittleman; t=1793739398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExnzUTE0DG5TrCl1w+XLfuekZrkRHbiJ/wFV76Oir+w=;
	b=kXdgrsbhw6IZn8qhmccYCYjphpymPYJOcr+RIR/2drcT1ks5n9oTt7iVulLu+hS4rl/sRW
	Hwli7fwhQdy38u1obI9j7dQAFs96Mo7EVDywtivrDBu/NlQKOvUNvXnnTZzBg1Vuln5bO7
	dZgDIDnujPlFgluNcy3/U6zccEDAZKE=
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 14:56:38 -0600
From: "David R. Hedges" <linuxdev844@thelittleman.net>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 5/5] drm/nouveau: don't let an IRQ_HPD hide a plug or
 unplug event
In-Reply-To: <sashiko-outbox-195933@kernel.org>
References: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
 <20261103-nouveau-dp-fixes-v1-5-892f4bd357cd@thelittleman.net>
 <sashiko-outbox-195933@kernel.org>
Message-ID: <201c6fefc6ddaee3915ba10ccbde80b1@thelittleman.net>
X-Sender: linuxdev844@thelittleman.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-03 13:45 -0600, sashiko-bot@kernel.org wrote:
> Can a separate plug or unplug event still be dropped if it arrives 
> while an
> earlier NVIF_CONN_EVENT_V0_IRQ is already pending for the same 
> connector?

[...]

> Should nv_connector->hpd_pending |= bits be moved outside the
> if (!(drm->hpd_pending & mask)) check in nouveau_connector_hpd()?

Yes. Since 016dacb60e6d ("drm/nouveau/kms: pass event mask to hpd
handler") put the event bits under that check, any event that arrives
between scheduling the HPD worker and the worker clearing
drm->hpd_pending is lost, and the worker can sit in
pm_runtime_get_sync() for some time first. That predates this patch,
but it's the same problem from the other side, so v2 will add a patch
that always records the bits and only schedules the worker under the
check.

> Would it be better to always run nouveau_dp_link_check(nv_connector) 
> when
> NVIF_CONN_EVENT_V0_IRQ is set, and only guard the continue statement 
> with
> !(bits & (NVIF_CONN_EVENT_V0_PLUG | NVIF_CONN_EVENT_V0_UNPLUG))?

I'd rather keep it as it is, but I welcome feedback from the
maintainers. With only this series applied, skipping the link check
loses nothing: nv_connector->dp_encoder is never set on nv50+, so
nouveau_dp_link_check() returns true without looking at the link. The
follow-up series that makes the link check work again [1] also restarts
an active DP link with a full modeset whenever the sink drops or
reasserts HPD, which covers a plug or unplug that comes in with an
IRQ_HPD. Running the link check as well would only add a second
retrain, or AUX reads from a sink that has just gone away.

[1] 
https://lore.kernel.org/r/20261103-nouveau-dp-relink-v1-0-7ee88c7f1e8a@thelittleman.net
