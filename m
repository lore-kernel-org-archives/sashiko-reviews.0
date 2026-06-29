Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114DD38A718
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 11:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733060; cv=none; b=S67mqAxqB5SS6uJdkPkAosGxD1YeaVeQdSwsTiFdXEFFVHtuKDGBR8KzHZJ7Es5GxA1Da7/DAmLlRzEWetiyenBJigcU8/mtQN8Vtr0/QsndTRFO+6C1whKrp7j5ydn8/Uu/bpMfFpElYjZzBbn2HZtgoTQlHaGqieZR02Y8kF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733060; c=relaxed/simple;
	bh=yo/QqEyBv6r0KEfB6JhNXuJFLEKJf6YiuY5wQi5XRbg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TqE+xgVxD3HZW90EGnibYsnmgXFEP2kg06FdkSHM4m9qEs1B7TInaE62KqR7v53p6swzlJ3DwSAOpk6Zd3+HgL1SdP7RTE6N6KVQxaeFi+Jd7DjCvXoUqpD0eQ7A9bJ70jJgKNam0G4aOG6C6R1SoG29GOPMGRiqKMt02WkYfQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=B9RE+efH; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="B9RE+efH"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-697e96dd8d2so5049553a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1782733057; x=1783337857; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wsUvbYZueAc+svWz2xljZ6btlooKMmGWQDBlphVR8PI=;
        b=B9RE+efHk0boi0smUPj4hHFtxZezQ8BOnwmV+XPQlu4tsCS8cbJPCYT3kgnhWrDOob
         BCdrMoB6RRGYpk97rByog/U0UpxcXd9G+EqnnHrdbS3uAIg7H9VQjlnPgckA98uNd+9J
         6O64sORkKhzILRlLW5vmhVxi+yHKVMzOs7yChBfOpwkFQvlOCBGqxDGg7Q2npxjDAo3m
         sOex/v/wEr+eYAoRdOSYqImuEIC75xcuSTKJi1A7RMwmMA51y62IkLI0wYkykKrQubec
         KBvbc4DrGcVCTHo6AM61z0qyGB7uiTF6BPjIhQZm/F9xYfP0w+wKiLrap0auF5sP/ljS
         baMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733057; x=1783337857;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wsUvbYZueAc+svWz2xljZ6btlooKMmGWQDBlphVR8PI=;
        b=BjbJV9nI0yEleD2zPeOBKLc6iXXyVh2Qs9lUL5KiOoiPNqPi7QcblZXn+hfKJjTOH1
         dMaG0cJi8lBcnDq+2In7/OS1zQ9LoT7uYXRD55IOVVpOCWaMDHDEmTJWqItxxqIGg+3k
         U7phwytg0a30k96sYhvrF5ZieeE47OYcXy0ArChga3cSctirU3DTIbfEC6YLeAdmKVMK
         BVcBNvQ6VWi49hPR6nsUrJMAo5HOfmt7/DZayMmtfEk1Hnjf4Afo0p6j87U7s7Bskhzs
         c6tV0wQprclBgTmohWuZhlFFl5xwlJDZ8ucXyii2IVasTpt4V8/S+L/lraSEiYM7RT0s
         MweA==
X-Gm-Message-State: AOJu0YyGWfsQMhJ4HvSzDj5LYinxBtGG/Kha4IMYm+PjdtsUBThrtRcg
	OQi2/2gDCGDVcsI86EcXOZtCnuS1qcvwL4z6YP9mWNhQR8Ka3q9FVq/Ee0FIZrSJne0=
X-Gm-Gg: AfdE7clqWjX2CmYmn4kD6NPwbYwaCuywsvcDK6bgIKqcvmpozeHyVbqvJMEzfC1BT3q
	p0hEHSjHY3P16hydMoLvlamlnbcAOidk2Buf6Vuq3Hl4O/hhpZSaY34ln5AvIPPdF4TbWaqe9k8
	OKSN/QyhjIOtWoLq2t4HKb+E3lcZvn5yukOk1tO/tkxSTa3qO3EpuHNbpjtPQ/gtnF4auoZu+0x
	t3YvVLdns8BVxHIPQEy78I+waGx1nqQba/Spc3TBHiG8ZQMiy86LRpM+pDeaN1hz0zdf38PKFt3
	CM/GUA5fEwJWFXa4thpNZObkAbrqC/E2LKlT28Nqcfrsn6vvcznoUJbBlHnoXodcdjyjehPjokP
	Q6pLn+tR72v/UB99Q029iLYcm4dNMWHd9VKTe5h1MU4FMrF5D7LcOimE1rTE0JEs2BwRKA12Ux5
	A9FU0PkG693jvzRmMFNs4Z+85HPw==
X-Received: by 2002:a05:6402:3415:b0:698:3e69:615f with SMTP id 4fb4d7f45d1cf-6983e697ddbmr3013953a12.4.1782733057478;
        Mon, 29 Jun 2026 04:37:37 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6986625efc1sm1527299a12.19.2026.06.29.04.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:37:36 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: sashiko-reviews@lists.linux.dev,  bpf@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/4] bpf, sockmap: Reject unhashed UDP sockets on
 sockmap update
In-Reply-To: <e08be4f5-0bd9-4228-843d-86ed20594bac@rbox.co> (Michal Luczaj's
	message of "Sun, 28 Jun 2026 23:59:37 +0200")
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co>
	<20260626-sockmap-lookup-udp-leak-v2-1-7e7e201c951a@rbox.co>
	<20260626205814.BAC3C1F000E9@smtp.kernel.org>
	<e08be4f5-0bd9-4228-843d-86ed20594bac@rbox.co>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Mon, 29 Jun 2026 13:37:34 +0200
Message-ID: <87v7b137cx.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Jun 28, 2026 at 11:59 PM +02, Michal Luczaj wrote:
> On 6/26/26 22:58, sashiko-bot@kernel.org wrote:
>> [Severity: High]
>> Could a memory ordering regression here allow unbound UDP sockets to still
>> bypass this check?
>> 
>> In udp_v4_get_port(), the flag and hash are set:
>> 
>> net/ipv4/udp.c:udp_v4_get_port() {
>>     ...
>>     sock_set_flag(sk, SOCK_RCU_FREE);
>>     sk_add_node_rcu(sk, &hslot->head);
>>     ...
>> }
>> 
>> Because these stores lack a memory barrier between them, could sk_hashed(sk)
>> return true on another CPU while SOCK_RCU_FREE is not yet visible, allowing
>> the leak to still trigger?
>
> I'd like to verify it on a weakly-ordered CPU; please give me a day or two.

False positive, IMO.
Both ->get_port and sock_map_sk_state_allowed run with sk_lock held.
