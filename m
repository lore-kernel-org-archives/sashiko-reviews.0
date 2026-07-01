Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938E640B392
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900260; cv=none; b=lrAY/AHV+u3jBDXjqVEfAOf2U6thFuX1PCmQZL9gWgLU5WL2rOsnbOz54Piu+8Yy5p13wppLjXhz09H29Rctt6YbDRjrmiVH+TG2hsFP+HQckrwyaNAoAg8gwefnMkdPfkzctkvRY33E+VK+uo9lCIsMrr+t+a5VvQcjuh5xuoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900260; c=relaxed/simple;
	bh=qDt4IJXQvKhSSerbr9KXeA+PEQui6XrmNBKRGQz2I48=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TEz+KaQbHuo8AXr71SaV9N2oVimSyAyjhmpa3ZHs0Uat/AdriMVIQ+Clv73g9nb7N/4l6BzPiR5l3hUeJoYwE2l4SfJ08cwouUdTCBr267yQQRS3kXOWFktgiBi1Vmb9P0emdOAYPri+jL9grIPuboJ8nUk+7uJI2huM9JIx4Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=OnhjZBqX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="OnhjZBqX"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6982e71dfb0so667598a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 03:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1782900257; x=1783505057; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bT9HoVUGh6XBwX6Pxk2VzEI2sj1gJsAoh4mTRhpR9ew=;
        b=OnhjZBqXaVykqzn6eiCONPSo/EvdTTLzfh5PavG0cLw7uqW/ce06fU2NXgw61qgMC+
         mZnUe/wdu2bFtJRa1zqlYjr0HeW2H056xHYn8fqF4c+sc4hJkyj5249wXH2eJNYHWTSq
         2pHav2kqBN+45hJhEw2cdxrIu9/hRmPAsXGJcOy7OkzR3Gp0KVXbVHTF+m5REVDryDW1
         nW1nkdWHSj/MsLfWxPmQFFqMljgIC5C/FWygHDpcjp4O95iGtcPDlu+nsyidE6xCI1L/
         twnYOoR7mF5NFeP+TzKc45RlukIHDKltTqEynpM0oJRBeTtY/nMUwr4TXZaYEwehodn0
         9a6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900257; x=1783505057;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bT9HoVUGh6XBwX6Pxk2VzEI2sj1gJsAoh4mTRhpR9ew=;
        b=fxXiEqfy9UztCyrk69mtYmLHzfh7IGzBOBeTsMbRwiEjRKtlUfh0n5sTzND84Xud6w
         pWmx7cA9leg65YTaauGGExjpwR5joamuUi1zUG6ItAAqWckN7+6XOYcZ52uJ+CeeFc1I
         +05HfakzkhZRH+5lqHXLOGg/anSgI35fz8TCEBbdtPePhQOA6LoV3i/M40y6n1eJbST4
         a0nlUKfkTLvyOnE4y153hwSou8D6iOtNrzp6et3iGBjeLWAgssFIbltJXgkKxlsAhbL3
         OdPgMs4HApzAi3PWYcdWZ5dl/I59zmyLry55xxqZGe9571RaUoBMYIwRIVnyHgfx2zfl
         xXLQ==
X-Gm-Message-State: AOJu0YwcGVTQMnb7P7PD1VVCrFFy+Pm9TogS78see3t8k/G7TWrbtAet
	A11YchKcjrRF87MfD2VjqfQYgPnoP4pRbfDR3H35K/Jco0R9j2n0uYthO+gtRLT1GkQ=
X-Gm-Gg: AfdE7cmWYabF0yPzUpyBMgsxqJ0XtMAUdWZbuNynhKx9eF4tSLkSUNh/XcgH9+cDohB
	TStoAEAIoPi+SOF8le9Yg4Isr1/z5rYBKRhft4A0Uf3vAsnrCsGLnOpJzkKZDgbApTRVF26ssLI
	7gvvi/mYBAjTh8HqDDznGtEYiqvBULJWWAlQCHJf/8xoOt+su/V5Snlbo1y4KtoOv+DySQ1eaW5
	ZxLVcUlXIy2876/NPpwHsd8T7227N9k8a7IpXyGYEHwdYTA3vUUz/qETPIoIU7pIgdMKOs+FYxb
	g0Seee7k96myT9GQzRvEb6OqOcDZZs7YYBY3/42gkhLQOYhalJmBxTPhANW/7ts6myOook35k3A
	2BKC8mLKOwPIvlir6cj2FJRBqquSyeQDDKsk4UgW2Eo3I3e3RHEEvQ5p0VD6Fi2vrMwIrfME/6o
	TA
X-Received: by 2002:a05:6402:26d0:b0:698:821d:aa37 with SMTP id 4fb4d7f45d1cf-6989f378252mr441815a12.24.1782900256737;
        Wed, 01 Jul 2026 03:04:16 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c968201sm2389522a12.24.2026.07.01.03.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:04:16 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: sashiko-reviews@lists.linux.dev,  bpf@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/4] bpf, sockmap: Reject unhashed UDP sockets on
 sockmap update
In-Reply-To: <26ecbce0-48ad-4b53-a0b7-34b59870e010@rbox.co> (Michal Luczaj's
	message of "Mon, 29 Jun 2026 23:40:49 +0200")
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co>
	<20260626-sockmap-lookup-udp-leak-v2-1-7e7e201c951a@rbox.co>
	<20260626205814.BAC3C1F000E9@smtp.kernel.org>
	<e08be4f5-0bd9-4228-843d-86ed20594bac@rbox.co>
	<87v7b137cx.fsf@cloudflare.com>
	<26ecbce0-48ad-4b53-a0b7-34b59870e010@rbox.co>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Wed, 01 Jul 2026 12:04:14 +0200
Message-ID: <87echn2fhd.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 29, 2026 at 11:40 PM +02, Michal Luczaj wrote:
> On 6/29/26 13:37, Jakub Sitnicki wrote:
>> On Sun, Jun 28, 2026 at 11:59 PM +02, Michal Luczaj wrote:
>>> On 6/26/26 22:58, sashiko-bot@kernel.org wrote:
>>>> [Severity: High]
>>>> Could a memory ordering regression here allow unbound UDP sockets to still
>>>> bypass this check?
>>>>
>>>> In udp_v4_get_port(), the flag and hash are set:
>>>>
>>>> net/ipv4/udp.c:udp_v4_get_port() {
>>>>     ...
>>>>     sock_set_flag(sk, SOCK_RCU_FREE);
>>>>     sk_add_node_rcu(sk, &hslot->head);
>>>>     ...
>>>> }
>>>>
>>>> Because these stores lack a memory barrier between them, could sk_hashed(sk)
>>>> return true on another CPU while SOCK_RCU_FREE is not yet visible, allowing
>>>> the leak to still trigger?
>>>
>>> I'd like to verify it on a weakly-ordered CPU; please give me a day or two.
>> 
>> False positive, IMO.
>> Both ->get_port and sock_map_sk_state_allowed run with sk_lock held.
>
> What about an update coming from iter/task_file? You get an unlocked socket
> via bpf_sock_from_file(ctx->file). And sock_map_update_elem()'s
> bh_lock_sock(sk) doesn't care if socket is owned.

You're right. No exclusive access to socket there.

I think we should block map updates from all iterators but iter/sockmap,
where we know the socket is already in the correct state.

This is in the spirit of the API lockdown that is in progress [1]

[1] https://msgid.link/akRZ_e7DJh2aP-2i@john-p8

> I was looking at iter/task_file in the context of [0]'s follow-up. With or
> without [1], we're getting closer to enforcing (stronger) locking in
> sock_map_update_elem(), per Martin's suggestion. Along the lines of
>
>    if (!has_current_bpf_ctx() && sock_owned_by_user_nocheck(sk))
>       ret = -EBUSY;
>    else if (WARN_ON_ONCE(has_current_bpf_ctx() && !sock_owned_by_user_nocheck(sk)))
>       ret = -EINVAL;
>    ...
>
> Would that fly?
>
> [0]: https://lore.kernel.org/bpf/20260414-unix-proto-update-null-ptr-deref-v4-0-2af6fe97918e@rbox.co/
> [1]: https://lore.kernel.org/bpf/20260629172704.1302218-1-rhkrqnwk98@gmail.com/
