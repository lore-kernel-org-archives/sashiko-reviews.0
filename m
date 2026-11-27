Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762475;
	b=gngQtlHNKu3du0qRcjdOs/767H9i5xZ4zuNgDQGEdyeIX2aGPgtJ/h9kH4svTI34FOAG
	 ab/zeEIiGccN/1PW4tKlj/JilXVGL8ZJpwHYQKwtTy3X814mJ9z/iPV5TXJw8Carqclua
	 O9lXUNdUFu5qYDLfCAOdUKYRCQpN65ssXEMJn63jlgU7PZTwTii5CWSMNguTpx14lb57Y
	 5SXQAJu7mIr5r2M0iPgrK6/ZrvBeZAK2uqqy0Qt27IpwL2TYAdEXjCg1KWsP6d8ljhPNO
	 9rycFloWrwe8Nm5qMl64knwYMWh9hCKfGPPH1VzZQlzPvnMwuPlKQf+UIJmP+/f/8vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762475;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ldgBYXNws0SrExrvq7eT+4NnxJR8sVTNBuuXZq814K4=;
	b=FnJCoESX/ExbL55UvprmpTjriEhWGHnQG+4YLcuwZlFaOsCeB/WtzD81YwCzy90lVPiJ
	 udKjjbWhjTPw6d9wi+kvGD9ECk0TOjP0FDueRsKGdnmP1/tU7kc6Am5LeQpaLmAmdkg3D
	 BNV7jOzAkVJ7GIVEiEQN/Nhz23C3yIdma1AFRu7bNNsMc+zRPX167TzEROAfsup967W5b
	 s9KZKSKBDEymft8UcZ2S0pscgg9tDxLuIPtzEXW2wh0I7w3eznQE3KK76XJ0Ieyq9Qvds
	 HHravsoaimtMknVnxA9m4LUAPP6AkD3UZRlFJ5bBBnwLFeU/El7XK34KYcHlVr4JsOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=srHIPuTm;
	arc=none smtp.remote-ip=95.215.58.125
Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8D5606A326
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 06:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F8D5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=srHIPuTm
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=h5rar8UUerAtpvggvfcIKvDaE3+p/9NaedNCkZ6XPI4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795762472; v=1; x=1796367272;
 b=srHIPuTmAbozvAb76f9ZODMlxakRy9BKzVtH6BdUOSiPl6TMVnEIsMPAMHyeJJ11m5UcbiH9
 5eqYr4WJJQGOLP8O7E81eowjttOhEtB13JwE/FLs+CIf0BfoRhmasmaCneJxOmFzfGoXxuJgzbE
 b9Tm9zHcLFX2jfJk5OUbNIDw=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 5fb339c859fca4ae;
	Fri, 27 Nov 2026 06:54:32 +0000
X-Mizu-Trace-ID: 5fb339c859fca4ae
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 14:54:21 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] bonding: undo enslave state when XDP setup fails
Message-ID: <awkpHepMHPoNNYf0@fedora>
References: <20261125-bond_xdp_rollback-v1-1-35dddaa337ba@kylinos.cn>
 <sashiko-outbox-235667@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-235667@kernel.org>

Hi,
On Thu, Nov 26, 2026 at 02:00:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] bonding: unbalanced bond_slave_ns_maddrs_del() calls in
>   bond_enslave()

Ack, I will remove the call in err_close.

> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] bonding: missing cleanup and 3ad unbind on XDP error in
>   bond_enslave() [1]

This will be addressed in another patch.

Thanks
Hangbin
---
pw-bot: cr
