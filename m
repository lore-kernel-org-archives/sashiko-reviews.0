Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF06C42F6E0
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247828; cv=none; b=cNhj4W2ZidA3HL1ZvBcrQy7K67GPtvJ3azpiuc/3cJ8hmymlIZXfWvD3DpO8oqpkxMBt2ZbJL8kPvY8ZS31HKdgWykF5AtAcRTIQuBu23uA2sCMM6fYAW9n+l/NriPFeKlD6ZaLsboEvi99meRhodPFNqG+/nQuXIxn8ntHpnO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247828; c=relaxed/simple;
	bh=InOnZ1pHA2iVVsvxVkslAkifC1nhanKrkXE7XVcRDgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7tzubQharkmMRdtfFy1ovQ40DVo5yV1AGZIIi2NV0yBV0TV83eL5XXjbGbbK/b9o3g497VO7oZViqpb0qUvYInAJ12mcUE7Dc9QnkNir1UdcXC2IbzVrabx/CkrKseZ7OZLobpr4ZLnE2E9R4oMqSjP8fISTYtf5SgT4r0iOYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=os+Rvwk3; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="os+Rvwk3"
Date: Tue, 28 Jul 2026 14:10:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785247823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=InOnZ1pHA2iVVsvxVkslAkifC1nhanKrkXE7XVcRDgA=;
	b=os+Rvwk3oU9Y2rvxRU16psz7g5EY3ObusC6xwcRaRGYzsqZSCDuRQsBovKwgYieKmbAMzO
	Pxv7sBW4ip7Rofx3SBXu+oOLC+Q2i8KvysQROtR65zJWZfk6HNlyFK6Xh1UHnUqekFMj+W
	hWSlZE6oAcZlNYqHkuclRsQFXqq7fMA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, Kuniyuki Iwashima <kuniyu@google.com>, 
	bpf@vger.kernel.org
Subject: Re: [PATCH bpf v2] bpf: tcp: Fix use-after-free in
 bpf_iter_tcp_established_batch()
Message-ID: <ami0NJ9s6ZhXVZb5@linux.dev>
References: <20260717-bpf-iter-tcp-refcnt-v2-1-8e81f0ac6f3e@linux.dev>
 <20260717025253.23EEB1F000E9@smtp.kernel.org>
 <DK4HTPHX3NL8.2N1FK8D2N9521@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DK4HTPHX3NL8.2N1FK8D2N9521@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 21, 2026 at 09:24:05PM +0200, Kumar Kartikeya Dwivedi wrote:
> On Fri Jul 17, 2026 at 4:52 AM CEST, sashiko-bot wrote:
> > [Severity: Low]
> > Does this multi-line comment follow the BPF subsystem comment style?
> > The BPF subsystem guide expects the opening block to be on its own line:

On the comment-style note, checkpatch accepts both block comment forms
and the one used here matches the surrounding code in
net/ipv4/tcp_ipv4.c, so I don't think the bot's flag applies. Either way
is fine by me, whatever the maintainers prefer.

> > Pre-existing issues:
> > - [High] Double-put and wild pointer dereference of batch sockets on the
> > first bpf_iter_tcp_realloc_batch failure path.
>
> Hi Kuniyuki,
> Thoughts on the fix and Sashiko's concern? (The latter should be probably be
> fixed separately, if needed).

The double-put is pre-existing and already fixed separately by
980a81345275 ("bpf: tcp: fix double sock release on batch realloc"),
now in the bpf tree. The hunks are disjoint, so this series applies
cleanly on top of it.

Thanks,
Jose
