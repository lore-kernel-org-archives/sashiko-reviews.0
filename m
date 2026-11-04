Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800646;
	b=kbo9D9/mqGX8Zf9/aq7um37AO/g8/Bi03nLR4HWg+v0sdRoHMK8KOSDyLHDgz/3DFTFS
	 NheETziH1uykKYhoOZMle/iGoDtuj5ax4c24OaCNWobV/YjUva8CVg3PoiAUrNTGVLAWS
	 8dhwnJZGgIFGpCxsn5dd3Sm301xcg0yGgkAqKR/hLMW8lu9KDddGNC3cs3UrcNh68ac8J
	 1Cpx2BPQx2Wa4EOoIWY12ROVosvh3jH6WVWNxaBkZAOwZ9R6nsTYglQgZRgrGNuDZU1TE
	 wX57Le0IOkYx/iwE5T+xeM+0F3UOLH50X4iMx0C5wU0Lz/TSC1HfCmALvGoI0kzWLCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800646;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=cOn8KJkhz5dyAZpDV0qrK/4NJ/64i6ThIIpkPqPhmJg=;
	b=309ILeUExawpw5lbXNa9YQCNtKIfBlZWxhu7O2YZxr2yM8QqMVCdZ6nY2FQvhSduQZZx
	 CePriG8kYzhZfG83dDKaaDefP6SpqjSuFgNAJRPchUj89gxp9mN0d6Np+DBqJSN/c+ZPI
	 teOWsgFX4LUnvknPRR8nKKv33K4vXeBn1SpPNculPoh71805t6QJ8JQPd6yVGViwGhFaR
	 zQGtDAqCT3AEeqW461w2FNCKmcpEm5Ejv5tn41MnMczrB2AwAiAXvtuFUGcmu/OHkypCk
	 2M5ce4IFb0CzFCuTo75v9+w/IjGbpNII1Ao51Wk4bRlIJOujKxTLyxAOcVOmi0keQvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F88606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 13:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F88606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id A9A451C40D4;
	Wed,  4 Nov 2026 13:57:18 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 0CD9C6000C;
	Wed,  4 Nov 2026 13:57:16 +0000 (UTC)
Date: Wed, 4 Nov 2026 08:57:15 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jaewon Jung <jaewon8868@gmail.com>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tracing: Keep copying markers when one instance is
 stopped
Message-ID: <20261104085715.5838b869@gandalf.local.home>
In-Reply-To: <20261104063552.28094-1-jaewon8868@gmail.com>
References: <20261103005219.3236380-1-jaewon8868@gmail.com>
	<sashiko-outbox-194417@kernel.org>
	<20261103095019.6a88e783@gandalf.local.home>
	<20261104063552.28094-1-jaewon8868@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 0CD9C6000C
X-Stat-Signature: 5bprzwbchtwg9jiwamyqnzcwcr6tkffw
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18Uc4/aVYuu7M6JAsaF4cBDgaQNSLZZmTs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=cOn8KJkhz5dyAZpDV0qrK/4NJ/64i6ThIIpkPqPhmJg=; b=Yat7rs/9cs7tZ/mAniJdbSMlqQkkcJomyiF/epC4CVhc/xl5WHpcm0LvdUhscF0hIbNjyA+DGvXbjoJla/Xx8JXcnDoLD31DA8RH3UeBKV/6BOtmCZcmrG4X3CRAzoIt3/G449babq8zKNe3xYjGDp7riHF8Hwa2RZpUL+yyxv4=
X-HE-Tag: 1793800636-478680
X-HE-Meta: U2FsdGVkX19jCxgfIIKSDIIdGplQxkRl5Dlu39dH8ccf2y8BEJD3OFCkX5iFLYUG8dknBhspwiJo3eWACZdxvhJSJIy4ztVUhsl1MmDC+twNlW3nVbohctYWDyXMRVaFiMCoYg7IhvDboJRgifMZx5lyUo8M0nkxPd0tt6zE3jA87+0VmMHMEa+cYZ/fTplYaYz2obJFhUWbXj2De457+nmzp3H8/cHCO2V137K4/AkSBmEFuZi9Jh667k5nxSG8WgLeFqWvys39TuQi1ssPGicaCKd+BcHaxHBvobWizZCAyiorl43KpAfVCZePYJqluGLkYFGcvVKYxmAYpWmvnrJ0Rr0qGScO

On Wed,  4 Nov 2026 15:35:38 +0900
Jaewon Jung <jaewon8868@gmail.com> wrote:

> The copy_trace_marker documentation says:
> 
> > If no instance has this option set, then a write will error with
> > the errno of ENODEV.  
> 
> With global copying disabled and another instance enabled, both versions
> record the marker in that instance, but the proposed change returns
> -ENODEV.

Hmm, that's a side effect I guess I didn't expect :-p

> 
> This seems inconsistent with the documentation. Should we return the
> last write's result, as in v2?

Perhaps just return the most successful write:

	if (tr == &global_trace) {
		guard(rcu)();
		list_for_each_entry_rcu(tr, &marker_copies, marker_list) {
			ssize_t w = write_marker_to_buffer(tr, buf, cnt, ip);
			if (w >= 0 && w > written)
				written = w;
		}

So it produces the output that wrote the most, and an error if non worked.

In reality, if the write_marker_to_buffer() succeeds then it should always
have the same return value.

Thanks,

-- Steve
