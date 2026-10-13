Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB50522EF9
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911429; cv=none; b=tqdBA71kPvTJLNcxCpM5NTEDz58642A6pnb7tEPJh8ThcvpGecpx/ImEPWxQSTUNasOiDt6J4MGNpECgViQoydHclVqNaznZ3W4DNsBiJ4KFtrm87SczAtKEoc930kemtG/Mm6WBczn8xPrhMbUt+b2wT+uq4kQZQzIVCcAqu8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911429; c=relaxed/simple;
	bh=8Mnb9rp0/KendOgopy9yG9eEoskvig2agjZXLTmvHSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYc5M51cOAyohfQ16RcuPKC49GQ19Ru/BlXUfQvxd86DkeYAOomgrquzdtX0/huusA8OOsXgzGny5Qqy64qeHmeze0lI/OT7/f2ganVOvCqe9P48Yu+SXwSrN96CSj+ZpHcJ/WCrEbTCCSorQGVniltP/6JzhJH844l7ww4gzkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZ6gaMAY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZ6gaMAY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-487049569b6so2277500f8f.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791911425; x=1792516225; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0KDBwBs4i6tsVXtOM7HjXD+EUyQMAjasdWbMXcJZLA=;
        b=OZ6gaMAYSZxrN4/MEn8pEPTRQqD+x8fmktO60uHsIaR8ch+XglJY9IkT6b6l1ASxyq
         uFE5nYPsZIA9aNcA5NaeoOjevqI46AnBErVagkNq/i4QhSVmDqBZqd52kFzQx7Em++y7
         Knyu9OOQzWfQAQE9Mr0mBQ81ilIraZf4QtwIuTAznkWgbW8hYlB9iU5hcl8BsB85zPow
         aKy1sOpzbovM+48DpNc5oevkqYVRXWyVtJpKPmL6yAKdBgzQB70iSYAJ26wU6wLtb/rj
         qoYFxpAT9UZNozj++1NrriGdVKNFxjtc9WFzRoFOKmWQOXdlcEhQmu6uksTVZrAzX23Z
         48Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911425; x=1792516225;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o0KDBwBs4i6tsVXtOM7HjXD+EUyQMAjasdWbMXcJZLA=;
        b=d3klJt3DNf3RyhWuXRx9UhaURADwnPhfEV+Eh88TLP3hDlPZ6+aF7hrfH/iqmx258X
         kxP/26ffXCUHFbBrS+NPs/JcpGH5L47UpBU2d8Cky5OB5l9TngBFHl5Xq5h3Yf1Hydi/
         mAlii7APcj9fcnjtU0BVuOvaMbGHkwm0fX2InAF0vlx5lO35bMJ5gLoNNGvx/9+9LFRt
         wLKZCGsBFl76JpjlQ7qaiD1a71AFx1daGbXzSzRi3PfWmuKVIc2B0MKhztvTX1cXyuK/
         hf3rxsV9M8UQjhUhpYxe5DozYdLhz6/qfbVDbhFL/ZiRbP6971Yep0pq+dzfMGjL801o
         eKww==
X-Gm-Message-State: AFq9FYLza3tgn1gnLAsjZyD07e6N7rrTDR9s159nTOV9MsBEy7+R3RsC
	479Mu10KggcL14uVNZEmjw624+1iv27Tl55ZbP6wvG83D1nmS9FqU0R+IP9THSuOB3w=
X-Gm-Gg: AYBFou1sgG39Lr5roSwbHX3NZYPIXV6rRu4TMmZoo3THZkotW5yKh7alnw7NbsKMEUO
	3Rly4s4bzlYsF4yGa6QOqgr9Mz8WSblSAu729ZAI0I2jR0iP2vjG7a7apIgyWJC8rFcyGdxVFEa
	nWGkKOd4ISgCf3JMUzDH9C6r8edbMaGodnPokepYs7F0Wpcby+J06i14EcmxE20D/MA5pte6G6I
	sE8juqKpjVjXF5RCOgSkZ2npHRuGoSTe8OFUdMSyhBz6dhyieX0Z4gD2nW6whFSRthTJ+t3/W+D
	Wgc60a8s+8iRiVTiSEMqtBvfe8X/vKKshzefGGXPKG2r5YGvuFc5EbfB3TXLjh4YTFjrDP53GRM
	v6LqSHarmRHybAlNFz2eik9FWx62Wgi6JmHGiJBXLHtw/kk0mC+Bu+soeTeA9GScMCKUrm5g6UT
	oynm+1gZ7JZKkbTytCEs0sB+vEphoCZ5BdQJZXVs7gFamrkBGhfsmfUiGCYNaslVa4HS7FkO1Y7
	BCi+wdWEI/gMiOawqfKvy+Jbrc5oF7jYFdTbWmHps4K+fg=
X-Received: by 2002:a05:6000:440e:b0:487:13f:f612 with SMTP id ffacd0b85a97d-48dbacdbd23mr18284968f8f.37.1791911425160;
        Tue, 13 Oct 2026 10:10:25 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de77b35b5sm599458f8f.21.2026.10.13.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:10:24 -0700 (PDT)
Date: Tue, 13 Oct 2026 19:10:22 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next] bpf: allow ksock kfuncs call from wq
Message-ID: <as5l_nMk7EV_dUs6@gmail.com>
References: <20261013163101.205638-1-mahe.tardy@gmail.com>
 <sashiko-outbox-170139@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-170139@kernel.org>

On Tue, Oct 13, 2026 at 04:42:13PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] bpf: bpf_ksock_create causes NULL pointer deref on task exit
> - [High] bpf: bpf_ksock_create in workqueue escapes network namespace
> --
> 
> commit 34ed977b7943eebacf7e605dc8f26f2576ba2664
> Author: Mahe Tardy <mahe.tardy@gmail.com>
> 
> bpf: allow ksock kfuncs call from wq
> 
> This commit relaxes the constraints on ksock kfuncs by removing the check
> that ensures they are executed in a user task context. This change was
> made to allow ksock kfuncs to be invoked from asynchronous workqueues,
> bypassing the original LSM hook considerations.
> 
> > diff --git a/net/core/bpf_ksock.c b/net/core/bpf_ksock.c
> > index e9943aeeadd32..21d5fd1eb403d 100644
> > --- a/net/core/bpf_ksock.c
> > +++ b/net/core/bpf_ksock.c
> > @@ -73,16 +64,6 @@ bpf_ksock_create(const struct bpf_ksock_create_opts *opts, u32 opts__sz,
> >  	struct bpf_ksock *ks;
> >  	int err;
> >  
> > -	/*
> > -	 * sock_create() derives the network namespace, credentials, and cgroup
> > -	 * from current. Kernel threads, including BPF workqueue callbacks, do
> > -	 * not carry the context of the task that invoked the BPF program.
> > -	 */
> > -	if (!bpf_ksock_has_user_task_context()) {
> > -		err = -EOPNOTSUPP;
> > -		goto err_out;
> > -	}
> > -
> 
> [Severity: High]
> Does removing this check expose us to a NULL pointer dereference during task
> exit?
> 
> If a sleepable BPF program running via task_work during do_exit() calls
> bpf_ksock_create() after exit_nsproxy_namespaces() has cleared
> current->nsproxy, it appears this could trigger a kernel panic.
> 
> Without the bpf_ksock_has_user_task_context() guard, bpf_ksock_create() will
> now unconditionally call sock_create():
> 
> net/socket.c:sock_create() {
> 	return __sock_create(current->nsproxy->net_ns, family, type, protocol, res, 0);
> }
> 
> Is it safe to allow sock_create() to dereference current->nsproxy here without
> checking if it is NULL?

Indeed, in do_exit(), it seems we have this ordering:

	exit_nsproxy_namespaces(tsk);
	exit_task_work(tsk);

The first line will put nsproxy to NULL and the second will schedule any
remaining work and call the bpf callback set up with the wq. So this is
valid.

The fix would be to add some NULL check to prevent the panic in this
specific case (or see the next point).

> 
> [Severity: High]
> Additionally, does this change allow containerized workloads to escape their
> network namespace?
> 
> When bpf_ksock_create() is invoked from a workqueue callback, the executing
> context is a kthread.
> 
> Because sock_create() uses current->nsproxy->net_ns, a kthread will resolve
> this to the host namespace (init_net), causing the socket to be created in the
> host namespace rather than the container's netns.
> 
> Could this allow BPF programs inside containers to bypass container routing
> and firewall policies by creating host-namespace sockets?

Also agree, maybe socket creation should still be behind the check, I
think it's still useful to be able to connect and send from a workqueue
but preventing to create via workqueues might be a good limitation.

Let me send a v2 with create still using the runtime check, that should
fix this and the above issue.

> 
> >  	if (!opts || opts__sz != sizeof(struct bpf_ksock_create_opts)) {
> >  		err = -EINVAL;
> >  		goto err_out;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261013163101.205638-1-mahe.tardy@gmail.com?part=1
