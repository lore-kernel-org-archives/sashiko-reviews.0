Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.99.148.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738858;
	b=WNjmCC9WxemHfeAxDMgX9YJpObhkfR8w5DiKbTRAzUHZi+dlaFgfrdAf9EGmV3HXO6Hz
	 azIP0Q4Q11vDAbCCFKj1YvqwYjDd/mnq0dLzqlnKz1rnGAiyR3E+Ms45D/V9T4UrG2bJg
	 630m88rtjGLItW5YKNqsFMMgppM32vZgpY3ZOPDWwZK/6otcFSICS319vyGTVYZQdkxMJ
	 AL8UkWUvBtoOnY+DkRR5F/KjeTlN+1SQ4Rg2N/pb1yUXQ2w8UJ6QQUU0KX71wmkT3LbyR
	 75/WA7T7HdM4XFb+SfKbJmVouuMjELMsgLy7MRczcUhXzgM8dGbUz5W/v0xlT2uZDcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738858;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=z1YZpLjfbu6fNLdkBVvsc4d/vtdUbC5126/UpuwWjT4=;
	b=uM7wgq8XAXkwIrZEP1s2FWwUJmKIBFCLIMi1HaOZT0L/F0ZhrTXZPeysA+lNkym5/7C5
	 GABIerWaVgiAs8j5ETVS3Mucf1Ifl5rrJjbW8NkDzOeElRJor4GSvi7y9764ptK9dHd6f
	 dOWKh6AuEjxD+S/ZCI8Gk3d3NaHfZ8UfBFkG9VmdQ5QfMDu63z3s779TlKUrmEXhg0aMw
	 hHevtiyHy8KsBsnJHEvI/2o6wgwwho/JEgKWJhedRXL4tDTilXzPc7nT4je2cQdTL+IYA
	 uBESrgmfzu9d2eX5hTLjNU4He53ILabKA/6/KqmIHAhxzONpE6GvCIuIU1xLnYW2sEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thelittleman.net;
	spf=pass smtp.mailfrom=thelittleman.net;
	dkim=pass header.d=thelittleman.net header.i=@thelittleman.net header.a=rsa-sha256 header.s=20140415-thelittleman header.b=OcRk48xl;
	arc=none smtp.remote-ip=91.99.148.243
Received: from mail.thelittleman.net (mail.thelittleman.net [91.99.148.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7B3606A32F
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 20:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC7B3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thelittleman.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thelittleman.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=thelittleman.net header.i=@thelittleman.net header.a=rsa-sha256 header.s=20140415-thelittleman header.b=OcRk48xl
Received: from mail.thelittleman.net (localhost [127.0.0.1])
	by mail.thelittleman.net (Postfix) with ESMTPSA id 8ABDD5F92D;
	Tue, 03 Nov 2026 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thelittleman.net;
	s=20140415-thelittleman; t=1793738849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z1YZpLjfbu6fNLdkBVvsc4d/vtdUbC5126/UpuwWjT4=;
	b=OcRk48xluXvjulj0mjLRYuQOra8JaZF3vUToOHWr1Q9S/Zvjj/ZXd8kEkzDZx0QVp8iLbv
	o84BgZMFykPizLZQsBd2NY83Ht94mG67fCQQy2A/H+8yRj2whLkruF/hpbuI2Y4n2YxRDG
	27WRS/3wn/l9qQb1sIoUd0YBFODrAxM=
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 14:47:29 -0600
From: "David R. Hedges" <linuxdev844@thelittleman.net>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 4/5] drm/nouveau/kms/nv50-: don't drive outputs at 0 bpc
In-Reply-To: <sashiko-outbox-195931@kernel.org>
References: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
 <20261103-nouveau-dp-fixes-v1-4-892f4bd357cd@thelittleman.net>
 <sashiko-outbox-195931@kernel.org>
Message-ID: <f3a2d8f720d1b619210067ad366fe7e9@thelittleman.net>
X-Sender: linuxdev844@thelittleman.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-03 13:41 -0600, sashiko-bot@kernel.org wrote:
> Could unconditionally defaulting asyh->or.bpc to 8 here break 6 bpc eDP 
> and
> 18-bit (6 bpc) LVDS panels?

Yes. ->detect() replaces the EDID on every probe, which resets
display_info.bpc, and for a panel whose EDID doesn't give a color depth
it stays 0 until ->get_modes() runs, so this isn't limited to a lost
EDID. For those panels, nouveau_connector_detect_depth() picks 6 bpc on
eDP and starts from 6 bpc on LVDS. Forcing 8 would drive eDP panels at
24 bpp and make nv50_sor_atomic_enable() override the VBIOS straps on
18-bit LVDS panels.

v2 will fall back to 6 bpc for eDP and LVDS and 8 bpc for everything
else, the same defaults nouveau_connector_detect_depth() uses before it
looks at the straps. On LVDS, that leaves the 18/24-bit choice to the
straps as 0 did, and eDP gets the depth ->get_modes() would give it
instead of 0, which trips the same watermark WARN as on DP. Calling
nouveau_connector_detect_depth() from ->detect() doesn't work for LVDS,
which needs the native mode that ->get_modes() sets up.
